	.build_version macos, 27, 0	sdk_version 27, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_CRYPTO_hchacha_20              ; -- Begin function CRYPTO_hchacha_20
	.p2align	2
_CRYPTO_hchacha_20:                     ; @CRYPTO_hchacha_20
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	ldp	w19, w11, [x1]
	ldp	w15, w16, [x1, #8]
	ldp	w6, w7, [x1, #16]
	ldp	w10, w12, [x1, #24]
	ldp	w14, w13, [x2]
	mov	w17, #25972                     ; =0x6574
	movk	w17, #27424, lsl #16
	mov	w3, #11570                      ; =0x2d32
	movk	w3, #31074, lsl #16
	mov	w4, #25710                      ; =0x646e
	movk	w4, #13088, lsl #16
	mov	w5, #30821                      ; =0x7865
	movk	w5, #24944, lsl #16
	mov	w9, #22                         ; =0x16
	ldp	w1, w8, [x2, #8]
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	add	w2, w5, w19
	eor	w14, w2, w14
	ror	w14, w14, #16
	add	w5, w14, w6
	eor	w6, w5, w19
	ror	w19, w6, #20
	add	w20, w19, w2
	eor	w14, w20, w14
	ror	w14, w14, #24
	add	w6, w14, w5
	eor	w2, w6, w19
	ror	w2, w2, #25
	add	w4, w4, w11
	eor	w13, w4, w13
	ror	w13, w13, #16
	add	w5, w13, w7
	eor	w11, w5, w11
	ror	w11, w11, #20
	add	w4, w11, w4
	eor	w13, w4, w13
	ror	w13, w13, #24
	add	w7, w13, w5
	eor	w11, w7, w11
	ror	w11, w11, #25
	add	w3, w3, w15
	eor	w1, w3, w1
	ror	w1, w1, #16
	add	w10, w1, w10
	eor	w15, w10, w15
	ror	w15, w15, #20
	add	w3, w15, w3
	eor	w1, w3, w1
	ror	w1, w1, #24
	add	w10, w1, w10
	eor	w15, w10, w15
	ror	w15, w15, #25
	add	w17, w17, w16
	eor	w8, w17, w8
	ror	w8, w8, #16
	add	w12, w8, w12
	eor	w16, w12, w16
	ror	w16, w16, #20
	add	w17, w16, w17
	eor	w8, w17, w8
	ror	w8, w8, #24
	add	w12, w8, w12
	eor	w16, w12, w16
	ror	w16, w16, #25
	add	w5, w11, w20
	eor	w8, w5, w8
	ror	w8, w8, #16
	add	w10, w8, w10
	eor	w11, w10, w11
	ror	w11, w11, #20
	add	w5, w11, w5
	eor	w8, w5, w8
	ror	w8, w8, #24
	add	w10, w8, w10
	eor	w11, w10, w11
	ror	w11, w11, #25
	add	w4, w15, w4
	eor	w14, w4, w14
	ror	w14, w14, #16
	add	w12, w14, w12
	eor	w15, w12, w15
	ror	w15, w15, #20
	add	w4, w15, w4
	eor	w14, w4, w14
	ror	w14, w14, #24
	add	w12, w14, w12
	eor	w15, w12, w15
	ror	w15, w15, #25
	add	w3, w16, w3
	eor	w13, w3, w13
	ror	w13, w13, #16
	add	w6, w13, w6
	eor	w16, w6, w16
	ror	w16, w16, #20
	add	w3, w16, w3
	eor	w13, w3, w13
	ror	w13, w13, #24
	add	w6, w13, w6
	eor	w16, w6, w16
	ror	w16, w16, #25
	add	w17, w2, w17
	eor	w1, w17, w1
	ror	w1, w1, #16
	add	w7, w1, w7
	eor	w2, w7, w2
	ror	w2, w2, #20
	add	w17, w2, w17
	eor	w1, w17, w1
	ror	w1, w1, #24
	add	w7, w1, w7
	eor	w2, w7, w2
	ror	w19, w2, #25
	sub	w9, w9, #2
	cmp	w9, #2
	b.hi	LBB0_1
; %bb.2:
	strb	w5, [x0]
	lsr	w9, w5, #8
	strb	w9, [x0, #1]
	lsr	w9, w5, #16
	strb	w9, [x0, #2]
	lsr	w9, w5, #24
	strb	w9, [x0, #3]
	strb	w4, [x0, #4]
	lsr	w9, w4, #8
	strb	w9, [x0, #5]
	lsr	w9, w4, #16
	strb	w9, [x0, #6]
	lsr	w9, w4, #24
	strb	w9, [x0, #7]
	strb	w3, [x0, #8]
	lsr	w9, w3, #8
	strb	w9, [x0, #9]
	lsr	w9, w3, #16
	strb	w9, [x0, #10]
	lsr	w9, w3, #24
	strb	w9, [x0, #11]
	strb	w17, [x0, #12]
	lsr	w9, w17, #8
	strb	w9, [x0, #13]
	lsr	w9, w17, #16
	strb	w9, [x0, #14]
	lsr	w9, w17, #24
	strb	w9, [x0, #15]
	strb	w14, [x0, #16]
	lsr	w9, w14, #8
	strb	w9, [x0, #17]
	lsr	w9, w14, #16
	strb	w9, [x0, #18]
	lsr	w9, w14, #24
	strb	w9, [x0, #19]
	strb	w13, [x0, #20]
	lsr	w9, w13, #8
	strb	w9, [x0, #21]
	lsr	w9, w13, #16
	strb	w9, [x0, #22]
	lsr	w9, w13, #24
	strb	w9, [x0, #23]
	strb	w1, [x0, #24]
	lsr	w9, w1, #8
	strb	w9, [x0, #25]
	lsr	w9, w1, #16
	strb	w9, [x0, #26]
	lsr	w9, w1, #24
	strb	w9, [x0, #27]
	strb	w8, [x0, #28]
	lsr	w9, w8, #8
	strb	w9, [x0, #29]
	lsr	w9, w8, #16
	strb	w9, [x0, #30]
	lsr	w8, w8, #24
	strb	w8, [x0, #31]
	ldp	x20, x19, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0                          ; -- Begin function ChaCha_set_key
lCPI1_0:
	.long	824206446                       ; 0x3120646e
	.long	2036477238                      ; 0x79622d36
lCPI1_1:
	.long	857760878                       ; 0x3320646e
	.long	2036477234                      ; 0x79622d32
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_ChaCha_set_key
	.p2align	2
_ChaCha_set_key:                        ; @ChaCha_set_key
	.cfi_startproc
; %bb.0:
	ldr	w8, [x1]
	str	w8, [x0, #16]
	ldr	w8, [x1, #4]
	str	w8, [x0, #20]
	ldr	w8, [x1, #8]
	str	w8, [x0, #24]
	ldr	w8, [x1, #12]
	str	w8, [x0, #28]
	cmp	w2, #256
	cset	w8, eq
	mov	w9, #16                         ; =0x10
	csel	x9, x9, xzr, eq
	add	x9, x1, x9
	ldr	w10, [x9]
	str	w10, [x0, #32]
	ldr	w10, [x9, #4]
	str	w10, [x0, #36]
	ldr	w10, [x9, #8]
	str	w10, [x0, #40]
	ldr	w9, [x9, #12]
	str	w9, [x0, #44]
	mov	w9, #30821                      ; =0x7865
	movk	w9, #24944, lsl #16
	dup.2s	v0, w8
	str	w9, [x0]
	shl.2s	v0, v0, #31
	cmlt.2s	v0, v0, #0
Lloh0:
	adrp	x8, lCPI1_0@PAGE
Lloh1:
	ldr	d1, [x8, lCPI1_0@PAGEOFF]
Lloh2:
	adrp	x8, lCPI1_1@PAGE
Lloh3:
	ldr	d2, [x8, lCPI1_1@PAGEOFF]
	bsl.8b	v0, v2, v1
	stur	d0, [x0, #4]
	mov	w8, #25972                      ; =0x6574
	movk	w8, #27424, lsl #16
	str	w8, [x0, #12]
	strb	wzr, [x0, #128]
	ret
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpAdrp	Lloh0, Lloh2
	.loh AdrpLdr	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_ChaCha_set_iv                  ; -- Begin function ChaCha_set_iv
	.p2align	2
_ChaCha_set_iv:                         ; @ChaCha_set_iv
	.cfi_startproc
; %bb.0:
	cbz	x2, LBB2_2
; %bb.1:
	ldr	w8, [x2]
	str	w8, [x0, #48]
	ldr	w8, [x2, #4]
	b	LBB2_3
LBB2_2:
	mov	w8, #0                          ; =0x0
	str	wzr, [x0, #48]
LBB2_3:
	str	w8, [x0, #52]
	ldr	w8, [x1]
	str	w8, [x0, #56]
	ldr	w8, [x1, #4]
	str	w8, [x0, #60]
	strb	wzr, [x0, #128]
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_ChaCha                         ; -- Begin function ChaCha
	.p2align	2
_ChaCha:                                ; @ChaCha
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x3
	mov	x22, x2
	mov	x21, x1
	mov	x20, x0
	mov	x8, x0
	ldrb	w14, [x8, #128]!
	cbz	x14, LBB3_8
; %bb.1:
	cmp	x19, x14
	csel	x9, x19, x14, lo
	cbz	x19, LBB3_7
; %bb.2:
	sub	x10, x8, x14
	sub	w11, w9, #1
	cmp	w11, #63
	b.hs	LBB3_12
; %bb.3:
	mov	w12, #0                         ; =0x0
LBB3_4:
	sub	w12, w9, w12
	mov	x11, x21
	mov	x13, x22
LBB3_5:                                 ; =>This Inner Loop Header: Depth=1
	ldrb	w14, [x13], #1
	ldrb	w15, [x10], #1
	eor	w14, w15, w14
	strb	w14, [x11], #1
	subs	w12, w12, #1
	b.ne	LBB3_5
LBB3_6:
	ldrb	w14, [x8]
	mov	x22, x13
	mov	x21, x11
LBB3_7:
	sub	w10, w14, w9
	strb	w10, [x8]
	sub	x19, x19, x9
LBB3_8:
	cbz	x19, LBB3_11
; %bb.9:
	mov	w24, #-1                        ; =0xffffffff
LBB3_10:                                ; =>This Inner Loop Header: Depth=1
	cmp	x19, x24
	csel	x23, x19, x24, lo
	mov	x0, x20
	mov	x1, x22
	mov	x2, x21
	mov	x3, x23
	bl	_chacha_encrypt_bytes
	add	x22, x22, x23
	add	x21, x21, x23
	subs	x19, x19, x23
	b.ne	LBB3_10
LBB3_11:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB3_12:
	mov	w12, #0                         ; =0x0
	sub	x13, x21, x22
	cmp	x13, #64
	b.lo	LBB3_4
; %bb.13:
	add	x13, x21, x14
	sub	x13, x13, x20
	sub	x13, x13, #128
	cmp	x13, #64
	b.lo	LBB3_4
; %bb.14:
	add	x14, x11, #1
	and	x12, x14, #0x1ffffffc0
	add	x11, x21, x12
	add	x13, x22, x12
	ldp	q0, q1, [x22]
	ldp	q2, q3, [x22, #32]
	ldp	q4, q5, [x10]
	ldp	q6, q7, [x10, #32]
	eor.16b	v0, v4, v0
	eor.16b	v1, v5, v1
	eor.16b	v2, v6, v2
	eor.16b	v3, v7, v3
	stp	q0, q1, [x21]
	stp	q2, q3, [x21, #32]
	cmp	x12, #64
	b.eq	LBB3_17
; %bb.15:
	ldp	q0, q1, [x22, #64]
	ldp	q2, q3, [x22, #96]
	ldp	q4, q5, [x10, #64]
	ldp	q6, q7, [x10, #96]
	eor.16b	v0, v4, v0
	eor.16b	v1, v5, v1
	eor.16b	v2, v6, v2
	eor.16b	v3, v7, v3
	stp	q0, q1, [x21, #64]
	stp	q2, q3, [x21, #96]
	cmp	x12, #128
	b.eq	LBB3_17
; %bb.16:
	ldp	q0, q1, [x22, #128]
	ldp	q2, q3, [x22, #160]
	ldp	q4, q5, [x10, #128]
	ldp	q6, q7, [x10, #160]
	eor.16b	v0, v4, v0
	eor.16b	v1, v5, v1
	eor.16b	v2, v6, v2
	eor.16b	v3, v7, v3
	stp	q0, q1, [x21, #128]
	stp	q2, q3, [x21, #160]
LBB3_17:
	cmp	x14, x12
	b.eq	LBB3_6
; %bb.18:
	add	x10, x10, x12
	mov	x21, x11
	mov	x22, x13
	b	LBB3_4
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function chacha_encrypt_bytes
lCPI4_0:
	.quad	2                               ; 0x2
	.quad	3                               ; 0x3
lCPI4_2:
	.byte	3                               ; 0x3
	.byte	0                               ; 0x0
	.byte	1                               ; 0x1
	.byte	2                               ; 0x2
	.byte	7                               ; 0x7
	.byte	4                               ; 0x4
	.byte	5                               ; 0x5
	.byte	6                               ; 0x6
	.byte	11                              ; 0xb
	.byte	8                               ; 0x8
	.byte	9                               ; 0x9
	.byte	10                              ; 0xa
	.byte	15                              ; 0xf
	.byte	12                              ; 0xc
	.byte	13                              ; 0xd
	.byte	14                              ; 0xe
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0
lCPI4_1:
	.long	2                               ; 0x2
	.long	3                               ; 0x3
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2
_chacha_encrypt_bytes:                  ; @chacha_encrypt_bytes
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #384
	stp	d15, d14, [sp, #224]            ; 16-byte Folded Spill
	stp	d13, d12, [sp, #240]            ; 16-byte Folded Spill
	stp	d11, d10, [sp, #256]            ; 16-byte Folded Spill
	stp	d9, d8, [sp, #272]              ; 16-byte Folded Spill
	stp	x28, x27, [sp, #288]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #304]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #320]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #336]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #352]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #368]            ; 16-byte Folded Spill
	add	x29, sp, #368
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -152
	.cfi_offset b15, -160
Lloh4:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh5:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh6:
	ldr	x8, [x8]
	stur	x8, [x29, #-160]
	cbz	w3, LBB4_39
; %bb.1:
	cmp	w3, #256
	b.lo	LBB4_7
; %bb.2:
	ldp	w9, w10, [x0, #48]
Lloh7:
	adrp	x8, lCPI4_0@PAGE
Lloh8:
	ldr	q0, [x8, lCPI4_0@PAGEOFF]
	str	q0, [sp, #64]                   ; 16-byte Folded Spill
Lloh9:
	adrp	x8, lCPI4_1@PAGE
Lloh10:
	ldr	d0, [x8, lCPI4_1@PAGEOFF]
	str	d0, [sp, #56]                   ; 8-byte Folded Spill
Lloh11:
	adrp	x8, lCPI4_2@PAGE
Lloh12:
	ldr	q2, [x8, lCPI4_2@PAGEOFF]
LBB4_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_4 Depth 2
	mov	w8, w9
	orr	x8, x8, x10, lsl #32
	add	x11, x8, #1
	lsr	x12, x11, #32
	dup.2d	v1, x8
	xtn.2s	v3, v1
	fmov	s0, w9
	mov.s	v0[1], w11
	ldr	d4, [sp, #56]                   ; 8-byte Folded Reload
	add.2s	v3, v3, v4
	mov.d	v0[1], v3[0]
	fmov	s6, w10
	mov.s	v6[1], w12
	mov	x9, x0
	ld1r.4s	{ v8 }, [x9], #4
	ld1r.4s	{ v10 }, [x9]
	add	x9, x0, #8
	ld1r.4s	{ v11 }, [x9]
	add	x9, x0, #12
	ld1r.4s	{ v12 }, [x9]
	add	x9, x0, #16
	ld1r.4s	{ v17 }, [x9]
	add	x9, x0, #20
	ld1r.4s	{ v18 }, [x9]
	add	x9, x0, #24
	ld1r.4s	{ v19 }, [x9]
	add	x9, x0, #28
	ld1r.4s	{ v20 }, [x9]
	add	x9, x0, #32
	ld1r.4s	{ v21 }, [x9]
	add	x9, x0, #36
	ld1r.4s	{ v23 }, [x9]
	ldr	q3, [sp, #64]                   ; 16-byte Folded Reload
	addhn2.4s	v6, v1, v3
	add	x9, x0, #40
	ld1r.4s	{ v24 }, [x9]
	add	x10, x0, #44
	add	x9, x0, #56
	ld1r.4s	{ v25 }, [x9]
	add	x9, x0, #60
	ld1r.4s	{ v22 }, [x9]
	mov	w9, #10                         ; =0xa
	mov.16b	v27, v22
	mov.16b	v14, v25
	mov.16b	v15, v6
	mov.16b	v3, v0
	stp	q10, q8, [sp, #112]             ; 32-byte Folded Spill
	mov.16b	v13, v17
	mov.16b	v1, v21
	mov.16b	v30, v18
	mov.16b	v4, v23
	stp	q12, q11, [sp, #80]             ; 32-byte Folded Spill
	mov.16b	v31, v19
	ld1r.4s	{ v26 }, [x10]
	mov.16b	v28, v24
	mov.16b	v9, v20
	mov.16b	v29, v26
LBB4_4:                                 ;   Parent Loop BB4_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add.4s	v8, v13, v8
	eor.16b	v3, v8, v3
	rev32.8h	v3, v3
	add.4s	v1, v1, v3
	eor.16b	v13, v1, v13
	shl.4s	v5, v13, #12
	sri.4s	v5, v13, #20
	add.4s	v8, v5, v8
	eor.16b	v3, v8, v3
	tbl.16b	v3, { v3 }, v2
	add.4s	v1, v1, v3
	eor.16b	v5, v1, v5
	shl.4s	v13, v5, #7
	sri.4s	v13, v5, #25
	add.4s	v5, v30, v10
	eor.16b	v10, v5, v15
	rev32.8h	v10, v10
	add.4s	v4, v4, v10
	eor.16b	v30, v4, v30
	shl.4s	v7, v30, #12
	sri.4s	v7, v30, #20
	add.4s	v5, v7, v5
	eor.16b	v30, v5, v10
	tbl.16b	v15, { v30 }, v2
	add.4s	v4, v4, v15
	eor.16b	v7, v4, v7
	shl.4s	v30, v7, #7
	sri.4s	v30, v7, #25
	add.4s	v7, v31, v11
	eor.16b	v10, v7, v14
	rev32.8h	v10, v10
	add.4s	v28, v28, v10
	eor.16b	v31, v28, v31
	shl.4s	v11, v31, #12
	sri.4s	v11, v31, #20
	add.4s	v7, v11, v7
	eor.16b	v31, v7, v10
	tbl.16b	v14, { v31 }, v2
	add.4s	v28, v28, v14
	eor.16b	v31, v28, v11
	shl.4s	v10, v31, #7
	sri.4s	v10, v31, #25
	add.4s	v31, v9, v12
	eor.16b	v27, v31, v27
	rev32.8h	v27, v27
	add.4s	v29, v29, v27
	eor.16b	v9, v29, v9
	shl.4s	v11, v9, #12
	sri.4s	v11, v9, #20
	add.4s	v12, v11, v31
	eor.16b	v27, v12, v27
	tbl.16b	v27, { v27 }, v2
	add.4s	v29, v29, v27
	eor.16b	v31, v29, v11
	shl.4s	v9, v31, #7
	sri.4s	v9, v31, #25
	add.4s	v31, v30, v8
	eor.16b	v27, v31, v27
	rev32.8h	v27, v27
	add.4s	v28, v28, v27
	eor.16b	v30, v28, v30
	shl.4s	v11, v30, #12
	sri.4s	v11, v30, #20
	add.4s	v8, v11, v31
	eor.16b	v27, v8, v27
	tbl.16b	v27, { v27 }, v2
	add.4s	v28, v28, v27
	eor.16b	v31, v28, v11
	shl.4s	v30, v31, #7
	sri.4s	v30, v31, #25
	add.4s	v5, v10, v5
	eor.16b	v3, v5, v3
	rev32.8h	v3, v3
	add.4s	v29, v29, v3
	eor.16b	v31, v29, v10
	shl.4s	v11, v31, #12
	sri.4s	v11, v31, #20
	add.4s	v10, v11, v5
	eor.16b	v3, v10, v3
	tbl.16b	v3, { v3 }, v2
	add.4s	v29, v29, v3
	eor.16b	v5, v29, v11
	shl.4s	v31, v5, #7
	sri.4s	v31, v5, #25
	add.4s	v5, v9, v7
	eor.16b	v7, v5, v15
	rev32.8h	v7, v7
	add.4s	v1, v1, v7
	eor.16b	v9, v1, v9
	shl.4s	v16, v9, #12
	sri.4s	v16, v9, #20
	add.4s	v11, v16, v5
	eor.16b	v5, v11, v7
	tbl.16b	v15, { v5 }, v2
	add.4s	v1, v1, v15
	eor.16b	v5, v1, v16
	shl.4s	v9, v5, #7
	sri.4s	v9, v5, #25
	add.4s	v5, v12, v13
	eor.16b	v7, v5, v14
	rev32.8h	v7, v7
	add.4s	v4, v4, v7
	eor.16b	v16, v4, v13
	shl.4s	v13, v16, #12
	sri.4s	v13, v16, #20
	add.4s	v12, v13, v5
	eor.16b	v5, v12, v7
	tbl.16b	v14, { v5 }, v2
	add.4s	v4, v4, v14
	eor.16b	v5, v4, v13
	shl.4s	v13, v5, #7
	sri.4s	v13, v5, #25
	subs	w9, w9, #1
	b.ne	LBB4_4
; %bb.5:                                ;   in Loop: Header=BB4_3 Depth=1
	add.4s	v25, v25, v14
	add.4s	v6, v6, v15
	add.4s	v3, v0, v3
	add.4s	v26, v29, v26
	add.4s	v24, v28, v24
	add.4s	v4, v4, v23
	add.4s	v1, v1, v21
	add.4s	v5, v9, v20
	add.4s	v7, v31, v19
	add.4s	v16, v30, v18
	add.4s	v17, v13, v17
	ldr	q0, [sp, #80]                   ; 16-byte Folded Reload
	add.4s	v18, v12, v0
	ldr	q0, [sp, #96]                   ; 16-byte Folded Reload
	add.4s	v19, v11, v0
	ldr	q0, [sp, #112]                  ; 16-byte Folded Reload
	add.4s	v20, v10, v0
	ldr	q0, [sp, #128]                  ; 16-byte Folded Reload
	add.4s	v21, v8, v0
	add.4s	v0, v22, v27
	trn1.4s	v22, v21, v20
	trn2.4s	v20, v21, v20
	trn1.4s	v21, v19, v18
	trn2.4s	v18, v19, v18
	zip2.2d	v19, v22, v21
	mov.d	v22[1], v21[0]
	zip2.2d	v21, v20, v18
	mov.d	v20[1], v18[0]
	ldr	q18, [x1]
	eor.16b	v18, v18, v22
	str	q18, [x2]
	ldr	q18, [x1, #64]
	eor.16b	v18, v18, v20
	str	q18, [x2, #64]
	ldr	q18, [x1, #128]
	eor.16b	v18, v18, v19
	str	q18, [x2, #128]
	ldr	q18, [x1, #192]
	eor.16b	v18, v18, v21
	str	q18, [x2, #192]
	trn1.4s	v18, v17, v16
	trn2.4s	v16, v17, v16
	trn1.4s	v17, v7, v5
	trn2.4s	v5, v7, v5
	zip2.2d	v7, v18, v17
	mov.d	v18[1], v17[0]
	zip2.2d	v17, v16, v5
	mov.d	v16[1], v5[0]
	ldr	q5, [x1, #16]
	eor.16b	v5, v5, v18
	str	q5, [x2, #16]
	ldr	q5, [x1, #80]
	eor.16b	v5, v5, v16
	str	q5, [x2, #80]
	ldr	q5, [x1, #144]
	eor.16b	v5, v5, v7
	str	q5, [x2, #144]
	ldr	q5, [x1, #208]
	eor.16b	v5, v5, v17
	str	q5, [x2, #208]
	trn1.4s	v5, v1, v4
	trn2.4s	v1, v1, v4
	trn1.4s	v4, v24, v26
	trn2.4s	v7, v24, v26
	zip2.2d	v16, v5, v4
	mov.d	v5[1], v4[0]
	zip2.2d	v4, v1, v7
	mov.d	v1[1], v7[0]
	ldr	q7, [x1, #32]
	eor.16b	v5, v7, v5
	str	q5, [x2, #32]
	ldr	q5, [x1, #96]
	eor.16b	v1, v5, v1
	str	q1, [x2, #96]
	ldr	q1, [x1, #160]
	eor.16b	v1, v1, v16
	str	q1, [x2, #160]
	ldr	q1, [x1, #224]
	eor.16b	v1, v1, v4
	str	q1, [x2, #224]
	trn1.4s	v1, v3, v6
	trn2.4s	v3, v3, v6
	trn1.4s	v4, v25, v0
	trn2.4s	v0, v25, v0
	zip2.2d	v5, v1, v4
	mov.d	v1[1], v4[0]
	zip2.2d	v4, v3, v0
	mov.d	v3[1], v0[0]
	ldr	q0, [x1, #48]
	eor.16b	v0, v0, v1
	str	q0, [x2, #48]
	ldr	q0, [x1, #112]
	eor.16b	v0, v0, v3
	str	q0, [x2, #112]
	ldr	q0, [x1, #176]
	eor.16b	v0, v0, v5
	str	q0, [x2, #176]
	ldr	q0, [x1, #240]
	eor.16b	v0, v0, v4
	str	q0, [x2, #240]
	add	x9, x8, #4
	lsr	x10, x9, #32
	stp	w9, w10, [x0, #48]
	add	x1, x1, #256
	add	x2, x2, #256
	sub	w3, w3, #256
                                        ; kill: def $w10 killed $w10 killed $x10 def $x10
	cmp	w3, #255
	b.hi	LBB4_3
; %bb.6:
	cbz	w3, LBB4_28
LBB4_7:
	str	xzr, [sp, #16]                  ; 8-byte Folded Spill
	ldp	w22, w24, [x0]
	ldp	w9, w8, [x0, #8]
	str	w9, [sp, #128]                  ; 4-byte Folded Spill
	str	w8, [sp, #112]                  ; 4-byte Folded Spill
	ldp	w9, w8, [x0, #16]
	str	w9, [sp, #96]                   ; 4-byte Folded Spill
	str	w8, [sp, #80]                   ; 4-byte Folded Spill
	ldp	w9, w10, [x0, #24]
	str	w9, [sp, #64]                   ; 4-byte Folded Spill
	ldp	w9, w11, [x0, #32]
	stp	w9, w10, [sp, #52]              ; 8-byte Folded Spill
	ldp	w9, w8, [x0, #40]
	stp	w9, w11, [sp, #44]              ; 8-byte Folded Spill
	str	w8, [sp, #40]                   ; 4-byte Folded Spill
	ldp	w19, w7, [x0, #48]
	mov	w10, w3
	add	x12, sp, #144
	str	x10, [sp, #8]                   ; 8-byte Folded Spill
	ldp	w9, w8, [x0, #56]
	stp	w8, w9, [sp, #32]               ; 8-byte Folded Spill
	stp	w24, w22, [sp, #24]             ; 8-byte Folded Spill
	cmp	x10, #63
	b.hi	LBB4_16
LBB4_8:
	mov	x8, #0                          ; =0x0
	cmp	x10, #8
	b.lo	LBB4_14
; %bb.9:
	sub	x9, x12, x1
	cmp	x9, #64
	b.lo	LBB4_14
; %bb.10:
	mov	x9, #0                          ; =0x0
	and	x11, x10, #0x38
	and	x8, x10, #0x38
LBB4_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x1, x9]
	str	d0, [x12, x9]
	add	x9, x9, #8
	cmp	x11, x9
	b.ne	LBB4_11
; %bb.12:
	cmp	x10, x8
	b.ne	LBB4_14
; %bb.13:
	add	x12, sp, #144
	b	LBB4_15
LBB4_14:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w9, [x1, x8]
	add	x12, sp, #144
	strb	w9, [x12, x8]
	add	x8, x8, #1
	cmp	x10, x8
	b.ne	LBB4_14
LBB4_15:
	add	x1, sp, #144
	str	x2, [sp, #16]                   ; 8-byte Folded Spill
	b	LBB4_17
LBB4_16:
	mov	x12, x2
LBB4_17:
	mov	w2, #-20                        ; =0xffffffec
	mov	x11, x22
	mov	x13, x24
	ldr	w14, [sp, #128]                 ; 4-byte Folded Reload
	ldr	w15, [sp, #112]                 ; 4-byte Folded Reload
	ldr	w20, [sp, #96]                  ; 4-byte Folded Reload
	ldr	w16, [sp, #80]                  ; 4-byte Folded Reload
	ldr	w28, [sp, #64]                  ; 4-byte Folded Reload
	ldp	w30, w3, [sp, #52]              ; 8-byte Folded Reload
	ldp	w26, w21, [sp, #44]             ; 8-byte Folded Reload
	ldp	w25, w23, [sp, #32]             ; 8-byte Folded Reload
	mov	x9, x7
	mov	x8, x19
	ldr	w27, [sp, #40]                  ; 4-byte Folded Reload
LBB4_18:                                ; =>This Inner Loop Header: Depth=1
	add	w11, w11, w20
	eor	w8, w11, w8
	ror	w8, w8, #16
	add	w5, w8, w30
	eor	w17, w5, w20
	ror	w6, w17, #20
	add	w11, w6, w11
	eor	w8, w11, w8
	ror	w4, w8, #24
	add	w8, w13, w16
	eor	w9, w8, w9
	ror	w9, w9, #16
	add	w13, w9, w21
	eor	w16, w13, w16
	ror	w17, w16, #20
	add	w20, w17, w8
	eor	w8, w20, w9
	ror	w8, w8, #24
	add	w16, w8, w13
	eor	w9, w16, w17
	ror	w9, w9, #25
	add	w13, w14, w28
	eor	w14, w13, w23
	ror	w14, w14, #16
	add	w21, w14, w26
	eor	w17, w21, w28
	ror	w23, w17, #20
	add	w28, w23, w13
	eor	w13, w28, w14
	ror	w17, w13, #24
	add	w13, w17, w21
	eor	w14, w13, w23
	ror	w14, w14, #25
	add	w15, w15, w3
	eor	w21, w15, w25
	ror	w21, w21, #16
	add	w23, w21, w27
	eor	w3, w23, w3
	ror	w3, w3, #20
	add	w15, w3, w15
	eor	w21, w15, w21
	ror	w21, w21, #24
	add	w23, w21, w23
	eor	w3, w23, w3
	ror	w3, w3, #25
	add	w11, w9, w11
	eor	w21, w11, w21
	ror	w21, w21, #16
	add	w13, w21, w13
	eor	w9, w13, w9
	ror	w9, w9, #20
	add	w11, w9, w11
	eor	w21, w11, w21
	ror	w25, w21, #24
	add	w5, w4, w5
	eor	w6, w5, w6
	add	w26, w25, w13
	eor	w21, w26, w9
	add	w9, w14, w20
	eor	w13, w9, w4
	ror	w4, w13, #16
	add	w20, w4, w23
	eor	w13, w20, w14
	ror	w14, w13, #20
	add	w13, w14, w9
	eor	w9, w13, w4
	add	w4, w3, w28
	eor	w23, w4, w8
	ror	w8, w9, #24
	ror	w9, w23, #16
	add	w27, w8, w20
	eor	w20, w27, w14
	add	w5, w9, w5
	eor	w14, w5, w3
	ror	w3, w14, #20
	add	w14, w3, w4
	eor	w9, w14, w9
	ror	w4, w6, #25
	ror	w9, w9, #24
	add	w30, w9, w5
	eor	w3, w30, w3
	add	w15, w4, w15
	eor	w17, w15, w17
	ror	w17, w17, #16
	add	w5, w17, w16
	eor	w4, w5, w4
	ror	w16, w21, #25
	ror	w4, w4, #20
	add	w15, w4, w15
	eor	w17, w15, w17
	ror	w28, w20, #25
	ror	w23, w17, #24
	add	w21, w23, w5
	eor	w17, w21, w4
	ror	w3, w3, #25
	ror	w20, w17, #25
	adds	w2, w2, #2
	b.ne	LBB4_18
; %bb.19:
	add	w5, w11, w22
	add	w6, w13, w24
	ldr	w11, [sp, #128]                 ; 4-byte Folded Reload
	add	w17, w14, w11
	ldr	w11, [sp, #112]                 ; 4-byte Folded Reload
	add	w4, w15, w11
	ldr	w11, [sp, #96]                  ; 4-byte Folded Reload
	add	w15, w20, w11
	ldr	w11, [sp, #80]                  ; 4-byte Folded Reload
	add	w16, w16, w11
	ldr	w11, [sp, #64]                  ; 4-byte Folded Reload
	add	w13, w28, w11
	ldr	w11, [sp, #56]                  ; 4-byte Folded Reload
	add	w14, w3, w11
	ldr	w11, [sp, #52]                  ; 4-byte Folded Reload
	add	w3, w30, w11
	ldp	w2, w11, [sp, #44]              ; 8-byte Folded Reload
	add	w11, w21, w11
	add	w28, w26, w2
	ldr	w2, [sp, #40]                   ; 4-byte Folded Reload
	add	w30, w27, w2
	add	w26, w8, w19
	add	w27, w9, w7
	ldp	w8, w9, [sp, #32]               ; 8-byte Folded Reload
	add	w2, w23, w9
	add	w25, w25, w8
	cmp	x10, #63
	b.hi	LBB4_21
; %bb.20:
	strb	w5, [x0, #64]
	lsr	w8, w5, #8
	strb	w8, [x0, #65]
	lsr	w8, w5, #16
	strb	w8, [x0, #66]
	lsr	w8, w5, #24
	strb	w8, [x0, #67]
	strb	w6, [x0, #68]
	lsr	w8, w6, #8
	strb	w8, [x0, #69]
	lsr	w8, w6, #16
	strb	w8, [x0, #70]
	lsr	w8, w6, #24
	strb	w8, [x0, #71]
	strb	w17, [x0, #72]
	lsr	w8, w17, #8
	strb	w8, [x0, #73]
	lsr	w8, w17, #16
	strb	w8, [x0, #74]
	lsr	w8, w17, #24
	strb	w8, [x0, #75]
	strb	w4, [x0, #76]
	lsr	w8, w4, #8
	strb	w8, [x0, #77]
	lsr	w8, w4, #16
	strb	w8, [x0, #78]
	lsr	w8, w4, #24
	strb	w8, [x0, #79]
	strb	w15, [x0, #80]
	lsr	w8, w15, #8
	strb	w8, [x0, #81]
	lsr	w8, w15, #16
	strb	w8, [x0, #82]
	lsr	w8, w15, #24
	strb	w8, [x0, #83]
	strb	w16, [x0, #84]
	lsr	w8, w16, #8
	strb	w8, [x0, #85]
	lsr	w8, w16, #16
	strb	w8, [x0, #86]
	lsr	w8, w16, #24
	strb	w8, [x0, #87]
	strb	w13, [x0, #88]
	lsr	w8, w13, #8
	strb	w8, [x0, #89]
	lsr	w8, w13, #16
	strb	w8, [x0, #90]
	lsr	w8, w13, #24
	strb	w8, [x0, #91]
	strb	w14, [x0, #92]
	lsr	w8, w14, #8
	strb	w8, [x0, #93]
	lsr	w8, w14, #16
	strb	w8, [x0, #94]
	lsr	w8, w14, #24
	strb	w8, [x0, #95]
	strb	w3, [x0, #96]
	lsr	w8, w3, #8
	strb	w8, [x0, #97]
	lsr	w8, w3, #16
	strb	w8, [x0, #98]
	lsr	w8, w3, #24
	strb	w8, [x0, #99]
	strb	w11, [x0, #100]
	lsr	w8, w11, #8
	strb	w8, [x0, #101]
	lsr	w8, w11, #16
	strb	w8, [x0, #102]
	lsr	w8, w11, #24
	strb	w8, [x0, #103]
	strb	w28, [x0, #104]
	lsr	w8, w28, #8
	strb	w8, [x0, #105]
	lsr	w8, w28, #16
	strb	w8, [x0, #106]
	lsr	w8, w28, #24
	strb	w8, [x0, #107]
	strb	w30, [x0, #108]
	lsr	w8, w30, #8
	strb	w8, [x0, #109]
	lsr	w8, w30, #16
	strb	w8, [x0, #110]
	lsr	w8, w30, #24
	strb	w8, [x0, #111]
	strb	w26, [x0, #112]
	lsr	w8, w26, #8
	strb	w8, [x0, #113]
	lsr	w8, w26, #16
	strb	w8, [x0, #114]
	lsr	w8, w26, #24
	strb	w8, [x0, #115]
	strb	w27, [x0, #116]
	lsr	w8, w27, #8
	strb	w8, [x0, #117]
	lsr	w8, w27, #16
	strb	w8, [x0, #118]
	lsr	w8, w27, #24
	strb	w8, [x0, #119]
	strb	w2, [x0, #120]
	lsr	w8, w2, #8
	strb	w8, [x0, #121]
	lsr	w8, w2, #16
	strb	w8, [x0, #122]
	lsr	w8, w2, #24
	strb	w8, [x0, #123]
	strb	w25, [x0, #124]
	lsr	w8, w25, #8
	strb	w8, [x0, #125]
	lsr	w8, w25, #16
	strb	w8, [x0, #126]
	lsr	w8, w25, #24
	strb	w8, [x0, #127]
LBB4_21:
	ldp	w8, w9, [x1]
	eor	w23, w8, w5
	eor	w24, w9, w6
	ldp	w8, w9, [x1, #8]
	eor	w22, w8, w17
	eor	w20, w9, w4
	ldp	w8, w9, [x1, #16]
	eor	w21, w8, w15
	eor	w6, w9, w16
	ldp	w8, w9, [x1, #24]
	eor	w5, w8, w13
	eor	w4, w9, w14
	ldp	w8, w9, [x1, #32]
	eor	w17, w8, w3
	eor	w9, w9, w11
	ldp	w8, w11, [x1, #40]
	eor	w8, w8, w28
	eor	w16, w11, w30
	ldp	w11, w13, [x1, #48]
	eor	w15, w11, w26
	eor	w14, w13, w27
	ldp	w11, w3, [x1, #56]
	eor	w13, w11, w2
	eor	w11, w3, w25
	adds	w19, w19, #1
	cinc	w7, w7, hs
	strb	w23, [x12]
	lsr	w2, w23, #8
	strb	w2, [x12, #1]
	lsr	w2, w23, #16
	strb	w2, [x12, #2]
	lsr	w2, w23, #24
	strb	w2, [x12, #3]
	strb	w24, [x12, #4]
	lsr	w2, w24, #8
	strb	w2, [x12, #5]
	lsr	w2, w24, #16
	strb	w2, [x12, #6]
	lsr	w2, w24, #24
	strb	w2, [x12, #7]
	strb	w22, [x12, #8]
	lsr	w2, w22, #8
	strb	w2, [x12, #9]
	lsr	w2, w22, #16
	strb	w2, [x12, #10]
	lsr	w2, w22, #24
	strb	w2, [x12, #11]
	strb	w20, [x12, #12]
	lsr	w2, w20, #8
	strb	w2, [x12, #13]
	lsr	w2, w20, #16
	strb	w2, [x12, #14]
	lsr	w2, w20, #24
	strb	w2, [x12, #15]
	strb	w21, [x12, #16]
	lsr	w2, w21, #8
	strb	w2, [x12, #17]
	lsr	w2, w21, #16
	strb	w2, [x12, #18]
	lsr	w2, w21, #24
	strb	w2, [x12, #19]
	strb	w6, [x12, #20]
	lsr	w2, w6, #8
	strb	w2, [x12, #21]
	lsr	w2, w6, #16
	strb	w2, [x12, #22]
	lsr	w2, w6, #24
	strb	w2, [x12, #23]
	strb	w5, [x12, #24]
	lsr	w2, w5, #8
	strb	w2, [x12, #25]
	lsr	w2, w5, #16
	strb	w2, [x12, #26]
	lsr	w2, w5, #24
	strb	w2, [x12, #27]
	strb	w4, [x12, #28]
	lsr	w2, w4, #8
	strb	w2, [x12, #29]
	lsr	w2, w4, #16
	strb	w2, [x12, #30]
	lsr	w2, w4, #24
	strb	w2, [x12, #31]
	strb	w17, [x12, #32]
	lsr	w2, w17, #8
	strb	w2, [x12, #33]
	lsr	w2, w17, #16
	strb	w2, [x12, #34]
	lsr	w17, w17, #24
	strb	w17, [x12, #35]
	strb	w9, [x12, #36]
	lsr	w17, w9, #8
	strb	w17, [x12, #37]
	lsr	w17, w9, #16
	strb	w17, [x12, #38]
	lsr	w9, w9, #24
	strb	w9, [x12, #39]
	strb	w8, [x12, #40]
	lsr	w9, w8, #8
	strb	w9, [x12, #41]
	lsr	w9, w8, #16
	strb	w9, [x12, #42]
	lsr	w8, w8, #24
	strb	w8, [x12, #43]
	strb	w16, [x12, #44]
	lsr	w8, w16, #8
	strb	w8, [x12, #45]
	lsr	w8, w16, #16
	strb	w8, [x12, #46]
	lsr	w8, w16, #24
	strb	w8, [x12, #47]
	strb	w15, [x12, #48]
	lsr	w8, w15, #8
	strb	w8, [x12, #49]
	lsr	w8, w15, #16
	strb	w8, [x12, #50]
	lsr	w8, w15, #24
	strb	w8, [x12, #51]
	strb	w14, [x12, #52]
	lsr	w8, w14, #8
	strb	w8, [x12, #53]
	lsr	w8, w14, #16
	strb	w8, [x12, #54]
	lsr	w8, w14, #24
	strb	w8, [x12, #55]
	strb	w13, [x12, #56]
	lsr	w8, w13, #8
	strb	w8, [x12, #57]
	lsr	w8, w13, #16
	strb	w8, [x12, #58]
	lsr	w8, w13, #24
	strb	w8, [x12, #59]
	strb	w11, [x12, #60]
	lsr	w8, w11, #8
	strb	w8, [x12, #61]
	lsr	w8, w11, #16
	strb	w8, [x12, #62]
	lsr	w8, w11, #24
	strb	w8, [x12, #63]
	subs	x8, x10, #64
	b.ls	LBB4_23
; %bb.22:
	add	x2, x12, #64
	add	x1, x1, #64
	mov	x10, x8
	ldp	w24, w22, [sp, #24]             ; 8-byte Folded Reload
	add	x12, sp, #144
	cmp	x10, #63
	b.hi	LBB4_16
	b	LBB4_8
LBB4_23:
	sub	w8, w10, #1
	cmp	w8, #62
	ldr	x16, [sp, #16]                  ; 8-byte Folded Reload
	b.hi	LBB4_37
; %bb.24:
	mov	x11, #0                         ; =0x0
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	subs	x8, x9, #64
	csel	x8, xzr, x8, lo
	add	w8, w8, #63
	and	x8, x8, #0x1c0
	sub	x13, x9, x8
	cmp	x13, #1
	csinc	x8, x13, xzr, hi
	cmp	x13, #8
	b.lo	LBB4_36
; %bb.25:
	sub	x9, x16, x12
	cmp	x9, #64
	b.lo	LBB4_36
; %bb.26:
	cmp	x13, #64
	b.hs	LBB4_29
; %bb.27:
	mov	x11, #0                         ; =0x0
	b	LBB4_33
LBB4_28:
	mov	w8, #0                          ; =0x0
	b	LBB4_38
LBB4_29:
	and	x11, x8, #0xffffffffffffffc0
	add	x9, x12, #32
	add	x14, x16, #32
	mov	x15, x11
LBB4_30:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x9, #-32]
	ldp	q2, q3, [x9], #64
	stp	q0, q1, [x14, #-32]
	stp	q2, q3, [x14], #64
	subs	x15, x15, #64
	b.ne	LBB4_30
; %bb.31:
	cmp	x13, x11
	b.eq	LBB4_37
; %bb.32:
	tst	x8, #0x38
	b.eq	LBB4_36
LBB4_33:
	mov	x14, x11
	and	x11, x8, #0xfffffffffffffff8
	sub	x8, x14, x11
	add	x9, x16, x14
	add	x14, x12, x14
LBB4_34:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x14], #8
	str	d0, [x9], #8
	adds	x8, x8, #8
	b.ne	LBB4_34
; %bb.35:
	cmp	x13, x11
	b.eq	LBB4_37
LBB4_36:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w8, [x12, x11]
	strb	w8, [x16, x11]
	add	x11, x11, #1
	cmp	x11, x10
	b.lo	LBB4_36
LBB4_37:
	stp	w19, w7, [x0, #48]
	mov	w8, #64                         ; =0x40
	sub	w8, w8, w10
LBB4_38:
	strb	w8, [x0, #128]
LBB4_39:
	ldur	x8, [x29, #-160]
Lloh13:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh14:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh15:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB4_41
; %bb.40:
	ldp	x29, x30, [sp, #368]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #352]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #336]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #320]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #304]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #288]            ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #272]              ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #256]            ; 16-byte Folded Reload
	ldp	d13, d12, [sp, #240]            ; 16-byte Folded Reload
	ldp	d15, d14, [sp, #224]            ; 16-byte Folded Reload
	add	sp, sp, #384
	ret
LBB4_41:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh4, Lloh5, Lloh6
	.loh AdrpLdr	Lloh11, Lloh12
	.loh AdrpAdrp	Lloh9, Lloh11
	.loh AdrpLdr	Lloh9, Lloh10
	.loh AdrpAdrp	Lloh7, Lloh9
	.loh AdrpLdr	Lloh7, Lloh8
	.loh AdrpLdrGotLdr	Lloh13, Lloh14, Lloh15
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function CRYPTO_chacha_20
lCPI5_0:
	.long	1634760805                      ; 0x61707865
	.long	857760878                       ; 0x3320646e
	.long	2036477234                      ; 0x79622d32
	.long	1797285236                      ; 0x6b206574
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_CRYPTO_chacha_20
	.p2align	2
_CRYPTO_chacha_20:                      ; @CRYPTO_chacha_20
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #208
	stp	x24, x23, [sp, #144]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #160]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #176]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #192]            ; 16-byte Folded Spill
	add	x29, sp, #192
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x2
	mov	x20, x1
	mov	x21, x0
Lloh16:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh17:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh18:
	ldr	x8, [x8]
	stur	x8, [x29, #-56]
	ldp	q0, q1, [x3]
	stp	q0, q1, [sp, #16]
Lloh19:
	adrp	x8, lCPI5_0@PAGE
Lloh20:
	ldr	q1, [x8, lCPI5_0@PAGEOFF]
	str	q1, [sp]
	str	xzr, [sp, #48]
	ldr	d0, [x4]
	str	d0, [sp, #56]
	cbz	x5, LBB5_2
; %bb.1:
	str	x5, [sp, #48]
LBB5_2:
	cbz	x19, LBB5_5
; %bb.3:
	mov	w23, #-1                        ; =0xffffffff
LBB5_4:                                 ; =>This Inner Loop Header: Depth=1
	cmp	x19, x23
	csel	x22, x19, x23, lo
	mov	x0, sp
	mov	x1, x20
	mov	x2, x21
	mov	x3, x22
	bl	_chacha_encrypt_bytes
	add	x20, x20, x22
	add	x21, x21, x22
	subs	x19, x19, x22
	b.ne	LBB5_4
LBB5_5:
	ldur	x8, [x29, #-56]
Lloh21:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh22:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh23:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB5_7
; %bb.6:
	ldp	x29, x30, [sp, #192]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #176]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #160]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #208
	ret
LBB5_7:
	bl	___stack_chk_fail
	.loh AdrpLdr	Lloh19, Lloh20
	.loh AdrpLdrGotLdr	Lloh16, Lloh17, Lloh18
	.loh AdrpLdrGotLdr	Lloh21, Lloh22, Lloh23
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function CRYPTO_xchacha_20
lCPI6_0:
	.long	1634760805                      ; 0x61707865
	.long	857760878                       ; 0x3320646e
	.long	2036477234                      ; 0x79622d32
	.long	1797285236                      ; 0x6b206574
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_CRYPTO_xchacha_20
	.p2align	2
_CRYPTO_xchacha_20:                     ; @CRYPTO_xchacha_20
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #240
	stp	x24, x23, [sp, #176]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #192]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #208]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #224]            ; 16-byte Folded Spill
	add	x29, sp, #224
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x22, x4
	mov	x19, x2
	mov	x20, x1
	mov	x21, x0
Lloh24:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh25:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh26:
	ldr	x8, [x8]
	stur	x8, [x29, #-56]
	mov	x0, sp
	mov	x1, x3
	mov	x2, x4
	bl	_CRYPTO_hchacha_20
	ldp	q0, q1, [sp]
	stp	q0, q1, [sp, #48]
Lloh27:
	adrp	x8, lCPI6_0@PAGE
Lloh28:
	ldr	q1, [x8, lCPI6_0@PAGEOFF]
	str	q1, [sp, #32]
	str	xzr, [sp, #80]
	ldr	d0, [x22, #16]
	str	d0, [sp, #88]
	cbz	x19, LBB6_3
; %bb.1:
	mov	w23, #-1                        ; =0xffffffff
LBB6_2:                                 ; =>This Inner Loop Header: Depth=1
	cmp	x19, x23
	csel	x22, x19, x23, lo
	add	x0, sp, #32
	mov	x1, x20
	mov	x2, x21
	mov	x3, x22
	bl	_chacha_encrypt_bytes
	add	x20, x20, x22
	add	x21, x21, x22
	subs	x19, x19, x22
	b.ne	LBB6_2
LBB6_3:
	ldur	x8, [x29, #-56]
Lloh29:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh30:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh31:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB6_5
; %bb.4:
	ldp	x29, x30, [sp, #224]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #208]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #192]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #176]            ; 16-byte Folded Reload
	add	sp, sp, #240
	ret
LBB6_5:
	bl	___stack_chk_fail
	.loh AdrpLdr	Lloh27, Lloh28
	.loh AdrpLdrGotLdr	Lloh24, Lloh25, Lloh26
	.loh AdrpLdrGotLdr	Lloh29, Lloh30, Lloh31
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
