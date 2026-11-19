#include <assert.h>
#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <openssl/chacha.h>

struct impl {
    void *lib;
    void (*key)(ChaCha_ctx *, const unsigned char *, unsigned int);
    void (*iv)(ChaCha_ctx *, const unsigned char *, const unsigned char *);
    void (*crypt)(ChaCha_ctx *, unsigned char *, const unsigned char *, size_t);
    ChaCha_ctx ctx;
    const char *name;
};
static double now(clockid_t clock) {
    struct timespec t;
    assert(clock_gettime(clock, &t) == 0);
    return t.tv_sec + t.tv_nsec / 1e9;
}
int main(int argc,char **argv) {
    static const unsigned sizes[] = {4,32,64,128,191,192,193,224,255,256,257,448,449,511,512,4096,32768,131072};
    static unsigned char in[131072], out[131072], expected[131072];
    unsigned char key[32], iv[8];
    int m=argc-2;
    assert(m==3);
    static const unsigned orders[6][3]={{0,1,2},{1,2,0},{2,0,1},{2,1,0},{1,0,2},{0,2,1}};
    struct impl variants[16]={0};
    for(unsigned i=0;i<sizeof(in);i++)in[i]=(i*17+i/193);
    for(unsigned i=0;i<sizeof(key);i++)key[i]=i;
    for(unsigned i=0;i<sizeof(iv);i++)iv[i]=i+3;
    for(int i=0;i<m;i++){
        struct impl *v=&variants[i];
        v->name=argv[i+2];v->lib=dlopen(v->name,RTLD_NOW|RTLD_LOCAL);
        if(!v->lib){fprintf(stderr,"%s\n",dlerror());return 1;}
        v->key=dlsym(v->lib,"ChaCha_set_key");v->iv=dlsym(v->lib,"ChaCha_set_iv");
        v->crypt=dlsym(v->lib,"ChaCha");assert(v->key && v->iv && v->crypt);
        v->key(&v->ctx,key,256);
    }
    int count=atoi(argv[1]);
    for(int r=0;r<=count;r++){
        for(unsigned n=0;n<sizeof(sizes)/sizeof(sizes[0]);n++){
            unsigned size=sizes[(n+r)% (sizeof(sizes)/sizeof(sizes[0]))];
            unsigned loops=16*1024*1024/size;
            if(loops>120000)loops=120000;
            for(int h=0;h<m;h++){
                int idx=orders[r ? (r-1)%6 : 0][h];
                struct impl *v=&variants[idx];
                v->iv(&v->ctx,iv,NULL); v->crypt(&v->ctx,out,in,size);
                if(h==0)memcpy(expected,out,size);else assert(!memcmp(out,expected,size));
                double c=now(CLOCK_PROCESS_CPUTIME_ID),w=now(CLOCK_MONOTONIC);
                for(unsigned k=0;k<loops;k++) {
                    v->iv(&v->ctx,iv,NULL);
                    v->crypt(&v->ctx,out,in,size);
                }
                double cpu=now(CLOCK_PROCESS_CPUTIME_ID)-c,wall=now(CLOCK_MONOTONIC)-w;
                assert(!memcmp(out,expected,size));
                printf("%d,%u,%s,%u,%.9f,%.9f\n",r,size,v->name,loops,cpu,wall);
            }
        }
        fflush(stdout);
    }
    return 0;
}
