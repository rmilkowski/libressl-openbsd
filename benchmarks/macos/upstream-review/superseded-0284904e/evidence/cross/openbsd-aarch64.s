	.aeabi_subsection	aeabi_feature_and_bits, optional, uleb128
	.aeabi_attribute	0, 1	// Tag_Feature_BTI
	.aeabi_attribute	1, 1	// Tag_Feature_PAC
	.aeabi_attribute	2, 0	// Tag_Feature_GCS
	.section	.note.gnu.property,"a",@note
	.p2align	3, 0x0
	.word	4
	.word	16
	.word	5
	.asciz	"GNU"
	.word	3221225472
	.word	4
	.word	3
	.word	0
.Lsec_end0:
	.text
	.file	"chacha.c"
	.globl	CRYPTO_hchacha_20               // -- Begin function CRYPTO_hchacha_20
	.p2align	2
	.type	CRYPTO_hchacha_20,@function
CRYPTO_hchacha_20:                      // @CRYPTO_hchacha_20
// %bb.0:
	hint	#34
	str	x23, [sp, #-48]!                // 8-byte Folded Spill
	ldrb	w8, [x1]
	ldrb	w9, [x1, #1]
	ldrb	w11, [x1, #4]
	ldrb	w12, [x1, #5]
	ldrb	w10, [x1, #2]
	ldrb	w15, [x1, #6]
	orr	w8, w8, w9, lsl #8
	ldrb	w13, [x1, #8]
	ldrb	w14, [x1, #9]
	orr	w11, w11, w12, lsl #8
	ldrb	w9, [x1, #3]
	ldrb	w12, [x1, #7]
	orr	w8, w8, w10, lsl #16
	orr	w13, w13, w14, lsl #8
	ldrb	w16, [x1, #13]
	orr	w11, w11, w15, lsl #16
	ldrb	w15, [x1, #12]
	ldrb	w14, [x1, #10]
	ldrb	w17, [x1, #16]
	orr	w10, w8, w9, lsl #24
	ldrb	w18, [x1, #17]
	orr	w9, w11, w12, lsl #24
	orr	w11, w15, w16, lsl #8
	ldrb	w12, [x1, #14]
	ldrb	w15, [x1, #20]
	ldrb	w16, [x1, #21]
	orr	w8, w13, w14, lsl #16
	orr	w13, w17, w18, lsl #8
	ldrb	w14, [x1, #18]
	ldrb	w17, [x1, #11]
	orr	w11, w11, w12, lsl #16
	ldrb	w18, [x1, #15]
	orr	w15, w15, w16, lsl #8
	ldrb	w16, [x1, #22]
	ldrb	w4, [x1, #24]
	ldrb	w5, [x1, #25]
	orr	w13, w13, w14, lsl #16
	ldrb	w3, [x1, #19]
	orr	w12, w8, w17, lsl #24
	orr	w14, w11, w18, lsl #24
	orr	w8, w15, w16, lsl #16
	ldrb	w11, [x1, #23]
	orr	w16, w4, w5, lsl #8
	ldrb	w17, [x1, #26]
	orr	w13, w13, w3, lsl #24
	ldrb	w18, [x1, #28]
	ldrb	w3, [x1, #29]
	orr	w15, w8, w11, lsl #24
	ldrb	w8, [x2]
	ldrb	w11, [x2, #1]
	orr	w16, w16, w17, lsl #16
	ldrb	w17, [x1, #27]
	orr	w18, w18, w3, lsl #8
	ldrb	w3, [x1, #30]
	orr	w8, w8, w11, lsl #8
	ldrb	w11, [x2, #2]
	ldrb	w4, [x2, #5]
	orr	w17, w16, w17, lsl #24
	ldrb	w16, [x2, #4]
	orr	w18, w18, w3, lsl #16
	orr	w8, w8, w11, lsl #16
	ldrb	w3, [x2, #9]
	ldrb	w5, [x2, #12]
	orr	w11, w16, w4, lsl #8
	ldrb	w16, [x2, #8]
	ldrb	w6, [x2, #13]
	ldrb	w1, [x1, #31]
	ldrb	w4, [x2, #6]
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	orr	w16, w16, w3, lsl #8
	ldrb	w3, [x2, #10]
	orr	w5, w5, w6, lsl #8
	ldrb	w6, [x2, #14]
	ldrb	w7, [x2, #3]
	orr	w11, w11, w4, lsl #16
	ldrb	w19, [x2, #7]
	orr	w16, w16, w3, lsl #16
	ldrb	w3, [x2, #11]
	orr	w4, w18, w1, lsl #24
	orr	w1, w5, w6, lsl #16
	ldrb	w5, [x2, #15]
	orr	w2, w8, w7, lsl #24
	orr	w18, w11, w19, lsl #24
	orr	w16, w16, w3, lsl #24
	orr	w11, w1, w5, lsl #24
	mov	w1, #25972                      // =0x6574
	mov	w3, #11570                      // =0x2d32
	mov	w5, #25710                      // =0x646e
	mov	w6, #30821                      // =0x7865
	movk	w1, #27424, lsl #16
	movk	w3, #31074, lsl #16
	movk	w5, #13088, lsl #16
	movk	w6, #24944, lsl #16
	mov	w8, #22                         // =0x16
	stp	x22, x21, [sp, #16]             // 16-byte Folded Spill
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	add	w6, w6, w10
	add	w5, w5, w9
	add	w3, w3, w12
	eor	w2, w6, w2
	eor	w18, w5, w18
	eor	w16, w3, w16
	add	w1, w1, w14
	ror	w2, w2, #16
	ror	w18, w18, #16
	eor	w11, w1, w11
	ror	w16, w16, #16
	sub	w8, w8, #2
	ror	w7, w11, #16
	add	w19, w2, w13
	add	w15, w18, w15
	add	w17, w16, w17
	eor	w10, w19, w10
	eor	w9, w15, w9
	add	w4, w7, w4
	eor	w11, w17, w12
	ror	w12, w10, #20
	eor	w10, w4, w14
	ror	w20, w9, #20
	ror	w21, w11, #20
	ror	w22, w10, #20
	add	w6, w12, w6
	cmp	w8, #2
	add	w5, w20, w5
	add	w3, w21, w3
	eor	w9, w6, w2
	eor	w10, w5, w18
	eor	w13, w3, w16
	add	w11, w22, w1
	ror	w2, w9, #24
	ror	w23, w10, #24
	eor	w9, w11, w7
	ror	w13, w13, #24
	ror	w7, w9, #24
	add	w10, w23, w15
	add	w9, w2, w19
	add	w14, w13, w17
	add	w15, w7, w4
	eor	w16, w10, w20
	eor	w18, w14, w21
	eor	w1, w15, w22
	ror	w17, w16, #25
	eor	w12, w9, w12
	ror	w18, w18, #25
	ror	w1, w1, #25
	ror	w16, w12, #25
	add	w12, w17, w6
	add	w4, w18, w5
	add	w3, w1, w3
	eor	w5, w12, w7
	eor	w2, w4, w2
	add	w11, w16, w11
	eor	w6, w3, w23
	ror	w7, w5, #16
	ror	w2, w2, #16
	eor	w13, w11, w13
	ror	w19, w6, #16
	ror	w13, w13, #16
	add	w14, w7, w14
	add	w15, w2, w15
	add	w9, w19, w9
	add	w10, w13, w10
	eor	w17, w14, w17
	eor	w18, w15, w18
	eor	w1, w9, w1
	ror	w20, w17, #20
	eor	w16, w10, w16
	ror	w21, w18, #20
	ror	w22, w1, #20
	ror	w23, w16, #20
	add	w6, w20, w12
	add	w5, w21, w4
	add	w3, w22, w3
	eor	w12, w6, w7
	eor	w16, w5, w2
	add	w1, w23, w11
	eor	w17, w3, w19
	ror	w11, w12, #24
	ror	w2, w16, #24
	eor	w12, w1, w13
	ror	w18, w17, #24
	ror	w16, w12, #24
	add	w4, w2, w15
	add	w17, w11, w14
	add	w13, w18, w9
	add	w15, w16, w10
	eor	w10, w4, w21
	eor	w9, w17, w20
	eor	w14, w13, w22
	ror	w12, w10, #25
	eor	w10, w15, w23
	ror	w9, w9, #25
	ror	w14, w14, #25
	ror	w10, w10, #25
	b.hi	.LBB0_1
// %bb.2:
	lsr	w8, w6, #8
	lsr	w9, w6, #24
	strb	w6, [x0]
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	strb	w5, [x0, #4]
	strb	w8, [x0, #1]
	lsr	w8, w6, #16
	strb	w9, [x0, #3]
	lsr	w9, w5, #16
	strb	w8, [x0, #2]
	lsr	w8, w5, #8
	strb	w9, [x0, #6]
	lsr	w9, w3, #16
	strb	w8, [x0, #5]
	lsr	w8, w5, #24
	strb	w9, [x0, #10]
	lsr	w9, w1, #16
	strb	w8, [x0, #7]
	lsr	w8, w3, #8
	strb	w9, [x0, #14]
	lsr	w9, w2, #16
	strb	w8, [x0, #9]
	lsr	w8, w3, #24
	strb	w9, [x0, #18]
	lsr	w9, w18, #16
	strb	w8, [x0, #11]
	lsr	w8, w1, #8
	strb	w9, [x0, #22]
	lsr	w9, w16, #16
	strb	w8, [x0, #13]
	lsr	w8, w1, #24
	strb	w9, [x0, #26]
	lsr	w9, w11, #16
	strb	w8, [x0, #15]
	lsr	w8, w2, #8
	ldp	x22, x21, [sp, #16]             // 16-byte Folded Reload
	strb	w3, [x0, #8]
	strb	w8, [x0, #17]
	lsr	w8, w2, #24
	strb	w1, [x0, #12]
	strb	w8, [x0, #19]
	lsr	w8, w18, #8
	strb	w2, [x0, #16]
	strb	w8, [x0, #21]
	lsr	w8, w18, #24
	strb	w18, [x0, #20]
	strb	w8, [x0, #23]
	lsr	w8, w16, #8
	strb	w16, [x0, #24]
	strb	w8, [x0, #25]
	lsr	w8, w16, #24
	strb	w11, [x0, #28]
	strb	w8, [x0, #27]
	lsr	w8, w11, #8
	strb	w9, [x0, #30]
	strb	w8, [x0, #29]
	lsr	w8, w11, #24
	strb	w8, [x0, #31]
	ldr	x23, [sp], #48                  // 8-byte Folded Reload
	ret
.Lfunc_end0:
	.size	CRYPTO_hchacha_20, .Lfunc_end0-CRYPTO_hchacha_20
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          // -- Begin function ChaCha_set_key
.LCPI1_0:
	.word	824206446                       // 0x3120646e
	.word	2036477238                      // 0x79622d36
.LCPI1_1:
	.word	857760878                       // 0x3320646e
	.word	2036477234                      // 0x79622d32
	.text
	.globl	ChaCha_set_key
	.p2align	2
	.type	ChaCha_set_key,@function
ChaCha_set_key:                         // @ChaCha_set_key
// %bb.0:
	hint	#34
	ldrb	w8, [x1]
	ldrb	w9, [x1, #1]
	cmp	w2, #256
	ldrb	w10, [x1, #2]
	adrp	x12, .LCPI1_1
	orr	w8, w8, w9, lsl #8
	ldrb	w9, [x1, #3]
	ldr	d2, [x12, :lo12:.LCPI1_1]
	orr	w8, w8, w10, lsl #16
	orr	w8, w8, w9, lsl #24
	str	w8, [x0, #16]
	ldrb	w8, [x1, #4]
	ldrb	w9, [x1, #5]
	ldrb	w10, [x1, #6]
	orr	w8, w8, w9, lsl #8
	ldrb	w9, [x1, #7]
	orr	w8, w8, w10, lsl #16
	orr	w8, w8, w9, lsl #24
	str	w8, [x0, #20]
	ldrb	w8, [x1, #8]
	ldrb	w9, [x1, #9]
	ldrb	w10, [x1, #10]
	orr	w8, w8, w9, lsl #8
	ldrb	w9, [x1, #11]
	orr	w8, w8, w10, lsl #16
	orr	w8, w8, w9, lsl #24
	str	w8, [x0, #24]
	ldrb	w8, [x1, #12]
	ldrb	w9, [x1, #13]
	ldrb	w10, [x1, #14]
	orr	w8, w8, w9, lsl #8
	ldrb	w9, [x1, #15]
	orr	w8, w8, w10, lsl #16
	mov	w10, #16                        // =0x10
	orr	w9, w8, w9, lsl #24
	csel	x8, x10, xzr, eq
	add	x8, x1, x8
	str	w9, [x0, #28]
	ldrb	w9, [x8]
	ldrb	w10, [x8, #1]
	ldrb	w11, [x8, #2]
	orr	w9, w9, w10, lsl #8
	ldrb	w10, [x8, #3]
	orr	w9, w9, w11, lsl #16
	orr	w9, w9, w10, lsl #24
	str	w9, [x0, #32]
	ldrb	w9, [x8, #4]
	ldrb	w10, [x8, #5]
	ldrb	w11, [x8, #6]
	orr	w9, w9, w10, lsl #8
	ldrb	w10, [x8, #7]
	orr	w9, w9, w11, lsl #16
	orr	w9, w9, w10, lsl #24
	cset	w10, eq
	dup	v0.2s, w10
	str	w9, [x0, #36]
	ldrb	w9, [x8, #8]
	ldrb	w10, [x8, #9]
	ldrb	w11, [x8, #10]
	orr	w9, w9, w10, lsl #8
	shl	v0.2s, v0.2s, #31
	ldrb	w10, [x8, #11]
	orr	w9, w9, w11, lsl #16
	adrp	x11, .LCPI1_0
	cmlt	v0.2s, v0.2s, #0
	ldr	d1, [x11, :lo12:.LCPI1_0]
	orr	w9, w9, w10, lsl #24
	str	w9, [x0, #40]
	bsl	v0.8b, v2.8b, v1.8b
	ldrb	w9, [x8, #12]
	ldrb	w10, [x8, #13]
	ldrb	w11, [x8, #14]
	ldrb	w8, [x8, #15]
	strb	wzr, [x0, #128]
	orr	w9, w9, w10, lsl #8
	mov	w10, #30821                     // =0x7865
	fmov	x12, d0
	movk	w10, #24944, lsl #16
	orr	w9, w9, w11, lsl #16
	lsr	x11, x12, #32
	stp	w10, w12, [x0]
	mov	w10, #25972                     // =0x6574
	orr	w8, w9, w8, lsl #24
	movk	w10, #27424, lsl #16
	stp	w11, w10, [x0, #8]
	str	w8, [x0, #44]
	ret
.Lfunc_end1:
	.size	ChaCha_set_key, .Lfunc_end1-ChaCha_set_key
                                        // -- End function
	.globl	ChaCha_set_iv                   // -- Begin function ChaCha_set_iv
	.p2align	2
	.type	ChaCha_set_iv,@function
ChaCha_set_iv:                          // @ChaCha_set_iv
// %bb.0:
	hint	#34
	cbz	x2, .LBB2_2
// %bb.1:
	ldrb	w8, [x2]
	ldrb	w9, [x2, #1]
	orr	w8, w8, w9, lsl #8
	ldrb	w9, [x2, #2]
	orr	w8, w8, w9, lsl #16
	ldrb	w9, [x2, #3]
	orr	w8, w8, w9, lsl #24
	str	w8, [x0, #48]
	ldrb	w8, [x2, #4]
	ldrb	w9, [x2, #5]
	orr	w8, w8, w9, lsl #8
	ldrb	w9, [x2, #6]
	orr	w8, w8, w9, lsl #16
	ldrb	w9, [x2, #7]
	orr	w8, w8, w9, lsl #24
	b	.LBB2_3
.LBB2_2:
	mov	w8, wzr
	str	wzr, [x0, #48]
.LBB2_3:
	str	w8, [x0, #52]
	ldrb	w8, [x1]
	ldrb	w9, [x1, #1]
	orr	w8, w8, w9, lsl #8
	ldrb	w9, [x1, #2]
	orr	w8, w8, w9, lsl #16
	ldrb	w9, [x1, #3]
	orr	w8, w8, w9, lsl #24
	str	w8, [x0, #56]
	ldrb	w8, [x1, #4]
	ldrb	w9, [x1, #5]
	ldrb	w10, [x1, #7]
	orr	w8, w8, w9, lsl #8
	ldrb	w9, [x1, #6]
	strb	wzr, [x0, #128]
	orr	w8, w8, w9, lsl #16
	orr	w8, w8, w10, lsl #24
	str	w8, [x0, #60]
	ret
.Lfunc_end2:
	.size	ChaCha_set_iv, .Lfunc_end2-ChaCha_set_iv
                                        // -- End function
	.globl	ChaCha                          // -- Begin function ChaCha
	.p2align	2
	.type	ChaCha,@function
ChaCha:                                 // @ChaCha
// %bb.0:
	hint	#25
	stp	x29, x30, [sp, #-80]!           // 16-byte Folded Spill
	str	x28, [sp, #16]                  // 8-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #32]             // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             // 16-byte Folded Spill
	sub	sp, sp, #672
	mov	x8, x0
	mov	x19, x3
	mov	x22, x2
	ldrb	w14, [x8, #128]!
	mov	x20, x0
	mov	x21, x1
	cbz	x14, .LBB3_8
// %bb.1:
	cmp	x19, x14
	csel	x9, x19, x14, lo
	cbz	x19, .LBB3_7
// %bb.2:
	sub	w12, w9, #1
	sub	x10, x8, x14
	cmp	w12, #31
	b.hs	.LBB3_12
// %bb.3:
	mov	w11, wzr
.LBB3_4:
	sub	w11, w9, w11
	mov	x12, x21
	mov	x13, x22
.LBB3_5:                                // =>This Inner Loop Header: Depth=1
	ldrb	w14, [x13], #1
	subs	w11, w11, #1
	ldrb	w15, [x10], #1
	eor	w14, w15, w14
	strb	w14, [x12], #1
	b.ne	.LBB3_5
.LBB3_6:
	ldrb	w14, [x8]
	mov	x22, x13
	mov	x21, x12
.LBB3_7:
	sub	w10, w14, w9
	sub	x19, x19, x9
	strb	w10, [x8]
.LBB3_8:
	cbz	x19, .LBB3_11
// %bb.9:
	mov	w24, #-1                        // =0xffffffff
.LBB3_10:                               // =>This Inner Loop Header: Depth=1
	cmp	x19, x24
	mov	x0, x20
	mov	x1, x22
	csel	x23, x19, x24, lo
	mov	x2, x21
	mov	w3, w23
	bl	chacha_encrypt_bytes
	subs	x19, x19, x23
	add	x22, x22, x23
	add	x21, x21, x23
	b.ne	.LBB3_10
.LBB3_11:
	add	sp, sp, #672
	ldp	x20, x19, [sp, #64]             // 16-byte Folded Reload
	ldr	x28, [sp, #16]                  // 8-byte Folded Reload
	ldp	x22, x21, [sp, #48]             // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80             // 16-byte Folded Reload
	hint	#29
	ret
.LBB3_12:
	sub	x11, x21, x22
	cmp	x11, #32
	mov	w11, wzr
	b.lo	.LBB3_4
// %bb.13:
	add	x13, x21, x14
	sub	x13, x13, x20
	sub	x13, x13, #128
	cmp	x13, #32
	b.lo	.LBB3_4
// %bb.14:
	mov	x14, x22
	ldrb	w13, [x22, #2]
	ldrb	w11, [x22, #1]
	ldrb	w15, [x14, #4]!
	ldrb	w16, [x14, #2]
	ldrb	w17, [x22]
	ldrb	w18, [x22, #3]
	lsl	x13, x13, #16
	ldrb	w0, [x22, #5]
	ldrb	w14, [x14, #3]
	lsl	w16, w16, #16
	orr	x11, x17, x11, lsl #8
	orr	x13, x13, x18, lsl #24
	orr	w15, w15, w0, lsl #8
	orr	w14, w16, w14, lsl #24
	orr	x11, x13, x11
	orr	w13, w14, w15
	orr	x11, x11, x13, lsl #32
	mov	x13, x22
	stur	x11, [x29, #-96]
	ldrb	w11, [x13, #8]!
	ldrb	w14, [x13, #3]
	ldrb	w15, [x13, #2]
	ldrb	w16, [x13, #4]!
	ldrb	w17, [x13, #2]
	ldrb	w18, [x22, #9]
	ldrb	w0, [x22, #13]
	ldrb	w13, [x13, #3]
	lsl	x15, x15, #16
	lsl	w17, w17, #16
	orr	x11, x11, x18, lsl #8
	orr	w16, w16, w0, lsl #8
	orr	x14, x15, x14, lsl #24
	orr	w13, w17, w13, lsl #24
	orr	x11, x14, x11
	orr	w13, w13, w16
	orr	x11, x11, x13, lsl #32
	mov	x13, x22
	stur	x11, [x29, #-88]
	ldrb	w11, [x13, #16]!
	mov	x15, x13
	ldrb	w14, [x13, #2]
	ldrb	w16, [x15, #4]!
	ldrb	w17, [x15, #2]
	ldrb	w18, [x22, #17]
	ldrb	w0, [x13, #3]
	ldrb	w1, [x22, #21]
	ldrb	w15, [x15, #3]
	lsl	x14, x14, #16
	lsl	w17, w17, #16
	orr	x11, x11, x18, lsl #8
	ldur	q0, [x29, #-96]
	orr	w16, w16, w1, lsl #8
	orr	x14, x14, x0, lsl #24
	orr	w15, w17, w15, lsl #24
	orr	x11, x14, x11
	orr	w14, w15, w16
	orr	x11, x11, x14, lsl #32
	stur	x11, [x29, #-64]
	mov	x11, x13
	ldrb	w14, [x11, #8]!
	ldrb	w15, [x11, #3]
	ldrb	w16, [x11, #2]
	ldrb	w17, [x11, #4]!
	ldrb	w18, [x11, #2]
	ldrb	w0, [x13, #9]
	ldrb	w13, [x13, #13]
	ldrb	w11, [x11, #3]
	lsl	x16, x16, #16
	lsl	w18, w18, #16
	orr	x14, x14, x0, lsl #8
	orr	w13, w17, w13, lsl #8
	orr	x15, x16, x15, lsl #24
	orr	w11, w18, w11, lsl #24
	orr	x14, x15, x14
	orr	w11, w11, w13
	orr	x11, x14, x11, lsl #32
	stur	x11, [x29, #-56]
	mov	x11, x10
	ldrb	w14, [x10, #2]
	ldrb	w15, [x11, #4]!
	ldrb	w16, [x11, #2]
	ldrb	w13, [x10, #1]
	ldrb	w17, [x10]
	ldrb	w18, [x10, #3]
	ldrb	w0, [x10, #5]
	ldrb	w11, [x11, #3]
	lsl	x14, x14, #16
	lsl	w16, w16, #16
	orr	x13, x17, x13, lsl #8
	orr	w15, w15, w0, lsl #8
	ldur	q1, [x29, #-64]
	orr	x14, x14, x18, lsl #24
	orr	w11, w16, w11, lsl #24
	orr	x13, x14, x13
	orr	w11, w11, w15
	orr	x11, x13, x11, lsl #32
	mov	x13, x10
	stur	x11, [x29, #-80]
	ldrb	w11, [x13, #8]!
	ldrb	w14, [x13, #3]
	ldrb	w15, [x13, #2]
	ldrb	w16, [x13, #4]!
	ldrb	w17, [x13, #2]
	ldrb	w18, [x10, #9]
	ldrb	w0, [x10, #13]
	ldrb	w13, [x13, #3]
	lsl	x15, x15, #16
	lsl	w17, w17, #16
	orr	x11, x11, x18, lsl #8
	orr	w16, w16, w0, lsl #8
	orr	x14, x15, x14, lsl #24
	orr	w13, w17, w13, lsl #24
	orr	x11, x14, x11
	orr	w13, w13, w16
	orr	x11, x11, x13, lsl #32
	mov	x13, x10
	stur	x11, [x29, #-72]
	ldrb	w11, [x13, #16]!
	mov	x15, x13
	ldrb	w14, [x13, #2]
	ldrb	w16, [x15, #4]!
	ldrb	w17, [x15, #2]
	ldrb	w18, [x10, #17]
	ldrb	w0, [x13, #3]
	ldrb	w1, [x10, #21]
	ldrb	w15, [x15, #3]
	lsl	x14, x14, #16
	lsl	w17, w17, #16
	orr	x11, x11, x18, lsl #8
	ldur	q2, [x29, #-80]
	orr	w16, w16, w1, lsl #8
	orr	x14, x14, x0, lsl #24
	orr	w15, w17, w15, lsl #24
	eor	v2.16b, v2.16b, v0.16b
	orr	x11, x14, x11
	orr	w14, w15, w16
	orr	x11, x11, x14, lsl #32
	stur	x11, [x29, #-48]
	mov	x11, x13
	ldrb	w14, [x11, #8]!
	ldrb	w15, [x11, #3]
	ldrb	w16, [x11, #2]
	ldrb	w17, [x11, #4]!
	ldrb	w18, [x11, #2]
	ldrb	w0, [x13, #9]
	ldrb	w13, [x13, #13]
	ldrb	w11, [x11, #3]
	lsl	x16, x16, #16
	stur	q2, [x29, #-32]
	lsl	w18, w18, #16
	orr	x14, x14, x0, lsl #8
	orr	w13, w17, w13, lsl #8
	orr	x15, x16, x15, lsl #24
	orr	w11, w18, w11, lsl #24
	orr	x14, x15, x14
	orr	w11, w11, w13
	orr	x11, x14, x11, lsl #32
	stur	x11, [x29, #-40]
	ldur	x11, [x29, #-32]
	ldur	q0, [x29, #-48]
	lsr	x13, x11, #40
	lsr	x14, x11, #24
	strb	w11, [x21]
	lsr	x15, x11, #16
	ldur	x16, [x29, #-24]
	lsr	x17, x11, #56
	strb	w13, [x21, #5]
	lsr	x13, x11, #8
	eor	v0.16b, v0.16b, v1.16b
	strb	w14, [x21, #3]
	lsr	x14, x11, #32
	lsr	x11, x11, #48
	strb	w15, [x21, #2]
	mov	x15, x21
	strb	w14, [x15, #4]!
	lsr	x14, x16, #24
	strb	w11, [x15, #2]
	lsr	x11, x16, #40
	strb	w17, [x15, #3]
	lsr	x15, x16, #16
	strb	w11, [x21, #13]
	lsr	x11, x16, #8
	strb	w13, [x21, #1]
	mov	x13, x21
	strb	w16, [x13, #8]!
	strb	w14, [x13, #3]
	lsr	x14, x16, #32
	strb	w15, [x13, #2]
	lsr	x15, x16, #56
	strb	w11, [x21, #9]
	lsr	x11, x16, #48
	strb	w14, [x13, #4]!
	strb	w15, [x13, #3]
	strb	w11, [x13, #2]
	mov	x13, x21
	stur	q0, [x29, #-16]
	ldur	x11, [x29, #-16]
	lsr	x14, x11, #40
	strb	w11, [x13, #16]!
	ldur	x17, [x29, #-8]
	lsr	x16, x11, #16
	lsr	x15, x11, #24
	strb	w14, [x21, #21]
	lsr	x14, x11, #8
	lsr	x0, x11, #48
	strb	w16, [x13, #2]
	lsr	x16, x17, #8
	lsr	x18, x17, #24
	strb	w14, [x21, #17]
	lsr	x14, x17, #40
	strb	w15, [x13, #3]
	mov	x15, x13
	strb	w14, [x13, #13]
	lsr	x14, x17, #16
	strb	w16, [x13, #9]
	lsr	x16, x11, #32
	strb	w17, [x15, #8]!
	strb	w18, [x15, #3]
	lsr	x18, x11, #56
	strb	w14, [x15, #2]
	add	x14, x12, #1
	lsr	x12, x17, #32
	strb	w16, [x13, #4]!
	and	x11, x14, #0x1ffffffe0
	lsr	x16, x17, #56
	lsr	x17, x17, #48
	strb	w18, [x13, #3]
	strb	w0, [x13, #2]
	cmp	x11, #32
	add	x13, x22, x11
	strb	w12, [x15, #4]!
	add	x12, x21, x11
	strb	w16, [x15, #3]
	strb	w17, [x15, #2]
	b.eq	.LBB3_21
// %bb.15:
	mov	x15, x22
	cmp	x11, #64
	ldrb	w16, [x15, #32]!
	mov	x18, x15
	ldrb	w17, [x15, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x15, #1]
	ldrb	w3, [x15, #3]
	ldrb	w4, [x15, #5]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x16, x16, x2, lsl #8
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x16, x17, x16
	orr	w17, w18, w0
	orr	x16, x16, x17, lsl #32
	mov	x17, x15
	stur	x16, [x29, #-176]
	ldrb	w16, [x17, #8]!
	ldrb	w18, [x17, #3]
	ldrb	w0, [x17, #2]
	ldrb	w1, [x17, #4]!
	ldrb	w2, [x17, #2]
	ldrb	w3, [x15, #9]
	ldrb	w4, [x15, #13]
	ldrb	w17, [x17, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x16, x16, x3, lsl #8
	orr	w1, w1, w4, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w17, w2, w17, lsl #24
	orr	x16, x18, x16
	orr	w17, w17, w1
	orr	x16, x16, x17, lsl #32
	stur	x16, [x29, #-168]
	mov	x16, x15
	ldrb	w17, [x16, #16]!
	mov	x0, x16
	ldrb	w18, [x16, #2]
	ldrb	w1, [x0, #4]!
	ldrb	w2, [x0, #2]
	ldrb	w3, [x15, #17]
	ldrb	w15, [x15, #21]
	ldrb	w4, [x16, #3]
	ldrb	w0, [x0, #3]
	lsl	x18, x18, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w15, w1, w15, lsl #8
	orr	x18, x18, x4, lsl #24
	ldur	q0, [x29, #-176]
	orr	w0, w2, w0, lsl #24
	orr	x17, x18, x17
	orr	w15, w0, w15
	orr	x15, x17, x15, lsl #32
	stur	x15, [x29, #-192]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	orr	x16, x17, x15, lsl #32
	mov	x15, x10
	stur	x16, [x29, #-184]
	ldrb	w16, [x15, #32]!
	mov	x18, x15
	ldrb	w17, [x15, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x15, #1]
	ldrb	w3, [x15, #3]
	ldrb	w4, [x15, #5]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x16, x16, x2, lsl #8
	ldur	q1, [x29, #-192]
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x16, x17, x16
	orr	w17, w18, w0
	orr	x16, x16, x17, lsl #32
	mov	x17, x15
	stur	x16, [x29, #-144]
	ldrb	w16, [x17, #8]!
	ldrb	w18, [x17, #3]
	ldrb	w0, [x17, #2]
	ldrb	w1, [x17, #4]!
	ldrb	w2, [x17, #2]
	ldrb	w3, [x15, #9]
	ldrb	w4, [x15, #13]
	ldrb	w17, [x17, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x16, x16, x3, lsl #8
	orr	w1, w1, w4, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w17, w2, w17, lsl #24
	orr	x16, x18, x16
	orr	w17, w17, w1
	orr	x16, x16, x17, lsl #32
	stur	x16, [x29, #-136]
	mov	x16, x15
	ldrb	w17, [x16, #16]!
	mov	x0, x16
	ldrb	w18, [x16, #2]
	ldrb	w1, [x0, #4]!
	ldrb	w2, [x0, #2]
	ldrb	w3, [x15, #17]
	ldrb	w15, [x15, #21]
	ldrb	w4, [x16, #3]
	ldrb	w0, [x0, #3]
	lsl	x18, x18, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w15, w1, w15, lsl #8
	orr	x18, x18, x4, lsl #24
	ldur	q2, [x29, #-144]
	orr	w0, w2, w0, lsl #24
	orr	x17, x18, x17
	eor	v0.16b, v2.16b, v0.16b
	orr	w15, w0, w15
	orr	x15, x17, x15, lsl #32
	stur	x15, [x29, #-160]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	stur	q0, [x29, #-112]
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	ldur	x16, [x29, #-112]
	orr	x15, x17, x15, lsl #32
	lsr	x17, x16, #40
	lsr	x18, x16, #24
	lsr	x0, x16, #16
	stur	x15, [x29, #-152]
	mov	x15, x21
	ldur	q2, [x29, #-160]
	strb	w16, [x15, #32]!
	ldur	x1, [x29, #-104]
	strb	w17, [x15, #5]
	lsr	x17, x16, #8
	strb	w18, [x15, #3]
	lsr	x18, x16, #32
	eor	v0.16b, v2.16b, v1.16b
	strb	w17, [x15, #1]
	lsr	x17, x16, #56
	lsr	x16, x16, #48
	strb	w0, [x15, #2]
	mov	x0, x15
	strb	w18, [x0, #4]!
	lsr	x18, x1, #8
	strb	w16, [x0, #2]
	lsr	x16, x1, #40
	strb	w17, [x0, #3]
	lsr	x0, x1, #24
	mov	x17, x15
	strb	w16, [x15, #13]
	lsr	x16, x1, #16
	strb	w1, [x17, #8]!
	strb	w18, [x15, #9]
	lsr	x18, x1, #32
	strb	w0, [x17, #3]
	lsr	x0, x1, #56
	strb	w16, [x17, #2]
	lsr	x16, x1, #48
	strb	w18, [x17, #4]!
	strb	w0, [x17, #3]
	strb	w16, [x17, #2]
	mov	x17, x15
	stur	q0, [x29, #-128]
	ldur	x16, [x29, #-128]
	lsr	x0, x16, #24
	strb	w16, [x17, #16]!
	lsr	x18, x16, #40
	ldur	x1, [x29, #-120]
	strb	w0, [x17, #3]
	lsr	x0, x16, #8
	strb	w18, [x15, #21]
	lsr	x18, x16, #16
	strb	w0, [x15, #17]
	lsr	x15, x1, #40
	lsr	x0, x1, #8
	strb	w18, [x17, #2]
	mov	x18, x17
	strb	w15, [x17, #13]
	lsr	x15, x1, #24
	strb	w0, [x17, #9]
	lsr	x0, x1, #16
	strb	w1, [x18, #8]!
	strb	w15, [x18, #3]
	lsr	x15, x16, #32
	strb	w0, [x18, #2]
	lsr	x0, x16, #56
	lsr	x16, x16, #48
	strb	w15, [x17, #4]!
	lsr	x15, x1, #32
	strb	w0, [x17, #3]
	lsr	x0, x1, #56
	strb	w16, [x17, #2]
	lsr	x16, x1, #48
	strb	w15, [x18, #4]!
	strb	w0, [x18, #3]
	strb	w16, [x18, #2]
	b.eq	.LBB3_21
// %bb.16:
	mov	x15, x22
	cmp	x11, #96
	ldrb	w16, [x15, #64]!
	mov	x18, x15
	ldrb	w17, [x15, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x15, #1]
	ldrb	w3, [x15, #3]
	ldrb	w4, [x15, #5]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x16, x16, x2, lsl #8
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x16, x17, x16
	orr	w17, w18, w0
	orr	x16, x16, x17, lsl #32
	mov	x17, x15
	str	x16, [sp, #400]
	ldrb	w16, [x17, #8]!
	ldrb	w18, [x17, #3]
	ldrb	w0, [x17, #2]
	ldrb	w1, [x17, #4]!
	ldrb	w2, [x17, #2]
	ldrb	w3, [x15, #9]
	ldrb	w4, [x15, #13]
	ldrb	w17, [x17, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x16, x16, x3, lsl #8
	orr	w1, w1, w4, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w17, w2, w17, lsl #24
	orr	x16, x18, x16
	orr	w17, w17, w1
	orr	x16, x16, x17, lsl #32
	str	x16, [sp, #408]
	mov	x16, x15
	ldrb	w17, [x16, #16]!
	mov	x0, x16
	ldrb	w18, [x16, #2]
	ldrb	w1, [x0, #4]!
	ldrb	w2, [x0, #2]
	ldrb	w3, [x15, #17]
	ldrb	w15, [x15, #21]
	ldrb	w4, [x16, #3]
	ldrb	w0, [x0, #3]
	lsl	x18, x18, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w15, w1, w15, lsl #8
	orr	x18, x18, x4, lsl #24
	ldr	q0, [sp, #400]
	orr	w0, w2, w0, lsl #24
	orr	x17, x18, x17
	orr	w15, w0, w15
	orr	x15, x17, x15, lsl #32
	str	x15, [sp, #384]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	orr	x16, x17, x15, lsl #32
	mov	x15, x10
	str	x16, [sp, #392]
	ldrb	w16, [x15, #64]!
	mov	x18, x15
	ldrb	w17, [x15, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x15, #1]
	ldrb	w3, [x15, #3]
	ldrb	w4, [x15, #5]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x16, x16, x2, lsl #8
	ldr	q1, [sp, #384]
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x16, x17, x16
	orr	w17, w18, w0
	orr	x16, x16, x17, lsl #32
	mov	x17, x15
	stur	x16, [x29, #-240]
	ldrb	w16, [x17, #8]!
	ldrb	w18, [x17, #3]
	ldrb	w0, [x17, #2]
	ldrb	w1, [x17, #4]!
	ldrb	w2, [x17, #2]
	ldrb	w3, [x15, #9]
	ldrb	w4, [x15, #13]
	ldrb	w17, [x17, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x16, x16, x3, lsl #8
	orr	w1, w1, w4, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w17, w2, w17, lsl #24
	orr	x16, x18, x16
	orr	w17, w17, w1
	orr	x16, x16, x17, lsl #32
	stur	x16, [x29, #-232]
	mov	x16, x15
	ldrb	w17, [x16, #16]!
	mov	x0, x16
	ldrb	w18, [x16, #2]
	ldrb	w1, [x0, #4]!
	ldrb	w2, [x0, #2]
	ldrb	w3, [x15, #17]
	ldrb	w15, [x15, #21]
	ldrb	w4, [x16, #3]
	ldrb	w0, [x0, #3]
	lsl	x18, x18, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w15, w1, w15, lsl #8
	orr	x18, x18, x4, lsl #24
	ldur	q2, [x29, #-240]
	orr	w0, w2, w0, lsl #24
	orr	x17, x18, x17
	eor	v0.16b, v2.16b, v0.16b
	orr	w15, w0, w15
	orr	x15, x17, x15, lsl #32
	stur	x15, [x29, #-256]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	stur	q0, [x29, #-208]
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	ldur	x16, [x29, #-208]
	orr	x15, x17, x15, lsl #32
	lsr	x17, x16, #40
	lsr	x18, x16, #24
	lsr	x0, x16, #16
	stur	x15, [x29, #-248]
	mov	x15, x21
	ldur	q2, [x29, #-256]
	strb	w16, [x15, #64]!
	ldur	x1, [x29, #-200]
	strb	w17, [x15, #5]
	lsr	x17, x16, #8
	strb	w18, [x15, #3]
	lsr	x18, x16, #32
	eor	v0.16b, v2.16b, v1.16b
	strb	w17, [x15, #1]
	lsr	x17, x16, #56
	lsr	x16, x16, #48
	strb	w0, [x15, #2]
	mov	x0, x15
	strb	w18, [x0, #4]!
	lsr	x18, x1, #8
	strb	w16, [x0, #2]
	lsr	x16, x1, #40
	strb	w17, [x0, #3]
	lsr	x0, x1, #24
	mov	x17, x15
	strb	w16, [x15, #13]
	lsr	x16, x1, #16
	strb	w1, [x17, #8]!
	strb	w18, [x15, #9]
	lsr	x18, x1, #32
	strb	w0, [x17, #3]
	lsr	x0, x1, #56
	strb	w16, [x17, #2]
	lsr	x16, x1, #48
	strb	w18, [x17, #4]!
	strb	w0, [x17, #3]
	strb	w16, [x17, #2]
	mov	x17, x15
	stur	q0, [x29, #-224]
	ldur	x16, [x29, #-224]
	lsr	x0, x16, #24
	strb	w16, [x17, #16]!
	lsr	x18, x16, #40
	ldur	x1, [x29, #-216]
	strb	w0, [x17, #3]
	lsr	x0, x16, #8
	strb	w18, [x15, #21]
	lsr	x18, x16, #16
	strb	w0, [x15, #17]
	lsr	x15, x1, #40
	lsr	x0, x1, #8
	strb	w18, [x17, #2]
	mov	x18, x17
	strb	w15, [x17, #13]
	lsr	x15, x1, #24
	strb	w0, [x17, #9]
	lsr	x0, x1, #16
	strb	w1, [x18, #8]!
	strb	w15, [x18, #3]
	lsr	x15, x16, #32
	strb	w0, [x18, #2]
	lsr	x0, x16, #56
	lsr	x16, x16, #48
	strb	w15, [x17, #4]!
	lsr	x15, x1, #32
	strb	w0, [x17, #3]
	lsr	x0, x1, #56
	strb	w16, [x17, #2]
	lsr	x16, x1, #48
	strb	w15, [x18, #4]!
	strb	w0, [x18, #3]
	strb	w16, [x18, #2]
	b.eq	.LBB3_21
// %bb.17:
	mov	x15, x22
	cmp	x11, #128
	ldrb	w16, [x15, #96]!
	mov	x18, x15
	ldrb	w17, [x15, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x15, #1]
	ldrb	w3, [x15, #3]
	ldrb	w4, [x15, #5]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x16, x16, x2, lsl #8
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x16, x17, x16
	orr	w17, w18, w0
	orr	x16, x16, x17, lsl #32
	mov	x17, x15
	str	x16, [sp, #304]
	ldrb	w16, [x17, #8]!
	ldrb	w18, [x17, #3]
	ldrb	w0, [x17, #2]
	ldrb	w1, [x17, #4]!
	ldrb	w2, [x17, #2]
	ldrb	w3, [x15, #9]
	ldrb	w4, [x15, #13]
	ldrb	w17, [x17, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x16, x16, x3, lsl #8
	orr	w1, w1, w4, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w17, w2, w17, lsl #24
	orr	x16, x18, x16
	orr	w17, w17, w1
	orr	x16, x16, x17, lsl #32
	str	x16, [sp, #312]
	mov	x16, x15
	ldrb	w17, [x16, #16]!
	mov	x0, x16
	ldrb	w18, [x16, #2]
	ldrb	w1, [x0, #4]!
	ldrb	w2, [x0, #2]
	ldrb	w3, [x15, #17]
	ldrb	w15, [x15, #21]
	ldrb	w4, [x16, #3]
	ldrb	w0, [x0, #3]
	lsl	x18, x18, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w15, w1, w15, lsl #8
	orr	x18, x18, x4, lsl #24
	ldr	q0, [sp, #304]
	orr	w0, w2, w0, lsl #24
	orr	x17, x18, x17
	orr	w15, w0, w15
	orr	x15, x17, x15, lsl #32
	str	x15, [sp, #288]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	orr	x16, x17, x15, lsl #32
	mov	x15, x10
	str	x16, [sp, #296]
	ldrb	w16, [x15, #96]!
	mov	x18, x15
	ldrb	w17, [x15, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x15, #1]
	ldrb	w3, [x15, #3]
	ldrb	w4, [x15, #5]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x16, x16, x2, lsl #8
	ldr	q1, [sp, #288]
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x16, x17, x16
	orr	w17, w18, w0
	orr	x16, x16, x17, lsl #32
	mov	x17, x15
	str	x16, [sp, #336]
	ldrb	w16, [x17, #8]!
	ldrb	w18, [x17, #3]
	ldrb	w0, [x17, #2]
	ldrb	w1, [x17, #4]!
	ldrb	w2, [x17, #2]
	ldrb	w3, [x15, #9]
	ldrb	w4, [x15, #13]
	ldrb	w17, [x17, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x16, x16, x3, lsl #8
	orr	w1, w1, w4, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w17, w2, w17, lsl #24
	orr	x16, x18, x16
	orr	w17, w17, w1
	orr	x16, x16, x17, lsl #32
	str	x16, [sp, #344]
	mov	x16, x15
	ldrb	w17, [x16, #16]!
	mov	x0, x16
	ldrb	w18, [x16, #2]
	ldrb	w1, [x0, #4]!
	ldrb	w2, [x0, #2]
	ldrb	w3, [x15, #17]
	ldrb	w15, [x15, #21]
	ldrb	w4, [x16, #3]
	ldrb	w0, [x0, #3]
	lsl	x18, x18, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w15, w1, w15, lsl #8
	orr	x18, x18, x4, lsl #24
	ldr	q2, [sp, #336]
	orr	w0, w2, w0, lsl #24
	orr	x17, x18, x17
	eor	v0.16b, v2.16b, v0.16b
	orr	w15, w0, w15
	orr	x15, x17, x15, lsl #32
	str	x15, [sp, #320]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	str	q0, [sp, #368]
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	ldr	x16, [sp, #368]
	orr	x15, x17, x15, lsl #32
	lsr	x17, x16, #40
	lsr	x18, x16, #24
	lsr	x0, x16, #16
	str	x15, [sp, #328]
	mov	x15, x21
	ldr	q2, [sp, #320]
	strb	w16, [x15, #96]!
	ldr	x1, [sp, #376]
	strb	w17, [x15, #5]
	lsr	x17, x16, #8
	strb	w18, [x15, #3]
	lsr	x18, x16, #32
	eor	v0.16b, v2.16b, v1.16b
	strb	w17, [x15, #1]
	lsr	x17, x16, #56
	lsr	x16, x16, #48
	strb	w0, [x15, #2]
	mov	x0, x15
	strb	w18, [x0, #4]!
	lsr	x18, x1, #8
	strb	w16, [x0, #2]
	lsr	x16, x1, #40
	strb	w17, [x0, #3]
	lsr	x0, x1, #24
	mov	x17, x15
	strb	w16, [x15, #13]
	lsr	x16, x1, #16
	strb	w1, [x17, #8]!
	strb	w18, [x15, #9]
	lsr	x18, x1, #32
	strb	w0, [x17, #3]
	lsr	x0, x1, #56
	strb	w16, [x17, #2]
	lsr	x16, x1, #48
	strb	w18, [x17, #4]!
	strb	w0, [x17, #3]
	strb	w16, [x17, #2]
	mov	x17, x15
	str	q0, [sp, #352]
	ldr	x16, [sp, #352]
	lsr	x0, x16, #24
	strb	w16, [x17, #16]!
	lsr	x18, x16, #40
	ldr	x1, [sp, #360]
	strb	w0, [x17, #3]
	lsr	x0, x16, #8
	strb	w18, [x15, #21]
	lsr	x18, x16, #16
	strb	w0, [x15, #17]
	lsr	x15, x1, #40
	lsr	x0, x1, #8
	strb	w18, [x17, #2]
	mov	x18, x17
	strb	w15, [x17, #13]
	lsr	x15, x1, #24
	strb	w0, [x17, #9]
	lsr	x0, x1, #16
	strb	w1, [x18, #8]!
	strb	w15, [x18, #3]
	lsr	x15, x16, #32
	strb	w0, [x18, #2]
	lsr	x0, x16, #56
	lsr	x16, x16, #48
	strb	w15, [x17, #4]!
	lsr	x15, x1, #32
	strb	w0, [x17, #3]
	lsr	x0, x1, #56
	strb	w16, [x17, #2]
	lsr	x16, x1, #48
	strb	w15, [x18, #4]!
	strb	w0, [x18, #3]
	strb	w16, [x18, #2]
	b.eq	.LBB3_21
// %bb.18:
	mov	x15, x22
	cmp	x11, #160
	ldrb	w16, [x15, #128]!
	mov	x18, x15
	ldrb	w17, [x15, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x15, #1]
	ldrb	w3, [x15, #3]
	ldrb	w4, [x15, #5]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x16, x16, x2, lsl #8
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x16, x17, x16
	orr	w17, w18, w0
	orr	x16, x16, x17, lsl #32
	mov	x17, x15
	str	x16, [sp, #208]
	ldrb	w16, [x17, #8]!
	ldrb	w18, [x17, #3]
	ldrb	w0, [x17, #2]
	ldrb	w1, [x17, #4]!
	ldrb	w2, [x17, #2]
	ldrb	w3, [x15, #9]
	ldrb	w4, [x15, #13]
	ldrb	w17, [x17, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x16, x16, x3, lsl #8
	orr	w1, w1, w4, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w17, w2, w17, lsl #24
	orr	x16, x18, x16
	orr	w17, w17, w1
	orr	x16, x16, x17, lsl #32
	str	x16, [sp, #216]
	mov	x16, x15
	ldrb	w17, [x16, #16]!
	mov	x0, x16
	ldrb	w18, [x16, #2]
	ldrb	w1, [x0, #4]!
	ldrb	w2, [x0, #2]
	ldrb	w3, [x15, #17]
	ldrb	w15, [x15, #21]
	ldrb	w4, [x16, #3]
	ldrb	w0, [x0, #3]
	lsl	x18, x18, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w15, w1, w15, lsl #8
	orr	x18, x18, x4, lsl #24
	ldr	q0, [sp, #208]
	orr	w0, w2, w0, lsl #24
	orr	x17, x18, x17
	orr	w15, w0, w15
	orr	x15, x17, x15, lsl #32
	str	x15, [sp, #192]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	orr	x16, x17, x15, lsl #32
	mov	x15, x10
	str	x16, [sp, #200]
	ldrb	w16, [x15, #128]!
	mov	x18, x15
	ldrb	w17, [x15, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x15, #1]
	ldrb	w3, [x15, #3]
	ldrb	w4, [x15, #5]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x16, x16, x2, lsl #8
	ldr	q1, [sp, #192]
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x16, x17, x16
	orr	w17, w18, w0
	orr	x16, x16, x17, lsl #32
	mov	x17, x15
	str	x16, [sp, #240]
	ldrb	w16, [x17, #8]!
	ldrb	w18, [x17, #3]
	ldrb	w0, [x17, #2]
	ldrb	w1, [x17, #4]!
	ldrb	w2, [x17, #2]
	ldrb	w3, [x15, #9]
	ldrb	w4, [x15, #13]
	ldrb	w17, [x17, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x16, x16, x3, lsl #8
	orr	w1, w1, w4, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w17, w2, w17, lsl #24
	orr	x16, x18, x16
	orr	w17, w17, w1
	orr	x16, x16, x17, lsl #32
	str	x16, [sp, #248]
	mov	x16, x15
	ldrb	w17, [x16, #16]!
	mov	x0, x16
	ldrb	w18, [x16, #2]
	ldrb	w1, [x0, #4]!
	ldrb	w2, [x0, #2]
	ldrb	w3, [x15, #17]
	ldrb	w15, [x15, #21]
	ldrb	w4, [x16, #3]
	ldrb	w0, [x0, #3]
	lsl	x18, x18, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w15, w1, w15, lsl #8
	orr	x18, x18, x4, lsl #24
	ldr	q2, [sp, #240]
	orr	w0, w2, w0, lsl #24
	orr	x17, x18, x17
	eor	v0.16b, v2.16b, v0.16b
	orr	w15, w0, w15
	orr	x15, x17, x15, lsl #32
	str	x15, [sp, #224]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	str	q0, [sp, #272]
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	ldr	x16, [sp, #272]
	orr	x15, x17, x15, lsl #32
	lsr	x17, x16, #40
	lsr	x18, x16, #24
	lsr	x0, x16, #16
	str	x15, [sp, #232]
	mov	x15, x21
	ldr	q2, [sp, #224]
	strb	w16, [x15, #128]!
	ldr	x1, [sp, #280]
	strb	w17, [x15, #5]
	lsr	x17, x16, #8
	strb	w18, [x15, #3]
	lsr	x18, x16, #32
	eor	v0.16b, v2.16b, v1.16b
	strb	w17, [x15, #1]
	lsr	x17, x16, #56
	lsr	x16, x16, #48
	strb	w0, [x15, #2]
	mov	x0, x15
	strb	w18, [x0, #4]!
	lsr	x18, x1, #8
	strb	w16, [x0, #2]
	lsr	x16, x1, #40
	strb	w17, [x0, #3]
	lsr	x0, x1, #24
	mov	x17, x15
	strb	w16, [x15, #13]
	lsr	x16, x1, #16
	strb	w1, [x17, #8]!
	strb	w18, [x15, #9]
	lsr	x18, x1, #32
	strb	w0, [x17, #3]
	lsr	x0, x1, #56
	strb	w16, [x17, #2]
	lsr	x16, x1, #48
	strb	w18, [x17, #4]!
	strb	w0, [x17, #3]
	strb	w16, [x17, #2]
	mov	x17, x15
	str	q0, [sp, #256]
	ldr	x16, [sp, #256]
	lsr	x0, x16, #24
	strb	w16, [x17, #16]!
	lsr	x18, x16, #40
	ldr	x1, [sp, #264]
	strb	w0, [x17, #3]
	lsr	x0, x16, #8
	strb	w18, [x15, #21]
	lsr	x18, x16, #16
	strb	w0, [x15, #17]
	lsr	x15, x1, #40
	lsr	x0, x1, #8
	strb	w18, [x17, #2]
	mov	x18, x17
	strb	w15, [x17, #13]
	lsr	x15, x1, #24
	strb	w0, [x17, #9]
	lsr	x0, x1, #16
	strb	w1, [x18, #8]!
	strb	w15, [x18, #3]
	lsr	x15, x16, #32
	strb	w0, [x18, #2]
	lsr	x0, x16, #56
	lsr	x16, x16, #48
	strb	w15, [x17, #4]!
	lsr	x15, x1, #32
	strb	w0, [x17, #3]
	lsr	x0, x1, #56
	strb	w16, [x17, #2]
	lsr	x16, x1, #48
	strb	w15, [x18, #4]!
	strb	w0, [x18, #3]
	strb	w16, [x18, #2]
	b.eq	.LBB3_21
// %bb.19:
	mov	x15, x22
	cmp	x11, #192
	ldrb	w16, [x15, #160]!
	mov	x18, x15
	ldrb	w17, [x15, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x15, #1]
	ldrb	w3, [x15, #3]
	ldrb	w4, [x15, #5]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x16, x16, x2, lsl #8
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x16, x17, x16
	orr	w17, w18, w0
	orr	x16, x16, x17, lsl #32
	mov	x17, x15
	str	x16, [sp, #112]
	ldrb	w16, [x17, #8]!
	ldrb	w18, [x17, #3]
	ldrb	w0, [x17, #2]
	ldrb	w1, [x17, #4]!
	ldrb	w2, [x17, #2]
	ldrb	w3, [x15, #9]
	ldrb	w4, [x15, #13]
	ldrb	w17, [x17, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x16, x16, x3, lsl #8
	orr	w1, w1, w4, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w17, w2, w17, lsl #24
	orr	x16, x18, x16
	orr	w17, w17, w1
	orr	x16, x16, x17, lsl #32
	str	x16, [sp, #120]
	mov	x16, x15
	ldrb	w17, [x16, #16]!
	mov	x0, x16
	ldrb	w18, [x16, #2]
	ldrb	w1, [x0, #4]!
	ldrb	w2, [x0, #2]
	ldrb	w3, [x15, #17]
	ldrb	w15, [x15, #21]
	ldrb	w4, [x16, #3]
	ldrb	w0, [x0, #3]
	lsl	x18, x18, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w15, w1, w15, lsl #8
	orr	x18, x18, x4, lsl #24
	ldr	q0, [sp, #112]
	orr	w0, w2, w0, lsl #24
	orr	x17, x18, x17
	orr	w15, w0, w15
	orr	x15, x17, x15, lsl #32
	str	x15, [sp, #96]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	orr	x16, x17, x15, lsl #32
	mov	x15, x10
	str	x16, [sp, #104]
	ldrb	w16, [x15, #160]!
	mov	x18, x15
	ldrb	w17, [x15, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x15, #1]
	ldrb	w3, [x15, #3]
	ldrb	w4, [x15, #5]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x16, x16, x2, lsl #8
	ldr	q1, [sp, #96]
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x16, x17, x16
	orr	w17, w18, w0
	orr	x16, x16, x17, lsl #32
	mov	x17, x15
	str	x16, [sp, #144]
	ldrb	w16, [x17, #8]!
	ldrb	w18, [x17, #3]
	ldrb	w0, [x17, #2]
	ldrb	w1, [x17, #4]!
	ldrb	w2, [x17, #2]
	ldrb	w3, [x15, #9]
	ldrb	w4, [x15, #13]
	ldrb	w17, [x17, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x16, x16, x3, lsl #8
	orr	w1, w1, w4, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w17, w2, w17, lsl #24
	orr	x16, x18, x16
	orr	w17, w17, w1
	orr	x16, x16, x17, lsl #32
	str	x16, [sp, #152]
	mov	x16, x15
	ldrb	w17, [x16, #16]!
	mov	x0, x16
	ldrb	w18, [x16, #2]
	ldrb	w1, [x0, #4]!
	ldrb	w2, [x0, #2]
	ldrb	w3, [x15, #17]
	ldrb	w15, [x15, #21]
	ldrb	w4, [x16, #3]
	ldrb	w0, [x0, #3]
	lsl	x18, x18, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w15, w1, w15, lsl #8
	orr	x18, x18, x4, lsl #24
	ldr	q2, [sp, #144]
	orr	w0, w2, w0, lsl #24
	orr	x17, x18, x17
	eor	v0.16b, v2.16b, v0.16b
	orr	w15, w0, w15
	orr	x15, x17, x15, lsl #32
	str	x15, [sp, #128]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	str	q0, [sp, #176]
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	ldr	x16, [sp, #176]
	orr	x15, x17, x15, lsl #32
	lsr	x17, x16, #40
	lsr	x18, x16, #24
	lsr	x0, x16, #16
	str	x15, [sp, #136]
	mov	x15, x21
	ldr	q2, [sp, #128]
	strb	w16, [x15, #160]!
	ldr	x1, [sp, #184]
	strb	w17, [x15, #5]
	lsr	x17, x16, #8
	strb	w18, [x15, #3]
	lsr	x18, x16, #32
	eor	v0.16b, v2.16b, v1.16b
	strb	w17, [x15, #1]
	lsr	x17, x16, #56
	lsr	x16, x16, #48
	strb	w0, [x15, #2]
	mov	x0, x15
	strb	w18, [x0, #4]!
	lsr	x18, x1, #8
	strb	w16, [x0, #2]
	lsr	x16, x1, #40
	strb	w17, [x0, #3]
	lsr	x0, x1, #24
	mov	x17, x15
	strb	w16, [x15, #13]
	lsr	x16, x1, #16
	strb	w1, [x17, #8]!
	strb	w18, [x15, #9]
	lsr	x18, x1, #32
	strb	w0, [x17, #3]
	lsr	x0, x1, #56
	strb	w16, [x17, #2]
	lsr	x16, x1, #48
	strb	w18, [x17, #4]!
	strb	w0, [x17, #3]
	strb	w16, [x17, #2]
	mov	x17, x15
	str	q0, [sp, #160]
	ldr	x16, [sp, #160]
	lsr	x0, x16, #24
	strb	w16, [x17, #16]!
	lsr	x18, x16, #40
	ldr	x1, [sp, #168]
	strb	w0, [x17, #3]
	lsr	x0, x16, #8
	strb	w18, [x15, #21]
	lsr	x18, x16, #16
	strb	w0, [x15, #17]
	lsr	x15, x1, #40
	lsr	x0, x1, #8
	strb	w18, [x17, #2]
	mov	x18, x17
	strb	w15, [x17, #13]
	lsr	x15, x1, #24
	strb	w0, [x17, #9]
	lsr	x0, x1, #16
	strb	w1, [x18, #8]!
	strb	w15, [x18, #3]
	lsr	x15, x16, #32
	strb	w0, [x18, #2]
	lsr	x0, x16, #56
	lsr	x16, x16, #48
	strb	w15, [x17, #4]!
	lsr	x15, x1, #32
	strb	w0, [x17, #3]
	lsr	x0, x1, #56
	strb	w16, [x17, #2]
	lsr	x16, x1, #48
	strb	w15, [x18, #4]!
	strb	w0, [x18, #3]
	strb	w16, [x18, #2]
	b.eq	.LBB3_21
// %bb.20:
	ldrb	w15, [x22, #192]!
	mov	x17, x22
	ldrb	w16, [x22, #2]
	ldrb	w18, [x17, #4]!
	ldrb	w0, [x17, #2]
	ldrb	w1, [x22, #1]
	ldrb	w2, [x22, #3]
	ldrb	w3, [x22, #5]
	ldrb	w17, [x17, #3]
	lsl	x16, x16, #16
	lsl	w0, w0, #16
	orr	x15, x15, x1, lsl #8
	orr	w18, w18, w3, lsl #8
	orr	x16, x16, x2, lsl #24
	orr	w17, w0, w17, lsl #24
	orr	x15, x16, x15
	orr	w16, w17, w18
	orr	x15, x15, x16, lsl #32
	mov	x16, x22
	str	x15, [sp, #16]
	ldrb	w15, [x16, #8]!
	ldrb	w17, [x16, #3]
	ldrb	w18, [x16, #2]
	ldrb	w0, [x16, #4]!
	ldrb	w1, [x16, #2]
	ldrb	w2, [x22, #9]
	ldrb	w3, [x22, #13]
	ldrb	w16, [x16, #3]
	lsl	x18, x18, #16
	lsl	w1, w1, #16
	orr	x15, x15, x2, lsl #8
	orr	w0, w0, w3, lsl #8
	orr	x17, x18, x17, lsl #24
	orr	w16, w1, w16, lsl #24
	orr	x15, x17, x15
	orr	w16, w16, w0
	orr	x15, x15, x16, lsl #32
	mov	x16, x22
	str	x15, [sp, #24]
	ldrb	w15, [x16, #16]!
	mov	x18, x16
	ldrb	w17, [x16, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x22, #17]
	ldrb	w3, [x16, #3]
	ldrb	w4, [x22, #21]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x15, x15, x2, lsl #8
	ldr	q0, [sp, #16]
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x15, x17, x15
	orr	w17, w18, w0
	orr	x15, x15, x17, lsl #32
	str	x15, [sp]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	orr	x16, x17, x15, lsl #32
	mov	x15, x10
	str	x16, [sp, #8]
	ldrb	w16, [x15, #192]!
	mov	x18, x15
	ldrb	w17, [x15, #2]
	ldrb	w0, [x18, #4]!
	ldrb	w1, [x18, #2]
	ldrb	w2, [x15, #1]
	ldrb	w3, [x15, #3]
	ldrb	w4, [x15, #5]
	ldrb	w18, [x18, #3]
	lsl	x17, x17, #16
	lsl	w1, w1, #16
	orr	x16, x16, x2, lsl #8
	ldr	q1, [sp]
	orr	w0, w0, w4, lsl #8
	orr	x17, x17, x3, lsl #24
	orr	w18, w1, w18, lsl #24
	orr	x16, x17, x16
	orr	w17, w18, w0
	orr	x16, x16, x17, lsl #32
	mov	x17, x15
	str	x16, [sp, #48]
	ldrb	w16, [x17, #8]!
	ldrb	w18, [x17, #3]
	ldrb	w0, [x17, #2]
	ldrb	w1, [x17, #4]!
	ldrb	w2, [x17, #2]
	ldrb	w3, [x15, #9]
	ldrb	w4, [x15, #13]
	ldrb	w17, [x17, #3]
	lsl	x0, x0, #16
	lsl	w2, w2, #16
	orr	x16, x16, x3, lsl #8
	orr	w1, w1, w4, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w17, w2, w17, lsl #24
	orr	x16, x18, x16
	orr	w17, w17, w1
	orr	x16, x16, x17, lsl #32
	str	x16, [sp, #56]
	mov	x16, x15
	ldrb	w17, [x16, #16]!
	mov	x0, x16
	ldrb	w18, [x16, #2]
	ldrb	w1, [x0, #4]!
	ldrb	w2, [x0, #2]
	ldrb	w3, [x15, #17]
	ldrb	w15, [x15, #21]
	ldrb	w4, [x16, #3]
	ldrb	w0, [x0, #3]
	lsl	x18, x18, #16
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w15, w1, w15, lsl #8
	orr	x18, x18, x4, lsl #24
	ldr	q2, [sp, #48]
	orr	w0, w2, w0, lsl #24
	orr	x17, x18, x17
	eor	v0.16b, v2.16b, v0.16b
	orr	w15, w0, w15
	orr	x15, x17, x15, lsl #32
	str	x15, [sp, #32]
	mov	x15, x16
	ldrb	w17, [x15, #8]!
	ldrb	w18, [x15, #3]
	ldrb	w0, [x15, #2]
	ldrb	w1, [x15, #4]!
	ldrb	w2, [x15, #2]
	ldrb	w3, [x16, #9]
	ldrb	w16, [x16, #13]
	ldrb	w15, [x15, #3]
	lsl	x0, x0, #16
	str	q0, [sp, #80]
	lsl	w2, w2, #16
	orr	x17, x17, x3, lsl #8
	orr	w16, w1, w16, lsl #8
	orr	x18, x0, x18, lsl #24
	orr	w15, w2, w15, lsl #24
	orr	x17, x18, x17
	orr	w15, w15, w16
	orr	x15, x17, x15, lsl #32
	str	x15, [sp, #40]
	ldr	x15, [sp, #80]
	ldr	q2, [sp, #32]
	lsr	x16, x15, #40
	strb	w15, [x21, #192]!
	lsr	x17, x15, #24
	ldr	x0, [sp, #88]
	lsr	x18, x15, #16
	strb	w16, [x21, #5]
	lsr	x16, x15, #8
	eor	v0.16b, v2.16b, v1.16b
	strb	w17, [x21, #3]
	lsr	x17, x15, #32
	strb	w16, [x21, #1]
	lsr	x16, x15, #56
	lsr	x15, x15, #48
	strb	w18, [x21, #2]
	mov	x18, x21
	strb	w17, [x18, #4]!
	lsr	x17, x0, #8
	strb	w15, [x18, #2]
	lsr	x15, x0, #40
	strb	w16, [x18, #3]
	lsr	x18, x0, #24
	mov	x16, x21
	strb	w15, [x21, #13]
	lsr	x15, x0, #16
	strb	w0, [x16, #8]!
	strb	w17, [x21, #9]
	lsr	x17, x0, #32
	strb	w18, [x16, #3]
	lsr	x18, x0, #56
	strb	w15, [x16, #2]
	lsr	x15, x0, #48
	strb	w17, [x16, #4]!
	strb	w18, [x16, #3]
	strb	w15, [x16, #2]
	mov	x16, x21
	str	q0, [sp, #64]
	ldr	x15, [sp, #64]
	lsr	x18, x15, #24
	strb	w15, [x16, #16]!
	ldr	x0, [sp, #72]
	lsr	x17, x15, #40
	strb	w18, [x16, #3]
	lsr	x18, x15, #8
	lsr	x1, x0, #8
	strb	w17, [x21, #21]
	lsr	x17, x15, #16
	strb	w18, [x21, #17]
	lsr	x18, x0, #40
	strb	w1, [x16, #9]
	lsr	x1, x0, #16
	strb	w18, [x16, #13]
	lsr	x18, x0, #24
	strb	w17, [x16, #2]
	mov	x17, x16
	strb	w0, [x17, #8]!
	strb	w18, [x17, #3]
	lsr	x18, x15, #32
	strb	w1, [x17, #2]
	lsr	x1, x15, #56
	lsr	x15, x15, #48
	strb	w18, [x16, #4]!
	lsr	x18, x0, #32
	strb	w1, [x16, #3]
	lsr	x1, x0, #56
	strb	w15, [x16, #2]
	lsr	x15, x0, #48
	strb	w18, [x17, #4]!
	strb	w1, [x17, #3]
	strb	w15, [x17, #2]
.LBB3_21:
	cmp	x14, x11
	b.eq	.LBB3_6
// %bb.22:
	add	x10, x10, x11
	mov	x21, x12
	mov	x22, x13
	b	.LBB3_4
.Lfunc_end3:
	.size	ChaCha, .Lfunc_end3-ChaCha
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function chacha_encrypt_bytes
.LCPI4_0:
	.byte	3                               // 0x3
	.byte	0                               // 0x0
	.byte	1                               // 0x1
	.byte	2                               // 0x2
	.byte	7                               // 0x7
	.byte	4                               // 0x4
	.byte	5                               // 0x5
	.byte	6                               // 0x6
	.byte	11                              // 0xb
	.byte	8                               // 0x8
	.byte	9                               // 0x9
	.byte	10                              // 0xa
	.byte	15                              // 0xf
	.byte	12                              // 0xc
	.byte	13                              // 0xd
	.byte	14                              // 0xe
	.text
	.p2align	2
	.type	chacha_encrypt_bytes,@function
chacha_encrypt_bytes:                   // @chacha_encrypt_bytes
// %bb.0:
	hint	#25
	stp	d15, d14, [sp, #-160]!          // 16-byte Folded Spill
	stp	d13, d12, [sp, #16]             // 16-byte Folded Spill
	stp	d11, d10, [sp, #32]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #48]               // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             // 16-byte Folded Spill
	add	x29, sp, #64
	stp	x28, x27, [sp, #80]             // 16-byte Folded Spill
	stp	x26, x25, [sp, #96]             // 16-byte Folded Spill
	stp	x24, x23, [sp, #112]            // 16-byte Folded Spill
	stp	x22, x21, [sp, #128]            // 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            // 16-byte Folded Spill
	sub	sp, sp, #1120
	adrp	x8, __guard_local
	adrp	x9, __guard_local
	ldr	x8, [x8, :lo12:__guard_local]
	ldr	xzr, [x9, :lo12:__guard_local]
	stur	x8, [x29, #-80]
	cbz	w3, .LBB4_45
// %bb.1:
	mov	x25, x0
	cmp	w3, #256
	b.lo	.LBB4_7
// %bb.2:
	adrp	x10, .LCPI4_0
	ldp	w9, w8, [x25, #48]
	ldr	q0, [x10, :lo12:.LCPI4_0]
.LBB4_3:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB4_4 Depth 2
	mov	w10, w9
	fmov	s1, w9
	mov	x11, x25
	orr	x9, x10, x8, lsl #32
	ld1r	{ v9.4s }, [x11], #4
	fmov	s2, w8
	add	x12, x25, #8
	ld1r	{ v3.4s }, [x11]
	add	x11, x9, #1
	ld1r	{ v11.4s }, [x12]
	add	x13, x25, #20
	lsr	x12, x11, #32
	mov	v1.s[1], w11
	add	x11, x9, #2
	ld1r	{ v30.4s }, [x13]
	lsr	x13, x11, #32
	add	x10, x25, #16
	mov	v2.s[1], w12
	ld1r	{ v29.4s }, [x10]
	add	x10, x25, #32
	ld1r	{ v21.4s }, [x10]
	add	x10, x9, #3
	add	x8, x25, #12
	mov	v1.s[2], w11
	add	x11, x25, #60
	ld1r	{ v12.4s }, [x8]
	ld1r	{ v5.4s }, [x11]
	lsr	x11, x10, #32
	add	x8, x25, #28
	mov	v2.s[2], w13
	ld1r	{ v28.4s }, [x8]
	add	x14, x25, #24
	add	x12, x25, #36
	ld1r	{ v31.4s }, [x14]
	add	x14, x25, #40
	mov	v1.s[3], w10
	add	x15, x25, #44
	add	x8, x25, #56
	ld1r	{ v22.4s }, [x12]
	ld1r	{ v6.4s }, [x8]
	ld1r	{ v23.4s }, [x14]
	mov	v2.s[3], w11
	ld1r	{ v24.4s }, [x15]
	mov	v14.16b, v9.16b
	mov	v10.16b, v3.16b
	mov	v15.16b, v11.16b
	mov	v13.16b, v12.16b
	mov	v7.16b, v1.16b
	mov	v8.16b, v28.16b
	mov	w8, #10                         // =0xa
	stp	q30, q29, [sp, #272]            // 32-byte Folded Spill
	mov	v16.16b, v2.16b
	stp	q24, q23, [sp, #304]            // 32-byte Folded Spill
	stp	q22, q21, [sp, #336]            // 32-byte Folded Spill
	stp	q6, q5, [sp, #368]              // 32-byte Folded Spill
	str	q31, [sp, #256]                 // 16-byte Folded Spill
.LBB4_4:                                //   Parent Loop BB4_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	v10.4s, v30.4s, v10.4s
	add	v14.4s, v29.4s, v14.4s
	subs	w8, w8, #1
	add	v15.4s, v31.4s, v15.4s
	add	v13.4s, v8.4s, v13.4s
	eor	v16.16b, v10.16b, v16.16b
	eor	v7.16b, v14.16b, v7.16b
	eor	v6.16b, v15.16b, v6.16b
	eor	v5.16b, v13.16b, v5.16b
	rev32	v16.8h, v16.8h
	rev32	v4.8h, v7.8h
	rev32	v6.8h, v6.8h
	rev32	v5.8h, v5.8h
	add	v17.4s, v22.4s, v16.4s
	add	v21.4s, v21.4s, v4.4s
	add	v23.4s, v23.4s, v6.4s
	add	v24.4s, v24.4s, v5.4s
	eor	v7.16b, v17.16b, v30.16b
	eor	v22.16b, v21.16b, v29.16b
	eor	v29.16b, v23.16b, v31.16b
	eor	v30.16b, v24.16b, v8.16b
	shl	v31.4s, v7.4s, #12
	shl	v8.4s, v22.4s, #12
	shl	v18.4s, v29.4s, #12
	shl	v19.4s, v30.4s, #12
	sri	v31.4s, v7.4s, #20
	sri	v8.4s, v22.4s, #20
	sri	v18.4s, v29.4s, #20
	sri	v19.4s, v30.4s, #20
	add	v20.4s, v31.4s, v10.4s
	add	v14.4s, v8.4s, v14.4s
	add	v15.4s, v18.4s, v15.4s
	add	v7.4s, v19.4s, v13.4s
	eor	v16.16b, v20.16b, v16.16b
	eor	v4.16b, v14.16b, v4.16b
	eor	v6.16b, v15.16b, v6.16b
	eor	v5.16b, v7.16b, v5.16b
	tbl	v22.16b, { v16.16b }, v0.16b
	tbl	v30.16b, { v4.16b }, v0.16b
	tbl	v29.16b, { v6.16b }, v0.16b
	tbl	v13.16b, { v5.16b }, v0.16b
	add	v5.4s, v17.4s, v22.4s
	add	v6.4s, v21.4s, v30.4s
	add	v23.4s, v23.4s, v29.4s
	add	v24.4s, v24.4s, v13.4s
	eor	v4.16b, v5.16b, v31.16b
	eor	v16.16b, v6.16b, v8.16b
	eor	v17.16b, v23.16b, v18.16b
	eor	v18.16b, v24.16b, v19.16b
	shl	v31.4s, v4.4s, #7
	shl	v21.4s, v16.4s, #7
	shl	v8.4s, v17.4s, #7
	shl	v10.4s, v18.4s, #7
	sri	v31.4s, v4.4s, #25
	sri	v21.4s, v16.4s, #25
	sri	v8.4s, v17.4s, #25
	sri	v10.4s, v18.4s, #25
	add	v16.4s, v31.4s, v14.4s
	add	v7.4s, v7.4s, v21.4s
	add	v4.4s, v8.4s, v20.4s
	add	v17.4s, v10.4s, v15.4s
	eor	v18.16b, v16.16b, v13.16b
	eor	v19.16b, v4.16b, v30.16b
	eor	v20.16b, v17.16b, v22.16b
	eor	v22.16b, v7.16b, v29.16b
	rev32	v18.8h, v18.8h
	rev32	v19.8h, v19.8h
	rev32	v20.8h, v20.8h
	rev32	v22.8h, v22.8h
	add	v23.4s, v23.4s, v18.4s
	add	v24.4s, v24.4s, v19.4s
	add	v29.4s, v6.4s, v20.4s
	add	v30.4s, v5.4s, v22.4s
	eor	v5.16b, v23.16b, v31.16b
	eor	v6.16b, v24.16b, v8.16b
	eor	v31.16b, v29.16b, v10.16b
	eor	v21.16b, v30.16b, v21.16b
	shl	v8.4s, v5.4s, #12
	shl	v25.4s, v6.4s, #12
	shl	v26.4s, v31.4s, #12
	shl	v27.4s, v21.4s, #12
	sri	v8.4s, v5.4s, #20
	sri	v25.4s, v6.4s, #20
	sri	v26.4s, v31.4s, #20
	sri	v27.4s, v21.4s, #20
	add	v14.4s, v8.4s, v16.4s
	add	v10.4s, v25.4s, v4.4s
	add	v15.4s, v26.4s, v17.4s
	add	v13.4s, v27.4s, v7.4s
	eor	v4.16b, v14.16b, v18.16b
	eor	v6.16b, v10.16b, v19.16b
	eor	v16.16b, v15.16b, v20.16b
	eor	v17.16b, v13.16b, v22.16b
	tbl	v5.16b, { v4.16b }, v0.16b
	tbl	v7.16b, { v6.16b }, v0.16b
	tbl	v16.16b, { v16.16b }, v0.16b
	tbl	v6.16b, { v17.16b }, v0.16b
	add	v23.4s, v23.4s, v5.4s
	add	v24.4s, v24.4s, v7.4s
	add	v21.4s, v29.4s, v16.4s
	add	v22.4s, v30.4s, v6.4s
	eor	v4.16b, v23.16b, v8.16b
	eor	v17.16b, v24.16b, v25.16b
	eor	v18.16b, v21.16b, v26.16b
	eor	v19.16b, v22.16b, v27.16b
	shl	v30.4s, v4.4s, #7
	shl	v31.4s, v17.4s, #7
	shl	v8.4s, v18.4s, #7
	shl	v29.4s, v19.4s, #7
	sri	v30.4s, v4.4s, #25
	sri	v31.4s, v17.4s, #25
	sri	v8.4s, v18.4s, #25
	sri	v29.4s, v19.4s, #25
	b.ne	.LBB4_4
// %bb.5:                               //   in Loop: Header=BB4_3 Depth=1
	mov	x11, x1
	ldrb	w10, [x1, #2]
	ldrb	w8, [x1, #1]
	ldrb	w12, [x11, #4]!
	ldrb	w13, [x11, #2]
	ldrb	w14, [x1]
	ldrb	w15, [x1, #3]
	lsl	x10, x10, #16
	ldrb	w16, [x1, #5]
	ldrb	w11, [x11, #3]
	lsl	w13, w13, #16
	orr	x8, x14, x8, lsl #8
	orr	x10, x10, x15, lsl #24
	add	v12.4s, v13.4s, v12.4s
	orr	w12, w12, w16, lsl #8
	orr	w11, w13, w11, lsl #24
	add	v13.4s, v15.4s, v11.4s
	orr	x8, x10, x8
	add	v11.4s, v10.4s, v3.4s
	add	v14.4s, v14.4s, v9.4s
	orr	w10, w11, w12
	add	v28.4s, v8.4s, v28.4s
	add	v7.4s, v1.4s, v7.4s
	orr	x8, x8, x10, lsl #32
	mov	x10, x1
	trn1	v10.4s, v13.4s, v12.4s
	trn1	v9.4s, v14.4s, v11.4s
	trn2	v11.4s, v14.4s, v11.4s
	trn2	v12.4s, v13.4s, v12.4s
	str	x8, [sp, #528]
	ldr	q1, [sp, #384]                  // 16-byte Folded Reload
	add	x9, x9, #4
	ldrb	w8, [x10, #8]!
	ldrb	w11, [x10, #3]
	ldrb	w12, [x10, #2]
	ldrb	w13, [x10, #4]!
	ldrb	w14, [x10, #2]
	ldrb	w15, [x1, #9]
	ldrb	w16, [x1, #13]
	ldrb	w10, [x10, #3]
	lsl	x12, x12, #16
	mov	v3.16b, v9.16b
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w16, lsl #8
	orr	x11, x12, x11, lsl #24
	add	v5.4s, v1.4s, v5.4s
	sub	w3, w3, #256
	orr	w10, w14, w10, lsl #24
	mov	v3.d[1], v10.d[0]
	cmp	w3, #255
	orr	x8, x11, x8
	orr	w10, w10, w13
	orr	x8, x8, x10, lsl #32
	str	x8, [sp, #536]
	ldr	q4, [sp, #528]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #544]
	mov	v3.16b, v11.16b
	ldr	x8, [sp, #544]
	lsr	x10, x8, #40
	lsr	x11, x8, #24
	strb	w8, [x2]
	lsr	x12, x8, #16
	ldr	x13, [sp, #552]
	lsr	x14, x8, #56
	strb	w10, [x2, #5]
	lsr	x10, x8, #8
	mov	v3.d[1], v12.d[0]
	strb	w11, [x2, #3]
	lsr	x11, x8, #32
	lsr	x8, x8, #48
	strb	w12, [x2, #2]
	mov	x12, x2
	strb	w11, [x12, #4]!
	lsr	x11, x13, #24
	strb	w8, [x12, #2]
	lsr	x8, x13, #40
	strb	w14, [x12, #3]
	lsr	x12, x13, #16
	strb	w8, [x2, #13]
	lsr	x8, x13, #8
	strb	w10, [x2, #1]
	mov	x10, x2
	strb	w13, [x10, #8]!
	strb	w11, [x10, #3]
	lsr	x11, x13, #32
	strb	w12, [x10, #2]
	lsr	x12, x13, #56
	strb	w8, [x2, #9]
	lsr	x8, x13, #48
	strb	w11, [x10, #4]!
	mov	x11, x1
	strb	w12, [x10, #3]
	strb	w8, [x10, #2]
	ldrb	w8, [x11, #64]!
	mov	x12, x11
	ldrb	w10, [x11, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #65]
	ldrb	w16, [x11, #3]
	ldrb	w17, [x1, #69]
	ldrb	w12, [x12, #3]
	lsl	x10, x10, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x10, x10, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x8, x10, x8
	orr	w10, w12, w13
	orr	x8, x8, x10, lsl #32
	str	x8, [sp, #560]
	mov	x8, x11
	ldrb	w10, [x8, #8]!
	ldrb	w12, [x8, #3]
	ldrb	w13, [x8, #2]
	ldrb	w14, [x8, #4]!
	ldrb	w15, [x8, #2]
	ldrb	w16, [x11, #9]
	ldrb	w11, [x11, #13]
	ldrb	w8, [x8, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x10, x10, x16, lsl #8
	orr	w11, w14, w11, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w8, w15, w8, lsl #24
	orr	x10, x12, x10
	orr	w8, w8, w11
	orr	x8, x10, x8, lsl #32
	mov	x10, x2
	str	x8, [sp, #568]
	ldr	q4, [sp, #560]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #576]
	zip2	v3.2d, v9.2d, v10.2d
	ldr	x8, [sp, #576]
	lsr	x11, x8, #40
	strb	w8, [x10, #64]!
	lsr	x13, x8, #16
	ldr	x14, [sp, #584]
	lsr	x12, x8, #24
	strb	w11, [x2, #69]
	lsr	x11, x8, #8
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #65]
	lsr	x11, x14, #40
	strb	w12, [x10, #3]
	mov	x12, x10
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w8, [x10, #2]
	lsr	x8, x14, #48
	strb	w15, [x10, #3]
	mov	x10, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w8, [x12, #2]
	ldrb	w8, [x10, #128]!
	mov	x12, x10
	ldrb	w11, [x10, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #129]
	ldrb	w16, [x10, #3]
	ldrb	w17, [x1, #133]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x8, x11, x8
	orr	w11, w12, w13
	orr	x8, x8, x11, lsl #32
	str	x8, [sp, #592]
	mov	x8, x10
	ldrb	w11, [x8, #8]!
	ldrb	w12, [x8, #3]
	ldrb	w13, [x8, #2]
	ldrb	w14, [x8, #4]!
	ldrb	w15, [x8, #2]
	ldrb	w16, [x10, #9]
	ldrb	w10, [x10, #13]
	ldrb	w8, [x8, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w10, w14, w10, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w8, w15, w8, lsl #24
	orr	x11, x12, x11
	orr	w8, w8, w10
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	str	x8, [sp, #600]
	ldr	q4, [sp, #592]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #608]
	zip2	v3.2d, v11.2d, v12.2d
	ldr	x8, [sp, #608]
	lsr	x11, x8, #40
	strb	w8, [x10, #128]!
	lsr	x13, x8, #16
	ldr	x14, [sp, #616]
	lsr	x12, x8, #24
	strb	w11, [x2, #133]
	lsr	x11, x8, #8
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #129]
	lsr	x11, x14, #40
	strb	w12, [x10, #3]
	mov	x12, x10
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w8, [x10, #2]
	lsr	x8, x14, #48
	strb	w15, [x10, #3]
	mov	x10, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w8, [x12, #2]
	ldrb	w8, [x10, #192]!
	mov	x12, x10
	ldrb	w11, [x10, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #193]
	ldrb	w16, [x10, #3]
	ldrb	w17, [x1, #197]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x8, x11, x8
	orr	w11, w12, w13
	orr	x8, x8, x11, lsl #32
	str	x8, [sp, #624]
	mov	x8, x10
	ldrb	w11, [x8, #8]!
	ldrb	w12, [x8, #3]
	ldrb	w13, [x8, #2]
	ldrb	w14, [x8, #4]!
	ldrb	w15, [x8, #2]
	ldrb	w16, [x10, #9]
	ldrb	w10, [x10, #13]
	ldrb	w8, [x8, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w10, w14, w10, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w8, w15, w8, lsl #24
	orr	x11, x12, x11
	orr	w8, w8, w10
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	str	x8, [sp, #632]
	ldr	q4, [sp, #624]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #640]
	ldp	q4, q3, [sp, #256]              // 32-byte Folded Reload
	ldr	x8, [sp, #640]
	lsr	x11, x8, #40
	strb	w8, [x10, #192]!
	lsr	x13, x8, #16
	ldr	x14, [sp, #648]
	lsr	x12, x8, #24
	strb	w11, [x2, #197]
	lsr	x11, x8, #8
	add	v27.4s, v30.4s, v3.4s
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #193]
	lsr	x11, x14, #40
	ldr	q3, [sp, #288]                  // 16-byte Folded Reload
	strb	w12, [x10, #3]
	mov	x12, x10
	add	v31.4s, v31.4s, v4.4s
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	add	v29.4s, v29.4s, v3.4s
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	trn1	v26.4s, v31.4s, v28.4s
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	trn1	v25.4s, v29.4s, v27.4s
	strb	w15, [x10, #3]
	trn2	v27.4s, v29.4s, v27.4s
	trn2	v28.4s, v31.4s, v28.4s
	strb	w8, [x10, #2]
	lsr	x10, x14, #48
	mov	x8, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	mov	v3.16b, v25.16b
	strb	w10, [x12, #2]
	ldrb	w10, [x8, #16]!
	mov	x12, x8
	ldrb	w11, [x8, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #17]
	ldrb	w16, [x8, #3]
	ldrb	w17, [x1, #21]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x10, x10, x15, lsl #8
	mov	v3.d[1], v26.d[0]
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x10, x11, x10
	orr	w11, w12, w13
	orr	x10, x10, x11, lsl #32
	str	x10, [sp, #656]
	mov	x10, x8
	ldrb	w11, [x10, #8]!
	ldrb	w12, [x10, #3]
	ldrb	w13, [x10, #2]
	ldrb	w14, [x10, #4]!
	ldrb	w15, [x10, #2]
	ldrb	w16, [x8, #9]
	ldrb	w8, [x8, #13]
	ldrb	w10, [x10, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w8, w14, w8, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w10, w15, w10, lsl #24
	orr	x11, x12, x11
	orr	w8, w10, w8
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	str	x8, [sp, #664]
	ldr	q4, [sp, #656]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #672]
	mov	v3.16b, v27.16b
	ldr	x8, [sp, #672]
	lsr	x11, x8, #40
	strb	w8, [x10, #16]!
	lsr	x13, x8, #16
	ldr	x14, [sp, #680]
	lsr	x12, x8, #24
	strb	w11, [x2, #21]
	lsr	x11, x8, #8
	mov	v3.d[1], v28.d[0]
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #17]
	lsr	x11, x14, #40
	strb	w12, [x10, #3]
	mov	x12, x10
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w8, [x10, #2]
	lsr	x8, x14, #48
	strb	w15, [x10, #3]
	mov	x10, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w8, [x12, #2]
	ldrb	w8, [x10, #80]!
	mov	x12, x10
	ldrb	w11, [x10, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #81]
	ldrb	w16, [x10, #3]
	ldrb	w17, [x1, #85]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x8, x11, x8
	orr	w11, w12, w13
	orr	x8, x8, x11, lsl #32
	str	x8, [sp, #688]
	mov	x8, x10
	ldrb	w11, [x8, #8]!
	ldrb	w12, [x8, #3]
	ldrb	w13, [x8, #2]
	ldrb	w14, [x8, #4]!
	ldrb	w15, [x8, #2]
	ldrb	w16, [x10, #9]
	ldrb	w10, [x10, #13]
	ldrb	w8, [x8, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w10, w14, w10, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w8, w15, w8, lsl #24
	orr	x11, x12, x11
	orr	w8, w8, w10
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	str	x8, [sp, #696]
	ldr	q4, [sp, #688]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #704]
	zip2	v3.2d, v25.2d, v26.2d
	ldr	x8, [sp, #704]
	lsr	x11, x8, #40
	strb	w8, [x10, #80]!
	lsr	x13, x8, #16
	ldr	x14, [sp, #712]
	lsr	x12, x8, #24
	strb	w11, [x2, #85]
	lsr	x11, x8, #8
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #81]
	lsr	x11, x14, #40
	strb	w12, [x10, #3]
	mov	x12, x10
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w8, [x10, #2]
	lsr	x8, x14, #48
	strb	w15, [x10, #3]
	mov	x10, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w8, [x12, #2]
	ldrb	w8, [x10, #144]!
	mov	x12, x10
	ldrb	w11, [x10, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #145]
	ldrb	w16, [x10, #3]
	ldrb	w17, [x1, #149]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x8, x11, x8
	orr	w11, w12, w13
	orr	x8, x8, x11, lsl #32
	str	x8, [sp, #720]
	mov	x8, x10
	ldrb	w11, [x8, #8]!
	ldrb	w12, [x8, #3]
	ldrb	w13, [x8, #2]
	ldrb	w14, [x8, #4]!
	ldrb	w15, [x8, #2]
	ldrb	w16, [x10, #9]
	ldrb	w10, [x10, #13]
	ldrb	w8, [x8, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w10, w14, w10, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w8, w15, w8, lsl #24
	orr	x11, x12, x11
	orr	w8, w8, w10
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	str	x8, [sp, #728]
	ldr	q4, [sp, #720]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #736]
	zip2	v3.2d, v27.2d, v28.2d
	ldr	x8, [sp, #736]
	lsr	x11, x8, #40
	strb	w8, [x10, #144]!
	lsr	x13, x8, #16
	ldr	x14, [sp, #744]
	lsr	x12, x8, #24
	strb	w11, [x2, #149]
	lsr	x11, x8, #8
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #145]
	lsr	x11, x14, #40
	strb	w12, [x10, #3]
	mov	x12, x10
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w8, [x10, #2]
	lsr	x8, x14, #48
	strb	w15, [x10, #3]
	mov	x10, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w8, [x12, #2]
	ldrb	w8, [x10, #208]!
	mov	x12, x10
	ldrb	w11, [x10, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #209]
	ldrb	w16, [x10, #3]
	ldrb	w17, [x1, #213]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x8, x11, x8
	orr	w11, w12, w13
	orr	x8, x8, x11, lsl #32
	str	x8, [sp, #752]
	mov	x8, x10
	ldrb	w11, [x8, #8]!
	ldrb	w12, [x8, #3]
	ldrb	w13, [x8, #2]
	ldrb	w14, [x8, #4]!
	ldrb	w15, [x8, #2]
	ldrb	w16, [x10, #9]
	ldrb	w10, [x10, #13]
	ldrb	w8, [x8, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w10, w14, w10, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w8, w15, w8, lsl #24
	orr	x11, x12, x11
	orr	w8, w8, w10
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	str	x8, [sp, #760]
	ldr	q4, [sp, #752]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #768]
	ldp	q4, q3, [sp, #304]              // 32-byte Folded Reload
	ldr	x8, [sp, #768]
	lsr	x11, x8, #40
	strb	w8, [x10, #208]!
	lsr	x13, x8, #16
	ldr	x14, [sp, #776]
	lsr	x12, x8, #24
	strb	w11, [x2, #213]
	lsr	x11, x8, #8
	add	v20.4s, v24.4s, v4.4s
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #209]
	lsr	x11, x14, #40
	add	v23.4s, v23.4s, v3.4s
	strb	w12, [x10, #3]
	mov	x12, x10
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w14, [x12, #8]!
	trn1	v18.4s, v23.4s, v20.4s
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	trn2	v20.4s, v23.4s, v20.4s
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w15, [x10, #3]
	ldp	q4, q3, [sp, #336]              // 32-byte Folded Reload
	strb	w8, [x10, #2]
	lsr	x10, x14, #48
	mov	x8, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	add	v19.4s, v22.4s, v4.4s
	add	v21.4s, v21.4s, v3.4s
	strb	w10, [x12, #2]
	ldrb	w10, [x8, #32]!
	mov	x12, x8
	ldrb	w11, [x8, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #33]
	ldrb	w16, [x8, #3]
	ldrb	w17, [x1, #37]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x10, x10, x15, lsl #8
	trn1	v17.4s, v21.4s, v19.4s
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	trn2	v19.4s, v21.4s, v19.4s
	orr	w12, w14, w12, lsl #24
	orr	x10, x11, x10
	orr	w11, w12, w13
	mov	v3.16b, v17.16b
	orr	x10, x10, x11, lsl #32
	str	x10, [sp, #784]
	mov	x10, x8
	mov	v3.d[1], v18.d[0]
	ldrb	w11, [x10, #8]!
	ldrb	w12, [x10, #3]
	ldrb	w13, [x10, #2]
	ldrb	w14, [x10, #4]!
	ldrb	w15, [x10, #2]
	ldrb	w16, [x8, #9]
	ldrb	w8, [x8, #13]
	ldrb	w10, [x10, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w8, w14, w8, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w10, w15, w10, lsl #24
	orr	x11, x12, x11
	orr	w8, w10, w8
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	str	x8, [sp, #792]
	ldr	q4, [sp, #784]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #800]
	mov	v3.16b, v19.16b
	ldr	x8, [sp, #800]
	lsr	x11, x8, #40
	strb	w8, [x10, #32]!
	lsr	x13, x8, #16
	ldr	x14, [sp, #808]
	lsr	x12, x8, #24
	strb	w11, [x2, #37]
	lsr	x11, x8, #8
	mov	v3.d[1], v20.d[0]
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #33]
	lsr	x11, x14, #40
	strb	w12, [x10, #3]
	mov	x12, x10
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w8, [x10, #2]
	lsr	x8, x14, #48
	strb	w15, [x10, #3]
	mov	x10, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w8, [x12, #2]
	ldrb	w8, [x10, #96]!
	mov	x12, x10
	ldrb	w11, [x10, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #97]
	ldrb	w16, [x10, #3]
	ldrb	w17, [x1, #101]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x8, x11, x8
	orr	w11, w12, w13
	orr	x8, x8, x11, lsl #32
	str	x8, [sp, #816]
	mov	x8, x10
	ldrb	w11, [x8, #8]!
	ldrb	w12, [x8, #3]
	ldrb	w13, [x8, #2]
	ldrb	w14, [x8, #4]!
	ldrb	w15, [x8, #2]
	ldrb	w16, [x10, #9]
	ldrb	w10, [x10, #13]
	ldrb	w8, [x8, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w10, w14, w10, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w8, w15, w8, lsl #24
	orr	x11, x12, x11
	orr	w8, w8, w10
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	str	x8, [sp, #824]
	ldr	q4, [sp, #816]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #832]
	zip2	v3.2d, v17.2d, v18.2d
	ldr	x8, [sp, #832]
	lsr	x11, x8, #40
	strb	w8, [x10, #96]!
	lsr	x13, x8, #16
	ldr	x14, [sp, #840]
	lsr	x12, x8, #24
	strb	w11, [x2, #101]
	lsr	x11, x8, #8
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #97]
	lsr	x11, x14, #40
	strb	w12, [x10, #3]
	mov	x12, x10
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w8, [x10, #2]
	lsr	x8, x14, #48
	strb	w15, [x10, #3]
	mov	x10, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w8, [x12, #2]
	ldrb	w8, [x10, #160]!
	mov	x12, x10
	ldrb	w11, [x10, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #161]
	ldrb	w16, [x10, #3]
	ldrb	w17, [x1, #165]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x8, x11, x8
	orr	w11, w12, w13
	orr	x8, x8, x11, lsl #32
	str	x8, [sp, #848]
	mov	x8, x10
	ldrb	w11, [x8, #8]!
	ldrb	w12, [x8, #3]
	ldrb	w13, [x8, #2]
	ldrb	w14, [x8, #4]!
	ldrb	w15, [x8, #2]
	ldrb	w16, [x10, #9]
	ldrb	w10, [x10, #13]
	ldrb	w8, [x8, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w10, w14, w10, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w8, w15, w8, lsl #24
	orr	x11, x12, x11
	orr	w8, w8, w10
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	str	x8, [sp, #856]
	ldr	q4, [sp, #848]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #864]
	zip2	v3.2d, v19.2d, v20.2d
	ldr	x8, [sp, #864]
	lsr	x11, x8, #40
	strb	w8, [x10, #160]!
	lsr	x13, x8, #16
	ldr	x14, [sp, #872]
	lsr	x12, x8, #24
	strb	w11, [x2, #165]
	lsr	x11, x8, #8
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #161]
	lsr	x11, x14, #40
	strb	w12, [x10, #3]
	mov	x12, x10
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w8, [x10, #2]
	lsr	x8, x14, #48
	strb	w15, [x10, #3]
	mov	x10, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w8, [x12, #2]
	ldrb	w8, [x10, #224]!
	mov	x12, x10
	ldrb	w11, [x10, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #225]
	ldrb	w16, [x10, #3]
	ldrb	w17, [x1, #229]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x8, x11, x8
	orr	w11, w12, w13
	orr	x8, x8, x11, lsl #32
	str	x8, [sp, #880]
	mov	x8, x10
	ldrb	w11, [x8, #8]!
	ldrb	w12, [x8, #3]
	ldrb	w13, [x8, #2]
	ldrb	w14, [x8, #4]!
	ldrb	w15, [x8, #2]
	ldrb	w16, [x10, #9]
	ldrb	w10, [x10, #13]
	ldrb	w8, [x8, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w10, w14, w10, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w8, w15, w8, lsl #24
	orr	x11, x12, x11
	orr	w8, w8, w10
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	str	x8, [sp, #888]
	ldr	q4, [sp, #880]
	eor	v3.16b, v4.16b, v3.16b
	str	q3, [sp, #896]
	ldr	q3, [sp, #368]                  // 16-byte Folded Reload
	ldr	x8, [sp, #896]
	add	v4.4s, v3.4s, v6.4s
	add	v6.4s, v2.4s, v16.4s
	lsr	x11, x8, #40
	strb	w8, [x10, #224]!
	lsr	x13, x8, #16
	ldr	x14, [sp, #904]
	lsr	x12, x8, #24
	strb	w11, [x2, #229]
	lsr	x11, x8, #8
	trn1	v1.4s, v7.4s, v6.4s
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #225]
	lsr	x11, x14, #40
	trn1	v2.4s, v4.4s, v5.4s
	strb	w12, [x10, #3]
	mov	x12, x10
	trn2	v4.4s, v4.4s, v5.4s
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	mov	v3.16b, v1.16b
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	zip2	v1.2d, v1.2d, v2.2d
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	mov	v3.d[1], v2.d[0]
	strb	w15, [x10, #3]
	strb	w8, [x10, #2]
	lsr	x10, x14, #48
	mov	x8, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w10, [x12, #2]
	ldrb	w10, [x8, #48]!
	mov	x12, x8
	ldrb	w11, [x8, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #49]
	ldrb	w16, [x8, #3]
	ldrb	w17, [x1, #53]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x10, x10, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x10, x11, x10
	orr	w11, w12, w13
	orr	x10, x10, x11, lsl #32
	str	x10, [sp, #912]
	mov	x10, x8
	ldrb	w11, [x10, #8]!
	ldrb	w12, [x10, #3]
	ldrb	w13, [x10, #2]
	ldrb	w14, [x10, #4]!
	ldrb	w15, [x10, #2]
	ldrb	w16, [x8, #9]
	ldrb	w8, [x8, #13]
	ldrb	w10, [x10, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w8, w14, w8, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w10, w15, w10, lsl #24
	orr	x11, x12, x11
	orr	w8, w10, w8
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	str	x8, [sp, #920]
	ldr	q16, [sp, #912]
	eor	v3.16b, v16.16b, v3.16b
	stur	q3, [x29, #-256]
	trn2	v3.4s, v7.4s, v6.4s
	ldur	x8, [x29, #-256]
	lsr	x11, x8, #40
	strb	w8, [x10, #48]!
	lsr	x13, x8, #16
	ldur	x14, [x29, #-248]
	lsr	x12, x8, #24
	strb	w11, [x2, #53]
	lsr	x11, x8, #8
	mov	v5.16b, v3.16b
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #49]
	lsr	x11, x14, #40
	strb	w12, [x10, #3]
	mov	x12, x10
	mov	v5.d[1], v4.d[0]
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w8, [x10, #2]
	lsr	x8, x14, #48
	strb	w15, [x10, #3]
	mov	x10, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w8, [x12, #2]
	ldrb	w8, [x10, #112]!
	mov	x12, x10
	ldrb	w11, [x10, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #113]
	ldrb	w16, [x10, #3]
	ldrb	w17, [x1, #117]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x8, x11, x8
	orr	w11, w12, w13
	orr	x8, x8, x11, lsl #32
	stur	x8, [x29, #-240]
	mov	x8, x10
	ldrb	w11, [x8, #8]!
	ldrb	w12, [x8, #3]
	ldrb	w13, [x8, #2]
	ldrb	w14, [x8, #4]!
	ldrb	w15, [x8, #2]
	ldrb	w16, [x10, #9]
	ldrb	w10, [x10, #13]
	ldrb	w8, [x8, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w10, w14, w10, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w8, w15, w8, lsl #24
	orr	x11, x12, x11
	orr	w8, w8, w10
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	stur	x8, [x29, #-232]
	ldur	q6, [x29, #-240]
	eor	v5.16b, v6.16b, v5.16b
	stur	q5, [x29, #-224]
	ldur	x8, [x29, #-224]
	lsr	x11, x8, #40
	strb	w8, [x10, #112]!
	lsr	x13, x8, #16
	ldur	x14, [x29, #-216]
	lsr	x12, x8, #24
	strb	w11, [x2, #117]
	lsr	x11, x8, #8
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #113]
	lsr	x11, x14, #40
	strb	w12, [x10, #3]
	mov	x12, x10
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w8, [x10, #2]
	lsr	x8, x14, #48
	strb	w15, [x10, #3]
	mov	x10, x1
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w8, [x12, #2]
	ldrb	w8, [x10, #176]!
	mov	x12, x10
	ldrb	w11, [x10, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w14, [x12, #2]
	ldrb	w15, [x1, #177]
	ldrb	w16, [x10, #3]
	ldrb	w17, [x1, #181]
	ldrb	w12, [x12, #3]
	lsl	x11, x11, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w17, lsl #8
	orr	x11, x11, x16, lsl #24
	orr	w12, w14, w12, lsl #24
	orr	x8, x11, x8
	orr	w11, w12, w13
	orr	x8, x8, x11, lsl #32
	stur	x8, [x29, #-208]
	mov	x8, x10
	ldrb	w11, [x8, #8]!
	ldrb	w12, [x8, #3]
	ldrb	w13, [x8, #2]
	ldrb	w14, [x8, #4]!
	ldrb	w15, [x8, #2]
	ldrb	w16, [x10, #9]
	ldrb	w10, [x10, #13]
	ldrb	w8, [x8, #3]
	lsl	x13, x13, #16
	lsl	w15, w15, #16
	orr	x11, x11, x16, lsl #8
	orr	w10, w14, w10, lsl #8
	orr	x12, x13, x12, lsl #24
	orr	w8, w15, w8, lsl #24
	orr	x11, x12, x11
	orr	w8, w8, w10
	mov	x10, x2
	orr	x8, x11, x8, lsl #32
	stur	x8, [x29, #-200]
	ldur	q2, [x29, #-208]
	eor	v1.16b, v2.16b, v1.16b
	stur	q1, [x29, #-192]
	zip2	v1.2d, v3.2d, v4.2d
	ldur	x8, [x29, #-192]
	lsr	x11, x8, #40
	strb	w8, [x10, #176]!
	lsr	x13, x8, #16
	ldur	x14, [x29, #-184]
	lsr	x12, x8, #24
	strb	w11, [x2, #181]
	lsr	x11, x8, #8
	strb	w13, [x10, #2]
	lsr	x13, x14, #8
	lsr	x15, x14, #24
	strb	w11, [x2, #177]
	lsr	x11, x14, #40
	strb	w12, [x10, #3]
	mov	x12, x10
	strb	w14, [x12, #8]!
	strb	w11, [x10, #13]
	lsr	x11, x14, #16
	strb	w13, [x10, #9]
	lsr	x13, x8, #32
	strb	w15, [x12, #3]
	lsr	x15, x8, #56
	lsr	x8, x8, #48
	strb	w11, [x12, #2]
	lsr	x11, x14, #32
	strb	w13, [x10, #4]!
	lsr	x13, x14, #56
	strb	w8, [x10, #2]
	lsr	x8, x14, #48
	strb	w15, [x10, #3]
	strb	w11, [x12, #4]!
	strb	w13, [x12, #3]
	strb	w8, [x12, #2]
	ldrb	w8, [x1, #240]!
	mov	x11, x1
	ldrb	w10, [x1, #2]
	ldrb	w12, [x11, #4]!
	ldrb	w13, [x11, #2]
	ldrb	w14, [x1, #1]
	ldrb	w15, [x1, #3]
	ldrb	w16, [x1, #5]
	ldrb	w11, [x11, #3]
	lsl	x10, x10, #16
	lsl	w13, w13, #16
	orr	x8, x8, x14, lsl #8
	orr	w12, w12, w16, lsl #8
	orr	x10, x10, x15, lsl #24
	orr	w11, w13, w11, lsl #24
	orr	x8, x10, x8
	orr	w10, w11, w12
	orr	x8, x8, x10, lsl #32
	mov	x10, x1
	stur	x8, [x29, #-176]
	ldrb	w8, [x10, #8]!
	ldrb	w11, [x10, #3]
	ldrb	w12, [x10, #2]
	ldrb	w13, [x10, #4]!
	ldrb	w14, [x10, #2]
	ldrb	w15, [x1, #9]
	ldrb	w16, [x1, #13]
	ldrb	w10, [x10, #3]
	lsl	x12, x12, #16
	add	x1, x1, #16
	lsl	w14, w14, #16
	orr	x8, x8, x15, lsl #8
	orr	w13, w13, w16, lsl #8
	orr	x11, x12, x11, lsl #24
	orr	w10, w14, w10, lsl #24
	orr	x8, x11, x8
	orr	w10, w10, w13
	orr	x8, x8, x10, lsl #32
	stur	x8, [x29, #-168]
	ldur	q2, [x29, #-176]
	eor	v1.16b, v2.16b, v1.16b
	stur	q1, [x29, #-160]
	ldur	x8, [x29, #-160]
	lsr	x10, x8, #40
	strb	w8, [x2, #240]!
	lsr	x11, x8, #24
	ldur	x13, [x29, #-152]
	lsr	x12, x8, #16
	strb	w10, [x2, #5]
	lsr	x10, x8, #8
	strb	w11, [x2, #3]
	lsr	x11, x8, #32
	strb	w10, [x2, #1]
	lsr	x10, x8, #56
	lsr	x8, x8, #48
	strb	w12, [x2, #2]
	mov	x12, x2
	strb	w11, [x12, #4]!
	lsr	x11, x13, #8
	strb	w8, [x12, #2]
	lsr	x8, x13, #40
	strb	w10, [x12, #3]
	mov	x10, x2
	lsr	x12, x13, #24
	strb	w8, [x2, #13]
	lsr	x8, x13, #16
	strb	w11, [x2, #9]
	lsr	x11, x13, #32
	add	x2, x2, #16
	strb	w13, [x10, #8]!
	strb	w12, [x10, #3]
	lsr	x12, x13, #56
	strb	w8, [x10, #2]
	lsr	x8, x13, #48
	strb	w11, [x10, #4]!
	lsr	x11, x9, #32
	strb	w8, [x10, #2]
	mov	w8, w11
	strb	w12, [x10, #3]
	stp	w9, w11, [x25, #48]
	b.hi	.LBB4_3
// %bb.6:
	cbz	w3, .LBB4_34
.LBB4_7:
	ldp	w30, w8, [x25]
	ldp	w26, w27, [x25, #48]
	sub	x4, x29, #144
	mov	w28, w3
	str	xzr, [sp, #16]                  // 8-byte Folded Spill
	str	w8, [sp, #384]                  // 4-byte Folded Spill
	ldp	w9, w8, [x25, #8]
	str	x25, [sp, #32]                  // 8-byte Folded Spill
	str	w30, [sp, #28]                  // 4-byte Folded Spill
	str	w9, [sp, #368]                  // 4-byte Folded Spill
	str	w8, [sp, #352]                  // 4-byte Folded Spill
	ldp	w9, w8, [x25, #16]
	str	w9, [sp, #336]                  // 4-byte Folded Spill
	str	w8, [sp, #320]                  // 4-byte Folded Spill
	ldp	w9, w8, [x25, #24]
	str	w9, [sp, #304]                  // 4-byte Folded Spill
	ldp	w9, w10, [x25, #32]
	str	w8, [sp, #288]                  // 4-byte Folded Spill
	str	w9, [sp, #272]                  // 4-byte Folded Spill
	ldp	w9, w11, [x25, #40]
	stp	w9, w10, [sp, #252]             // 8-byte Folded Spill
	ldp	w9, w8, [x25, #56]
	str	w8, [sp, #240]                  // 4-byte Folded Spill
	add	x8, x4, #16
	stp	w9, w11, [sp, #244]             // 8-byte Folded Spill
	stp	x28, x8, [sp]                   // 16-byte Folded Spill
	cmp	x28, #63
	b.hi	.LBB4_12
.LBB4_8:
	cmp	x28, #8
	mov	x8, xzr
	b.lo	.LBB4_21
// %bb.9:
	sub	x9, x4, x1
	cmp	x9, #32
	b.lo	.LBB4_21
// %bb.10:
	cmp	x28, #32
	b.hs	.LBB4_13
// %bb.11:
	mov	x8, xzr
	b	.LBB4_17
.LBB4_12:
	mov	x22, x2
	b	.LBB4_23
.LBB4_13:
	ldr	x14, [sp, #8]                   // 8-byte Folded Reload
	and	x12, x28, #0x20
	and	x8, x28, #0x20
	add	x13, x1, #16
.LBB4_14:                               // =>This Inner Loop Header: Depth=1
	mov	x9, x13
	ldurb	w18, [x13, #-15]
	ldurb	w0, [x13, #-11]
	ldrb	w10, [x9, #-16]!
	mov	x15, x9
	ldrb	w11, [x9, #2]
	ldrb	w16, [x15, #4]!
	ldrb	w17, [x15, #2]
	ldrb	w3, [x9, #3]
	ldrb	w15, [x15, #3]
	lsl	x11, x11, #16
	orr	x10, x10, x18, lsl #8
	orr	w16, w16, w0, lsl #8
	lsl	w17, w17, #16
	subs	x12, x12, #32
	orr	x11, x11, x3, lsl #24
	orr	w15, w17, w15, lsl #24
	orr	x10, x11, x10
	orr	w11, w15, w16
	orr	x10, x10, x11, lsl #32
	str	x10, [sp, #480]
	mov	x10, x9
	ldrb	w11, [x10, #8]!
	ldrb	w15, [x10, #3]
	ldrb	w16, [x10, #2]
	ldrb	w17, [x10, #4]!
	ldrb	w18, [x10, #2]
	ldrb	w0, [x9, #9]
	ldrb	w9, [x9, #13]
	ldrb	w10, [x10, #3]
	lsl	x16, x16, #16
	lsl	w18, w18, #16
	orr	x11, x11, x0, lsl #8
	orr	w9, w17, w9, lsl #8
	orr	x15, x16, x15, lsl #24
	orr	w10, w18, w10, lsl #24
	orr	x11, x15, x11
	orr	w9, w10, w9
	orr	x9, x11, x9, lsl #32
	str	x9, [sp, #488]
	mov	x9, x13
	ldrb	w11, [x13, #2]
	ldrb	w15, [x9, #4]!
	ldrb	w16, [x9, #2]
	ldrb	w10, [x13, #1]
	ldrb	w17, [x13]
	ldrb	w18, [x13, #3]
	ldrb	w0, [x13, #5]
	ldrb	w9, [x9, #3]
	lsl	x11, x11, #16
	lsl	w16, w16, #16
	orr	x10, x17, x10, lsl #8
	orr	w15, w15, w0, lsl #8
	orr	x11, x11, x18, lsl #24
	orr	w9, w16, w9, lsl #24
	orr	x10, x11, x10
	orr	w9, w9, w15
	orr	x9, x10, x9, lsl #32
	mov	x10, x13
	str	x9, [sp, #464]
	ldrb	w9, [x10, #8]!
	ldrb	w11, [x10, #3]
	ldrb	w15, [x10, #2]
	ldrb	w16, [x10, #4]!
	ldrb	w17, [x10, #2]
	ldrb	w18, [x13, #9]
	ldrb	w0, [x13, #13]
	ldrb	w10, [x10, #3]
	lsl	x15, x15, #16
	add	x13, x13, #32
	lsl	w17, w17, #16
	orr	x9, x9, x18, lsl #8
	orr	w16, w16, w0, lsl #8
	orr	x11, x15, x11, lsl #24
	orr	w10, w17, w10, lsl #24
	orr	x9, x11, x9
	orr	w10, w10, w16
	orr	x9, x9, x10, lsl #32
	mov	x10, x14
	str	x9, [sp, #472]
	ldp	q0, q1, [sp, #464]
	str	q1, [sp, #512]
	ldr	x9, [sp, #512]
	lsr	x11, x9, #40
	strb	w9, [x10, #-16]!
	lsr	x15, x9, #24
	ldr	x16, [sp, #520]
	sturb	w11, [x14, #-11]
	lsr	x11, x9, #16
	strb	w15, [x10, #3]
	lsr	x15, x9, #8
	strb	w11, [x10, #2]
	lsr	x11, x16, #40
	sturb	w15, [x14, #-15]
	lsr	x15, x16, #8
	strb	w11, [x10, #13]
	lsr	x11, x9, #32
	strb	w15, [x10, #9]
	mov	x15, x10
	strb	w11, [x10, #4]!
	lsr	x11, x9, #56
	lsr	x9, x9, #48
	strb	w16, [x15, #8]!
	strb	w11, [x10, #3]
	lsr	x11, x16, #24
	strb	w9, [x10, #2]
	lsr	x9, x16, #16
	lsr	x10, x16, #32
	strb	w11, [x15, #3]
	lsr	x11, x16, #56
	strb	w9, [x15, #2]
	lsr	x9, x16, #48
	strb	w10, [x15, #4]!
	strb	w11, [x15, #3]
	strb	w9, [x15, #2]
	str	q0, [sp, #496]
	ldr	x9, [sp, #496]
	lsr	x10, x9, #40
	strb	w9, [x14]
	lsr	x15, x9, #16
	ldr	x16, [sp, #504]
	lsr	x11, x9, #24
	strb	w10, [x14, #5]
	lsr	x10, x9, #8
	strb	w15, [x14, #2]
	lsr	x15, x16, #24
	strb	w10, [x14, #1]
	lsr	x10, x16, #40
	strb	w11, [x14, #3]
	mov	x11, x14
	strb	w10, [x14, #13]
	lsr	x10, x16, #16
	strb	w16, [x11, #8]!
	strb	w15, [x11, #3]
	lsr	x15, x16, #32
	strb	w10, [x11, #2]
	lsr	x10, x16, #56
	strb	w15, [x11, #4]!
	lsr	x15, x16, #48
	lsr	x16, x16, #8
	strb	w10, [x11, #3]
	lsr	x10, x9, #32
	strb	w15, [x11, #2]
	lsr	x15, x9, #56
	lsr	x9, x9, #48
	add	x11, x14, #32
	strb	w16, [x14, #9]
	strb	w10, [x14, #4]!
	strb	w15, [x14, #3]
	strb	w9, [x14, #2]
	mov	x14, x11
	b.ne	.LBB4_14
// %bb.15:
	cmp	x28, x8
	b.eq	.LBB4_20
// %bb.16:
	tst	x28, #0x18
	b.eq	.LBB4_21
.LBB4_17:
	mov	x9, x8
	and	x10, x28, #0x38
	and	x8, x28, #0x38
.LBB4_18:                               // =>This Inner Loop Header: Depth=1
	add	x11, x1, x9
	add	x17, x4, x9
	add	x9, x9, #8
	mov	x12, x11
	ldrb	w15, [x11, #3]
	ldrb	w16, [x11, #2]
	ldrb	w13, [x12, #4]!
	ldrb	w0, [x11, #1]
	ldrb	w14, [x12, #2]!
	ldurb	w18, [x12, #-1]
	ldrb	w12, [x12, #1]
	ldrb	w11, [x11]
	cmp	x10, x9
	lsl	w14, w14, #16
	orr	w13, w13, w18, lsl #8
	strb	w16, [x17, #2]
	strb	w11, [x17]
	orr	w14, w14, w12, lsl #24
	strb	w15, [x17, #3]
	strb	w0, [x17, #1]
	orr	w11, w14, w13
	strb	w18, [x17, #5]
	lsr	x13, x11, #16
	strb	w11, [x17, #4]!
	strb	w12, [x17, #3]
	strb	w13, [x17, #2]
	b.ne	.LBB4_18
// %bb.19:
	cmp	x28, x8
	b.ne	.LBB4_21
.LBB4_20:
	sub	x22, x29, #144
	b	.LBB4_22
.LBB4_21:                               // =>This Inner Loop Header: Depth=1
	ldrb	w9, [x1, x8]
	sub	x22, x29, #144
	strb	w9, [x22, x8]
	add	x8, x8, #1
	cmp	x28, x8
	b.ne	.LBB4_21
.LBB4_22:
	sub	x1, x29, #144
	str	x2, [sp, #16]                   // 8-byte Folded Spill
.LBB4_23:
	ldp	w10, w2, [sp, #252]             // 8-byte Folded Reload
	ldp	w9, w12, [sp, #240]             // 8-byte Folded Reload
	ldr	w18, [sp, #384]                 // 4-byte Folded Reload
	ldr	w5, [sp, #368]                  // 4-byte Folded Reload
	mov	w8, #-20                        // =0xffffffec
	ldr	w11, [sp, #352]                 // 4-byte Folded Reload
	ldr	w6, [sp, #336]                  // 4-byte Folded Reload
	mov	w4, w30
	ldr	w17, [sp, #320]                 // 4-byte Folded Reload
	ldr	w0, [sp, #304]                  // 4-byte Folded Reload
	mov	w14, w27
	ldr	w16, [sp, #288]                 // 4-byte Folded Reload
	ldr	w15, [sp, #272]                 // 4-byte Folded Reload
	mov	w3, w26
	ldr	w13, [sp, #248]                 // 4-byte Folded Reload
.LBB4_24:                               // =>This Inner Loop Header: Depth=1
	add	w4, w4, w6
	add	w18, w18, w17
	add	w5, w5, w0
	add	w11, w11, w16
	eor	w3, w4, w3
	eor	w14, w18, w14
	eor	w12, w5, w12
	ror	w3, w3, #16
	eor	w9, w11, w9
	ror	w14, w14, #16
	ror	w12, w12, #16
	ror	w9, w9, #16
	add	w7, w3, w15
	adds	w8, w8, #2
	add	w2, w14, w2
	add	w19, w12, w10
	eor	w10, w7, w6
	eor	w15, w2, w17
	eor	w17, w19, w0
	add	w13, w9, w13
	ror	w0, w10, #20
	ror	w6, w15, #20
	eor	w10, w13, w16
	ror	w20, w17, #20
	ror	w21, w10, #20
	add	w23, w0, w4
	add	w24, w6, w18
	add	w5, w20, w5
	add	w11, w21, w11
	eor	w10, w23, w3
	eor	w15, w24, w14
	eor	w12, w5, w12
	ror	w14, w10, #24
	eor	w9, w11, w9
	ror	w17, w15, #24
	ror	w15, w12, #24
	ror	w4, w9, #24
	add	w10, w14, w7
	add	w9, w17, w2
	add	w16, w15, w19
	eor	w12, w10, w0
	eor	w18, w9, w6
	eor	w0, w16, w20
	add	w2, w4, w13
	ror	w18, w18, #25
	ror	w0, w0, #25
	eor	w3, w2, w21
	ror	w13, w12, #25
	ror	w3, w3, #25
	add	w12, w18, w23
	add	w6, w0, w24
	add	w5, w3, w5
	add	w11, w13, w11
	eor	w4, w12, w4
	eor	w14, w6, w14
	eor	w17, w5, w17
	ror	w7, w4, #16
	eor	w15, w11, w15
	ror	w14, w14, #16
	ror	w17, w17, #16
	ror	w15, w15, #16
	add	w16, w7, w16
	add	w2, w14, w2
	add	w19, w17, w10
	eor	w10, w16, w18
	eor	w18, w2, w0
	add	w20, w15, w9
	eor	w0, w19, w3
	ror	w23, w18, #20
	eor	w9, w20, w13
	ror	w21, w10, #20
	ror	w0, w0, #20
	ror	w24, w9, #20
	add	w18, w23, w6
	add	w4, w21, w12
	add	w5, w0, w5
	add	w11, w24, w11
	eor	w10, w18, w14
	eor	w9, w4, w7
	eor	w12, w5, w17
	eor	w13, w11, w15
	ror	w3, w10, #24
	ror	w9, w9, #24
	ror	w14, w12, #24
	ror	w12, w13, #24
	add	w13, w3, w2
	add	w10, w9, w16
	add	w15, w14, w19
	eor	w6, w13, w23
	add	w2, w12, w20
	eor	w16, w10, w21
	eor	w7, w15, w0
	ror	w0, w6, #25
	eor	w6, w2, w24
	ror	w17, w16, #25
	ror	w16, w7, #25
	ror	w6, w6, #25
	b.ne	.LBB4_24
// %bb.25:
	ldr	w8, [sp, #384]                  // 4-byte Folded Reload
	add	w4, w4, w30
	cmp	x28, #63
	stp	w27, w26, [sp, #232]            // 8-byte Folded Spill
	add	w18, w18, w8
	ldr	w8, [sp, #368]                  // 4-byte Folded Reload
	str	x28, [sp, #224]                 // 8-byte Folded Spill
	add	w23, w5, w8
	ldr	w8, [sp, #352]                  // 4-byte Folded Reload
	add	w21, w11, w8
	ldr	w8, [sp, #336]                  // 4-byte Folded Reload
	add	w20, w6, w8
	ldr	w8, [sp, #320]                  // 4-byte Folded Reload
	add	w19, w17, w8
	ldr	w8, [sp, #304]                  // 4-byte Folded Reload
	add	w7, w0, w8
	ldr	w8, [sp, #288]                  // 4-byte Folded Reload
	add	w6, w16, w8
	ldr	w8, [sp, #272]                  // 4-byte Folded Reload
	add	w5, w15, w8
	add	w15, w3, w26
	ldp	w8, w11, [sp, #252]             // 8-byte Folded Reload
	add	w17, w10, w8
	add	w0, w2, w11
	ldp	w8, w10, [sp, #244]             // 8-byte Folded Reload
	add	w11, w12, w8
	ldr	w8, [sp, #240]                  // 4-byte Folded Reload
	add	w16, w13, w10
	add	w13, w14, w27
	add	w10, w9, w8
	b.hi	.LBB4_27
// %bb.26:
	lsr	w8, w4, #8
	lsr	w9, w4, #16
	strb	w4, [x25, #64]
	strb	w18, [x25, #68]
	strb	w8, [x25, #65]
	lsr	w8, w4, #24
	strb	w9, [x25, #66]
	lsr	w9, w18, #8
	strb	w8, [x25, #67]
	lsr	w8, w18, #16
	strb	w9, [x25, #69]
	lsr	w9, w18, #24
	strb	w8, [x25, #70]
	lsr	w8, w23, #8
	strb	w9, [x25, #71]
	lsr	w9, w23, #16
	strb	w8, [x25, #73]
	lsr	w8, w23, #24
	strb	w9, [x25, #74]
	lsr	w9, w21, #8
	strb	w8, [x25, #75]
	lsr	w8, w21, #16
	strb	w9, [x25, #77]
	lsr	w9, w21, #24
	strb	w8, [x25, #78]
	lsr	w8, w20, #8
	strb	w9, [x25, #79]
	lsr	w9, w20, #16
	strb	w8, [x25, #81]
	lsr	w8, w20, #24
	strb	w9, [x25, #82]
	lsr	w9, w19, #8
	strb	w8, [x25, #83]
	lsr	w8, w19, #16
	strb	w9, [x25, #85]
	lsr	w9, w19, #24
	strb	w8, [x25, #86]
	lsr	w8, w7, #8
	strb	w9, [x25, #87]
	lsr	w9, w7, #16
	strb	w8, [x25, #89]
	lsr	w8, w7, #24
	strb	w9, [x25, #90]
	lsr	w9, w6, #8
	strb	w8, [x25, #91]
	lsr	w8, w6, #16
	strb	w9, [x25, #93]
	lsr	w9, w6, #24
	strb	w8, [x25, #94]
	lsr	w8, w5, #8
	strb	w9, [x25, #95]
	lsr	w9, w5, #16
	strb	w8, [x25, #97]
	lsr	w8, w5, #24
	strb	w9, [x25, #98]
	lsr	w9, w0, #8
	strb	w8, [x25, #99]
	lsr	w8, w0, #16
	strb	w9, [x25, #101]
	lsr	w9, w0, #24
	strb	w8, [x25, #102]
	lsr	w8, w17, #8
	strb	w9, [x25, #103]
	lsr	w9, w17, #16
	strb	w8, [x25, #105]
	lsr	w8, w17, #24
	strb	w9, [x25, #106]
	strb	w8, [x25, #107]
	lsr	w8, w16, #8
	strb	w23, [x25, #72]
	strb	w8, [x25, #109]
	lsr	w8, w16, #16
	strb	w21, [x25, #76]
	strb	w8, [x25, #110]
	lsr	w8, w16, #24
	strb	w20, [x25, #80]
	strb	w8, [x25, #111]
	lsr	w8, w15, #8
	strb	w19, [x25, #84]
	strb	w8, [x25, #113]
	lsr	w8, w15, #16
	strb	w7, [x25, #88]
	strb	w8, [x25, #114]
	lsr	w8, w15, #24
	strb	w6, [x25, #92]
	strb	w8, [x25, #115]
	lsr	w8, w13, #8
	strb	w5, [x25, #96]
	strb	w8, [x25, #117]
	lsr	w8, w13, #16
	strb	w0, [x25, #100]
	strb	w8, [x25, #118]
	lsr	w8, w13, #24
	strb	w17, [x25, #104]
	strb	w8, [x25, #119]
	lsr	w8, w11, #8
	strb	w16, [x25, #108]
	strb	w8, [x25, #121]
	lsr	w8, w11, #16
	strb	w15, [x25, #112]
	strb	w8, [x25, #122]
	lsr	w8, w11, #24
	strb	w13, [x25, #116]
	strb	w8, [x25, #123]
	lsr	w8, w10, #8
	strb	w11, [x25, #120]
	strb	w8, [x25, #125]
	lsr	w8, w10, #16
	strb	w10, [x25, #124]
	strb	w8, [x25, #126]
	lsr	w8, w10, #24
	strb	w8, [x25, #127]
.LBB4_27:
	ldrb	w8, [x1]
	ldrb	w9, [x1, #1]
	mov	w26, w6
	stp	w11, w10, [sp, #216]            // 8-byte Folded Spill
	ldrb	w10, [x1, #4]
	ldrb	w11, [x1, #5]
	orr	w8, w8, w9, lsl #8
	ldrb	w12, [x1, #8]
	str	w13, [sp, #212]                 // 4-byte Folded Spill
	orr	w9, w10, w11, lsl #8
	ldrb	w10, [x1, #2]
	ldrb	w13, [x1, #9]
	ldrb	w11, [x1, #3]
	stp	w5, w16, [sp, #204]             // 8-byte Folded Spill
	ldrb	w14, [x1, #23]
	orr	w8, w8, w10, lsl #16
	orr	w30, w12, w13, lsl #8
	ldrb	w10, [x1, #10]
	ldrb	w12, [x1, #6]
	ldrb	w13, [x1, #7]
	str	w17, [sp, #136]                 // 4-byte Folded Spill
	orr	w8, w8, w11, lsl #24
	str	w10, [sp, #124]                 // 4-byte Folded Spill
	ldrb	w10, [x1, #11]
	orr	w9, w9, w12, lsl #16
	ldrb	w11, [x1, #15]
	ldrb	w12, [x1, #20]
	eor	w5, w8, w4
	str	w10, [sp, #160]                 // 4-byte Folded Spill
	ldrb	w10, [x1, #12]
	orr	w9, w9, w13, lsl #24
	ldrb	w8, [x1, #18]
	ldrb	w13, [x1, #22]
	str	w10, [sp, #108]                 // 4-byte Folded Spill
	ldrb	w10, [x1, #13]
	ldrb	w17, [x1, #24]
	eor	w16, w9, w18
	ldrb	w9, [x1, #36]
	str	w8, [sp, #164]                  // 4-byte Folded Spill
	str	w10, [sp, #104]                 // 4-byte Folded Spill
	ldrb	w10, [x1, #14]
	ldrb	w8, [x1, #19]
	str	w9, [sp, #40]                   // 4-byte Folded Spill
	ldrb	w9, [x1, #38]
	ldrb	w18, [x1, #26]
	str	w10, [sp, #128]                 // 4-byte Folded Spill
	ldrb	w10, [x1, #16]
	ldrb	w4, [x1, #27]
	str	w8, [sp, #176]                  // 4-byte Folded Spill
	lsr	w8, w5, #8
	ldrb	w2, [x1, #28]
	stp	w11, w10, [sp, #152]            // 8-byte Folded Spill
	ldrb	w10, [x1, #17]
	ldrb	w11, [x1, #21]
	str	w15, [sp, #200]                 // 4-byte Folded Spill
	ldrb	w15, [x1, #25]
	ldrb	w3, [x1, #30]
	orr	w11, w12, w11, lsl #8
	str	w10, [sp, #148]                 // 4-byte Folded Spill
	ldrb	w10, [x1, #35]
	str	w0, [sp, #84]                   // 4-byte Folded Spill
	ldrb	w0, [x1, #29]
	ldrb	w6, [x1, #31]
	stp	w9, w10, [sp, #44]              // 8-byte Folded Spill
	ldrb	w9, [x1, #40]
	ldrb	w10, [x1, #39]
	ldrb	w25, [x1, #32]
	ldrb	w24, [x1, #33]
	ldrb	w27, [x1, #34]
	str	w9, [sp, #60]                   // 4-byte Folded Spill
	ldrb	w9, [x1, #41]
	ldrb	w28, [x1, #37]
	ldr	w12, [sp, #176]                 // 4-byte Folded Reload
	stp	w10, w9, [sp, #52]              // 8-byte Folded Spill
	ldrb	w9, [x1, #43]
	ldrb	w10, [x1, #42]
	str	w9, [sp, #80]                   // 4-byte Folded Spill
	ldrb	w9, [x1, #44]
	str	w9, [sp, #72]                   // 4-byte Folded Spill
	ldrb	w9, [x1, #45]
	stp	w10, w9, [sp, #64]              // 8-byte Folded Spill
	ldrb	w9, [x1, #46]
	ldrb	w10, [x1, #47]
	str	w9, [sp, #76]                   // 4-byte Folded Spill
	ldrb	w9, [x1, #48]
	str	w9, [sp, #96]                   // 4-byte Folded Spill
	ldrb	w9, [x1, #49]
	stp	w10, w9, [sp, #88]              // 8-byte Folded Spill
	ldrb	w9, [x1, #50]
	ldrb	w10, [x1, #51]
	str	w9, [sp, #100]                  // 4-byte Folded Spill
	ldrb	w9, [x1, #52]
	stp	w10, w9, [sp, #116]             // 8-byte Folded Spill
	ldrb	w9, [x1, #53]
	ldrb	w10, [x1, #54]
	str	w9, [sp, #112]                  // 4-byte Folded Spill
	ldrb	w9, [x1, #55]
	str	w9, [sp, #168]                  // 4-byte Folded Spill
	ldrb	w9, [x1, #56]
	stp	w9, w10, [sp, #140]             // 8-byte Folded Spill
	ldrb	w9, [x1, #57]
	ldrb	w10, [x1, #59]
	str	w9, [sp, #132]                  // 4-byte Folded Spill
	ldrb	w9, [x1, #58]
	str	w9, [sp, #172]                  // 4-byte Folded Spill
	ldrb	w9, [x1, #60]
	str	w9, [sp, #188]                  // 4-byte Folded Spill
	ldrb	w9, [x1, #61]
	stp	w10, w9, [sp, #180]             // 8-byte Folded Spill
	ldrb	w10, [x1, #62]
	ldrb	w9, [x1, #63]
	strb	w8, [x22, #1]
	lsr	w8, w5, #16
	stp	w10, w9, [sp, #192]             // 8-byte Folded Spill
	ldr	w9, [sp, #124]                  // 4-byte Folded Reload
	strb	w5, [x22]
	lsr	w5, w5, #24
	orr	w10, w30, w9, lsl #16
	strb	w8, [x22, #2]
	lsr	w8, w16, #8
	ldp	w30, w9, [sp, #104]             // 8-byte Folded Reload
	strb	w5, [x22, #3]
	ldr	w5, [sp, #128]                  // 4-byte Folded Reload
	strb	w8, [x22, #5]
	lsr	w8, w16, #16
	orr	w9, w9, w30, lsl #8
	ldr	w30, [sp, #160]                 // 4-byte Folded Reload
	strb	w16, [x22, #4]
	lsr	w16, w16, #24
	strb	w8, [x22, #6]
	orr	w10, w10, w30, lsl #24
	orr	w9, w9, w5, lsl #16
	strb	w16, [x22, #7]
	ldr	w16, [sp, #164]                 // 4-byte Folded Reload
	eor	w10, w10, w23
	ldp	w23, w5, [sp, #148]             // 8-byte Folded Reload
	lsr	w8, w10, #8
	strb	w10, [x22, #8]
	orr	w9, w9, w5, lsl #24
	ldr	w5, [sp, #156]                  // 4-byte Folded Reload
	strb	w8, [x22, #9]
	lsr	w8, w10, #16
	lsr	w10, w10, #24
	orr	w5, w5, w23, lsl #8
	eor	w9, w9, w21
	strb	w8, [x22, #10]
	lsr	w8, w9, #8
	orr	w16, w5, w16, lsl #16
	strb	w10, [x22, #11]
	orr	w10, w11, w13, lsl #16
	strb	w8, [x22, #13]
	lsr	w8, w9, #16
	ldr	w13, [sp, #48]                  // 4-byte Folded Reload
	orr	w12, w16, w12, lsl #24
	strb	w9, [x22, #12]
	lsr	w9, w9, #24
	strb	w8, [x22, #14]
	orr	w10, w10, w14, lsl #24
	eor	w11, w12, w20
	orr	w12, w17, w15, lsl #8
	strb	w9, [x22, #15]
	lsr	w8, w11, #8
	eor	w9, w10, w19
	strb	w11, [x22, #16]
	orr	w10, w12, w18, lsl #16
	orr	w12, w2, w0, lsl #8
	strb	w9, [x22, #20]
	strb	w8, [x22, #17]
	lsr	w8, w11, #16
	lsr	w11, w11, #24
	orr	w10, w10, w4, lsl #24
	ldr	x4, [sp, #224]                  // 8-byte Folded Reload
	strb	w8, [x22, #18]
	lsr	w8, w9, #8
	strb	w11, [x22, #19]
	orr	w11, w12, w3, lsl #16
	eor	w10, w10, w7
	strb	w8, [x22, #21]
	lsr	w8, w9, #16
	lsr	w9, w9, #24
	orr	w11, w11, w6, lsl #24
	orr	w12, w25, w24, lsl #8
	strb	w10, [x22, #24]
	strb	w8, [x22, #22]
	lsr	w8, w10, #8
	strb	w9, [x22, #23]
	eor	w9, w11, w26
	orr	w11, w12, w27, lsl #16
	strb	w8, [x22, #25]
	lsr	w8, w10, #16
	lsr	w10, w10, #24
	ldr	w12, [sp, #40]                  // 4-byte Folded Reload
	orr	w11, w11, w13, lsl #24
	strb	w9, [x22, #28]
	strb	w10, [x22, #27]
	ldr	w10, [sp, #44]                  // 4-byte Folded Reload
	orr	w12, w12, w28, lsl #8
	strb	w8, [x22, #26]
	lsr	w8, w9, #8
	ldp	w27, w26, [sp, #232]            // 8-byte Folded Reload
	orr	w10, w12, w10, lsl #16
	ldr	w12, [sp, #204]                 // 4-byte Folded Reload
	strb	w8, [x22, #29]
	lsr	w8, w9, #16
	lsr	w9, w9, #24
	eor	w11, w11, w12
	adds	w26, w26, #1
	ldp	w12, w13, [sp, #52]             // 8-byte Folded Reload
	strb	w9, [x22, #31]
	ldr	w9, [sp, #84]                   // 4-byte Folded Reload
	cinc	w27, w27, hs
	strb	w8, [x22, #30]
	lsr	w8, w11, #8
	orr	w10, w10, w12, lsl #24
	ldr	w12, [sp, #60]                  // 4-byte Folded Reload
	strb	w11, [x22, #32]
	strb	w8, [x22, #33]
	lsr	w8, w11, #16
	lsr	w11, w11, #24
	orr	w12, w12, w13, lsl #8
	eor	w9, w10, w9
	ldp	w10, w13, [sp, #64]             // 8-byte Folded Reload
	strb	w11, [x22, #35]
	ldr	w11, [sp, #76]                  // 4-byte Folded Reload
	strb	w8, [x22, #34]
	lsr	w8, w9, #8
	orr	w10, w12, w10, lsl #16
	ldr	w12, [sp, #72]                  // 4-byte Folded Reload
	strb	w9, [x22, #36]
	strb	w8, [x22, #37]
	lsr	w8, w9, #16
	lsr	w9, w9, #24
	orr	w12, w12, w13, lsl #8
	ldr	w13, [sp, #80]                  // 4-byte Folded Reload
	strb	w9, [x22, #39]
	ldr	w9, [sp, #208]                  // 4-byte Folded Reload
	orr	w10, w10, w13, lsl #24
	orr	w11, w12, w11, lsl #16
	ldr	w12, [sp, #136]                 // 4-byte Folded Reload
	strb	w8, [x22, #38]
	eor	w10, w10, w12
	ldp	w12, w13, [sp, #88]             // 8-byte Folded Reload
	lsr	w8, w10, #8
	strb	w10, [x22, #40]
	orr	w11, w11, w12, lsl #24
	ldr	w12, [sp, #96]                  // 4-byte Folded Reload
	strb	w8, [x22, #41]
	lsr	w8, w10, #16
	lsr	w10, w10, #24
	orr	w12, w12, w13, lsl #8
	eor	w9, w11, w9
	ldr	w11, [sp, #100]                 // 4-byte Folded Reload
	strb	w10, [x22, #43]
	ldr	w10, [sp, #120]                 // 4-byte Folded Reload
	orr	w11, w12, w11, lsl #16
	strb	w8, [x22, #42]
	lsr	w8, w9, #8
	ldp	w12, w13, [sp, #112]            // 8-byte Folded Reload
	strb	w8, [x22, #45]
	lsr	w8, w9, #16
	strb	w9, [x22, #44]
	lsr	w9, w9, #24
	orr	w11, w11, w13, lsl #24
	orr	w10, w10, w12, lsl #8
	ldr	w12, [sp, #200]                 // 4-byte Folded Reload
	strb	w8, [x22, #46]
	ldr	w8, [sp, #140]                  // 4-byte Folded Reload
	eor	w11, w11, w12
	ldr	w12, [sp, #144]                 // 4-byte Folded Reload
	strb	w9, [x22, #47]
	lsr	w9, w11, #8
	strb	w11, [x22, #48]
	orr	w10, w10, w12, lsl #16
	ldr	w12, [sp, #132]                 // 4-byte Folded Reload
	strb	w9, [x22, #49]
	lsr	w9, w11, #24
	orr	w8, w8, w12, lsl #8
	ldp	w12, w13, [sp, #168]            // 8-byte Folded Reload
	strb	w9, [x22, #51]
	orr	w10, w10, w12, lsl #24
	lsr	w12, w11, #16
	ldr	w11, [sp, #212]                 // 4-byte Folded Reload
	orr	w8, w8, w13, lsl #16
	eor	w10, w10, w11
	strb	w12, [x22, #50]
	ldp	w11, w12, [sp, #180]            // 8-byte Folded Reload
	lsr	w9, w10, #8
	strb	w10, [x22, #52]
	orr	w8, w8, w11, lsl #24
	ldr	w11, [sp, #188]                 // 4-byte Folded Reload
	strb	w9, [x22, #53]
	lsr	w9, w10, #24
	orr	w11, w11, w12, lsl #8
	lsr	w12, w10, #16
	ldr	w10, [sp, #216]                 // 4-byte Folded Reload
	strb	w9, [x22, #55]
	eor	w8, w8, w10
	ldr	w10, [sp, #192]                 // 4-byte Folded Reload
	strb	w12, [x22, #54]
	lsr	w9, w8, #8
	strb	w8, [x22, #56]
	orr	w10, w11, w10, lsl #16
	ldr	w11, [sp, #196]                 // 4-byte Folded Reload
	strb	w9, [x22, #57]
	ldr	w9, [sp, #220]                  // 4-byte Folded Reload
	orr	w10, w10, w11, lsl #24
	lsr	w11, w8, #16
	lsr	w8, w8, #24
	eor	w9, w10, w9
	strb	w8, [x22, #59]
	lsr	w8, w9, #8
	strb	w9, [x22, #60]
	lsr	w10, w9, #16
	lsr	w9, w9, #24
	strb	w11, [x22, #58]
	strb	w8, [x22, #61]
	subs	x8, x4, #64
	strb	w10, [x22, #62]
	strb	w9, [x22, #63]
	b.ls	.LBB4_29
// %bb.28:
	ldr	x25, [sp, #32]                  // 8-byte Folded Reload
	ldr	w30, [sp, #28]                  // 4-byte Folded Reload
	add	x2, x22, #64
	add	x1, x1, #64
	mov	x28, x8
	sub	x4, x29, #144
	cmp	x28, #63
	b.hi	.LBB4_12
	b	.LBB4_8
.LBB4_29:
	sub	w8, w4, #1
	ldr	x25, [sp, #32]                  // 8-byte Folded Reload
	ldr	x5, [sp, #16]                   // 8-byte Folded Reload
	cmp	w8, #62
	b.hi	.LBB4_43
// %bb.30:
	ldr	x9, [sp]                        // 8-byte Folded Reload
	subs	x8, x9, #64
	csel	x8, xzr, x8, lo
	add	w8, w8, #63
	and	x8, x8, #0x1c0
	sub	x12, x9, x8
	mov	x8, xzr
	cmp	x12, #1
	csinc	x13, x12, xzr, hi
	cmp	x12, #8
	b.lo	.LBB4_42
// %bb.31:
	sub	x9, x5, x22
	cmp	x9, #32
	b.lo	.LBB4_42
// %bb.32:
	cmp	x12, #32
	b.hs	.LBB4_35
// %bb.33:
	mov	x8, xzr
	b	.LBB4_39
.LBB4_34:
	mov	w8, wzr
	b	.LBB4_44
.LBB4_35:
	and	x8, x13, #0xffffffffffffffe0
	add	x15, x5, #16
	add	x14, x22, #16
	mov	x16, x8
.LBB4_36:                               // =>This Inner Loop Header: Depth=1
	mov	x9, x14
	ldurb	w1, [x14, #-15]
	ldurb	w2, [x14, #-11]
	ldrb	w10, [x9, #-16]!
	mov	x17, x9
	ldrb	w11, [x9, #2]
	ldrb	w18, [x17, #4]!
	ldrb	w0, [x17, #2]
	ldrb	w3, [x9, #3]
	ldrb	w17, [x17, #3]
	lsl	x11, x11, #16
	orr	x10, x10, x1, lsl #8
	orr	w18, w18, w2, lsl #8
	lsl	w0, w0, #16
	subs	x16, x16, #32
	orr	x11, x11, x3, lsl #24
	orr	w17, w0, w17, lsl #24
	orr	x10, x11, x10
	orr	w11, w17, w18
	orr	x10, x10, x11, lsl #32
	str	x10, [sp, #416]
	mov	x10, x9
	ldrb	w11, [x10, #8]!
	ldrb	w17, [x10, #3]
	ldrb	w18, [x10, #2]
	ldrb	w0, [x10, #4]!
	ldrb	w1, [x10, #2]
	ldrb	w2, [x9, #9]
	ldrb	w9, [x9, #13]
	ldrb	w10, [x10, #3]
	lsl	x18, x18, #16
	lsl	w1, w1, #16
	orr	x11, x11, x2, lsl #8
	orr	w9, w0, w9, lsl #8
	orr	x17, x18, x17, lsl #24
	orr	w10, w1, w10, lsl #24
	orr	x11, x17, x11
	orr	w9, w10, w9
	orr	x9, x11, x9, lsl #32
	str	x9, [sp, #424]
	mov	x9, x14
	ldrb	w11, [x14, #2]
	ldrb	w17, [x9, #4]!
	ldrb	w18, [x9, #2]
	ldrb	w10, [x14, #1]
	ldrb	w0, [x14]
	ldrb	w1, [x14, #3]
	ldrb	w2, [x14, #5]
	ldrb	w9, [x9, #3]
	lsl	x11, x11, #16
	lsl	w18, w18, #16
	orr	x10, x0, x10, lsl #8
	orr	w17, w17, w2, lsl #8
	orr	x11, x11, x1, lsl #24
	orr	w9, w18, w9, lsl #24
	orr	x10, x11, x10
	orr	w9, w9, w17
	orr	x9, x10, x9, lsl #32
	mov	x10, x14
	str	x9, [sp, #400]
	ldrb	w9, [x10, #8]!
	ldrb	w11, [x10, #3]
	ldrb	w17, [x10, #2]
	ldrb	w18, [x10, #4]!
	ldrb	w0, [x10, #2]
	ldrb	w1, [x14, #9]
	ldrb	w2, [x14, #13]
	ldrb	w10, [x10, #3]
	lsl	x17, x17, #16
	add	x14, x14, #32
	lsl	w0, w0, #16
	orr	x9, x9, x1, lsl #8
	orr	w18, w18, w2, lsl #8
	orr	x11, x17, x11, lsl #24
	orr	w10, w0, w10, lsl #24
	orr	x9, x11, x9
	orr	w10, w10, w18
	orr	x9, x9, x10, lsl #32
	mov	x10, x15
	str	x9, [sp, #408]
	ldp	q0, q1, [sp, #400]
	str	q1, [sp, #448]
	ldr	x9, [sp, #448]
	lsr	x11, x9, #40
	strb	w9, [x10, #-16]!
	lsr	x17, x9, #24
	ldr	x18, [sp, #456]
	sturb	w11, [x15, #-11]
	lsr	x11, x9, #16
	strb	w17, [x10, #3]
	lsr	x17, x9, #8
	strb	w11, [x10, #2]
	lsr	x11, x18, #40
	sturb	w17, [x15, #-15]
	lsr	x17, x18, #8
	strb	w11, [x10, #13]
	lsr	x11, x9, #32
	strb	w17, [x10, #9]
	mov	x17, x10
	strb	w11, [x10, #4]!
	lsr	x11, x9, #56
	lsr	x9, x9, #48
	strb	w18, [x17, #8]!
	strb	w11, [x10, #3]
	lsr	x11, x18, #24
	strb	w9, [x10, #2]
	lsr	x9, x18, #16
	lsr	x10, x18, #32
	strb	w11, [x17, #3]
	lsr	x11, x18, #56
	strb	w9, [x17, #2]
	lsr	x9, x18, #48
	strb	w10, [x17, #4]!
	strb	w11, [x17, #3]
	strb	w9, [x17, #2]
	str	q0, [sp, #432]
	ldr	x9, [sp, #432]
	lsr	x10, x9, #40
	strb	w9, [x15]
	lsr	x17, x9, #16
	ldr	x18, [sp, #440]
	lsr	x11, x9, #24
	strb	w10, [x15, #5]
	lsr	x10, x9, #8
	strb	w17, [x15, #2]
	lsr	x17, x18, #24
	strb	w10, [x15, #1]
	lsr	x10, x18, #40
	strb	w11, [x15, #3]
	mov	x11, x15
	strb	w10, [x15, #13]
	lsr	x10, x18, #16
	strb	w18, [x11, #8]!
	strb	w17, [x11, #3]
	lsr	x17, x18, #32
	strb	w10, [x11, #2]
	lsr	x10, x18, #56
	strb	w17, [x11, #4]!
	lsr	x17, x18, #48
	lsr	x18, x18, #8
	strb	w10, [x11, #3]
	lsr	x10, x9, #32
	strb	w17, [x11, #2]
	lsr	x17, x9, #56
	lsr	x9, x9, #48
	add	x11, x15, #32
	strb	w18, [x15, #9]
	strb	w10, [x15, #4]!
	strb	w17, [x15, #3]
	strb	w9, [x15, #2]
	mov	x15, x11
	b.ne	.LBB4_36
// %bb.37:
	cmp	x12, x8
	b.eq	.LBB4_43
// %bb.38:
	tst	x13, #0x18
	b.eq	.LBB4_42
.LBB4_39:
	mov	x10, x8
	and	x8, x13, #0xfffffffffffffff8
	sub	x9, x10, x8
	add	x11, x5, x10
	add	x10, x22, x10
.LBB4_40:                               // =>This Inner Loop Header: Depth=1
	mov	x13, x10
	ldrb	w16, [x10, #3]
	ldrb	w17, [x10, #2]
	ldrb	w14, [x13, #4]!
	ldrb	w0, [x10, #1]
	ldrb	w15, [x13, #2]!
	ldurb	w18, [x13, #-1]
	ldrb	w13, [x13, #1]
	ldrb	w1, [x10], #8
	lsl	w15, w15, #16
	orr	w14, w14, w18, lsl #8
	strb	w17, [x11, #2]
	strb	w16, [x11, #3]
	add	x16, x11, #8
	adds	x9, x9, #8
	orr	w15, w15, w13, lsl #24
	strb	w1, [x11]
	strb	w0, [x11, #1]
	orr	w14, w15, w14
	strb	w18, [x11, #5]
	lsr	x15, x14, #16
	strb	w14, [x11, #4]!
	strb	w13, [x11, #3]
	strb	w15, [x11, #2]
	mov	x11, x16
	b.ne	.LBB4_40
// %bb.41:
	cmp	x12, x8
	b.eq	.LBB4_43
.LBB4_42:                               // =>This Inner Loop Header: Depth=1
	ldrb	w9, [x22, x8]
	strb	w9, [x5, x8]
	add	x8, x8, #1
	cmp	x8, x4
	b.lo	.LBB4_42
.LBB4_43:
	mov	w8, #64                         // =0x40
	stp	w26, w27, [x25, #48]
	sub	w8, w8, w4
.LBB4_44:
	strb	w8, [x25, #128]
.LBB4_45:
	adrp	x8, __guard_local
	ldr	x8, [x8, :lo12:__guard_local]
	ldur	x9, [x29, #-80]
	cmp	x8, x9
	b.ne	.LBB4_47
// %bb.46:
	add	sp, sp, #1120
	ldp	x20, x19, [sp, #144]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]            // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]             // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	ldp	d9, d8, [sp, #48]               // 16-byte Folded Reload
	ldp	d11, d10, [sp, #32]             // 16-byte Folded Reload
	ldp	d13, d12, [sp, #16]             // 16-byte Folded Reload
	ldp	d15, d14, [sp], #160            // 16-byte Folded Reload
	hint	#29
	ret
.LBB4_47:
	adrp	x0, .LSSH
	add	x0, x0, :lo12:.LSSH
	bl	__stack_smash_handler
.Lfunc_end4:
	.size	chacha_encrypt_bytes, .Lfunc_end4-chacha_encrypt_bytes
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function CRYPTO_chacha_20
.LCPI5_0:
	.word	1634760805                      // 0x61707865
	.word	857760878                       // 0x3320646e
	.word	2036477234                      // 0x79622d32
	.word	1797285236                      // 0x6b206574
	.text
	.globl	CRYPTO_chacha_20
	.p2align	2
	.type	CRYPTO_chacha_20,@function
CRYPTO_chacha_20:                       // @CRYPTO_chacha_20
// %bb.0:
	hint	#25
	sub	sp, sp, #208
	adrp	x8, __guard_local
	stp	x29, x30, [sp, #144]            // 16-byte Folded Spill
	add	x29, sp, #144
	ldr	x8, [x8, :lo12:__guard_local]
	stp	x24, x23, [sp, #160]            // 16-byte Folded Spill
	adrp	x23, __guard_local
	stp	x22, x21, [sp, #176]            // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #192]            // 16-byte Folded Spill
	mov	x19, x2
	mov	x20, x1
	ldr	xzr, [x23, :lo12:__guard_local]
	stur	x8, [x29, #-8]
	ldrb	w8, [x3]
	ldrb	w9, [x3, #1]
	ldrb	w11, [x3, #4]
	ldrb	w12, [x3, #5]
	ldrb	w13, [x3, #8]
	ldrb	w14, [x3, #9]
	ldrb	w15, [x3, #12]
	orr	w8, w8, w9, lsl #8
	ldrb	w9, [x3, #13]
	ldrb	w10, [x3, #2]
	orr	w11, w11, w12, lsl #8
	orr	w13, w13, w14, lsl #8
	ldrb	w14, [x3, #6]
	orr	w9, w15, w9, lsl #8
	ldrb	w15, [x3, #10]
	ldrb	w12, [x3, #3]
	orr	w8, w8, w10, lsl #16
	ldrb	w10, [x3, #7]
	orr	w11, w11, w14, lsl #16
	orr	w13, w13, w15, lsl #16
	ldrb	w15, [x3, #14]
	ldrb	w14, [x3, #11]
	orr	w8, w8, w12, lsl #24
	ldrb	w12, [x3, #15]
	orr	w10, w11, w10, lsl #24
	ldrb	w11, [x3, #16]
	orr	w9, w9, w15, lsl #16
	ldrb	w15, [x3, #17]
	stp	wzr, wzr, [sp, #48]
	stp	w8, w10, [sp, #16]
	orr	w8, w13, w14, lsl #24
	orr	w9, w9, w12, lsl #24
	orr	w10, w11, w15, lsl #8
	ldrb	w11, [x3, #18]
	ldrb	w12, [x3, #20]
	ldrb	w13, [x3, #21]
	stp	w8, w9, [sp, #24]
	ldrb	w14, [x3, #29]
	orr	w8, w10, w11, lsl #16
	ldrb	w10, [x3, #22]
	ldrb	w11, [x3, #19]
	orr	w9, w12, w13, lsl #8
	ldrb	w12, [x3, #24]
	ldrb	w13, [x3, #25]
	ldrb	w15, [x3, #23]
	orr	w8, w8, w11, lsl #24
	ldrb	w11, [x3, #30]
	orr	w9, w9, w10, lsl #16
	ldrb	w10, [x3, #28]
	orr	w12, w12, w13, lsl #8
	ldrb	w13, [x3, #26]
	orr	w10, w10, w14, lsl #8
	orr	w9, w9, w15, lsl #24
	ldrb	w14, [x4, #5]
	orr	w12, w12, w13, lsl #16
	ldrb	w13, [x3, #27]
	orr	w10, w10, w11, lsl #16
	ldrb	w11, [x3, #31]
	stp	w8, w9, [sp, #32]
	orr	w8, w12, w13, lsl #24
	ldrb	w13, [x4, #4]
	adrp	x12, .LCPI5_0
	orr	w9, w10, w11, lsl #24
	ldrb	w10, [x4]
	ldrb	w11, [x4, #1]
	ldr	q0, [x12, :lo12:.LCPI5_0]
	orr	w12, w13, w14, lsl #8
	ldrb	w13, [x4, #6]
	orr	w10, w10, w11, lsl #8
	ldrb	w11, [x4, #2]
	stp	w8, w9, [sp, #40]
	ldrb	w9, [x4, #3]
	str	q0, [sp]
	orr	w8, w10, w11, lsl #16
	orr	w10, w12, w13, lsl #16
	ldrb	w11, [x4, #7]
	orr	w8, w8, w9, lsl #24
	orr	w9, w10, w11, lsl #24
	stp	w8, w9, [sp, #56]
	cbz	x5, .LBB5_2
// %bb.1:
	str	x5, [sp, #48]
.LBB5_2:
	cbz	x19, .LBB5_5
// %bb.3:
	mov	w24, #-1                        // =0xffffffff
.LBB5_4:                                // =>This Inner Loop Header: Depth=1
	cmp	x19, x24
	mov	x0, sp
	mov	x1, x20
	csel	x22, x19, x24, lo
	mov	x2, x21
	mov	w3, w22
	bl	chacha_encrypt_bytes
	subs	x19, x19, x22
	add	x20, x20, x22
	add	x21, x21, x22
	b.ne	.LBB5_4
.LBB5_5:
	ldr	x8, [x23, :lo12:__guard_local]
	ldur	x9, [x29, #-8]
	cmp	x8, x9
	b.ne	.LBB5_7
// %bb.6:
	ldp	x20, x19, [sp, #192]            // 16-byte Folded Reload
	ldp	x22, x21, [sp, #176]            // 16-byte Folded Reload
	ldp	x24, x23, [sp, #160]            // 16-byte Folded Reload
	ldp	x29, x30, [sp, #144]            // 16-byte Folded Reload
	add	sp, sp, #208
	hint	#29
	ret
.LBB5_7:
	adrp	x0, .LSSH.1
	add	x0, x0, :lo12:.LSSH.1
	bl	__stack_smash_handler
.Lfunc_end5:
	.size	CRYPTO_chacha_20, .Lfunc_end5-CRYPTO_chacha_20
                                        // -- End function
	.globl	CRYPTO_xchacha_20               // -- Begin function CRYPTO_xchacha_20
	.p2align	2
	.type	CRYPTO_xchacha_20,@function
CRYPTO_xchacha_20:                      // @CRYPTO_xchacha_20
// %bb.0:
	hint	#25
	sub	sp, sp, #112
	adrp	x8, __guard_local
	stp	x29, x30, [sp, #48]             // 16-byte Folded Spill
	add	x29, sp, #48
	str	x23, [sp, #64]                  // 8-byte Folded Spill
	ldr	x8, [x8, :lo12:__guard_local]
	adrp	x23, __guard_local
	stp	x22, x21, [sp, #80]             // 16-byte Folded Spill
	mov	x21, x1
	mov	x22, x0
	stp	x20, x19, [sp, #96]             // 16-byte Folded Spill
	mov	x20, x2
	add	x0, sp, #8
	ldr	xzr, [x23, :lo12:__guard_local]
	mov	x1, x3
	mov	x2, x4
	mov	x19, x4
	stur	x8, [x29, #-8]
	bl	CRYPTO_hchacha_20
	add	x3, sp, #8
	add	x4, x19, #16
	mov	x0, x22
	mov	x1, x21
	mov	x2, x20
	mov	x5, xzr
	bl	CRYPTO_chacha_20
	ldr	x8, [x23, :lo12:__guard_local]
	ldur	x9, [x29, #-8]
	cmp	x8, x9
	b.ne	.LBB6_2
// %bb.1:
	ldp	x20, x19, [sp, #96]             // 16-byte Folded Reload
	ldr	x23, [sp, #64]                  // 8-byte Folded Reload
	ldp	x22, x21, [sp, #80]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]             // 16-byte Folded Reload
	add	sp, sp, #112
	hint	#29
	ret
.LBB6_2:
	adrp	x0, .LSSH.2
	add	x0, x0, :lo12:.LSSH.2
	bl	__stack_smash_handler
.Lfunc_end6:
	.size	CRYPTO_xchacha_20, .Lfunc_end6-CRYPTO_xchacha_20
                                        // -- End function
	.hidden	__guard_local
	.type	.LSSH,@object                   // @SSH
	.section	.rodata.str1.4,"aMS",@progbits,1
	.p2align	2, 0x0
.LSSH:
	.asciz	"chacha_encrypt_bytes"
	.size	.LSSH, 21

	.type	.LSSH.1,@object                 // @SSH.1
	.p2align	2, 0x0
.LSSH.1:
	.asciz	"CRYPTO_chacha_20"
	.size	.LSSH.1, 17

	.type	.LSSH.2,@object                 // @SSH.2
	.p2align	2, 0x0
.LSSH.2:
	.asciz	"CRYPTO_xchacha_20"
	.size	.LSSH.2, 18

	.ident	"Apple clang version 21.0.0 (clang-2100.3.25.1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __stack_smash_handler
	.addrsig_sym __guard_local
