/* Compare the SSH EVP ChaCha call pattern in two isolated LibreSSL dylibs. */
#include <assert.h>
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <time.h>

struct api {
    void *lib, *ctx;
    void *(*newctx)(void);
    void (*freectx)(void *);
    const void *(*cipher)(void);
    int (*init)(void *, const void *, const unsigned char *, const unsigned char *, int);
    int (*crypt)(void *, unsigned char *, const unsigned char *, unsigned);
};

static struct api
load(const char *path)
{
    struct api a = {0};
    a.lib = dlopen(path, RTLD_NOW | RTLD_LOCAL);
    if (!a.lib) { fprintf(stderr, "%s\n", dlerror()); exit(2); }
    a.newctx = dlsym(a.lib, "EVP_CIPHER_CTX_new");
    a.freectx = dlsym(a.lib, "EVP_CIPHER_CTX_free");
    a.cipher = dlsym(a.lib, "EVP_chacha20");
    a.init = dlsym(a.lib, "EVP_CipherInit");
    a.crypt = dlsym(a.lib, "EVP_Cipher");
    assert(a.newctx && a.freectx && a.cipher && a.init && a.crypt);
    a.ctx = a.newctx();
    assert(a.ctx);
    return a;
}

static double
cpu(void)
{
    struct rusage r;
    assert(getrusage(RUSAGE_SELF, &r) == 0);
    return r.ru_utime.tv_sec + r.ru_utime.tv_usec / 1e6 +
        r.ru_stime.tv_sec + r.ru_stime.tv_usec / 1e6;
}

static double
wall(void)
{
    struct timespec t;
    assert(clock_gettime(CLOCK_MONOTONIC, &t) == 0);
    return t.tv_sec + t.tv_nsec / 1e9;
}

int
main(int argc, char **argv)
{
    assert(argc == 4);
    unsigned pairs = (unsigned)strtoul(argv[3], NULL, 10);
    assert(pairs > 0);
    struct api api[2] = {load(argv[1]), load(argv[2])};
    const char *labels[] = {"upstream", "neon"};
    const unsigned sizes[] = {4, 32, 256, 4096, 32768, 131072};
    unsigned char key[32], iv[16] = {1};
    unsigned char input[131072], output[2][131072];
    for (unsigned i = 0; i < sizeof(key); i++) key[i] = i;
    for (unsigned i = 0; i < sizeof(input); i++) input[i] = (unsigned char)(i * 17 + i / 193);
    for (unsigned b = 0; b < 2; b++)
        assert(api[b].init(api[b].ctx, api[b].cipher(), key, iv, 1) == 1);
    for (unsigned round = 0; round <= pairs; round++) {
        for (unsigned s = 0; s < sizeof(sizes) / sizeof(sizes[0]); s++) {
            unsigned length = sizes[s], n = 256U * 1024 * 1024 / length;
            if (n > 500000) n = 500000;
            for (unsigned b = 0; b < 2; b++) {
                assert(api[b].init(api[b].ctx, NULL, NULL, iv, 1) == 1);
                assert(api[b].crypt(api[b].ctx, output[b], input, length) >= 0);
            }
            assert(memcmp(output[0], output[1], length) == 0);
            for (unsigned position = 0; position < 2; position++) {
                unsigned b = (position + round) % 2;
                double c = cpu(), w = wall();
                for (unsigned i = 0; i < n; i++) {
                    assert(api[b].init(api[b].ctx, NULL, NULL, iv, 1) == 1);
                    assert(api[b].crypt(api[b].ctx, output[b], input, length) >= 0);
                }
                double elapsed = wall() - w, used = cpu() - c;
                printf("{\"backend\":\"%s\",\"size\":%u,\"round\":%u,"
                    "\"warmup\":%s,\"iterations\":%u,\"cpu\":%.9f,\"wall\":%.9f}\n",
                    labels[b], length, round, round == 0 ? "true" : "false", n, used, elapsed);
                fflush(stdout);
            }
        }
    }
    for (unsigned b = 0; b < 2; b++) {
        api[b].freectx(api[b].ctx);
        dlclose(api[b].lib);
    }
    return 0;
}
