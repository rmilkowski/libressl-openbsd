#include <assert.h>
#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <openssl/chacha.h>
struct api {
    void *lib;
    void (*key)(ChaCha_ctx *,const unsigned char *,uint32_t);
    void (*iv)(ChaCha_ctx *,const unsigned char *,const unsigned char *);
    void (*crypt)(ChaCha_ctx *,unsigned char *,const unsigned char *,size_t);
};
static struct api load(const char *name) {
    struct api a={0};a.lib=dlopen(name,RTLD_NOW|RTLD_LOCAL);
    if(!a.lib){fprintf(stderr,"%s\n",dlerror());exit(2);}
    a.key=dlsym(a.lib,"ChaCha_set_key");a.iv=dlsym(a.lib,"ChaCha_set_iv");a.crypt=dlsym(a.lib,"ChaCha");
    assert(a.key&&a.iv&&a.crypt);return a;
}
int main(int argc,char **argv) {
    assert(argc==3);struct api base=load(argv[1]),opt=load(argv[2]);
    const unsigned cap=131072;
    unsigned char *src=malloc(cap+64),*a=malloc(cap+64),*b=malloc(cap+64);
    assert(src&&a&&b);arc4random_buf(src,cap+64);
    const uint64_t counters[]={0,1,0xfffffffdULL,0xffffffffULL,0xfffffffffffffffdULL,UINT64_MAX};
    unsigned char key[32],iv[8],ctr[8];unsigned cases=0;
    for(unsigned bits=128;bits<=256;bits+=128)for(unsigned ci=0;ci<6;ci++)for(unsigned off=0;off<4;off++) {
        arc4random_buf(key,32);arc4random_buf(iv,8);
        for(unsigned j=0;j<8;j++)ctr[j]=(unsigned char)(counters[ci]>>(8*j));
        for(unsigned index=0;index<1031;index++) {
            unsigned n=index<=1024?index:((unsigned[]){1025,4095,4096,32767,32768,131072})[index-1025];
            ChaCha_ctx reference={0},candidate={0};
            memset(a,0xa5,cap+64);memset(b,0xa5,cap+64);
            base.key(&reference,key,bits);base.iv(&reference,iv,ctr);
            opt.key(&candidate,key,bits);opt.iv(&candidate,iv,ctr);
            base.crypt(&reference,a+off,src+off,n);opt.crypt(&candidate,b+off,src+off,n);
            assert(memcmp(a,b,cap+64)==0);
            // Split input so each boundary can leave cached keystream bytes.
            opt.iv(&candidate,iv,ctr);
            for(unsigned pos=0,step=0;pos<n;step++) {
                unsigned take=(step*193)%521+1;if(take>n-pos)take=n-pos;
                opt.crypt(&candidate,b+off+pos,src+off+pos,take);pos+=take;
            }
            assert(memcmp(a+off,b+off,n)==0);
            // Verify continued output after a full or partial final block.
            base.crypt(&reference,a,src,129);opt.crypt(&candidate,b,src,129);
            assert(memcmp(a,b,129)==0);
            // Exact in-place operation, again with arbitrary call boundaries.
            memcpy(b+off,src+off,n);opt.iv(&candidate,iv,ctr);base.iv(&reference,iv,ctr);
            base.crypt(&reference,a+off,src+off,n);
            for(unsigned pos=0;pos<n;) {
                unsigned take=(pos*17)%769+1;if(take>n-pos)take=n-pos;
                opt.crypt(&candidate,b+off+pos,b+off+pos,take);pos+=take;
            }
            assert(memcmp(a+off,b+off,n)==0);cases++;
        }
    }
    printf("PASS %u LibreSSL differential cases: 128/256-bit keys, zero/boundary lengths, unaligned buffers, 64-bit counter carry/wrap, cached-stream continuation, and in-place split calls\n",cases);
    free(src);free(a);free(b);dlclose(base.lib);dlclose(opt.lib);return 0;
}
