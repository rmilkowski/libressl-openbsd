/* Additional POSIX review tests; not part of the proposed libcrypto diff. */
#include <sys/mman.h>

#include <assert.h>
#include <dlfcn.h>
#include <err.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <openssl/chacha.h>

struct api {
	void *handle;
	void (*key)(ChaCha_ctx *, const unsigned char *, uint32_t);
	void (*iv)(ChaCha_ctx *, const unsigned char *, const unsigned char *);
	void (*crypt)(ChaCha_ctx *, unsigned char *, const unsigned char *, size_t);
};

static struct api
load(const char *path)
{
	struct api a;

	if ((a.handle = dlopen(path, RTLD_LOCAL | RTLD_NOW)) == NULL)
		errx(1, "dlopen: %s", dlerror());
	a.key = dlsym(a.handle, "ChaCha_set_key");
	a.iv = dlsym(a.handle, "ChaCha_set_iv");
	a.crypt = dlsym(a.handle, "ChaCha");
	assert(a.key != NULL && a.iv != NULL && a.crypt != NULL);
	return a;
}

static int
same_state(const ChaCha_ctx *a, const ChaCha_ctx *b)
{
	if (a->unused > 64 || b->unused > 64 || a->unused != b->unused ||
	    memcmp(a->input, b->input, sizeof(a->input)) != 0)
		return 0;
	return memcmp(a->ks + 64 - a->unused, b->ks + 64 - b->unused,
	    a->unused) == 0;
}

static void
init(struct api *a, ChaCha_ctx *ctx, unsigned int bits, uint64_t counter)
{
	unsigned char key[32], iv[8], ctr[8];
	size_t i;

	memset(ctx, 0, sizeof(*ctx));
	for (i = 0; i < sizeof(key); i++)
		key[i] = i * 7 + 1;
	for (i = 0; i < sizeof(iv); i++) {
		iv[i] = i * 13 + 2;
		ctr[i] = counter >> (8 * i);
	}
	a->key(ctx, key, bits);
	a->iv(ctx, iv, ctr);
}

static unsigned char *
guarded_page(size_t page)
{
	unsigned char *mapping;

	mapping = mmap(NULL, page * 3, PROT_NONE, MAP_PRIVATE | MAP_ANON, -1, 0);
	if (mapping == MAP_FAILED ||
	    mprotect(mapping + page, page, PROT_READ | PROT_WRITE) == -1)
		err(1, "guarded mapping");
	return mapping + page;
}

static void
guard_case(struct api *base, struct api *candidate, unsigned char *input,
    unsigned char *output, size_t page, unsigned int bits, uint64_t counter,
    size_t len, int input_end, int output_end, int inplace, size_t prefix)
{
	ChaCha_ctx reference, ctx, before;
	unsigned char tail_in[129], tail_a[129], tail_b[129];
	unsigned char *expected, *in, *out;
	size_t i, offset;

	assert(mprotect(input, page, PROT_READ | PROT_WRITE) == 0);
	for (i = 0; i < page; i++)
		input[i] = i * 17 + i / 193;
	memset(output, 0xa5, page);
	in = input + (input_end ? page - len : 0);
	offset = output_end ? page - len : 0;
	out = output + offset;
	if ((expected = malloc(page)) == NULL)
		err(1, "malloc");
	memset(expected, 0xa5, page);
	init(base, &reference, bits, counter);
	base->crypt(&reference, expected + offset, in, len);
	init(candidate, &ctx, bits, counter);
	if (inplace) {
		memcpy(out, in, len);
		in = out;
	}
	assert(mprotect(input, page, PROT_READ) == 0);
	candidate->crypt(&ctx, out, in, prefix);
	before = ctx;
	candidate->crypt(&ctx, out, in, 0);
	assert(same_state(&ctx, &before));
	candidate->crypt(&ctx, out + prefix, in + prefix, len - prefix);
	if (memcmp(output, expected, page) != 0 || !same_state(&ctx, &reference)) {
		errx(1, "guard: bits=%u counter=%016llx len=%zu in_end=%d "
		    "out_end=%d inplace=%d prefix=%zu", bits,
		    (unsigned long long)counter, len, input_end, output_end,
		    inplace, prefix);
	}
	for (i = 0; i < sizeof(tail_in); i++)
		tail_in[i] = i * 31;
	base->crypt(&reference, tail_a, tail_in, sizeof(tail_a));
	candidate->crypt(&ctx, tail_b, tail_in, sizeof(tail_b));
	assert(memcmp(tail_a, tail_b, sizeof(tail_a)) == 0);
	assert(same_state(&ctx, &reference));
	free(expected);
}

static void
alignment_case(struct api *base, struct api *candidate, unsigned int bits,
    uint64_t counter, size_t len, size_t in_offset, size_t out_offset, int nonzero)
{
	ChaCha_ctx reference, ctx;
	unsigned char input[4112], expected[4112], output[4112];
	size_t i;

	for (i = 0; i < sizeof(input); i++)
		input[i] = nonzero ? i * 17 + i / 193 : 0;
	memset(expected, 0xa5, sizeof(expected));
	memset(output, 0xa5, sizeof(output));
	init(base, &reference, bits, counter);
	init(candidate, &ctx, bits, counter);
	base->crypt(&reference, expected + out_offset, input + in_offset, len);
	candidate->crypt(&ctx, output + out_offset, input + in_offset, len);
	if (memcmp(output, expected, sizeof(output)) != 0 ||
	    !same_state(&ctx, &reference)) {
		errx(1, "alignment: bits=%u counter=%016llx len=%zu "
		    "input=%zu output=%zu nonzero=%d", bits,
		    (unsigned long long)counter, len, in_offset, out_offset, nonzero);
	}
}

int
main(int argc, char **argv)
{
	static const size_t lengths[] = {
		0, 1, 15, 16, 17, 63, 64, 65, 127, 128, 129, 255, 256, 257,
		319, 320, 511, 512, 513, 767, 768, 769, 1023, 1024, 1025,
		4095, 4096
	};
	static const uint64_t counters[] = {
		0, 1, UINT64_C(0xfffffffd), UINT64_C(0xffffffff),
		UINT64_MAX - 2, UINT64_MAX
	};
	static const size_t prefixes[] = { 0, 1, 63 };
	struct api base, candidate;
	unsigned char *input, *output;
	size_t page, i, j, k, a, b, guards = 0, alignments = 0;
	unsigned int bits;
	int input_end, output_end, inplace, nonzero;
	long pagesize;

	if (argc != 3)
		errx(1, "usage: test_bounds original-scalar-library candidate-library");
	base = load(argv[1]);
	candidate = load(argv[2]);
	assert((pagesize = sysconf(_SC_PAGESIZE)) >= 4096);
	page = pagesize;
	input = guarded_page(page);
	output = guarded_page(page);
	for (bits = 128; bits <= 256; bits += 128) {
		for (i = 0; i < sizeof(counters) / sizeof(counters[0]); i++) {
			for (j = 0; j < sizeof(lengths) / sizeof(lengths[0]); j++) {
				for (input_end = 0; input_end <= 1; input_end++)
				for (output_end = 0; output_end <= 1; output_end++)
				for (inplace = 0; inplace <= 1; inplace++)
				for (k = 0; k < sizeof(prefixes) / sizeof(prefixes[0]); k++) {
					if (prefixes[k] > lengths[j])
						continue;
					guard_case(&base, &candidate, input, output, page,
					    bits, counters[i], lengths[j], input_end,
					    output_end, inplace, prefixes[k]);
					guards++;
				}
				for (a = 0; a < 16; a++)
				for (b = 0; b < 16; b++)
				for (nonzero = 0; nonzero <= 1; nonzero++) {
					alignment_case(&base, &candidate, bits, counters[i],
					    lengths[j], a, b, nonzero);
					alignments++;
				}
			}
		}
	}
	assert(munmap(input - page, page * 3) == 0);
	assert(munmap(output - page, page * 3) == 0);
	dlclose(base.handle);
	dlclose(candidate.handle);
	printf("PASS %zu guard-page and %zu independent-alignment cases; "
	    "original scalar output/live-state/cache/continuation comparison\n",
	    guards, alignments);
	return 0;
}
