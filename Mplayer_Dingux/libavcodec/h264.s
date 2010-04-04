	.file	1 "h264.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 3
	.abicalls
	.text
	.align	2
	.ent	get_bits
	.type	get_bits, @function
get_bits:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lw	$9,8($4)
	lw	$3,0($4)
	sra	$2,$9,3
	addu	$3,$3,$2
	lbu	$6,0($3)
	lbu	$2,3($3)
	lbu	$7,1($3)
	lbu	$8,2($3)
	sll	$6,$6,24
	or	$2,$2,$6
	sll	$7,$7,16
	or	$2,$2,$7
	sll	$8,$8,8
	andi	$3,$9,0x7
	or	$2,$2,$8
	addu	$9,$5,$9
	sll	$2,$2,$3
	subu	$5,$0,$5
	sw	$9,8($4)
	j	$31
	srl	$2,$2,$5

	.set	macro
	.set	reorder
	.end	get_bits
	.align	2
	.ent	get_cabac_noinline
	.type	get_cabac_noinline, @function
get_cabac_noinline:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	move	$9,$4
	lw	$4,4($4)
	lui	$28,%hi(__gnu_local_gp)
	lbu	$8,0($5)
	addiu	$28,$28,%lo(__gnu_local_gp)
	andi	$3,$4,0xc0
	sll	$3,$3,1
	lw	$2,%got(ff_h264_lps_range)($28)
	addu	$3,$3,$8
	addu	$2,$2,$3
	lbu	$7,0($2)
	lw	$6,0($9)
	subu	$4,$4,$7
	sll	$2,$4,17
	subu	$3,$2,$6
	sra	$3,$3,31
	and	$2,$3,$2
	subu	$6,$6,$2
	lw	$2,%got(ff_h264_mlps_state)($28)
	movn	$4,$7,$3
	xor	$10,$3,$8
	sw	$6,0($9)
	sw	$4,4($9)
	addu	$2,$2,$10
	lbu	$3,128($2)
	lw	$7,%got(ff_h264_norm_shift)($28)
	sb	$3,0($5)
	lw	$4,4($9)
	lw	$5,0($9)
	addu	$2,$7,$4
	lbu	$3,0($2)
	sll	$8,$5,$3
	sll	$4,$4,$3
	andi	$2,$8,0xffff
	sw	$4,4($9)
	bne	$2,$0,$L4
	sw	$8,0($9)

	lw	$6,16($9)
	addiu	$3,$8,-1
	xor	$3,$3,$8
	lbu	$4,0($6)
	sra	$3,$3,15
	lbu	$5,1($6)
	addu	$3,$7,$3
	li	$2,-65536			# 0xffffffffffff0000
	ori	$2,$2,0x1
	sll	$4,$4,9
	lbu	$7,0($3)
	addu	$4,$4,$2
	sll	$5,$5,1
	li	$2,7			# 0x7
	addu	$4,$4,$5
	subu	$2,$2,$7
	sll	$4,$4,$2
	addu	$4,$4,$8
	addiu	$6,$6,2
	sw	$6,16($9)
	sw	$4,0($9)
$L4:
	j	$31
	andi	$2,$10,0x1

	.set	macro
	.set	reorder
	.end	get_cabac_noinline
	.align	2
	.ent	get_cabac
	.type	get_cabac, @function
get_cabac:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	move	$9,$4
	lw	$4,4($4)
	lui	$28,%hi(__gnu_local_gp)
	lbu	$8,0($5)
	addiu	$28,$28,%lo(__gnu_local_gp)
	andi	$3,$4,0xc0
	sll	$3,$3,1
	lw	$2,%got(ff_h264_lps_range)($28)
	addu	$3,$3,$8
	addu	$2,$2,$3
	lbu	$7,0($2)
	lw	$6,0($9)
	subu	$4,$4,$7
	sll	$2,$4,17
	subu	$3,$2,$6
	sra	$3,$3,31
	and	$2,$3,$2
	subu	$6,$6,$2
	lw	$2,%got(ff_h264_mlps_state)($28)
	movn	$4,$7,$3
	xor	$10,$3,$8
	sw	$6,0($9)
	sw	$4,4($9)
	addu	$2,$2,$10
	lbu	$3,128($2)
	lw	$7,%got(ff_h264_norm_shift)($28)
	sb	$3,0($5)
	lw	$4,4($9)
	lw	$5,0($9)
	addu	$2,$7,$4
	lbu	$3,0($2)
	sll	$8,$5,$3
	sll	$4,$4,$3
	andi	$2,$8,0xffff
	sw	$4,4($9)
	bne	$2,$0,$L8
	sw	$8,0($9)

	lw	$6,16($9)
	addiu	$3,$8,-1
	xor	$3,$3,$8
	lbu	$4,0($6)
	sra	$3,$3,15
	lbu	$5,1($6)
	addu	$3,$7,$3
	li	$2,-65536			# 0xffffffffffff0000
	ori	$2,$2,0x1
	sll	$4,$4,9
	lbu	$7,0($3)
	addu	$4,$4,$2
	sll	$5,$5,1
	li	$2,7			# 0x7
	addu	$4,$4,$5
	subu	$2,$2,$7
	sll	$4,$4,$2
	addu	$4,$4,$8
	addiu	$6,$6,2
	sw	$6,16($9)
	sw	$4,0($9)
$L8:
	j	$31
	andi	$2,$10,0x1

	.set	macro
	.set	reorder
	.end	get_cabac
	.align	2
	.ent	get_cabac_bypass
	.type	get_cabac_bypass, @function
get_cabac_bypass:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lw	$6,0($4)
	move	$7,$4
	sll	$6,$6,1
	andi	$2,$6,0xffff
	bne	$2,$0,$L11
	sw	$6,0($4)

	lw	$5,16($4)
	li	$2,-65536			# 0xffffffffffff0000
	lbu	$3,0($5)
	lbu	$4,1($5)
	ori	$2,$2,0x1
	addu	$2,$6,$2
	sll	$3,$3,9
	addu	$2,$2,$3
	sll	$4,$4,1
	addu	$2,$2,$4
	addiu	$5,$5,2
	sw	$5,16($7)
	sw	$2,0($7)
	move	$6,$2
$L11:
	lw	$2,4($7)
	sll	$2,$2,17
	slt	$3,$6,$2
	bne	$3,$0,$L15
	nop

	subu	$2,$6,$2
	sw	$2,0($7)
	j	$31
	li	$2,1			# 0x1

$L15:
	j	$31
	move	$2,$0

	.set	macro
	.set	reorder
	.end	get_cabac_bypass
	.align	2
	.ent	get_ue_golomb
	.type	get_ue_golomb, @function
get_ue_golomb:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lw	$8,8($4)
	lw	$2,0($4)
	sra	$3,$8,3
	addu	$2,$2,$3
	move	$9,$4
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	lui	$28,%hi(__gnu_local_gp)
	sltu	$2,$6,$2
	beq	$2,$0,$L23
	addiu	$28,$28,%lo(__gnu_local_gp)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$6,$2
	bne	$2,$0,$L19
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L20:
	andi	$2,$5,0xff00
	beq	$2,$0,$L24
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L24:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	sw	$4,8($9)
	j	$31
	addiu	$2,$2,-1

$L19:
	b	$L20
	li	$7,16			# 0x10

$L23:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8($9)
	j	$31
	lbu	$2,0($2)

	.set	macro
	.set	reorder
	.end	get_ue_golomb
	.align	2
	.ent	get_se_golomb
	.type	get_se_golomb, @function
get_se_golomb:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lw	$8,8($4)
	lw	$2,0($4)
	sra	$3,$8,3
	addu	$2,$2,$3
	move	$9,$4
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	lui	$28,%hi(__gnu_local_gp)
	sltu	$2,$6,$2
	beq	$2,$0,$L34
	addiu	$28,$28,%lo(__gnu_local_gp)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$6,$2
	bne	$2,$0,$L28
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L29:
	andi	$2,$5,0xff00
	beq	$2,$0,$L35
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L35:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$6,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L31
	sw	$4,8($9)

	srl	$2,$5,1
	j	$31
	subu	$2,$0,$2

$L28:
	b	$L29
	li	$7,16			# 0x10

$L34:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_se_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8($9)
	j	$31
	lb	$2,0($2)

$L31:
	j	$31
	srl	$2,$5,1

	.set	macro
	.set	reorder
	.end	get_se_golomb
	.align	2
	.ent	fill_caches
	.type	fill_caches, @function
fill_caches:
	.set	nomips16
	.frame	$sp,264,$31		# vars= 216, regs= 9/0, args= 0, gp= 8
	.mask	0x40ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-264
	sw	$fp,260($sp)
	sw	$23,256($sp)
	sw	$22,252($sp)
	sw	$21,248($sp)
	sw	$20,244($sp)
	sw	$19,240($sp)
	sw	$18,236($sp)
	sw	$17,232($sp)
	sw	$16,228($sp)
	.cprestore	0
	lw	$9,6172($4)
	lw	$8,152($4)
	lw	$10,6168($4)
	mul	$2,$8,$9
	move	$24,$4
	sw	$6,272($sp)
	sw	$5,268($sp)
	bne	$6,$0,$L37
	addu	$11,$2,$10

	li	$2,65536			# 0x10000
	addu	$2,$4,$2
	lw	$5,-6276($2)
	subu	$12,$11,$8
$L38:
	li	$2,2			# 0x2
	li	$3,3			# 0x3
	sw	$2,32($sp)
	sw	$3,36($sp)
	li	$2,7			# 0x7
	li	$3,10			# 0xa
	addiu	$4,$11,-1
	li	$7,1			# 0x1
	sw	$2,40($sp)
	sw	$3,44($sp)
	li	$2,8			# 0x8
	li	$3,11			# 0xb
	sw	$4,12($sp)
	sw	$2,48($sp)
	sw	$3,52($sp)
	sw	$4,8($sp)
	sw	$0,24($sp)
	sw	$7,28($sp)
	addiu	$17,$12,-1
	beq	$5,$0,$L41
	addiu	$16,$12,1

	li	$2,-2			# 0xfffffffffffffffe
	and	$2,$9,$2
	mul	$3,$2,$8
	lw	$13,268($sp)
	addu	$10,$3,$10
	subu	$2,$10,$8
	lw	$4,1568($24)
	addiu	$6,$2,1
	subu	$5,$10,$7
	addiu	$3,$2,-1
	sll	$3,$3,2
	sll	$6,$6,2
	sll	$5,$5,2
	sll	$2,$2,2
	srl	$7,$13,7
	addu	$5,$4,$5
	addu	$3,$4,$3
	addu	$2,$4,$2
	xori	$7,$7,0x1
	addu	$4,$4,$6
	andi	$9,$9,0x1
	lw	$3,0($3)
	lw	$2,0($2)
	lw	$4,0($4)
	lw	$5,0($5)
	beq	$9,$0,$L42
	andi	$7,$7,0x1

	xori	$6,$7,0x1
$L43:
	subu	$2,$12,$8
	beq	$9,$0,$L46
	movn	$12,$2,$6

	xori	$3,$7,0x1
$L47:
	subu	$2,$17,$8
	beq	$9,$0,$L50
	movn	$17,$2,$3

	xori	$4,$7,0x1
$L51:
	subu	$2,$16,$8
	movn	$16,$2,$4
	srl	$2,$5,7
$L252:
	xori	$2,$2,0x1
	andi	$2,$2,0x1
	beq	$2,$7,$L41
	addiu	$2,$10,-1

	sw	$2,8($sp)
	beq	$7,$0,$L54
	sw	$2,12($sp)

	beq	$9,$0,$L55
	li	$2,1			# 0x1

	li	$2,2			# 0x2
	li	$3,3			# 0x3
	li	$4,8			# 0x8
	li	$5,11			# 0xb
	sw	$2,28($sp)
	sw	$3,36($sp)
	sw	$4,48($sp)
	sw	$5,52($sp)
	sw	$2,24($sp)
	sw	$3,32($sp)
	sw	$4,40($sp)
	sw	$5,44($sp)
$L41:
	lw	$15,8($sp)
	lw	$14,12($sp)
	sw	$12,8764($24)
	sw	$15,8768($24)
	sw	$14,8772($24)
	lw	$2,272($sp)
	beq	$2,$0,$L230
	li	$2,65536			# 0x10000

	addu	$2,$24,$2
$L259:
	lw	$5,-6288($2)
	li	$2,255			# 0xff
	addu	$3,$5,$12
	lbu	$4,0($3)
	beq	$4,$2,$L204
	sll	$3,$12,2

	lw	$2,1568($24)
	addu	$2,$2,$3
	lw	$2,0($2)
	sw	$2,120($sp)
$L58:
	addu	$2,$5,$15
	lbu	$4,0($2)
	li	$3,255			# 0xff
	beq	$4,$3,$L205
	sll	$3,$15,2

	lw	$2,1568($24)
	addu	$2,$2,$3
	lw	$2,0($2)
$L60:
	sw	$2,16($sp)
	addu	$2,$5,$14
	lbu	$4,0($2)
	li	$3,255			# 0xff
	beq	$4,$3,$L206
	sll	$3,$14,2

	lw	$2,1568($24)
	addu	$2,$2,$3
	lw	$4,0($2)
$L62:
	li	$2,65536			# 0x10000
	addu	$2,$24,$2
	lw	$3,-6276($2)
	bne	$3,$0,$L63
	sw	$4,20($sp)

	lw	$5,268($sp)
	sw	$0,124($sp)
	andi	$13,$5,0x7
	beq	$13,$0,$L202
	sw	$0,116($sp)

$L66:
	lw	$8,120($sp)
$L235:
	li	$2,65535			# 0xffff
	li	$3,61162			# 0xeeea
	andi	$4,$8,0x7
	sw	$2,8980($24)
	sw	$3,8988($24)
	sw	$2,8992($24)
	bne	$4,$0,$L84
	sw	$2,8984($24)

	bne	$8,$0,$L207
	li	$2,46079			# 0xb3ff

$L227:
	sw	$2,8980($24)
	li	$3,13311			# 0x33ff
	li	$2,9962			# 0x26ea
	sw	$3,8984($24)
	sw	$2,8988($24)
$L84:
	lw	$3,16($sp)
$L253:
	andi	$2,$3,0x7
	bne	$2,$0,$L86
	nop

	bne	$3,$0,$L87
	nop

$L88:
	lw	$2,8980($24)
	lw	$3,8992($24)
	andi	$2,$2,0xdf5f
	andi	$3,$3,0x5f5f
	sw	$2,8980($24)
	sw	$3,8992($24)
$L86:
	lw	$3,20($sp)
	andi	$2,$3,0x7
$L260:
	bne	$2,$0,$L231
	lw	$9,124($sp)

	bne	$3,$0,$L208
	nop

	lw	$2,8980($24)
$L225:
	lw	$3,8992($24)
	andi	$2,$2,0xdf5f
	andi	$3,$3,0x5f5f
	sw	$2,8980($24)
	sw	$3,8992($24)
	lw	$9,124($sp)
$L231:
	andi	$2,$9,0x7
	bne	$2,$0,$L232
	lw	$3,116($sp)

	bne	$9,$0,$L209
	nop

	lw	$2,8980($24)
$L228:
	andi	$2,$2,0x7fff
	sw	$2,8980($24)
	lw	$3,116($sp)
$L232:
	andi	$2,$3,0x7
	bne	$2,$0,$L233
	lw	$4,268($sp)

	bne	$3,$0,$L210
	nop

	lw	$2,8988($24)
$L229:
	andi	$2,$2,0xfbff
	sw	$2,8988($24)
	lw	$4,268($sp)
$L233:
	andi	$2,$4,0x1
	bne	$2,$0,$L201
	lw	$7,120($sp)

	lw	$4,120($sp)
	addiu	$5,$sp,24
	addiu	$6,$sp,16
	sw	$5,172($sp)
	bne	$4,$0,$L211
	sw	$6,168($sp)

$L106:
	lw	$9,11808($24)
	beq	$9,$0,$L109
	li	$2,64			# 0x40

	beq	$13,$0,$L109
	move	$2,$0

	li	$2,64			# 0x40
$L109:
	sb	$2,9084($24)
	sb	$2,9106($24)
	sb	$2,9105($24)
	sb	$2,9082($24)
	sb	$2,9081($24)
	sb	$2,9087($24)
	sb	$2,9086($24)
	b	$L107
	sb	$2,9085($24)

$L37:
	li	$2,65536			# 0x10000
	addu	$6,$4,$2
	lw	$3,-6296($6)
	li	$2,1			# 0x1
	beq	$3,$2,$L39
	subu	$12,$11,$8

	lw	$2,-6288($6)
	addu	$5,$2,$12
	addu	$2,$2,$11
	lbu	$4,0($2)
	lbu	$3,0($5)
	beq	$4,$3,$L234
	li	$2,65536			# 0x10000

	b	$L38
	lw	$5,-6276($6)

$L56:
$L230:
	addu	$2,$24,$2
	lw	$5,-6288($2)
	lw	$4,-6296($2)
	addu	$3,$5,$17
	lbu	$2,0($3)
	beq	$2,$4,$L73
	sll	$3,$17,2

	sw	$0,124($sp)
$L74:
	addu	$2,$5,$12
	lbu	$3,0($2)
	beq	$4,$3,$L75
	sll	$3,$12,2

	sw	$0,120($sp)
$L76:
	addu	$2,$5,$16
	lbu	$3,0($2)
	beq	$4,$3,$L77
	sll	$3,$16,2

	sw	$0,116($sp)
$L78:
	addu	$2,$5,$15
	lbu	$3,0($2)
	beq	$4,$3,$L79
	addu	$2,$5,$14

	lbu	$3,0($2)
	beq	$4,$3,$L81
	move	$6,$0

	move	$2,$0
$L254:
	sw	$6,16($sp)
	sw	$2,20($sp)
$L223:
	lw	$5,268($sp)
	andi	$13,$5,0x7
	bne	$13,$0,$L235
	lw	$8,120($sp)

$L202:
	addiu	$6,$sp,24
	addiu	$7,$sp,16
	sw	$6,172($sp)
	sw	$7,168($sp)
$L83:
	lw	$4,120($sp)
	beq	$4,$0,$L106
	nop

$L211:
	lw	$4,9128($24)
	sll	$2,$12,4
	addu	$4,$4,$2
	lbu	$3,4($4)
	lw	$9,11808($24)
	sb	$3,9084($24)
	lbu	$2,5($4)
	sb	$2,9085($24)
	lbu	$3,6($4)
	sb	$3,9086($24)
	lbu	$2,3($4)
	sb	$2,9087($24)
	lbu	$3,9($4)
	sb	$3,9081($24)
	lbu	$2,8($4)
	sb	$2,9082($24)
	lbu	$3,12($4)
	sb	$3,9105($24)
	lbu	$2,11($4)
	sb	$2,9106($24)
$L107:
	lw	$8,172($sp)
	move	$23,$24
	move	$7,$24
	move	$6,$24
	move	$5,$0
	addiu	$11,$sp,8
	li	$10,8			# 0x8
$L114:
	lw	$3,168($sp)
	addu	$2,$3,$5
	lw	$3,0($2)
	beq	$3,$0,$L110
	addu	$4,$11,$5

	lw	$3,0($4)
	lw	$4,9128($24)
	lw	$2,0($8)
	sll	$3,$3,4
	addu	$4,$4,$3
	addu	$2,$4,$2
	lbu	$3,0($2)
	sb	$3,9091($7)
	lw	$2,4($8)
	addu	$2,$4,$2
	lbu	$3,0($2)
	sb	$3,9099($7)
	lw	$2,16($8)
	addu	$2,$4,$2
	lbu	$3,0($2)
	sb	$3,9088($6)
	lw	$2,20($8)
	addu	$4,$4,$2
	lbu	$3,0($4)
	sb	$3,9112($6)
$L111:
	addiu	$5,$5,4
	addiu	$8,$8,8
	addiu	$7,$7,16
	bne	$5,$10,$L114
	addiu	$6,$6,8

	bne	$9,$0,$L115
	lw	$4,16($sp)

	sw	$4,56($sp)
$L116:
	lw	$7,268($sp)
$L250:
	andi	$2,$7,0x178
	beq	$2,$0,$L236
	lw	$4,56($sp)

	li	$2,65536			# 0x10000
	addu	$7,$24,$2
	lw	$3,5944($7)
	beq	$3,$0,$L236
	li	$3,131072			# 0x20000

	ori	$2,$3,0x2348
	lw	$8,20($sp)
	lw	$9,24($sp)
	lw	$13,32($sp)
	ori	$4,$3,0x233c
	addu	$2,$24,$2
	sw	$2,100($sp)
	lw	$5,28($sp)
	ori	$2,$3,0x21ec
	addu	$4,$24,$4
	ori	$3,$3,0x21f8
	sw	$8,68($sp)
	sw	$9,72($sp)
	sw	$13,60($sp)
	addu	$3,$24,$3
	addiu	$4,$4,4
	addu	$2,$24,$2
	sw	$5,156($sp)
	sw	$3,160($sp)
	sw	$4,148($sp)
	sw	$2,96($sp)
	lw	$8,100($sp)
	lw	$9,100($sp)
	lw	$13,100($sp)
	lw	$2,72($sp)
	lw	$3,68($sp)
	lw	$4,68($sp)
	lw	$5,60($sp)
	lw	$6,36($sp)
	sll	$17,$17,2
	sll	$16,$16,2
	sw	$7,188($sp)
	addiu	$8,$8,8
	addiu	$7,$24,9456
	addiu	$9,$9,16
	addiu	$13,$13,24
	sra	$2,$2,1
	andi	$3,$3,0x100
	andi	$4,$4,0x40
	sra	$5,$5,1
	sll	$12,$12,2
	sll	$15,$15,2
	sll	$14,$14,2
	sw	$6,152($sp)
	sw	$17,84($sp)
	sw	$16,80($sp)
	sw	$7,88($sp)
	sw	$8,104($sp)
	sw	$9,108($sp)
	sw	$13,112($sp)
	sw	$2,144($sp)
	sw	$3,140($sp)
	sw	$4,136($sp)
	sw	$12,92($sp)
	sw	$15,76($sp)
	sw	$14,64($sp)
	sw	$5,132($sp)
	lw	$8,268($sp)
	lw	$6,68($sp)
	andi	$8,$8,0x900
	andi	$6,$6,0x80
	addiu	$7,$sp,8
	sw	$8,184($sp)
	lw	$9,124($sp)
	lw	$13,120($sp)
	lw	$2,116($sp)
	lw	$3,56($sp)
	lw	$5,116($sp)
	lw	$8,124($sp)
	sw	$6,128($sp)
	sw	$7,180($sp)
	li	$6,-1			# 0xffffffffffffffff
	li	$4,-2			# 0xfffffffffffffffe
	li	$7,-2			# 0xfffffffffffffffe
	andi	$9,$9,0x80
	andi	$13,$13,0x80
	andi	$2,$2,0x80
	andi	$3,$3,0x80
	movn	$4,$6,$5
	movn	$7,$6,$8
	addiu	$19,$24,9136
	move	$17,$24
	move	$20,$24
	move	$22,$0
	move	$16,$0
	sw	$9,192($sp)
	sw	$13,196($sp)
	sw	$2,200($sp)
	sw	$3,204($sp)
	sw	$4,208($sp)
	sw	$7,212($sp)
$L180:
	sll	$2,$22,1
	li	$3,12288			# 0x3000
	lw	$9,268($sp)
	sll	$18,$3,$2
	and	$4,$18,$9
	bne	$4,$0,$L237
	lw	$2,120($sp)

	andi	$2,$9,0x100
	bne	$2,$0,$L237
	lw	$2,120($sp)

	lw	$13,188($sp)
	lw	$2,5340($13)
	beq	$2,$0,$L238
	lw	$3,96($sp)

	lw	$2,120($sp)
$L237:
	sw	$0,9536($23)
	and	$2,$18,$2
	beq	$2,$0,$L126
	sw	$2,164($sp)

	lw	$5,92($sp)
	lw	$3,9740($24)
	lw	$4,9748($24)
	sll	$fp,$16,2
	addu	$3,$3,$5
	addu	$2,$fp,$16
	lw	$6,0($3)
	sll	$5,$4,1
	subu	$2,$0,$2
	addu	$5,$5,$4
	addiu	$2,$2,1
	addu	$5,$5,$6
	lw	$7,1560($23)
	sll	$2,$2,3
	sll	$3,$5,2
	subu	$2,$0,$2
	lw	$13,92($sp)
	addu	$3,$7,$3
	addiu	$2,$2,12
	lw	$6,9744($24)
	lw	$9,0($3)
	sll	$8,$16,5
	addiu	$4,$5,1
	sll	$2,$2,2
	sll	$21,$16,3
	addu	$25,$21,$8
	addu	$6,$6,$13
	addu	$2,$19,$2
	sll	$4,$4,2
	sw	$8,176($sp)
	lw	$10,9752($24)
	lw	$8,0($6)
	addu	$4,$7,$4
	sw	$9,0($2)
	addiu	$3,$25,5
	lw	$6,0($4)
	addiu	$2,$5,2
	sll	$3,$3,2
	addu	$3,$19,$3
	sll	$2,$2,2
	sw	$6,0($3)
	addu	$2,$7,$2
	addiu	$3,$25,6
	lw	$4,0($2)
	sll	$3,$3,2
	addiu	$5,$5,3
	addu	$3,$19,$3
	sll	$5,$5,2
	sw	$4,0($3)
	addu	$7,$7,$5
	addiu	$2,$25,7
	lw	$3,0($7)
	sll	$2,$2,2
	lw	$4,1652($23)
	addu	$2,$19,$2
	addu	$8,$8,$10
	sw	$3,0($2)
	addu	$4,$4,$8
	lb	$2,0($4)
	sb	$2,9460($17)
	sb	$2,9461($17)
	lb	$3,1($4)
	sb	$3,9462($17)
	sb	$3,9463($17)
$L127:
	addu	$4,$fp,$16
	sll	$4,$4,5
	addiu	$5,$25,11
	sll	$3,$22,3
	sll	$2,$22,5
	addu	$3,$3,$2
	sll	$5,$5,2
	addiu	$4,$4,76
	addu	$13,$19,$5
	addu	$12,$19,$4
	addiu	$3,$3,9467
	lw	$11,172($sp)
	addu	$10,$24,$3
	move	$15,$13
	move	$14,$12
	move	$9,$0
$L134:
	lw	$5,168($sp)
	lw	$2,180($sp)
	addu	$3,$5,$9
	addu	$4,$2,$9
	lw	$2,0($3)
	li	$6,-1			# 0xffffffffffffffff
	li	$3,-2			# 0xfffffffffffffffe
	movn	$3,$6,$2
	and	$2,$18,$2
	beq	$2,$0,$L130
	nop

	lw	$4,0($4)
	lw	$2,9740($24)
	sll	$4,$4,2
	addu	$2,$2,$4
	lw	$3,0($2)
	lw	$8,0($11)
	lw	$2,9748($24)
	addiu	$3,$3,3
	mtlo	$3
	madd	$8,$2
	lw	$6,1560($23)
	mflo	$2
	sw	$3,216($sp)
	sll	$2,$2,2
	addu	$2,$6,$2
	lw	$3,9744($24)
	lw	$7,0($2)
	addu	$3,$3,$4
	lw	$5,0($3)
	sw	$7,0($15)
	lw	$3,216($sp)
	lw	$4,4($11)
	lw	$2,9748($24)
	mtlo	$3
	madd	$4,$2
	sra	$8,$8,1
	mflo	$2
	lw	$7,1652($23)
	sll	$2,$2,2
	addu	$6,$6,$2
	lw	$3,0($6)
	addiu	$5,$5,1
	sw	$3,0($14)
	lw	$2,9752($24)
	sra	$4,$4,1
	mul	$3,$8,$2
	addu	$6,$7,$5
	mul	$5,$4,$2
	addu	$8,$3,$6
	lbu	$3,0($8)
	addu	$4,$5,$6
	sb	$3,0($10)
	lbu	$2,0($4)
	sb	$2,8($10)
$L131:
	addiu	$9,$9,4
	li	$6,8			# 0x8
	addiu	$11,$11,8
	addiu	$15,$15,64
	addiu	$14,$14,64
	addiu	$10,$10,16
	addiu	$12,$12,64
	bne	$9,$6,$L134
	addiu	$13,$13,64

	lw	$7,272($sp)
	bne	$7,$0,$L135
	lw	$8,268($sp)

	andi	$2,$8,0x100
	bne	$2,$0,$L213
	lw	$3,124($sp)

$L248:
	and	$2,$18,$3
	beq	$2,$0,$L239
	addiu	$2,$25,3

	lw	$5,84($sp)
$L249:
	lw	$3,9740($24)
	lw	$4,9748($24)
	addu	$3,$3,$5
	lw	$5,0($3)
	sll	$2,$4,1
	addu	$2,$2,$4
	lw	$6,84($sp)
	addu	$2,$2,$5
	lw	$3,9744($24)
	addiu	$2,$2,3
	lw	$4,1560($23)
	addu	$3,$3,$6
	sll	$2,$2,2
	lw	$5,9752($24)
	lw	$6,0($3)
	addu	$4,$4,$2
	addiu	$2,$25,3
	lw	$7,0($4)
	addiu	$5,$5,1
	sll	$2,$2,2
	lw	$3,1652($23)
	addu	$2,$19,$2
	addu	$5,$5,$6
	sw	$7,0($2)
	addu	$3,$3,$5
	lbu	$2,0($3)
	sb	$2,9459($17)
	lw	$8,116($sp)
	and	$2,$18,$8
	beq	$2,$0,$L240
	sll	$2,$16,1

$L215:
	lw	$9,80($sp)
	lw	$3,9740($24)
	lw	$4,9748($24)
	sll	$2,$16,1
	addu	$3,$3,$9
	addu	$2,$2,$21
	lw	$5,0($3)
	subu	$2,$0,$2
	sll	$3,$4,1
	addu	$3,$3,$4
	addiu	$2,$2,1
	lw	$4,9744($24)
	addu	$3,$3,$5
	sll	$2,$2,2
	lw	$5,1560($23)
	addu	$4,$4,$9
	sll	$3,$3,2
	subu	$2,$0,$2
	lw	$6,0($4)
	addu	$5,$5,$3
	lw	$4,9752($24)
	addiu	$2,$2,12
	lw	$7,0($5)
	sll	$2,$2,2
	lw	$3,1652($23)
	addu	$2,$19,$2
	addu	$6,$6,$4
	sw	$7,0($2)
	addu	$3,$3,$6
	lbu	$2,0($3)
	sb	$2,9464($17)
$L142:
	lw	$2,184($sp)
	beq	$2,$0,$L145
	lw	$3,188($sp)

	lw	$2,-6276($3)
	bne	$2,$0,$L241
	lw	$4,176($sp)

$L125:
	lw	$13,188($sp)
$L243:
	lw	$3,96($sp)
$L238:
	lw	$2,5944($13)
	addiu	$22,$22,1
	addiu	$3,$3,4
	sltu	$2,$22,$2
	addiu	$17,$17,40
	addiu	$20,$20,160
	sw	$3,96($sp)
	addiu	$23,$23,4
	bne	$2,$0,$L180
	move	$16,$22

	lw	$4,56($sp)
$L236:
	lw	$5,120($sp)
	srl	$3,$4,24
	srl	$2,$5,24
	andi	$3,$3,0x1
	andi	$2,$2,0x1
	addu	$3,$3,$2
	sw	$3,9544($24)
	lw	$fp,260($sp)
$L242:
	lw	$23,256($sp)
	lw	$22,252($sp)
	lw	$21,248($sp)
	lw	$20,244($sp)
	lw	$19,240($sp)
	lw	$18,236($sp)
	lw	$17,232($sp)
	lw	$16,228($sp)
	j	$31
	addiu	$sp,$sp,264

$L39:
	li	$2,65536			# 0x10000
$L234:
	addu	$2,$24,$2
	lw	$5,-6276($2)
	beq	$5,$0,$L242
	lw	$fp,260($sp)

	b	$L38
	subu	$12,$11,$8

$L145:
	lw	$4,176($sp)
$L241:
	addu	$8,$21,$4
	addiu	$2,$8,16
	addiu	$3,$8,24
	addiu	$4,$8,32
	addiu	$5,$8,14
	addiu	$6,$8,30
	sll	$13,$2,2
	sll	$12,$3,2
	sll	$11,$4,2
	sll	$10,$5,2
	sll	$9,$6,2
	li	$2,-2
	addu	$3,$19,$9
	addu	$4,$19,$10
	addu	$5,$19,$11
	addu	$6,$19,$12
	addu	$7,$19,$13
	sb	$2,9472($17)
	sb	$2,9486($17)
	sb	$2,9470($17)
	sb	$2,9488($17)
	sb	$2,9480($17)
	sw	$0,0($3)
	sw	$0,0($4)
	sw	$0,0($5)
	sw	$0,0($6)
	sw	$0,0($7)
	lw	$2,11808($24)
	beq	$2,$0,$L146
	lw	$5,164($sp)

	beq	$5,$0,$L147
	addu	$2,$fp,$16

	lw	$6,92($sp)
	lw	$3,9740($24)
	lw	$5,9748($24)
	addu	$3,$3,$6
	lw	$6,0($3)
	sll	$4,$5,1
	lw	$7,96($sp)
	subu	$2,$0,$2
	addu	$4,$4,$5
	addiu	$2,$2,1
	addu	$4,$4,$6
	lw	$5,0($7)
	sll	$2,$2,3
	sll	$3,$4,2
	subu	$2,$0,$2
	lw	$7,160($sp)
	addu	$3,$5,$3
	addiu	$2,$2,12
	lw	$6,0($3)
	sll	$2,$2,2
	addiu	$3,$4,1
	addu	$2,$7,$2
	sll	$3,$3,2
	sw	$6,0($2)
	addu	$3,$5,$3
	addiu	$2,$8,5
	lw	$6,0($3)
	sll	$2,$2,2
	addiu	$3,$4,2
	addu	$2,$7,$2
	sll	$3,$3,2
	sw	$6,0($2)
	addu	$3,$5,$3
	addiu	$2,$8,6
	lw	$6,0($3)
	sll	$2,$2,2
	addiu	$4,$4,3
	addu	$2,$7,$2
	sll	$4,$4,2
	sw	$6,0($2)
	addu	$5,$5,$4
	addiu	$2,$8,7
	sll	$2,$2,2
	lw	$3,0($5)
	addu	$2,$7,$2
	sw	$3,0($2)
	addiu	$7,$8,12
$L148:
	lw	$3,56($sp)
	and	$2,$18,$3
	beq	$2,$0,$L149
	lw	$4,176($sp)

	lw	$4,76($sp)
	lw	$2,9740($24)
	lw	$3,9748($24)
	addu	$2,$2,$4
	lw	$4,0($2)
	lw	$6,96($sp)
	lw	$2,72($sp)
	lw	$5,0($6)
	addiu	$6,$4,3
	mul	$4,$2,$3
	addu	$3,$4,$6
	lw	$4,176($sp)
	sll	$3,$3,2
	addu	$3,$5,$3
	addu	$2,$21,$4
	addiu	$2,$2,11
	lw	$4,0($3)
	lw	$3,160($sp)
	sll	$2,$2,2
	addu	$2,$3,$2
	sw	$4,0($2)
	lw	$3,9748($24)
	lw	$4,156($sp)
	addiu	$2,$8,19
	mul	$8,$4,$3
	sll	$2,$2,2
	addu	$3,$8,$6
	sll	$3,$3,2
	addu	$5,$5,$3
	lw	$3,160($sp)
	lw	$4,0($5)
	addu	$2,$3,$2
	sw	$4,0($2)
$L150:
	lw	$6,68($sp)
	and	$2,$18,$6
	beq	$2,$0,$L151
	addiu	$3,$7,15

	lw	$8,64($sp)
	lw	$2,9740($24)
	lw	$3,9748($24)
	addu	$2,$2,$8
	lw	$4,0($2)
	lw	$2,96($sp)
	addiu	$8,$4,3
	lw	$6,0($2)
	lw	$2,60($sp)
	mul	$4,$2,$3
	lw	$2,160($sp)
	addu	$3,$4,$8
	sll	$3,$3,2
	addu	$3,$6,$3
	addiu	$4,$7,15
	lw	$5,0($3)
	sll	$4,$4,2
	addu	$4,$2,$4
	sw	$5,0($4)
	lw	$2,9748($24)
	lw	$4,152($sp)
	addiu	$3,$7,23
	mul	$5,$4,$2
	sll	$3,$3,2
	addu	$2,$5,$8
	sll	$2,$2,2
	addu	$6,$6,$2
	lw	$4,0($6)
	lw	$6,160($sp)
	addu	$3,$6,$3
	sw	$4,0($3)
$L152:
	lw	$8,160($sp)
	addu	$2,$8,$9
	addu	$3,$8,$10
	addu	$4,$8,$11
	addu	$5,$8,$12
	addu	$6,$8,$13
	lw	$9,188($sp)
	sw	$0,0($2)
	sw	$0,0($3)
	sw	$0,0($4)
	sw	$0,0($5)
	sw	$0,0($6)
	lw	$3,-6284($9)
	li	$2,3			# 0x3
	bne	$3,$2,$L146
	lw	$13,120($sp)

	lw	$3,100($sp)
	lw	$4,104($sp)
	lw	$5,108($sp)
	lw	$6,112($sp)
	andi	$2,$13,0x100
	sw	$0,0($3)
	sw	$0,0($4)
	sw	$0,0($5)
	beq	$2,$0,$L153
	sw	$0,0($6)

	li	$8,16842752			# 0x1010000
	lw	$7,148($sp)
	ori	$8,$8,0x101
	sw	$8,0($7)
$L154:
	lw	$5,56($sp)
	andi	$2,$5,0x100
	beq	$2,$0,$L156
	lw	$7,56($sp)

	li	$6,131072			# 0x20000
	addu	$3,$24,$6
	li	$2,1
	sb	$2,9031($3)
$L157:
	lw	$9,140($sp)
	beq	$9,$0,$L159
	lw	$2,136($sp)

	li	$13,131072			# 0x20000
	addu	$3,$24,$13
	li	$2,1
	sb	$2,9047($3)
$L146:
	lw	$9,188($sp)
	lw	$2,-6276($9)
	beq	$2,$0,$L243
	lw	$13,188($sp)

	lw	$2,-6272($9)
	beq	$2,$0,$L161
	lw	$13,192($sp)

	bne	$13,$0,$L244
	lw	$3,196($sp)

	lb	$7,9459($17)
	bltz	$7,$L244
	li	$2,131072			# 0x20000

	ori	$4,$2,0x2206
	addu	$4,$20,$4
	lh	$5,9150($20)
	lh	$6,0($4)
	srl	$3,$5,31
	srl	$2,$6,31
	addu	$3,$3,$5
	addu	$2,$2,$6
	sll	$5,$7,1
	sra	$3,$3,1
	sra	$2,$2,1
	sh	$2,0($4)
	sb	$5,9459($17)
	sh	$3,9150($20)
	lw	$3,196($sp)
$L244:
	bne	$3,$0,$L245
	lw	$13,200($sp)

	lb	$7,9460($17)
	bltz	$7,$L164
	li	$5,131072			# 0x20000

	ori	$4,$5,0x220a
	addu	$4,$20,$4
	lh	$5,9154($20)
	lh	$6,0($4)
	srl	$3,$5,31
	srl	$2,$6,31
	addu	$3,$3,$5
	addu	$2,$2,$6
	sll	$5,$7,1
	sra	$3,$3,1
	sra	$2,$2,1
	sh	$2,0($4)
	sb	$5,9460($17)
	sh	$3,9154($20)
$L164:
	lb	$7,9461($17)
	bltz	$7,$L165
	li	$6,131072			# 0x20000

	ori	$4,$6,0x220e
	addu	$4,$20,$4
	lh	$5,9158($20)
	lh	$6,0($4)
	srl	$3,$5,31
	srl	$2,$6,31
	addu	$3,$3,$5
	addu	$2,$2,$6
	sll	$5,$7,1
	sra	$3,$3,1
	sra	$2,$2,1
	sh	$2,0($4)
	sb	$5,9461($17)
	sh	$3,9158($20)
$L165:
	lb	$7,9462($17)
	bltz	$7,$L166
	li	$8,131072			# 0x20000

	ori	$4,$8,0x2212
	addu	$4,$20,$4
	lh	$5,9162($20)
	lh	$6,0($4)
	srl	$3,$5,31
	srl	$2,$6,31
	addu	$3,$3,$5
	addu	$2,$2,$6
	sll	$5,$7,1
	sra	$3,$3,1
	sra	$2,$2,1
	sh	$2,0($4)
	sb	$5,9462($17)
	sh	$3,9162($20)
$L166:
	lb	$7,9463($17)
	bltz	$7,$L163
	li	$9,131072			# 0x20000

	ori	$4,$9,0x2216
	addu	$4,$20,$4
	lh	$5,9166($20)
	lh	$6,0($4)
	srl	$3,$5,31
	srl	$2,$6,31
	addu	$3,$3,$5
	addu	$2,$2,$6
	sll	$5,$7,1
	sra	$3,$3,1
	sra	$2,$2,1
	sh	$2,0($4)
	sb	$5,9463($17)
	sh	$3,9166($20)
$L163:
	lw	$13,200($sp)
$L245:
	bne	$13,$0,$L246
	lw	$3,204($sp)

	lb	$7,9464($17)
	bltz	$7,$L246
	li	$2,131072			# 0x20000

	ori	$4,$2,0x221a
	addu	$4,$20,$4
	lh	$5,9170($20)
	lh	$6,0($4)
	srl	$3,$5,31
	srl	$2,$6,31
	addu	$3,$3,$5
	addu	$2,$2,$6
	sll	$5,$7,1
	sra	$3,$3,1
	sra	$2,$2,1
	sh	$2,0($4)
	sb	$5,9464($17)
	sh	$3,9170($20)
	lw	$3,204($sp)
$L246:
	bne	$3,$0,$L247
	lw	$7,128($sp)

	lb	$7,9467($17)
	bltz	$7,$L169
	nop

	li	$5,131072			# 0x20000
	ori	$4,$5,0x2226
	addu	$4,$20,$4
	lh	$5,9182($20)
	lh	$6,0($4)
	srl	$3,$5,31
	srl	$2,$6,31
	addu	$3,$3,$5
	addu	$2,$2,$6
	sll	$5,$7,1
	sra	$3,$3,1
	sra	$2,$2,1
	sh	$2,0($4)
	sb	$5,9467($17)
	sh	$3,9182($20)
$L169:
	lb	$7,9475($17)
	bltz	$7,$L168
	nop

	li	$6,131072			# 0x20000
	ori	$4,$6,0x2246
	addu	$4,$20,$4
	lh	$5,9214($20)
	lh	$6,0($4)
	srl	$3,$5,31
	srl	$2,$6,31
	addu	$3,$3,$5
	addu	$2,$2,$6
	sll	$5,$7,1
	sra	$3,$3,1
	sra	$2,$2,1
	sh	$2,0($4)
	sb	$5,9475($17)
	sh	$3,9214($20)
$L168:
	lw	$7,128($sp)
$L247:
	bne	$7,$0,$L125
	nop

	lb	$7,9483($17)
	bltz	$7,$L170
	nop

	li	$8,131072			# 0x20000
	ori	$4,$8,0x2266
	addu	$4,$20,$4
	lh	$5,9246($20)
	lh	$6,0($4)
	srl	$3,$5,31
	srl	$2,$6,31
	addu	$3,$3,$5
	addu	$2,$2,$6
	sll	$5,$7,1
	sra	$3,$3,1
	sra	$2,$2,1
	sh	$2,0($4)
	sb	$5,9483($17)
	sh	$3,9246($20)
$L170:
	lb	$7,9491($17)
	bltz	$7,$L243
	lw	$13,188($sp)

	li	$9,131072			# 0x20000
	ori	$9,$9,0x2286
	addu	$6,$20,$9
	lh	$4,9278($20)
	lh	$5,0($6)
	srl	$3,$4,31
	srl	$2,$5,31
	addu	$3,$3,$4
	addu	$2,$2,$5
	sll	$4,$7,1
	sra	$3,$3,1
	sra	$2,$2,1
	sh	$2,0($6)
	sb	$4,9491($17)
	b	$L125
	sh	$3,9278($20)

$L110:
	beq	$9,$0,$L113
	li	$2,64			# 0x40

	bne	$13,$0,$L113
	nop

	move	$2,$0
$L113:
	sb	$2,9112($6)
	sb	$2,9088($6)
	sb	$2,9091($7)
	b	$L111
	sb	$2,9099($7)

$L130:
	sw	$0,0($12)
	sw	$0,0($13)
	sb	$3,0($10)
	b	$L131
	sb	$3,8($10)

$L213:
	lw	$9,188($sp)
	lw	$2,5356($9)
	bne	$2,$0,$L248
	nop

$L135:
	lw	$13,188($sp)
	lw	$2,-6276($13)
	beq	$2,$0,$L238
	lw	$3,96($sp)

	lw	$3,124($sp)
	and	$2,$18,$3
	bne	$2,$0,$L249
	lw	$5,84($sp)

	addiu	$2,$25,3
$L239:
	sll	$2,$2,2
	lw	$7,212($sp)
	addu	$2,$19,$2
	sw	$0,0($2)
	sb	$7,9459($17)
	lw	$8,116($sp)
	and	$2,$18,$8
	bne	$2,$0,$L215
	sll	$2,$16,1

$L240:
	addu	$2,$2,$21
	subu	$2,$0,$2
	addiu	$2,$2,1
	sll	$2,$2,2
	subu	$2,$0,$2
	addiu	$2,$2,12
	sll	$2,$2,2
	lw	$13,208($sp)
	addu	$2,$19,$2
	sw	$0,0($2)
	b	$L142
	sb	$13,9464($17)

$L115:
	lw	$5,120($sp)
	beq	$5,$0,$L117
	li	$5,131072			# 0x20000

	addu	$5,$24,$5
	lw	$2,8660($5)
	sll	$3,$12,1
	addu	$2,$2,$3
	lhu	$4,0($2)
	sw	$4,8668($5)
$L118:
	lw	$6,16($sp)
	beq	$6,$0,$L120
	sw	$6,56($sp)

	li	$6,131072			# 0x20000
	addu	$6,$24,$6
	lw	$4,8660($6)
	sll	$2,$15,1
	addu	$4,$4,$2
	lw	$2,24($sp)
	li	$5,-2			# 0xfffffffffffffffe
	lhu	$3,0($4)
	and	$2,$2,$5
	addiu	$2,$2,1
	sra	$2,$3,$2
	andi	$2,$2,0x1
	sll	$2,$2,1
	andi	$3,$3,0x1f0
	or	$2,$2,$3
	sw	$2,8672($6)
$L121:
	lw	$2,20($sp)
	beq	$2,$0,$L250
	lw	$7,268($sp)

	li	$6,131072			# 0x20000
	addu	$6,$24,$6
	lw	$4,8660($6)
	sll	$2,$14,1
	lw	$3,32($sp)
	addu	$4,$4,$2
	li	$5,-2			# 0xfffffffffffffffe
	and	$3,$3,$5
	lhu	$2,0($4)
	addiu	$3,$3,1
	sra	$2,$2,$3
	andi	$2,$2,0x1
	lw	$3,8672($6)
	sll	$2,$2,3
	or	$2,$2,$3
	b	$L116
	sw	$2,8672($6)

$L126:
	sll	$fp,$16,2
	addu	$2,$fp,$16
	subu	$2,$0,$2
	addiu	$2,$2,1
	sll	$3,$16,5
	sll	$2,$2,3
	sll	$21,$16,3
	addu	$25,$21,$3
	subu	$2,$0,$2
	addiu	$2,$2,12
	sw	$3,176($sp)
	addiu	$4,$25,6
	addiu	$3,$25,7
	addiu	$5,$25,5
	lw	$8,120($sp)
	li	$9,-16908288			# 0xfffffffffefe0000
	lw	$13,88($sp)
	sll	$6,$2,2
	sll	$3,$3,2
	sll	$4,$4,2
	sll	$5,$5,2
	li	$7,-1			# 0xffffffffffffffff
	ori	$9,$9,0xfefe
	addu	$3,$19,$3
	addu	$4,$19,$4
	addu	$5,$19,$5
	addu	$6,$19,$6
	movz	$7,$9,$8
	addu	$2,$13,$2
	sw	$0,0($3)
	sw	$0,0($4)
	sw	$0,0($5)
	sw	$0,0($6)
	b	$L127
	sw	$7,0($2)

$L201:
	andi	$2,$7,0x1
	beq	$2,$0,$L95
	lw	$8,120($sp)

	lw	$4,8816($24)
	sll	$2,$12,3
	addu	$4,$4,$2
	lbu	$3,4($4)
	sb	$3,8780($24)
	lbu	$2,5($4)
	sb	$2,8781($24)
	lbu	$3,6($4)
	sb	$3,8782($24)
	lbu	$2,3($4)
	sb	$2,8783($24)
$L96:
	addiu	$2,$sp,16
	sw	$2,168($sp)
	lw	$3,168($sp)
	move	$5,$0
	addu	$2,$3,$5
	lw	$2,0($2)
	addiu	$9,$sp,24
	sw	$9,172($sp)
	move	$7,$9
	andi	$3,$2,0x1
	addiu	$9,$sp,8
	move	$6,$24
	li	$8,8			# 0x8
	beq	$3,$0,$L100
	addu	$4,$9,$5

$L216:
	lw	$3,0($4)
	lw	$4,8816($24)
	lw	$2,0($7)
	sll	$3,$3,3
	addu	$4,$4,$3
	addu	$2,$4,$2
	lbu	$3,0($2)
	sb	$3,8787($6)
	lw	$2,4($7)
	addu	$4,$4,$2
	lbu	$3,0($4)
	sb	$3,8795($6)
$L101:
	addiu	$5,$5,4
	addiu	$7,$7,8
	beq	$5,$8,$L83
	addiu	$6,$6,16

	lw	$3,168($sp)
	addu	$2,$3,$5
	lw	$2,0($2)
	andi	$3,$2,0x1
	bne	$3,$0,$L216
	addu	$4,$9,$5

$L100:
	beq	$2,$0,$L102
	andi	$3,$2,0x78

	beq	$3,$0,$L251
	li	$2,2			# 0x2

	lw	$2,11860($24)
	beq	$2,$0,$L103
	li	$2,2			# 0x2

$L102:
	li	$2,-1			# 0xffffffffffffffff
	sb	$2,8787($6)
	b	$L101
	sb	$2,8795($6)

$L42:
	beq	$7,$0,$L217
	nop

$L46:
	beq	$7,$0,$L218
	srl	$2,$3,7

$L50:
	bne	$7,$0,$L252
	srl	$2,$5,7

	srl	$2,$4,7
	b	$L51
	andi	$4,$2,0x1

$L63:
	lw	$3,268($sp)
	andi	$13,$3,0x7
	bne	$13,$0,$L219
	sll	$3,$11,4

	lw	$2,9128($24)
	addu	$2,$2,$3
	lhu	$6,14($2)
	lui	$3,%hi(scan8)
	addiu	$8,$3,%lo(scan8)
	move	$5,$0
	li	$7,16			# 0x10
$L67:
	addu	$2,$8,$5
	lbu	$4,0($2)
	sra	$3,$6,$5
	addu	$4,$24,$4
	andi	$3,$3,0x1
	addiu	$5,$5,1
	bne	$5,$7,$L67
	sb	$3,9080($4)

	li	$2,65536			# 0x10000
	addu	$2,$24,$2
	lw	$3,5944($2)
	beq	$3,$0,$L68
	move	$9,$0

	sll	$22,$11,2
	move	$25,$2
	addiu	$21,$24,9136
	addiu	$19,$24,9456
	move	$10,$24
	move	$6,$0
	li	$fp,12288			# 0x3000
	li	$20,-1			# 0xffffffffffffffff
	li	$23,4			# 0x4
$L72:
	sll	$2,$9,1
	lw	$4,268($sp)
	sll	$2,$fp,$2
	and	$2,$2,$4
	beq	$2,$0,$L69
	sll	$2,$6,5

	lw	$3,9740($24)
	lw	$4,9744($24)
	sll	$5,$6,5
	sll	$2,$6,3
	addu	$3,$3,$22
	addu	$18,$2,$5
	lw	$6,0($3)
	addu	$4,$4,$22
	lw	$7,0($4)
	lw	$5,1560($10)
	addiu	$11,$18,12
	lw	$3,1652($10)
	sll	$6,$6,2
	sll	$2,$11,2
	addu	$5,$5,$6
	addu	$8,$3,$7
	addu	$6,$21,$2
	move	$7,$0
$L70:
	lw	$3,0($5)
	addiu	$7,$7,1
	sw	$3,0($6)
	lw	$2,4($5)
	sw	$2,4($6)
	lw	$3,8($5)
	sw	$3,8($6)
	lw	$4,12($5)
	sw	$4,12($6)
	lw	$2,9748($24)
	addiu	$6,$6,32
	sll	$2,$2,2
	bne	$7,$23,$L70
	addu	$5,$5,$2

	lb	$3,1($8)
	lb	$2,0($8)
	sll	$3,$3,16
	andi	$2,$2,0xffff
	addu	$3,$3,$2
	sll	$4,$3,8
	addu	$4,$4,$3
	addu	$5,$19,$18
	addu	$3,$19,$11
	sw	$4,20($5)
	sw	$4,0($3)
	lw	$2,9752($24)
	addu	$2,$8,$2
	lb	$4,0($2)
	lb	$3,1($2)
	andi	$4,$4,0xffff
	sll	$3,$3,16
	addu	$3,$3,$4
	sll	$2,$3,8
	addu	$2,$2,$3
	sw	$2,28($5)
	sw	$2,36($5)
$L71:
	lw	$2,5944($25)
	addiu	$9,$9,1
	sltu	$2,$9,$2
	addiu	$10,$10,4
	bne	$2,$0,$L72
	move	$6,$9

$L68:
	sw	$0,124($sp)
	b	$L202
	sw	$0,116($sp)

$L120:
	beq	$13,$0,$L122
	li	$2,131072			# 0x20000

	addu	$2,$24,$2
	li	$3,448			# 0x1c0
	b	$L121
	sw	$3,8672($2)

$L117:
	beq	$13,$0,$L119
	li	$2,131072			# 0x20000

	addu	$2,$24,$2
	li	$3,448			# 0x1c0
	b	$L118
	sw	$3,8668($2)

$L54:
	addu	$2,$2,$8
	sw	$2,12($sp)
	lw	$15,8($sp)
	lw	$14,12($sp)
	li	$3,2			# 0x2
	li	$4,10			# 0xa
	li	$2,7			# 0x7
	sw	$2,48($sp)
	sw	$3,36($sp)
	sw	$4,52($sp)
	sw	$3,28($sp)
	sw	$0,32($sp)
	sw	$4,44($sp)
	sw	$12,8764($24)
	sw	$15,8768($24)
	sw	$14,8772($24)
	lw	$2,272($sp)
	beq	$2,$0,$L56
	li	$2,65536			# 0x10000

	b	$L259
	addu	$2,$24,$2

$L208:
	lw	$2,11860($24)
	beq	$2,$0,$L231
	lw	$9,124($sp)

	b	$L225
	lw	$2,8980($24)

$L87:
	lw	$2,11860($24)
	bne	$2,$0,$L88
	lw	$3,20($sp)

	b	$L260
	andi	$2,$3,0x7

$L207:
	lw	$2,11860($24)
	beq	$2,$0,$L253
	lw	$3,16($sp)

	b	$L227
	li	$2,46079			# 0xb3ff

$L209:
	lw	$2,11860($24)
	beq	$2,$0,$L232
	lw	$3,116($sp)

	b	$L228
	lw	$2,8980($24)

$L217:
	srl	$2,$2,7
	b	$L43
	andi	$6,$2,0x1

$L218:
	b	$L47
	andi	$3,$2,0x1

$L219:
	sw	$0,124($sp)
	b	$L66
	sw	$0,116($sp)

$L210:
	lw	$2,11860($24)
	beq	$2,$0,$L233
	lw	$4,268($sp)

	b	$L229
	lw	$2,8988($24)

$L95:
	beq	$8,$0,$L99
	li	$2,-1			# 0xffffffffffffffff

	andi	$2,$8,0x78
	bne	$2,$0,$L221
	li	$2,2			# 0x2

	b	$L99
	nop

$L119:
	addu	$2,$24,$2
	b	$L118
	sw	$0,8668($2)

$L122:
	addu	$2,$24,$2
	b	$L121
	sw	$0,8672($2)

$L103:
$L251:
	sb	$2,8787($6)
	b	$L101
	sb	$2,8795($6)

$L79:
	lw	$2,1568($24)
	sll	$3,$15,2
	addu	$2,$2,$3
	lw	$6,0($2)
	addu	$2,$5,$14
	lbu	$3,0($2)
	bne	$4,$3,$L254
	move	$2,$0

$L81:
	lw	$2,1568($24)
	sll	$3,$14,2
	addu	$2,$2,$3
	lw	$2,0($2)
	sw	$6,16($sp)
	b	$L223
	sw	$2,20($sp)

$L77:
	lw	$2,1568($24)
	addu	$2,$2,$3
	lw	$2,0($2)
	b	$L78
	sw	$2,116($sp)

$L75:
	lw	$2,1568($24)
	addu	$2,$2,$3
	lw	$2,0($2)
	b	$L76
	sw	$2,120($sp)

$L73:
	lw	$2,1568($24)
	addu	$2,$2,$3
	lw	$2,0($2)
	b	$L74
	sw	$2,124($sp)

$L206:
	b	$L62
	move	$4,$0

$L205:
	b	$L60
	move	$2,$0

$L204:
	b	$L58
	sw	$0,120($sp)

$L69:
	sll	$3,$6,3
	addu	$3,$3,$2
	addiu	$3,$3,12
	sll	$2,$3,2
	addu	$2,$21,$2
	addu	$3,$19,$3
	sw	$0,108($2)
	sw	$0,0($2)
	sw	$0,4($2)
	sw	$0,8($2)
	sw	$0,12($2)
	sw	$0,32($2)
	sw	$0,36($2)
	sw	$0,40($2)
	sw	$0,44($2)
	sw	$0,64($2)
	sw	$0,68($2)
	sw	$0,72($2)
	sw	$0,76($2)
	sw	$0,96($2)
	sw	$0,100($2)
	sw	$0,104($2)
	sw	$20,24($3)
	sw	$20,0($3)
	sw	$20,8($3)
	b	$L71
	sw	$20,16($3)

$L161:
	beq	$13,$0,$L255
	lw	$3,196($sp)

	lb	$5,9459($17)
	bltz	$5,$L255
	li	$2,131072			# 0x20000

	ori	$3,$2,0x2206
	addu	$3,$20,$3
	lh	$4,9150($20)
	lh	$2,0($3)
	sra	$5,$5,1
	sll	$4,$4,1
	sll	$2,$2,1
	sh	$2,0($3)
	sb	$5,9459($17)
	sh	$4,9150($20)
	lw	$3,196($sp)
$L255:
	beq	$3,$0,$L256
	lw	$9,200($sp)

	lb	$5,9460($17)
	bltz	$5,$L173
	li	$4,131072			# 0x20000

	ori	$3,$4,0x220a
	addu	$3,$20,$3
	lh	$4,9154($20)
	lh	$2,0($3)
	sra	$5,$5,1
	sll	$4,$4,1
	sll	$2,$2,1
	sh	$2,0($3)
	sb	$5,9460($17)
	sh	$4,9154($20)
$L173:
	lb	$5,9461($17)
	bltz	$5,$L174
	li	$6,131072			# 0x20000

	ori	$3,$6,0x220e
	addu	$3,$20,$3
	lh	$4,9158($20)
	lh	$2,0($3)
	sra	$5,$5,1
	sll	$4,$4,1
	sll	$2,$2,1
	sh	$2,0($3)
	sb	$5,9461($17)
	sh	$4,9158($20)
$L174:
	lb	$5,9462($17)
	bltz	$5,$L175
	li	$7,131072			# 0x20000

	ori	$3,$7,0x2212
	addu	$3,$20,$3
	lh	$4,9162($20)
	lh	$2,0($3)
	sra	$5,$5,1
	sll	$4,$4,1
	sll	$2,$2,1
	sh	$2,0($3)
	sb	$5,9462($17)
	sh	$4,9162($20)
$L175:
	lb	$5,9463($17)
	bltz	$5,$L172
	li	$8,131072			# 0x20000

	ori	$3,$8,0x2216
	addu	$3,$20,$3
	lh	$4,9166($20)
	lh	$2,0($3)
	sra	$5,$5,1
	sll	$4,$4,1
	sll	$2,$2,1
	sh	$2,0($3)
	sb	$5,9463($17)
	sh	$4,9166($20)
$L172:
	lw	$9,200($sp)
$L256:
	beq	$9,$0,$L257
	lw	$2,204($sp)

	lb	$5,9464($17)
	bltz	$5,$L257
	li	$13,131072			# 0x20000

	ori	$3,$13,0x221a
	addu	$3,$20,$3
	lh	$4,9170($20)
	lh	$2,0($3)
	sra	$5,$5,1
	sll	$4,$4,1
	sll	$2,$2,1
	sh	$2,0($3)
	sb	$5,9464($17)
	sh	$4,9170($20)
	lw	$2,204($sp)
$L257:
	beq	$2,$0,$L258
	lw	$7,128($sp)

	lb	$5,9467($17)
	bltz	$5,$L178
	li	$4,131072			# 0x20000

	ori	$3,$4,0x2226
	addu	$3,$20,$3
	lh	$4,9182($20)
	lh	$2,0($3)
	sra	$5,$5,1
	sll	$4,$4,1
	sll	$2,$2,1
	sh	$2,0($3)
	sb	$5,9467($17)
	sh	$4,9182($20)
$L178:
	lb	$5,9475($17)
	bltz	$5,$L177
	li	$6,131072			# 0x20000

	ori	$3,$6,0x2246
	addu	$3,$20,$3
	lh	$4,9214($20)
	lh	$2,0($3)
	sra	$5,$5,1
	sll	$4,$4,1
	sll	$2,$2,1
	sh	$2,0($3)
	sb	$5,9475($17)
	sh	$4,9214($20)
$L177:
	lw	$7,128($sp)
$L258:
	beq	$7,$0,$L243
	lw	$13,188($sp)

	lb	$5,9483($17)
	bltz	$5,$L179
	li	$8,131072			# 0x20000

	ori	$3,$8,0x2266
	addu	$3,$20,$3
	lh	$4,9246($20)
	lh	$2,0($3)
	sra	$5,$5,1
	sll	$4,$4,1
	sll	$2,$2,1
	sh	$2,0($3)
	sb	$5,9483($17)
	sh	$4,9246($20)
$L179:
	lb	$5,9491($17)
	bltz	$5,$L243
	lw	$13,188($sp)

	li	$9,131072			# 0x20000
	ori	$9,$9,0x2286
	addu	$4,$20,$9
	lh	$3,9278($20)
	lh	$2,0($4)
	sra	$5,$5,1
	sll	$3,$3,1
	sll	$2,$2,1
	sh	$2,0($4)
	sb	$5,9491($17)
	b	$L125
	sh	$3,9278($20)

$L149:
	lw	$5,160($sp)
	addu	$2,$21,$4
	addiu	$3,$8,19
	addiu	$2,$2,11
	sll	$3,$3,2
	sll	$2,$2,2
	addu	$3,$5,$3
	addu	$2,$5,$2
	sw	$0,0($3)
	b	$L150
	sw	$0,0($2)

$L147:
	subu	$2,$0,$2
	addiu	$2,$2,1
	sll	$2,$2,3
	subu	$2,$0,$2
	lw	$6,160($sp)
	addiu	$2,$2,12
	addiu	$3,$8,7
	addiu	$4,$8,6
	addiu	$5,$8,5
	sll	$3,$3,2
	sll	$4,$4,2
	sll	$5,$5,2
	sll	$2,$2,2
	addu	$3,$6,$3
	addu	$4,$6,$4
	addu	$5,$6,$5
	addu	$2,$6,$2
	sw	$0,0($3)
	addiu	$7,$8,12
	sw	$0,0($4)
	sw	$0,0($5)
	b	$L148
	sw	$0,0($2)

$L151:
	addiu	$2,$7,23
	lw	$7,160($sp)
	sll	$2,$2,2
	sll	$3,$3,2
	addu	$2,$7,$2
	addu	$3,$7,$3
	sw	$0,0($2)
	b	$L152
	sw	$0,0($3)

$L55:
	li	$3,7			# 0x7
	li	$4,10			# 0xa
	sw	$2,36($sp)
	sw	$3,48($sp)
	sw	$4,52($sp)
	sw	$0,24($sp)
	sw	$0,28($sp)
	sw	$2,32($sp)
	sw	$3,40($sp)
	b	$L41
	sw	$4,44($sp)

$L221:
	lw	$2,11860($24)
	beq	$2,$0,$L99
	li	$2,2			# 0x2

	li	$2,-1			# 0xffffffffffffffff
$L99:
	sb	$2,8780($24)
	sb	$2,8783($24)
	sb	$2,8782($24)
	b	$L96
	sb	$2,8781($24)

$L153:
	lw	$9,120($sp)
	andi	$2,$9,0x40
	beq	$2,$0,$L155
	lw	$4,148($sp)

	lw	$3,92($sp)
	lw	$2,9744($24)
	li	$13,131072			# 0x20000
	addu	$2,$2,$3
	lw	$3,0($2)
	addu	$5,$24,$13
	lw	$4,9752($24)
	lw	$2,9016($5)
	addu	$3,$3,$4
	addu	$2,$2,$3
	lbu	$4,0($2)
	sb	$4,9024($5)
	lbu	$3,1($2)
	b	$L154
	sb	$3,9026($5)

$L159:
	beq	$2,$0,$L160
	li	$8,131072			# 0x20000

	li	$3,131072			# 0x20000
	addu	$6,$24,$3
	lw	$7,64($sp)
	lw	$3,132($sp)
	lw	$2,9752($24)
	lw	$4,9744($24)
	lw	$5,9016($6)
	addu	$4,$4,$7
	mul	$7,$3,$2
	lw	$3,0($4)
	addu	$2,$7,$5
	addu	$2,$2,$3
	lbu	$4,1($2)
	b	$L146
	sb	$4,9047($6)

$L156:
	andi	$2,$7,0x40
	beq	$2,$0,$L158
	li	$8,131072			# 0x20000

	lw	$3,144($sp)
	lw	$2,9752($24)
	lw	$9,76($sp)
	mul	$7,$3,$2
	lw	$4,9744($24)
	addu	$6,$24,$8
	addu	$4,$4,$9
	lw	$5,9016($6)
	lw	$3,0($4)
	addu	$2,$7,$5
	addu	$2,$2,$3
	lbu	$4,1($2)
	b	$L157
	sb	$4,9031($6)

$L155:
	b	$L154
	sw	$0,0($4)

$L160:
	addu	$2,$24,$8
	b	$L146
	sb	$0,9047($2)

$L158:
	addu	$2,$24,$8
	b	$L157
	sb	$0,9031($2)

	.set	macro
	.set	reorder
	.end	fill_caches
	.align	2
	.ent	write_back_motion
	.type	write_back_motion, @function
write_back_motion:
	.set	nomips16
	.frame	$sp,56,$31		# vars= 8, regs= 9/0, args= 0, gp= 8
	.mask	0x40ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-56
	sw	$fp,52($sp)
	sw	$23,48($sp)
	sw	$22,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	.cprestore	0
	lw	$2,6172($4)
	lw	$7,9752($4)
	lw	$8,6168($4)
	lw	$6,9748($4)
	move	$11,$4
	mul	$4,$2,$7
	move	$16,$5
	addu	$3,$4,$8
	andi	$4,$5,0x3000
	mul	$5,$2,$6
	sll	$25,$3,1
	addu	$2,$5,$8
	sll	$2,$2,2
	bne	$4,$0,$L262
	sw	$2,8($sp)

	lw	$2,1652($11)
	li	$4,-1
	addu	$2,$2,$25
	addu	$3,$2,$7
	sh	$4,0($2)
	sh	$4,0($3)
$L262:
	li	$2,65536			# 0x10000
	addu	$4,$11,$2
	lw	$3,5944($4)
	beq	$3,$0,$L263
	li	$2,131072			# 0x20000

	lw	$14,8($sp)
	ori	$3,$2,0x21ec
	ori	$2,$2,0x21f8
	addu	$15,$11,$3
	addu	$22,$11,$2
	move	$18,$4
	addiu	$19,$11,9136
	sll	$23,$14,2
	move	$12,$11
	move	$13,$11
	move	$10,$0
	move	$3,$0
	li	$20,12288			# 0x3000
	addiu	$24,$14,2
	li	$17,4			# 0x4
	andi	$21,$16,0x800
$L270:
	sll	$2,$10,1
	sll	$2,$20,$2
	and	$2,$2,$16
	beq	$2,$0,$L264
	sll	$2,$3,2

	addu	$2,$2,$3
	lw	$9,9748($11)
	sll	$14,$2,5
	lw	$8,1560($13)
	move	$2,$9
	addu	$7,$19,$14
	move	$6,$0
$L266:
	lw	$3,8($sp)
	lw	$4,48($7)
	mtlo	$3
	madd	$2,$6
	lw	$5,52($7)
	mflo	$2
	mul	$fp,$6,$9
	sll	$2,$2,2
	addu	$2,$8,$2
	sw	$4,0($2)
	sw	$5,4($2)
	addu	$3,$fp,$24
	lw	$4,56($7)
	lw	$5,60($7)
	sll	$3,$3,2
	addu	$3,$8,$3
	addiu	$6,$6,1
	move	$2,$9
	sw	$4,0($3)
	sw	$5,4($3)
	bne	$6,$17,$L266
	addiu	$7,$7,32

	lw	$2,11808($11)
	beq	$2,$0,$L267
	nop

	bne	$21,$0,$L274
	sll	$3,$9,2

	lw	$8,0($15)
	addu	$7,$22,$14
	move	$2,$9
	move	$6,$0
$L269:
	lw	$3,8($sp)
	lw	$4,48($7)
	mtlo	$3
	madd	$2,$6
	lw	$5,52($7)
	mflo	$2
	mul	$14,$6,$9
	sll	$2,$2,2
	addu	$2,$8,$2
	sw	$4,0($2)
	sw	$5,4($2)
	addu	$3,$14,$24
	lw	$4,56($7)
	lw	$5,60($7)
	sll	$3,$3,2
	addu	$3,$8,$3
	addiu	$6,$6,1
	move	$2,$9
	sw	$4,0($3)
	sw	$5,4($3)
	bne	$6,$17,$L269
	addiu	$7,$7,32

$L267:
	lw	$3,1652($13)
	lbu	$2,9468($12)
	addu	$3,$3,$25
	sb	$2,0($3)
	lbu	$4,9470($12)
	sb	$4,1($3)
	lw	$2,9752($11)
	lbu	$4,9484($12)
	addu	$2,$3,$2
	sb	$4,0($2)
	lw	$5,9752($11)
	lbu	$2,9486($12)
	addu	$3,$3,$5
	sb	$2,1($3)
$L264:
	lw	$2,5944($18)
	addiu	$10,$10,1
	sltu	$2,$10,$2
	addiu	$13,$13,4
	addiu	$12,$12,40
	addiu	$15,$15,4
	bne	$2,$0,$L270
	move	$3,$10

$L263:
	li	$2,65536			# 0x10000
	addu	$6,$11,$2
	lw	$3,-6284($6)
	li	$2,3			# 0x3
	beq	$3,$2,$L275
	nop

$L272:
	lw	$fp,52($sp)
	lw	$23,48($sp)
	lw	$22,44($sp)
	lw	$21,40($sp)
	lw	$20,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	j	$31
	addiu	$sp,$sp,56

$L274:
	lw	$2,0($15)
	addiu	$6,$3,4
	sll	$9,$9,3
	addiu	$4,$3,2
	addiu	$7,$3,6
	addu	$2,$2,$23
	addu	$5,$9,$3
	sll	$8,$6,1
	sll	$4,$4,1
	sll	$7,$7,1
	addu	$5,$2,$5
	addu	$3,$2,$3
	addu	$4,$2,$4
	addu	$8,$2,$8
	addu	$7,$2,$7
	addu	$6,$2,$6
	addu	$9,$2,$9
	sw	$0,0($2)
	sw	$0,4($2)
	sw	$0,8($2)
	sw	$0,12($2)
	sw	$0,0($3)
	sw	$0,0($6)
	sw	$0,12($3)
	sw	$0,8($3)
	sw	$0,0($9)
	lw	$3,1652($13)
	sw	$0,0($4)
	sw	$0,0($8)
	sw	$0,0($7)
	sw	$0,12($5)
	sw	$0,0($5)
	sw	$0,4($5)
	sw	$0,8($5)
	lbu	$2,9468($12)
	addu	$3,$3,$25
	sb	$2,0($3)
	lbu	$4,9470($12)
	sb	$4,1($3)
	lw	$2,9752($11)
	lbu	$4,9484($12)
	addu	$2,$3,$2
	sb	$4,0($2)
	lw	$5,9752($11)
	lbu	$2,9486($12)
	addu	$3,$3,$5
	b	$L264
	sb	$2,1($3)

$L275:
	lw	$2,11808($11)
	beq	$2,$0,$L272
	andi	$2,$16,0x40

	beq	$2,$0,$L272
	li	$2,131072			# 0x20000

	lw	$3,-6260($6)
	addu	$2,$11,$2
	lw	$5,9016($2)
	srl	$3,$3,8
	addu	$5,$5,$25
	andi	$3,$3,0x1
	sb	$3,1($5)
	lw	$2,-6256($6)
	lw	$4,9752($11)
	srl	$2,$2,8
	addu	$4,$5,$4
	andi	$2,$2,0x1
	sb	$2,0($4)
	lw	$3,-6252($6)
	lw	$2,9752($11)
	srl	$3,$3,8
	addu	$5,$5,$2
	andi	$3,$3,0x1
	sb	$3,1($5)
	lw	$fp,52($sp)
	lw	$23,48($sp)
	lw	$22,44($sp)
	lw	$21,40($sp)
	lw	$20,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	j	$31
	addiu	$sp,$sp,56

	.set	macro
	.set	reorder
	.end	write_back_motion
	.align	2
	.ent	xchg_mb_border
	.type	xchg_mb_border, @function
xchg_mb_border:
	.set	nomips16
	.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
	.mask	0x00030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	li	$2,65536			# 0x10000
	move	$13,$4
	addu	$4,$4,$2
	lw	$3,5340($4)
	addiu	$sp,$sp,-8
	li	$2,2			# 0x2
	sw	$17,4($sp)
	sw	$16,0($sp)
	move	$9,$5
	move	$16,$6
	move	$17,$7
	lw	$8,24($sp)
	lw	$11,28($sp)
	beq	$3,$2,$L295
	lw	$12,32($sp)

	lw	$2,6168($13)
	lw	$3,6172($13)
	slt	$24,$0,$2
	slt	$25,$0,$3
$L278:
	nor	$2,$0,$8
	beq	$24,$0,$L279
	addu	$9,$9,$2

	sltu	$5,$25,1
	mul	$3,$5,$8
	addu	$2,$13,$5
	addu	$4,$3,$9
	addiu	$3,$2,9004
$L282:
	addiu	$5,$5,1
	slt	$7,$5,17
	beq	$12,$0,$L281
	lbu	$6,0($3)

	lbu	$2,0($4)
	sb	$2,0($3)
$L281:
	sb	$6,0($4)
	addiu	$3,$3,1
	bne	$7,$0,$L282
	addu	$4,$4,$8

$L279:
	beq	$25,$0,$L297
	lw	$2,36($sp)

	lw	$6,6168($13)
	lw	$10,8996($13)
	sll	$2,$6,5
	addu	$4,$10,$2
	lw	$14,0($4)
	bne	$12,$0,$L284
	lw	$15,4($4)

	addiu	$5,$9,1
$L285:
	sll	$4,$6,5
	addiu	$4,$4,8
	sw	$14,0($5)
	sw	$15,4($5)
	addu	$4,$10,$4
	lw	$5,144($13)
	lw	$7,4($4)
	lw	$2,9($9)
	lw	$3,13($9)
	addiu	$8,$6,1
	lw	$6,0($4)
	slt	$5,$8,$5
	sw	$2,0($4)
	sw	$3,4($4)
	sw	$6,9($9)
	beq	$5,$0,$L283
	sw	$7,13($9)

	sll	$2,$8,5
	addu	$2,$10,$2
	lw	$6,0($2)
	lw	$7,4($2)
	lw	$4,17($9)
	lw	$5,21($9)
	sw	$4,0($2)
	sw	$5,4($2)
	sw	$6,17($9)
	sw	$7,21($9)
$L283:
	lw	$2,36($sp)
$L297:
	bne	$2,$0,$L298
	nor	$2,$0,$11

	lw	$2,56($13)
	andi	$2,$2,0x2000
	bne	$2,$0,$L292
	nor	$2,$0,$11

$L298:
	addu	$10,$17,$2
	beq	$24,$0,$L288
	addu	$14,$16,$2

	sltu	$8,$25,1
	mul	$7,$8,$11
	addu	$2,$13,$8
	addu	$9,$10,$7
	addiu	$3,$2,9030
	addu	$5,$14,$7
	b	$L290
	move	$6,$9

$L296:
	lbu	$2,0($5)
	addiu	$8,$8,1
	sb	$2,-9($3)
	sb	$4,0($5)
	lbu	$2,0($6)
	lbu	$4,0($3)
	addu	$7,$7,$11
	sb	$2,0($3)
	slt	$2,$8,9
	sb	$4,0($9)
	addu	$5,$5,$11
	addu	$9,$10,$7
	addiu	$3,$3,1
	beq	$2,$0,$L288
	addu	$6,$6,$11

$L290:
	bne	$12,$0,$L296
	lbu	$4,-9($3)

	sb	$4,0($5)
	lbu	$4,0($3)
	addiu	$8,$8,1
	addu	$7,$7,$11
	slt	$2,$8,9
	sb	$4,0($9)
	addu	$5,$5,$11
	addu	$9,$10,$7
	addiu	$3,$3,1
	bne	$2,$0,$L290
	addu	$6,$6,$11

$L288:
	beq	$25,$0,$L299
	lw	$17,4($sp)

	lw	$3,6168($13)
	lw	$8,8996($13)
	sll	$2,$3,5
	addiu	$2,$2,16
	addu	$2,$8,$2
	lw	$6,0($2)
	lw	$7,4($2)
	lw	$4,1($14)
	lw	$5,5($14)
	sll	$3,$3,5
	addiu	$3,$3,24
	sw	$4,0($2)
	sw	$5,4($2)
	addu	$8,$8,$3
	sw	$6,1($14)
	sw	$7,5($14)
	lw	$4,0($8)
	lw	$5,4($8)
	lw	$2,1($10)
	lw	$3,5($10)
	sw	$2,0($8)
	sw	$3,4($8)
	sw	$4,1($10)
	sw	$5,5($10)
$L292:
	lw	$17,4($sp)
$L299:
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,8

$L284:
	lw	$2,1($9)
	lw	$3,5($9)
	addiu	$5,$9,1
	sw	$2,0($4)
	b	$L285
	sw	$3,4($4)

$L295:
	lw	$6,152($13)
	lw	$5,6172($13)
	lw	$2,-6288($4)
	mul	$4,$6,$5
	lw	$3,6168($13)
	addu	$6,$4,$3
	lw	$4,8764($13)
	addu	$6,$2,$6
	addu	$2,$2,$4
	lbu	$5,0($6)
	lbu	$3,-1($6)
	lbu	$4,0($2)
	xor	$3,$3,$5
	xor	$4,$4,$5
	sltu	$24,$3,1
	b	$L278
	sltu	$25,$4,1

	.set	macro
	.set	reorder
	.end	xchg_mb_border
	.align	2
	.ent	xchg_pair_border
	.type	xchg_pair_border, @function
xchg_pair_border:
	.set	nomips16
	.frame	$sp,16,$31		# vars= 0, regs= 4/0, args= 0, gp= 0
	.mask	0x000f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	move	$24,$4
	lw	$10,32($sp)
	lw	$4,6168($4)
	lw	$3,6172($24)
	sll	$2,$10,1
	sw	$17,4($sp)
	slt	$3,$3,2
	nor	$2,$0,$2
	slt	$17,$0,$4
	sw	$19,12($sp)
	sw	$18,8($sp)
	sw	$16,0($sp)
	addu	$11,$5,$2
	move	$18,$6
	move	$19,$7
	xori	$16,$3,0x1
	lw	$13,36($sp)
	beq	$17,$0,$L301
	lw	$12,40($sp)

	li	$2,2			# 0x2
	move	$5,$0
	movz	$5,$2,$16
	mul	$2,$5,$10
	addu	$3,$24,$5
	addu	$4,$2,$11
	addiu	$3,$3,9004
$L306:
	addiu	$5,$5,1
	slt	$7,$5,34
	beq	$12,$0,$L305
	lbu	$6,0($3)

	lbu	$2,0($4)
	sb	$2,0($3)
$L305:
	sb	$6,0($4)
	addiu	$3,$3,1
	bne	$7,$0,$L306
	addu	$4,$4,$10

$L301:
	beq	$16,$0,$L307
	nop

	lw	$14,6168($24)
	lw	$25,8996($24)
	sll	$2,$14,5
	addu	$4,$25,$2
	lw	$6,0($4)
	bne	$12,$0,$L308
	lw	$7,4($4)

	addiu	$5,$11,1
$L309:
	sll	$2,$14,5
	addiu	$2,$2,8
	sw	$6,0($5)
	sw	$7,4($5)
	addu	$2,$25,$2
	lw	$6,0($2)
	lw	$7,4($2)
	lw	$4,9($11)
	lw	$5,13($11)
	lw	$15,9000($24)
	sll	$3,$14,5
	sw	$4,0($2)
	sw	$5,4($2)
	sw	$6,9($11)
	sw	$7,13($11)
	addu	$6,$15,$3
	lw	$8,0($6)
	bne	$12,$0,$L310
	lw	$9,4($6)

	addiu	$2,$10,1
	addu	$5,$11,$2
$L311:
	sll	$4,$14,5
	addiu	$4,$4,8
	addiu	$6,$10,9
	sw	$8,0($5)
	sw	$9,4($5)
	addu	$4,$15,$4
	addu	$6,$11,$6
	lw	$5,144($24)
	lw	$8,0($4)
	lw	$9,4($4)
	lw	$2,0($6)
	lw	$3,4($6)
	addiu	$7,$14,1
	slt	$5,$7,$5
	sw	$2,0($4)
	sw	$3,4($4)
	sw	$8,0($6)
	beq	$5,$0,$L307
	sw	$9,4($6)

	sll	$7,$7,5
	addu	$8,$25,$7
	lw	$4,0($8)
	lw	$5,4($8)
	lw	$2,17($11)
	lw	$3,21($11)
	addiu	$6,$10,17
	sw	$2,0($8)
	sw	$3,4($8)
	addu	$7,$15,$7
	sw	$4,17($11)
	sw	$5,21($11)
	addu	$6,$11,$6
	lw	$4,0($7)
	lw	$5,4($7)
	lw	$2,0($6)
	lw	$3,4($6)
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,0($6)
	sw	$5,4($6)
$L307:
	lw	$2,56($24)
	andi	$2,$2,0x2000
	bne	$2,$0,$L319
	sll	$2,$13,1

	nor	$2,$0,$2
	addu	$11,$19,$2
	beq	$17,$0,$L313
	addu	$14,$18,$2

	li	$2,2			# 0x2
	move	$8,$0
	movz	$8,$2,$16
	mul	$7,$8,$13
	addu	$2,$24,$8
	addu	$9,$11,$7
	addiu	$3,$2,9056
	addu	$5,$14,$7
	b	$L317
	move	$6,$9

$L322:
	lbu	$2,0($5)
	addiu	$8,$8,1
	sb	$2,-18($3)
	sb	$4,0($5)
	lbu	$2,0($6)
	lbu	$4,0($3)
	addu	$7,$7,$13
	sb	$2,0($3)
	slt	$2,$8,18
	sb	$4,0($9)
	addu	$5,$5,$13
	addu	$9,$11,$7
	addiu	$3,$3,1
	beq	$2,$0,$L313
	addu	$6,$6,$13

$L317:
	bne	$12,$0,$L322
	lbu	$4,-18($3)

	sb	$4,0($5)
	lbu	$4,0($3)
	addiu	$8,$8,1
	addu	$7,$7,$13
	slt	$2,$8,18
	sb	$4,0($9)
	addu	$5,$5,$13
	addu	$9,$11,$7
	addiu	$3,$3,1
	bne	$2,$0,$L317
	addu	$6,$6,$13

$L313:
	beq	$16,$0,$L323
	lw	$19,12($sp)

	lw	$5,6168($24)
	lw	$9,8996($24)
	sll	$4,$5,5
	addiu	$4,$4,16
	addu	$8,$9,$4
	lw	$6,0($8)
	lw	$7,4($8)
	lw	$2,1($14)
	lw	$3,5($14)
	sll	$5,$5,5
	addiu	$5,$5,24
	sw	$2,0($8)
	sw	$3,4($8)
	addu	$9,$9,$5
	sw	$6,1($14)
	sw	$7,5($14)
	lw	$6,0($9)
	lw	$7,4($9)
	lw	$2,1($11)
	lw	$3,5($11)
	lw	$10,9000($24)
	addiu	$8,$13,1
	sw	$2,0($9)
	sw	$3,4($9)
	addu	$4,$10,$4
	sw	$6,1($11)
	sw	$7,5($11)
	addu	$9,$14,$8
	lw	$6,0($4)
	lw	$7,4($4)
	lw	$2,0($9)
	lw	$3,4($9)
	addu	$10,$10,$5
	sw	$2,0($4)
	sw	$3,4($4)
	addu	$8,$11,$8
	sw	$6,0($9)
	sw	$7,4($9)
	lw	$5,4($10)
	lw	$2,0($8)
	lw	$3,4($8)
	lw	$4,0($10)
	sw	$3,4($10)
	sw	$2,0($10)
	sw	$4,0($8)
	sw	$5,4($8)
$L319:
	lw	$19,12($sp)
$L323:
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,16

$L308:
	lw	$2,1($11)
	lw	$3,5($11)
	addiu	$5,$11,1
	sw	$2,0($4)
	b	$L309
	sw	$3,4($4)

$L310:
	addiu	$4,$10,1
	addu	$5,$11,$4
	lw	$2,0($5)
	lw	$3,4($5)
	sw	$2,0($6)
	b	$L311
	sw	$3,4($6)

	.set	macro
	.set	reorder
	.end	xchg_pair_border
	.align	2
	.ent	idr
	.type	idr, @function
idr:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	li	$2,65536			# 0x10000
	li	$5,131072			# 0x20000
	move	$10,$4
	ori	$3,$5,0x1744
	ori	$4,$2,0x17fc
	ori	$2,$2,0x17bc
	addu	$6,$10,$2
	addu	$8,$10,$3
	addu	$7,$10,$4
	addu	$5,$10,$5
	li	$9,4			# 0x4
$L332:
	lw	$4,0($6)
	beq	$4,$0,$L325
	nop

	lw	$2,6024($5)
	beq	$4,$2,$L328
	sw	$0,80($4)

	lw	$2,5952($5)
	beq	$2,$0,$L327
	nop

	beq	$4,$2,$L328
	nop

	b	$L330
	move	$2,$8

$L331:
	beq	$4,$3,$L328
	nop

$L330:
	lw	$3,0($2)
	bne	$3,$0,$L331
	addiu	$2,$2,4

$L327:
	sw	$0,0($6)
$L325:
	addiu	$6,$6,4
	bne	$6,$7,$L332
	li	$3,131072			# 0x20000

	addu	$4,$10,$3
	lw	$2,6828($4)
	blez	$2,$L333
	sw	$0,6824($4)

	li	$2,65536			# 0x10000
	ori	$3,$3,0x1744
	ori	$2,$2,0x173c
	addu	$6,$10,$2
	move	$8,$4
	addu	$3,$10,$3
	move	$7,$0
	li	$9,4			# 0x4
$L340:
	lw	$5,0($6)
	lw	$2,6024($8)
	beq	$5,$2,$L336
	sw	$0,80($5)

	lw	$2,5952($8)
	beq	$2,$0,$L335
	nop

	beq	$5,$2,$L336
	move	$2,$3

	b	$L349
	lw	$4,0($2)

$L339:
	beq	$5,$4,$L336
	nop

	lw	$4,0($2)
$L349:
	bne	$4,$0,$L339
	addiu	$2,$2,4

$L335:
	lw	$2,6828($8)
	addiu	$7,$7,1
	slt	$2,$7,$2
	sw	$0,0($6)
	bne	$2,$0,$L340
	addiu	$6,$6,4

$L333:
	li	$2,131072			# 0x20000
$L348:
	addu	$2,$10,$2
	j	$31
	sw	$0,6828($2)

$L336:
	sw	$9,80($5)
	lw	$2,6828($8)
	addiu	$7,$7,1
	slt	$2,$7,$2
	sw	$0,0($6)
	bne	$2,$0,$L340
	addiu	$6,$6,4

	b	$L348
	li	$2,131072			# 0x20000

$L328:
	b	$L327
	sw	$9,80($4)

	.set	macro
	.set	reorder
	.end	idr
	.align	2
	.ent	flush_dpb
	.type	flush_dpb, @function
flush_dpb:
	.set	nomips16
	.frame	$sp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$16,24($sp)
	.cprestore	16
	lw	$16,136($4)
	li	$2,131072			# 0x20000
	ori	$2,$2,0x1740
	addu	$3,$16,$2
	move	$4,$0
	li	$5,16			# 0x10
$L352:
	lw	$2,0($3)
	beq	$2,$0,$L351
	addiu	$4,$4,1

	sw	$0,80($2)
$L351:
	sw	$0,0($3)
	bne	$4,$5,$L352
	addiu	$3,$3,4

	li	$2,131072			# 0x20000
	addu	$2,$16,$2
	lw	$2,6024($2)
	beq	$2,$0,$L353
	nop

	sw	$0,80($2)
$L353:
	li	$2,131072			# 0x20000
	addu	$2,$16,$2
	sw	$0,6024($2)
	.option	pic0
	jal	idr
	.option	pic2
	move	$4,$16

	lw	$2,1880($16)
	beq	$2,$0,$L355
	lw	$28,16($sp)

	sw	$0,80($2)
$L355:
	lw	$31,28($sp)
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	flush_dpb
	.align	2
	.ent	predict_field_decoding_flag
	.type	predict_field_decoding_flag, @function
predict_field_decoding_flag:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	move	$7,$4
	lw	$8,152($4)
	lw	$4,6172($4)
	lw	$3,6168($7)
	mul	$5,$8,$4
	li	$2,65536			# 0x10000
	addu	$2,$7,$2
	addu	$4,$5,$3
	lw	$5,-6288($2)
	lw	$6,-6296($2)
	addu	$3,$5,$4
	lbu	$2,-1($3)
	beq	$2,$6,$L362
	addiu	$2,$4,-1

	subu	$4,$4,$8
	addu	$2,$5,$4
	lbu	$3,0($2)
	beq	$6,$3,$L360
	li	$2,65536			# 0x10000

	move	$3,$0
	addu	$2,$7,$2
	sw	$3,-6268($2)
	j	$31
	sw	$3,-6272($2)

$L360:
	lw	$2,1568($7)
	sll	$4,$4,2
	addu	$2,$2,$4
	lw	$3,0($2)
	li	$2,65536			# 0x10000
	srl	$3,$3,7
	andi	$3,$3,0x1
	addu	$2,$7,$2
	sw	$3,-6268($2)
	j	$31
	sw	$3,-6272($2)

$L362:
	lw	$4,1568($7)
	sll	$2,$2,2
	addu	$4,$4,$2
	lw	$3,0($4)
	li	$2,65536			# 0x10000
	srl	$3,$3,7
	andi	$3,$3,0x1
	addu	$2,$7,$2
	sw	$3,-6268($2)
	j	$31
	sw	$3,-6272($2)

	.set	macro
	.set	reorder
	.end	predict_field_decoding_flag
	.align	2
	.ent	decode_cabac_field_decoding_flag
	.type	decode_cabac_field_decoding_flag, @function
decode_cabac_field_decoding_flag:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	move	$6,$4
	lw	$11,6168($4)
	lw	$4,6172($4)
	li	$2,-2			# 0xfffffffffffffffe
	lw	$10,152($6)
	and	$9,$4,$2
	mul	$5,$9,$10
	li	$3,65536			# 0x10000
	addu	$3,$6,$3
	addiu	$2,$11,-1
	addu	$4,$5,$2
	lw	$5,-6288($3)
	lw	$8,-6296($3)
	addu	$2,$5,$4
	lbu	$3,0($2)
	beq	$3,$8,$L364
	sll	$4,$4,2

	move	$7,$0
$L365:
	addiu	$2,$9,-2
	mul	$3,$2,$10
	addu	$4,$3,$11
	addu	$3,$5,$4
	lbu	$2,0($3)
	bne	$8,$2,$L366
	nop

	lw	$2,1568($6)
	sll	$4,$4,2
	addu	$2,$2,$4
	lw	$3,0($2)
	addiu	$4,$7,1
	andi	$3,$3,0x80
	movn	$7,$4,$3
$L366:
	li	$4,131072			# 0x20000
	ori	$5,$4,0x2046
	addu	$5,$7,$5
	addu	$5,$6,$5
	ori	$4,$4,0x1fd8
	addu	$4,$6,$4
	.option	pic0
	j	get_cabac_noinline
	.option	pic2
	addiu	$5,$5,4

$L364:
	lw	$2,1568($6)
	addu	$2,$2,$4
	lw	$3,0($2)
	srl	$3,$3,7
	b	$L365
	andi	$7,$3,0x1

	.set	macro
	.set	reorder
	.end	decode_cabac_field_decoding_flag
	.align	2
	.ent	decode_cabac_intra_mb_type
	.type	decode_cabac_intra_mb_type, @function
decode_cabac_intra_mb_type:
	.set	nomips16
	.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$19,40($sp)
	sw	$18,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	.cprestore	16
	li	$3,131072			# 0x20000
	ori	$2,$3,0x2000
	addu	$5,$5,$2
	addu	$5,$4,$5
	move	$16,$4
	move	$19,$6
	beq	$6,$0,$L369
	addiu	$17,$5,4

	li	$2,65536			# 0x10000
	addu	$2,$4,$2
	lw	$7,-6288($2)
	lw	$4,8768($4)
	lw	$6,-6296($2)
	addu	$3,$7,$4
	lbu	$2,0($3)
	beq	$2,$6,$L370
	lw	$8,8764($16)

	addu	$2,$7,$8
	lbu	$3,0($2)
	beq	$6,$3,$L381
	move	$5,$0

	li	$4,131072			# 0x20000
$L386:
	ori	$4,$4,0x1fd8
	addu	$4,$16,$4
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	addu	$5,$17,$5

	beq	$2,$0,$L373
	lw	$28,16($sp)

$L384:
	li	$2,131072			# 0x20000
	addu	$6,$16,$2
	lw	$5,8156($6)
	lw	$3,8152($6)
	addiu	$4,$5,-2
	sll	$2,$4,17
	slt	$2,$3,$2
	addiu	$17,$17,2
	beq	$2,$0,$L375
	sw	$4,8156($6)

$L385:
	addiu	$2,$5,-258
	srl	$2,$2,31
	sll	$7,$3,$2
	andi	$3,$7,0xffff
	sll	$2,$4,$2
	sw	$2,8156($6)
	beq	$3,$0,$L382
	sw	$7,8152($6)

$L376:
	li	$2,131072			# 0x20000
	ori	$2,$2,0x1fd8
	addu	$16,$16,$2
	move	$4,$16
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	addiu	$5,$17,1

	sll	$3,$2,4
	sll	$2,$2,2
	subu	$3,$3,$2
	move	$4,$16
	addiu	$5,$17,2
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	addiu	$18,$3,1

	bne	$2,$0,$L383
	addiu	$5,$19,2

$L379:
	addiu	$5,$19,3
	addu	$5,$17,$5
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$16

	sll	$5,$19,1
	addiu	$5,$5,3
	addu	$5,$17,$5
	move	$4,$16
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$16,$2

	lw	$31,44($sp)
	addu	$2,$2,$18
	sll	$16,$16,1
	addu	$2,$2,$16
	lw	$28,16($sp)
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	j	$31
	addiu	$sp,$sp,48

$L370:
	lw	$2,1568($16)
	sll	$4,$4,2
	addu	$2,$2,$4
	lw	$3,0($2)
	addu	$2,$7,$8
	xori	$3,$3,0x1
	andi	$5,$3,0x1
	lbu	$3,0($2)
	bne	$6,$3,$L386
	li	$4,131072			# 0x20000

$L381:
	lw	$2,1568($16)
	sll	$4,$8,2
	addu	$2,$2,$4
	lw	$3,0($2)
	addiu	$4,$5,1
	andi	$3,$3,0x1
	movz	$5,$4,$3
	li	$4,131072			# 0x20000
	ori	$4,$4,0x1fd8
	addu	$4,$16,$4
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	addu	$5,$17,$5

	bne	$2,$0,$L384
	lw	$28,16($sp)

$L373:
	lw	$31,44($sp)
	move	$2,$0
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	j	$31
	addiu	$sp,$sp,48

$L369:
	ori	$4,$3,0x1fd8
	addu	$4,$16,$4
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$5,$17

	beq	$2,$0,$L373
	lw	$28,16($sp)

	li	$2,131072			# 0x20000
	addu	$6,$16,$2
	lw	$5,8156($6)
	lw	$3,8152($6)
	addiu	$4,$5,-2
	sll	$2,$4,17
	slt	$2,$3,$2
	bne	$2,$0,$L385
	sw	$4,8156($6)

$L375:
	lw	$3,8164($6)
	lw	$2,8168($6)
	beq	$2,$3,$L376
	lw	$31,44($sp)

	li	$2,25			# 0x19
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	j	$31
	addiu	$sp,$sp,48

$L382:
	lw	$5,8168($6)
	li	$2,-65536			# 0xffffffffffff0000
	lbu	$3,0($5)
	lbu	$4,1($5)
	sll	$3,$3,9
	ori	$2,$2,0x1
	addu	$3,$3,$2
	sll	$4,$4,1
	addu	$3,$3,$4
	addu	$3,$3,$7
	addiu	$5,$5,2
	sw	$5,8168($6)
	b	$L376
	sw	$3,8152($6)

$L383:
	addu	$5,$17,$5
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$16

	addiu	$2,$2,1
	sll	$2,$2,2
	b	$L379
	addu	$18,$18,$2

	.set	macro
	.set	reorder
	.end	decode_cabac_intra_mb_type
	.align	2
	.ent	decode_cabac_mb_skip
	.type	decode_cabac_mb_skip, @function
decode_cabac_mb_skip:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	li	$2,65536			# 0x10000
	addu	$7,$4,$2
	lw	$3,-6276($7)
	move	$8,$4
	beq	$3,$0,$L388
	move	$15,$5

	lw	$9,152($4)
	li	$2,-2			# 0xfffffffffffffffe
	and	$2,$6,$2
	mul	$3,$2,$9
	andi	$14,$6,0x1
	addu	$5,$3,$5
	beq	$14,$0,$L403
	addiu	$3,$5,-1

	lw	$13,-6288($7)
	addu	$2,$13,$3
	lbu	$10,0($2)
	lw	$2,-6296($7)
	beq	$10,$2,$L391
	move	$11,$3

	lw	$4,-6272($7)
	move	$12,$10
	move	$10,$2
$L390:
	beq	$4,$0,$L408
	addiu	$4,$6,-1

$L407:
	bne	$14,$0,$L404
	subu	$4,$5,$9

	addu	$2,$13,$4
	lbu	$7,0($2)
	beq	$7,$10,$L396
	move	$5,$4

	move	$9,$7
	move	$7,$10
$L395:
	beq	$7,$12,$L398
	nop

$L406:
	beq	$7,$9,$L405
	move	$6,$0

$L400:
	li	$2,65536			# 0x10000
	addu	$2,$8,$2
	lw	$3,-6284($2)
	li	$4,131072			# 0x20000
	xori	$3,$3,0x3
	addiu	$2,$6,13
	ori	$5,$4,0x200b
	movz	$6,$2,$3
	addu	$5,$6,$5
	addu	$5,$8,$5
	ori	$4,$4,0x1fd8
	addu	$4,$8,$4
	.option	pic0
	j	get_cabac_noinline
	.option	pic2
	addiu	$5,$5,4

$L388:
	lw	$4,152($4)
	lw	$2,-6288($7)
	mul	$5,$6,$4
	lw	$7,-6296($7)
	addu	$3,$5,$15
	addiu	$11,$3,-1
	subu	$5,$3,$4
	addu	$4,$2,$11
	lbu	$12,0($4)
	addu	$2,$2,$5
	bne	$7,$12,$L406
	lbu	$9,0($2)

$L398:
	lw	$2,1568($8)
	sll	$4,$11,2
	addu	$2,$2,$4
	lw	$3,0($2)
	srl	$3,$3,11
	xori	$3,$3,0x1
	bne	$7,$9,$L400
	andi	$6,$3,0x1

$L405:
	lw	$2,1568($8)
	sll	$4,$5,2
	addu	$2,$2,$4
	lw	$3,0($2)
	li	$2,65536			# 0x10000
	addiu	$4,$6,1
	andi	$3,$3,0x800
	addu	$2,$8,$2
	movz	$6,$4,$3
	lw	$3,-6284($2)
	li	$4,131072			# 0x20000
	xori	$3,$3,0x3
	addiu	$2,$6,13
	ori	$5,$4,0x200b
	movz	$6,$2,$3
	addu	$5,$6,$5
	addu	$5,$8,$5
	ori	$4,$4,0x1fd8
	addu	$4,$8,$4
	.option	pic0
	j	get_cabac_noinline
	.option	pic2
	addiu	$5,$5,4

$L403:
	lw	$13,-6288($7)
	lw	$4,-6272($7)
	addu	$2,$13,$3
	move	$11,$3
	lbu	$12,0($2)
	bne	$4,$0,$L407
	lw	$10,-6296($7)

	addiu	$4,$6,-1
$L408:
	mul	$3,$4,$9
	li	$2,65536			# 0x10000
	addu	$2,$8,$2
	addu	$5,$3,$15
	lw	$3,-6288($2)
	lw	$7,-6296($2)
	addu	$3,$3,$5
	b	$L395
	lbu	$9,0($3)

$L404:
	li	$3,65536			# 0x10000
	addu	$3,$8,$3
	lw	$2,-6288($3)
	move	$5,$4
	addu	$2,$2,$4
	lbu	$9,0($2)
	b	$L395
	lw	$7,-6296($3)

$L391:
	lw	$2,1568($4)
	sll	$4,$3,2
	addu	$2,$2,$4
	lw	$3,0($2)
	lw	$4,-6272($7)
	srl	$3,$3,7
	andi	$3,$3,0x1
	beq	$4,$3,$L392
	nop

	b	$L390
	move	$12,$10

$L396:
	lw	$2,1568($8)
	sll	$4,$4,2
	addu	$2,$2,$4
	lw	$3,0($2)
	andi	$3,$3,0x80
	bne	$3,$0,$L397
	nop

	b	$L395
	move	$9,$10

$L392:
	addu	$11,$11,$9
	addu	$2,$13,$11
	b	$L390
	lbu	$12,0($2)

$L397:
	subu	$5,$5,$9
	addu	$2,$13,$5
	b	$L395
	lbu	$9,0($2)

	.set	macro
	.set	reorder
	.end	decode_cabac_mb_skip
	.align	2
	.ent	decode_cabac_mb_intra4x4_pred_mode
	.type	decode_cabac_mb_intra4x4_pred_mode, @function
decode_cabac_mb_intra4x4_pred_mode:
	.set	nomips16
	.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$19,40($sp)
	sw	$18,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	.cprestore	16
	li	$17,131072			# 0x20000
	ori	$2,$17,0x1fd8
	addu	$16,$4,$2
	ori	$3,$17,0x2048
	move	$18,$4
	move	$19,$5
	addu	$5,$4,$3
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$4,$16

	beq	$2,$0,$L413
	lw	$28,16($sp)

	lw	$31,44($sp)
	move	$2,$19
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	j	$31
	addiu	$sp,$sp,48

$L413:
	ori	$17,$17,0x2049
	addu	$17,$18,$17
	move	$4,$16
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$5,$17

	move	$4,$16
	move	$5,$17
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$18,$2

	move	$4,$16
	move	$5,$17
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$16,$2

	sll	$2,$2,2
	sll	$16,$16,1
	addu	$16,$16,$2
	addu	$16,$16,$18
	slt	$2,$16,$19
	bne	$2,$0,$L414
	lw	$28,16($sp)

	lw	$31,44($sp)
	addiu	$19,$16,1
	move	$2,$19
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	j	$31
	addiu	$sp,$sp,48

$L414:
	lw	$31,44($sp)
	move	$19,$16
	move	$2,$19
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	j	$31
	addiu	$sp,$sp,48

	.set	macro
	.set	reorder
	.end	decode_cabac_mb_intra4x4_pred_mode
	.align	2
	.ent	decode_cabac_mb_transform_size
	.type	decode_cabac_mb_transform_size, @function
decode_cabac_mb_transform_size:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	move	$3,$4
	lw	$5,9544($3)
	li	$4,131072			# 0x20000
	ori	$2,$4,0x218f
	addu	$5,$5,$2
	addu	$5,$3,$5
	ori	$4,$4,0x1fd8
	addu	$4,$3,$4
	.option	pic0
	j	get_cabac_noinline
	.option	pic2
	addiu	$5,$5,4

	.set	macro
	.set	reorder
	.end	decode_cabac_mb_transform_size
	.align	2
	.ent	decode_cabac_residual
	.type	decode_cabac_residual, @function
decode_cabac_residual:
	.set	nomips16
	.frame	$sp,376,$31		# vars= 312, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-376
	sw	$31,372($sp)
	sw	$fp,368($sp)
	sw	$23,364($sp)
	sw	$22,360($sp)
	sw	$21,356($sp)
	sw	$20,352($sp)
	sw	$19,348($sp)
	sw	$18,344($sp)
	sw	$17,340($sp)
	sw	$16,336($sp)
	.cprestore	16
	li	$9,131072			# 0x20000
	addu	$8,$4,$9
	lw	$2,8156($8)
	lw	$3,8152($8)
	sw	$4,376($sp)
	sw	$2,28($sp)
	lw	$2,376($sp)
	sw	$3,24($sp)
	sw	$6,384($sp)
	sw	$7,388($sp)
	lw	$2,6168($2)
	lw	$3,376($sp)
	lw	$4,8168($8)
	sw	$2,328($sp)
	li	$2,5			# 0x5
	sw	$4,40($sp)
	sw	$5,380($sp)
	lw	$23,6172($3)
	beq	$6,$2,$L418
	lw	$22,152($3)

	bne	$6,$0,$L419
	lw	$5,384($sp)

	lw	$2,8668($8)
	lw	$3,8672($8)
	andi	$4,$2,0x100
	andi	$3,$3,0x100
$L420:
	sltu	$5,$0,$3
	lw	$3,384($sp)
	addiu	$2,$5,2
	movn	$5,$2,$4
	sll	$16,$3,2
	li	$17,131072			# 0x20000
	lw	$4,376($sp)
	ori	$2,$17,0x2055
	addu	$5,$5,$16
	addu	$5,$5,$2
	addu	$5,$4,$5
	addiu	$18,$sp,24
	addiu	$5,$5,4
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$4,$18

	bne	$2,$0,$L424
	lw	$28,16($sp)

	lw	$5,384($sp)
	addiu	$2,$5,-1
	sltu	$2,$2,2
	bne	$2,$0,$L469
	lw	$3,384($sp)

	li	$2,4			# 0x4
	beq	$3,$2,$L470
	lw	$4,388($sp)

$L426:
	lw	$7,376($sp)
	li	$4,131072			# 0x20000
	addu	$4,$7,$4
$L468:
	lw	$2,40($sp)
	lw	$3,28($sp)
	sw	$2,8168($4)
	lw	$31,372($sp)
	lw	$2,24($sp)
	lw	$fp,368($sp)
	lw	$23,364($sp)
	lw	$22,360($sp)
	lw	$21,356($sp)
	lw	$20,352($sp)
	lw	$19,348($sp)
	lw	$18,344($sp)
	lw	$17,340($sp)
	lw	$16,336($sp)
	sw	$3,8156($4)
	sw	$2,8152($4)
	j	$31
	addiu	$sp,$sp,376

$L419:
	addiu	$2,$5,-1
	sltu	$2,$2,2
	bne	$2,$0,$L471
	li	$2,3			# 0x3

	lw	$3,384($sp)
	beq	$3,$2,$L472
	lui	$2,%hi(scan8)

	lw	$7,388($sp)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$7,$2
	lbu	$3,16($2)
	lw	$2,376($sp)
	addu	$3,$2,$3
	lbu	$4,9072($3)
	b	$L420
	lbu	$3,9079($3)

$L424:
	lw	$7,376($sp)
	li	$2,65536			# 0x10000
	addu	$2,$7,$2
	lw	$3,-6272($2)
	lw	$2,384($sp)
	sll	$4,$3,3
	sll	$3,$3,1
	subu	$4,$4,$3
	addu	$4,$4,$2
	lui	$5,%hi(last_coeff_flag_offset.14555)
	lui	$3,%hi(coeff_abs_level_m1_offset.14556)
	lui	$2,%hi(significant_coeff_flag_offset.14554)
	sll	$4,$4,2
	addiu	$2,$2,%lo(significant_coeff_flag_offset.14554)
	addiu	$5,$5,%lo(last_coeff_flag_offset.14555)
	addiu	$3,$3,%lo(coeff_abs_level_m1_offset.14556)
	addu	$5,$4,$5
	addu	$3,$16,$3
	addu	$4,$4,$2
	lw	$6,0($4)
	lw	$7,0($5)
	lw	$4,0($3)
	ori	$2,$17,0x2000
	lw	$3,376($sp)
	lw	$5,400($sp)
	addu	$4,$4,$2
	addu	$6,$6,$2
	addu	$7,$7,$2
	addu	$6,$3,$6
	addu	$7,$3,$7
	addu	$4,$3,$4
	addiu	$17,$5,-1
	addiu	$20,$6,4
	addiu	$21,$7,4
	blez	$17,$L473
	addiu	$fp,$4,4

	move	$16,$0
	b	$L434
	move	$19,$0

$L432:
	addiu	$16,$16,1
	slt	$2,$16,$17
	beq	$2,$0,$L433
	nop

$L434:
	addu	$5,$20,$16
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$4,$18

	beq	$2,$0,$L432
	lw	$28,16($sp)

	sll	$2,$19,2
	addu	$2,$18,$2
	addu	$5,$21,$16
	move	$4,$18
	.option	pic0
	jal	get_cabac
	.option	pic2
	sw	$16,44($2)

	lw	$28,16($sp)
	beq	$2,$0,$L432
	addiu	$19,$19,1

	lw	$16,400($sp)
$L433:
	beq	$16,$17,$L474
	lw	$2,328($sp)

	lw	$3,384($sp)
	mtlo	$2
	madd	$22,$23
	bne	$3,$0,$L436
	mflo	$5

$L479:
	lw	$4,376($sp)
	li	$2,131072			# 0x20000
	addu	$2,$4,$2
	lw	$3,8660($2)
	sll	$4,$5,1
	addu	$3,$3,$4
	lhu	$2,0($3)
	ori	$2,$2,0x100
	sh	$2,0($3)
$L437:
	beq	$19,$0,$L441
	addiu	$2,$19,-1

	addiu	$3,$sp,68
	sll	$2,$2,2
	addu	$20,$3,$2
	addiu	$3,$sp,64
	li	$22,1			# 0x1
	move	$21,$0
	sw	$3,332($sp)
	li	$23,15			# 0xf
$L460:
	beq	$21,$0,$L442
	slt	$2,$22,5

	move	$3,$0
$L443:
	lw	$4,392($sp)
	lw	$2,0($20)
	addu	$5,$fp,$3
	addu	$2,$4,$2
	move	$4,$18
	.option	pic0
	jal	get_cabac
	.option	pic2
	lbu	$19,0($2)

	bne	$2,$0,$L444
	lw	$28,16($sp)

	lw	$5,396($sp)
	beq	$5,$0,$L475
	lw	$6,24($sp)

	lw	$4,396($sp)
	sll	$6,$6,1
	sll	$2,$19,2
	addu	$2,$4,$2
	andi	$3,$6,0xffff
	lw	$5,0($2)
	bne	$3,$0,$L448
	sw	$6,24($sp)

	lw	$2,40($sp)
	li	$7,-65536			# 0xffffffffffff0000
	lbu	$3,0($2)
	lbu	$4,1($2)
	sll	$3,$3,9
	addu	$3,$3,$6
	sll	$4,$4,1
	addu	$3,$3,$4
	addiu	$2,$2,2
	ori	$7,$7,0x1
	sw	$2,40($sp)
	addu	$6,$3,$7
$L448:
	subu	$3,$0,$5
	lw	$5,28($sp)
	li	$7,32			# 0x20
	sll	$5,$5,17
	subu	$6,$6,$5
	sra	$2,$6,31
	xor	$3,$3,$2
	subu	$4,$7,$2
	and	$2,$2,$5
	lw	$5,380($sp)
	addu	$4,$4,$3
	sll	$3,$19,1
	addu	$2,$2,$6
	addu	$3,$5,$3
	sra	$4,$4,6
	sh	$4,0($3)
	sw	$2,24($sp)
$L447:
	addiu	$22,$22,1
$L449:
	lw	$3,332($sp)
	addiu	$20,$20,-4
	bne	$3,$20,$L460
	nop

$L441:
	lw	$5,376($sp)
	li	$4,131072			# 0x20000
	b	$L468
	addu	$4,$5,$4

$L444:
	slt	$3,$21,5
	li	$2,4			# 0x4
	movn	$2,$21,$3
	addiu	$2,$2,5
	addu	$16,$fp,$2
	li	$17,2			# 0x2
	move	$4,$18
$L481:
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$5,$16

	beq	$2,$0,$L480
	lw	$7,396($sp)

	addiu	$17,$17,1
	bne	$17,$23,$L481
	move	$4,$18

	move	$16,$0
$L482:
	.option	pic0
	jal	get_cabac_bypass
	.option	pic2
	move	$4,$18

	bne	$2,$0,$L482
	addiu	$16,$16,1

	addiu	$16,$16,-1
	beq	$16,$0,$L480
	lw	$7,396($sp)

	li	$17,1			# 0x1
$L455:
	.option	pic0
	jal	get_cabac_bypass
	.option	pic2
	move	$4,$18

	sll	$3,$17,1
	addiu	$16,$16,-1
	bne	$16,$0,$L455
	addu	$17,$3,$2

	addiu	$17,$17,14
	lw	$7,396($sp)
$L480:
	beq	$7,$0,$L476
	nop

	.option	pic0
	jal	get_cabac_bypass
	.option	pic2
	move	$4,$18

	beq	$2,$0,$L459
	lw	$28,16($sp)

	lw	$5,396($sp)
	sll	$2,$19,2
	addu	$2,$5,$2
	lw	$4,0($2)
	subu	$3,$0,$17
	mul	$3,$3,$4
	lw	$4,380($sp)
	sll	$2,$19,1
	addiu	$3,$3,32
	addu	$2,$4,$2
	srl	$3,$3,6
	sh	$3,0($2)
	b	$L449
	addiu	$21,$21,1

$L442:
	li	$3,4			# 0x4
	b	$L443
	movn	$3,$22,$2

$L459:
	lw	$5,396($sp)
	sll	$2,$19,2
	addu	$2,$5,$2
	lw	$3,0($2)
	lw	$2,380($sp)
	mul	$3,$17,$3
	sll	$4,$19,1
	addiu	$3,$3,32
	addu	$4,$2,$4
	srl	$3,$3,6
	sh	$3,0($4)
	b	$L449
	addiu	$21,$21,1

$L476:
	.option	pic0
	jal	get_cabac_bypass
	.option	pic2
	move	$4,$18

	beq	$2,$0,$L457
	lw	$28,16($sp)

	lw	$3,380($sp)
	sll	$2,$19,1
	addu	$2,$3,$2
	subu	$3,$0,$17
	sh	$3,0($2)
	b	$L449
	addiu	$21,$21,1

$L475:
	sll	$6,$6,1
	andi	$2,$6,0xffff
	bne	$2,$0,$L446
	sw	$6,24($sp)

	lw	$2,40($sp)
	li	$7,-65536			# 0xffffffffffff0000
	lbu	$3,0($2)
	lbu	$4,1($2)
	sll	$3,$3,9
	addu	$3,$3,$6
	sll	$4,$4,1
	addu	$3,$3,$4
	addiu	$2,$2,2
	ori	$7,$7,0x1
	sw	$2,40($sp)
	addu	$6,$3,$7
$L446:
	lw	$2,28($sp)
	sll	$5,$19,1
	sll	$2,$2,17
	subu	$6,$6,$2
	sra	$3,$6,31
	nor	$4,$0,$3
	and	$2,$3,$2
	subu	$4,$4,$3
	lw	$3,380($sp)
	addu	$2,$2,$6
	addu	$5,$3,$5
	sh	$4,0($5)
	b	$L447
	sw	$2,24($sp)

$L457:
	lw	$4,380($sp)
	sll	$2,$19,1
	addu	$2,$4,$2
	sh	$17,0($2)
	b	$L449
	addiu	$21,$21,1

$L418:
	lw	$3,376($sp)
	li	$2,65536			# 0x10000
	addu	$2,$3,$2
	lw	$7,-6272($2)
	lui	$4,%hi(last_coeff_flag_offset.14555)
	sll	$5,$7,3
	sll	$3,$7,5
	lui	$2,%hi(significant_coeff_flag_offset.14554)
	subu	$3,$3,$5
	addiu	$2,$2,%lo(significant_coeff_flag_offset.14554)
	addiu	$4,$4,%lo(last_coeff_flag_offset.14555)
	addu	$4,$3,$4
	addu	$3,$3,$2
	lw	$5,20($3)
	lw	$6,20($4)
	ori	$2,$9,0x2000
	addu	$6,$6,$2
	addu	$5,$5,$2
	lw	$4,376($sp)
	sll	$3,$7,6
	lui	$2,%hi(significant_coeff_flag_offset_8x8.14557)
	addiu	$2,$2,%lo(significant_coeff_flag_offset_8x8.14557)
	subu	$3,$3,$7
	addu	$5,$4,$5
	addu	$6,$4,$6
	addu	$17,$2,$3
	lui	$2,%hi(last_coeff_flag_offset_8x8)
	addiu	$20,$5,4
	addiu	$22,$6,4
	addiu	$23,$2,%lo(last_coeff_flag_offset_8x8)
	move	$16,$0
	move	$19,$0
	addiu	$18,$sp,24
	b	$L430
	li	$21,63			# 0x3f

$L428:
	addiu	$16,$16,1
	beq	$16,$21,$L429
	nop

$L430:
	addu	$2,$17,$16
	lbu	$5,0($2)
	move	$4,$18
	.option	pic0
	jal	get_cabac
	.option	pic2
	addu	$5,$20,$5

	beq	$2,$0,$L428
	lw	$28,16($sp)

	addu	$2,$23,$16
	lbu	$5,0($2)
	sll	$3,$19,2
	addu	$3,$18,$3
	addu	$5,$22,$5
	move	$4,$18
	.option	pic0
	jal	get_cabac
	.option	pic2
	sw	$16,44($3)

	lw	$28,16($sp)
	beq	$2,$0,$L428
	addiu	$19,$19,1

	lw	$16,400($sp)
$L429:
	lw	$5,400($sp)
	addiu	$2,$5,-1
	beq	$2,$16,$L477
	sll	$2,$19,2

$L431:
	li	$2,131072			# 0x20000
	lw	$7,376($sp)
	ori	$2,$2,0x21ae
	addu	$fp,$7,$2
$L439:
	lw	$3,384($sp)
	li	$2,4			# 0x4
	beq	$3,$2,$L478
	lw	$7,388($sp)

	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$7,$2
	lbu	$4,0($2)
	sll	$3,$19,8
	lw	$2,376($sp)
	addu	$3,$3,$19
	addiu	$4,$4,9080
	andi	$3,$3,0xffff
	addu	$4,$2,$4
	sh	$3,8($4)
	b	$L437
	sh	$3,0($4)

$L470:
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$4,$2
	lw	$5,376($sp)
	lbu	$3,16($2)
	addu	$3,$5,$3
	b	$L426
	sb	$0,9080($3)

$L472:
	lw	$5,388($sp)
	lw	$2,8668($8)
	lw	$3,8672($8)
	addiu	$4,$5,6
	sra	$3,$3,$4
	sra	$2,$2,$4
	andi	$3,$3,0x1
	b	$L420
	andi	$4,$2,0x1

$L477:
	addu	$2,$18,$2
	sw	$16,44($2)
	b	$L431
	addiu	$19,$19,1

$L478:
	lw	$4,388($sp)
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$4,$2
	lw	$5,376($sp)
	lbu	$3,16($2)
	addu	$3,$5,$3
	b	$L437
	sb	$19,9080($3)

$L474:
	sll	$2,$19,2
	addu	$2,$18,$2
	sw	$16,44($2)
	lw	$2,328($sp)
	lw	$3,384($sp)
	mtlo	$2
	madd	$22,$23
	addiu	$19,$19,1
	beq	$3,$0,$L479
	mflo	$5

$L436:
	lw	$7,384($sp)
	addiu	$2,$7,-1
	sltu	$2,$2,2
	beq	$2,$0,$L483
	lw	$3,388($sp)

	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$3,$2
	lw	$4,376($sp)
	lbu	$3,0($2)
	addu	$3,$4,$3
	b	$L437
	sb	$19,9080($3)

$L471:
	lui	$2,%hi(scan8)
	lw	$7,388($sp)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$7,$2
	lbu	$3,0($2)
	lw	$2,376($sp)
	addu	$3,$2,$3
	lbu	$4,9072($3)
	b	$L420
	lbu	$3,9079($3)

$L469:
	lw	$7,388($sp)
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$7,$2
	lbu	$3,0($2)
	lw	$2,376($sp)
	addu	$3,$2,$3
	b	$L426
	sb	$0,9080($3)

$L473:
	move	$16,$0
	b	$L433
	move	$19,$0

$L483:
	li	$2,3			# 0x3
	bne	$7,$2,$L439
	lw	$3,376($sp)

	li	$2,131072			# 0x20000
	addu	$2,$3,$2
	lw	$4,8660($2)
	sll	$3,$5,1
	addu	$4,$4,$3
	lw	$7,388($sp)
	lhu	$5,0($4)
	li	$2,64			# 0x40
	sll	$2,$2,$7
	or	$2,$2,$5
	b	$L437
	sh	$2,0($4)

	.set	macro
	.set	reorder
	.end	decode_cabac_residual
	.align	2
	.ent	filter_mb_edgev
	.type	filter_mb_edgev, @function
filter_mb_edgev:
	.set	nomips16
	.frame	$sp,56,$31		# vars= 8, regs= 4/0, args= 24, gp= 8
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$18,48($sp)
	sw	$17,44($sp)
	sw	$16,40($sp)
	.cprestore	24
	li	$2,65536			# 0x10000
	addu	$2,$4,$2
	lw	$8,5344($2)
	move	$10,$7
	move	$12,$4
	lw	$7,72($sp)
	lw	$4,5348($2)
	lh	$9,0($10)
	lui	$3,%hi(beta_table+52)
	lui	$2,%hi(alpha_table+52)
	addu	$4,$7,$4
	addiu	$3,$3,%lo(beta_table+52)
	addu	$7,$7,$8
	addiu	$2,$2,%lo(alpha_table+52)
	addu	$3,$3,$4
	addu	$2,$2,$7
	slt	$9,$9,4
	move	$8,$5
	move	$17,$6
	lbu	$24,0($2)
	beq	$9,$0,$L485
	lbu	$16,0($3)

	sll	$3,$7,1
	addu	$3,$3,$7
	lui	$2,%hi(tc0_table)
	addiu	$3,$3,156
	addiu	$11,$sp,32
	addiu	$2,$2,%lo(tc0_table)
	addu	$3,$2,$3
	move	$7,$10
	move	$4,$11
	addiu	$9,$sp,36
$L488:
	lh	$2,0($7)
	li	$6,-1			# 0xffffffffffffffff
	beq	$2,$0,$L487
	addu	$5,$3,$2

	lb	$6,-1($5)
$L487:
	sb	$6,0($4)
	addiu	$4,$4,1
	bne	$9,$4,$L488
	addiu	$7,$7,2

	lw	$25,4960($12)
	move	$4,$8
	sw	$11,16($sp)
	move	$5,$17
	move	$6,$24
	jalr	$25
	move	$7,$16

	lw	$28,24($sp)
$L501:
	lw	$31,52($sp)
	lw	$18,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	j	$31
	addiu	$sp,$sp,56

$L485:
	sra	$2,$24,2
	addiu	$18,$2,1
	move	$14,$0
	li	$25,16			# 0x10
	lbu	$9,-1($8)
$L507:
	lbu	$10,0($8)
	lbu	$11,-2($8)
	subu	$5,$9,$10
	subu	$2,$0,$5
	slt	$3,$5,0
	movn	$5,$2,$3
	slt	$4,$5,$24
	lbu	$12,-3($8)
	lbu	$13,1($8)
	beq	$4,$0,$L491
	lbu	$15,2($8)

	subu	$2,$11,$9
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$16
	beq	$2,$0,$L491
	subu	$2,$13,$10

	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$16
	beq	$2,$0,$L491
	slt	$2,$18,$5

	bne	$2,$0,$L494
	addu	$3,$11,$10

	subu	$2,$12,$9
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$16
	bne	$2,$0,$L503
	addu	$2,$11,$9

	addu	$2,$9,$13
	sll	$3,$11,1
	addiu	$2,$2,2
	addu	$2,$2,$3
	sra	$2,$2,2
	sb	$2,-1($8)
	subu	$2,$15,$10
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$16
	beq	$2,$0,$L505
	addu	$2,$11,$10

	addu	$7,$10,$9
$L506:
	lbu	$4,3($8)
	addiu	$3,$7,4
	sll	$4,$4,1
	addu	$7,$7,$13
	addu	$3,$3,$13
	addu	$2,$11,$15
	sll	$5,$15,1
	addu	$3,$3,$4
	addu	$5,$5,$15
	addiu	$2,$2,4
	sll	$6,$7,1
	addiu	$4,$15,2
	addu	$2,$2,$6
	addu	$4,$4,$7
	addu	$3,$3,$5
	sra	$2,$2,3
	sra	$4,$4,2
	sra	$3,$3,3
	sb	$2,0($8)
	sb	$4,1($8)
	sb	$3,2($8)
$L491:
	addiu	$14,$14,1
	beq	$14,$25,$L501
	addu	$8,$8,$17

	b	$L507
	lbu	$9,-1($8)

$L494:
	addu	$2,$9,$13
	addiu	$2,$2,2
	addiu	$3,$3,2
	sll	$5,$13,1
	sll	$4,$11,1
	addu	$2,$2,$4
	addu	$3,$3,$5
	sra	$2,$2,2
	sra	$3,$3,2
	sb	$2,-1($8)
	b	$L491
	sb	$3,0($8)

$L503:
	lbu	$6,-4($8)
	addiu	$4,$2,4
	addu	$7,$2,$10
	addiu	$2,$2,2
	addu	$4,$4,$10
	sll	$6,$6,1
	addu	$3,$12,$13
	sll	$5,$12,1
	addu	$2,$2,$12
	addu	$4,$4,$6
	addu	$5,$5,$12
	addiu	$3,$3,4
	sll	$7,$7,1
	addu	$2,$2,$10
	sra	$2,$2,2
	addu	$3,$3,$7
	addu	$4,$4,$5
	sra	$3,$3,3
	sra	$4,$4,3
	sb	$2,-2($8)
	subu	$2,$15,$10
	sb	$3,-1($8)
	sb	$4,-3($8)
	slt	$3,$2,0
	subu	$4,$0,$2
	movn	$2,$4,$3
	slt	$2,$2,$16
	bne	$2,$0,$L506
	addu	$7,$10,$9

	addu	$2,$11,$10
$L505:
	addiu	$2,$2,2
	sll	$3,$13,1
	addu	$2,$2,$3
	sra	$2,$2,2
	b	$L491
	sb	$2,0($8)

	.set	macro
	.set	reorder
	.end	filter_mb_edgev
	.align	2
	.ent	filter_mb_edgecv
	.type	filter_mb_edgecv, @function
filter_mb_edgecv:
	.set	nomips16
	.frame	$sp,48,$31		# vars= 8, regs= 1/0, args= 24, gp= 8
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	.cprestore	24
	li	$2,65536			# 0x10000
	addu	$2,$4,$2
	move	$10,$7
	lw	$8,5344($2)
	lw	$7,64($sp)
	move	$12,$4
	lw	$4,5348($2)
	lh	$9,0($10)
	lui	$3,%hi(beta_table+52)
	lui	$2,%hi(alpha_table+52)
	addu	$4,$7,$4
	addiu	$3,$3,%lo(beta_table+52)
	addu	$7,$7,$8
	addiu	$2,$2,%lo(alpha_table+52)
	addu	$3,$3,$4
	addu	$2,$2,$7
	slt	$9,$9,4
	move	$4,$5
	lbu	$13,0($3)
	move	$5,$6
	beq	$9,$0,$L509
	lbu	$6,0($2)

	sll	$3,$7,1
	addu	$3,$3,$7
	lui	$2,%hi(tc0_table)
	addiu	$3,$3,156
	addiu	$14,$sp,32
	addiu	$2,$2,%lo(tc0_table)
	addu	$3,$2,$3
	move	$7,$10
	move	$8,$14
	addiu	$11,$sp,36
$L512:
	lh	$2,0($7)
	move	$10,$0
	beq	$2,$0,$L511
	addu	$9,$3,$2

	lbu	$2,-1($9)
	addiu	$2,$2,1
	sll	$10,$2,24
	sra	$10,$10,24
$L511:
	sb	$10,0($8)
	addiu	$8,$8,1
	bne	$11,$8,$L512
	addiu	$7,$7,2

	lw	$25,4968($12)
	move	$7,$13
	jalr	$25
	sw	$14,16($sp)

	lw	$31,44($sp)
	lw	$28,24($sp)
	j	$31
	addiu	$sp,$sp,48

$L509:
	lw	$25,4976($12)
	jalr	$25
	move	$7,$13

	lw	$31,44($sp)
	lw	$28,24($sp)
	j	$31
	addiu	$sp,$sp,48

	.set	macro
	.set	reorder
	.end	filter_mb_edgecv
	.align	2
	.ent	filter_mb_mbaff_edgecv
	.type	filter_mb_mbaff_edgecv, @function
filter_mb_mbaff_edgecv:
	.set	nomips16
	.frame	$sp,16,$31		# vars= 0, regs= 4/0, args= 0, gp= 0
	.mask	0x000f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	li	$2,65536			# 0x10000
	addiu	$sp,$sp,-16
	addu	$15,$4,$2
	lui	$2,%hi(alpha_table+52)
	sw	$17,4($sp)
	addiu	$25,$2,%lo(alpha_table+52)
	lui	$3,%hi(beta_table+52)
	lui	$2,%hi(tc0_table+156)
	lw	$17,32($sp)
	sw	$19,12($sp)
	sw	$18,8($sp)
	sw	$16,0($sp)
	move	$9,$5
	addiu	$16,$3,%lo(beta_table+52)
	addiu	$18,$2,%lo(tc0_table+156)
	move	$10,$0
	li	$19,-256			# 0xffffffffffffff00
	li	$24,8			# 0x8
$L533:
	lh	$8,0($7)
	beq	$8,$0,$L517
	nop

	lw	$2,-6272($15)
	beq	$2,$0,$L519
	andi	$2,$10,0x1

	sra	$2,$10,2
$L519:
	sll	$2,$2,2
	addu	$2,$17,$2
	lw	$3,0($2)
	lw	$4,5344($15)
	lw	$2,5348($15)
	addu	$5,$3,$4
	addu	$3,$3,$2
	addu	$3,$16,$3
	addu	$2,$25,$5
	slt	$4,$8,4
	lbu	$12,0($2)
	beq	$4,$0,$L520
	lbu	$13,0($3)

	lbu	$11,-1($9)
	lbu	$14,0($9)
	sll	$2,$5,1
	subu	$3,$11,$14
	addu	$2,$2,$5
	slt	$4,$3,0
	subu	$5,$0,$3
	movn	$3,$5,$4
	addu	$2,$18,$2
	addu	$2,$2,$8
	slt	$3,$3,$12
	lbu	$5,-2($9)
	lbu	$12,-1($2)
	beq	$3,$0,$L517
	lbu	$8,1($9)

	subu	$2,$5,$11
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$13
	beq	$2,$0,$L517
	subu	$2,$8,$14

	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$13
	bne	$2,$0,$L535
	addiu	$2,$5,4

$L517:
	addiu	$10,$10,1
	beq	$10,$24,$L534
	addiu	$7,$7,2

$L536:
	b	$L533
	addu	$9,$9,$6

$L520:
	lbu	$8,-1($9)
	lbu	$11,0($9)
	lbu	$14,-2($9)
	subu	$2,$8,$11
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$12
	beq	$2,$0,$L517
	lbu	$5,1($9)

	subu	$2,$14,$8
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$13
	beq	$2,$0,$L517
	subu	$2,$5,$11

	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$13
	beq	$2,$0,$L517
	addu	$2,$8,$5

	addu	$3,$14,$11
	addiu	$2,$2,2
	addiu	$3,$3,2
	sll	$5,$5,1
	sll	$4,$14,1
	addu	$2,$2,$4
	addu	$3,$3,$5
	sra	$2,$2,2
	sra	$3,$3,2
	addiu	$10,$10,1
	sb	$2,-1($9)
	sb	$3,0($9)
	bne	$10,$24,$L536
	addiu	$7,$7,2

$L534:
	lw	$19,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,16

$L535:
	subu	$3,$14,$11
	sll	$3,$3,2
	subu	$2,$2,$8
	addu	$2,$2,$3
	addiu	$3,$12,1
	sra	$5,$2,3
	subu	$4,$0,$3
	slt	$2,$5,$4
	beq	$2,$0,$L537
	slt	$2,$3,$5

	addu	$3,$4,$11
	and	$2,$3,$19
	bne	$2,$0,$L538
	subu	$2,$0,$3

	andi	$5,$3,0x00ff
$L541:
	subu	$3,$14,$4
	and	$2,$3,$19
	beq	$2,$0,$L527
	sb	$5,-1($9)

$L539:
	subu	$2,$0,$3
	sra	$2,$2,31
	andi	$2,$2,0x00ff
	b	$L517
	sb	$2,0($9)

$L538:
$L540:
	sra	$2,$2,31
	subu	$3,$14,$4
	andi	$5,$2,0x00ff
	and	$2,$3,$19
	bne	$2,$0,$L539
	sb	$5,-1($9)

$L527:
	andi	$2,$3,0x00ff
	b	$L517
	sb	$2,0($9)

$L537:
	move	$4,$3
	movz	$4,$5,$2
	addu	$3,$4,$11
	and	$2,$3,$19
	beq	$2,$0,$L541
	andi	$5,$3,0x00ff

	b	$L540
	subu	$2,$0,$3

	.set	macro
	.set	reorder
	.end	filter_mb_mbaff_edgecv
	.align	2
	.ent	filter_mb_edgeh
	.type	filter_mb_edgeh, @function
filter_mb_edgeh:
	.set	nomips16
	.frame	$sp,88,$31		# vars= 16, regs= 10/0, args= 24, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-88
	sw	$31,84($sp)
	sw	$fp,80($sp)
	sw	$23,76($sp)
	sw	$22,72($sp)
	sw	$21,68($sp)
	sw	$20,64($sp)
	sw	$19,60($sp)
	sw	$18,56($sp)
	sw	$17,52($sp)
	sw	$16,48($sp)
	.cprestore	24
	li	$2,65536			# 0x10000
	addu	$2,$4,$2
	move	$10,$7
	lw	$8,5344($2)
	lw	$7,104($sp)
	move	$13,$4
	lw	$4,5348($2)
	lh	$9,0($10)
	lui	$3,%hi(beta_table+52)
	lui	$2,%hi(alpha_table+52)
	addu	$4,$7,$4
	addiu	$3,$3,%lo(beta_table+52)
	addu	$7,$7,$8
	addiu	$2,$2,%lo(alpha_table+52)
	addu	$3,$3,$4
	addu	$2,$2,$7
	slt	$9,$9,4
	move	$11,$5
	lbu	$21,0($2)
	beq	$9,$0,$L543
	lbu	$22,0($3)

	sll	$3,$7,1
	addu	$3,$3,$7
	lui	$2,%hi(tc0_table)
	addiu	$3,$3,156
	addiu	$12,$sp,32
	addiu	$2,$2,%lo(tc0_table)
	addu	$3,$2,$3
	move	$7,$10
	move	$4,$12
	addiu	$9,$sp,36
$L546:
	lh	$2,0($7)
	li	$8,-1			# 0xffffffffffffffff
	beq	$2,$0,$L545
	addu	$5,$3,$2

	lb	$8,-1($5)
$L545:
	sb	$8,0($4)
	addiu	$4,$4,1
	bne	$9,$4,$L546
	addiu	$7,$7,2

	lw	$25,4956($13)
	move	$5,$6
	sw	$12,16($sp)
	move	$4,$11
	move	$6,$21
	jalr	$25
	move	$7,$22

	lw	$28,24($sp)
$L559:
	lw	$31,84($sp)
	lw	$fp,80($sp)
	lw	$23,76($sp)
	lw	$22,72($sp)
	lw	$21,68($sp)
	lw	$20,64($sp)
	lw	$19,60($sp)
	lw	$18,56($sp)
	lw	$17,52($sp)
	lw	$16,48($sp)
	j	$31
	addiu	$sp,$sp,88

$L543:
	sll	$3,$6,1
	sra	$2,$21,2
	addu	$5,$3,$6
	sll	$4,$6,2
	addiu	$2,$2,1
	sw	$2,40($sp)
	addu	$17,$11,$3
	subu	$19,$11,$4
	addu	$18,$11,$5
	subu	$14,$11,$6
	subu	$16,$11,$3
	subu	$25,$11,$5
	addu	$15,$11,$6
	move	$24,$0
	li	$23,16			# 0x10
$L558:
	lbu	$8,0($14)
	lbu	$9,0($11)
	lbu	$10,0($16)
	subu	$5,$8,$9
	subu	$2,$0,$5
	slt	$3,$5,0
	movn	$5,$2,$3
	slt	$4,$5,$21
	lbu	$13,0($25)
	lbu	$12,0($15)
	beq	$4,$0,$L549
	lbu	$20,0($17)

	subu	$2,$10,$8
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$22
	beq	$2,$0,$L549
	subu	$2,$12,$9

	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$22
	beq	$2,$0,$L549
	lw	$3,40($sp)

	lbu	$7,0($19)
	slt	$2,$3,$5
	bne	$2,$0,$L552
	lbu	$fp,0($18)

	subu	$2,$13,$8
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$22
	bne	$2,$0,$L561
	addu	$2,$10,$8

	addu	$2,$8,$12
	sll	$3,$10,1
	addiu	$2,$2,2
	addu	$2,$2,$3
	sra	$2,$2,2
	sb	$2,0($14)
	subu	$2,$20,$9
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$22
	beq	$2,$0,$L563
	addu	$2,$10,$9

	addu	$7,$9,$8
$L564:
	addiu	$3,$7,4
	sll	$4,$fp,1
	addu	$7,$7,$12
	addu	$3,$3,$12
	addu	$2,$10,$20
	sll	$5,$20,1
	addu	$3,$3,$4
	addu	$5,$5,$20
	addiu	$2,$2,4
	sll	$6,$7,1
	addiu	$4,$20,2
	addu	$2,$2,$6
	addu	$4,$4,$7
	addu	$3,$3,$5
	sra	$2,$2,3
	sra	$4,$4,2
	sra	$3,$3,3
	sb	$2,0($11)
	sb	$4,0($15)
	sb	$3,0($17)
$L549:
	addiu	$24,$24,1
	addiu	$14,$14,1
	addiu	$16,$16,1
	addiu	$25,$25,1
	addiu	$15,$15,1
	addiu	$17,$17,1
	addiu	$19,$19,1
	beq	$24,$23,$L559
	addiu	$18,$18,1

	b	$L558
	addiu	$11,$11,1

$L552:
	addu	$3,$10,$9
	addu	$2,$8,$12
	addiu	$2,$2,2
	addiu	$3,$3,2
	sll	$5,$12,1
	sll	$4,$10,1
	addu	$2,$2,$4
	addu	$3,$3,$5
	sra	$2,$2,2
	sra	$3,$3,2
	sb	$2,0($14)
	b	$L549
	sb	$3,0($11)

$L561:
	addiu	$4,$2,4
	addu	$6,$2,$9
	addu	$3,$13,$12
	addiu	$2,$2,2
	addu	$4,$4,$9
	sll	$7,$7,1
	sll	$5,$13,1
	addiu	$3,$3,4
	sll	$6,$6,1
	addu	$2,$2,$13
	addu	$4,$4,$7
	addu	$5,$5,$13
	addu	$3,$3,$6
	addu	$2,$2,$9
	sra	$3,$3,3
	sra	$2,$2,2
	addu	$4,$4,$5
	sb	$3,0($14)
	sra	$4,$4,3
	sb	$2,0($16)
	subu	$2,$20,$9
	sb	$4,0($25)
	slt	$3,$2,0
	subu	$4,$0,$2
	movn	$2,$4,$3
	slt	$2,$2,$22
	bne	$2,$0,$L564
	addu	$7,$9,$8

	addu	$2,$10,$9
$L563:
	addiu	$2,$2,2
	sll	$3,$12,1
	addu	$2,$2,$3
	sra	$2,$2,2
	b	$L549
	sb	$2,0($11)

	.set	macro
	.set	reorder
	.end	filter_mb_edgeh
	.align	2
	.ent	filter_mb_edgech
	.type	filter_mb_edgech, @function
filter_mb_edgech:
	.set	nomips16
	.frame	$sp,48,$31		# vars= 8, regs= 1/0, args= 24, gp= 8
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	.cprestore	24
	li	$2,65536			# 0x10000
	addu	$2,$4,$2
	move	$10,$7
	lw	$8,5344($2)
	lw	$7,64($sp)
	move	$12,$4
	lw	$4,5348($2)
	lh	$9,0($10)
	lui	$3,%hi(beta_table+52)
	lui	$2,%hi(alpha_table+52)
	addu	$4,$7,$4
	addiu	$3,$3,%lo(beta_table+52)
	addu	$7,$7,$8
	addiu	$2,$2,%lo(alpha_table+52)
	addu	$3,$3,$4
	addu	$2,$2,$7
	slt	$9,$9,4
	move	$4,$5
	lbu	$13,0($3)
	move	$5,$6
	beq	$9,$0,$L566
	lbu	$6,0($2)

	sll	$3,$7,1
	addu	$3,$3,$7
	lui	$2,%hi(tc0_table)
	addiu	$3,$3,156
	addiu	$14,$sp,32
	addiu	$2,$2,%lo(tc0_table)
	addu	$3,$2,$3
	move	$7,$10
	move	$8,$14
	addiu	$11,$sp,36
$L569:
	lh	$2,0($7)
	move	$10,$0
	beq	$2,$0,$L568
	addu	$9,$3,$2

	lbu	$2,-1($9)
	addiu	$2,$2,1
	sll	$10,$2,24
	sra	$10,$10,24
$L568:
	sb	$10,0($8)
	addiu	$8,$8,1
	bne	$11,$8,$L569
	addiu	$7,$7,2

	lw	$25,4964($12)
	move	$7,$13
	jalr	$25
	sw	$14,16($sp)

	lw	$31,44($sp)
	lw	$28,24($sp)
	j	$31
	addiu	$sp,$sp,48

$L566:
	lw	$25,4972($12)
	jalr	$25
	move	$7,$13

	lw	$31,44($sp)
	lw	$28,24($sp)
	j	$31
	addiu	$sp,$sp,48

	.set	macro
	.set	reorder
	.end	filter_mb_edgech
	.align	2
	.ent	filter_mb
	.type	filter_mb, @function
filter_mb:
	.set	nomips16
	.frame	$sp,208,$31		# vars= 136, regs= 10/0, args= 24, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-208
	sw	$31,204($sp)
	sw	$fp,200($sp)
	sw	$23,196($sp)
	sw	$22,192($sp)
	sw	$21,188($sp)
	sw	$20,184($sp)
	sw	$19,180($sp)
	sw	$18,176($sp)
	sw	$17,172($sp)
	sw	$16,168($sp)
	.cprestore	24
	lw	$8,152($4)
	mtlo	$5
	madd	$6,$8
	sw	$6,216($sp)
	mflo	$2
	lw	$6,1568($4)
	sll	$3,$2,2
	sw	$2,116($sp)
	addu	$2,$6,$3
	lw	$2,0($2)
	sw	$3,140($sp)
	sw	$2,136($sp)
	li	$3,65536			# 0x10000
	move	$19,$4
	move	$10,$5
	addu	$5,$4,$3
	lw	$4,136($sp)
	li	$9,2			# 0x2
	andi	$4,$4,0x80
	li	$3,4			# 0x4
	lw	$2,-6276($5)
	movn	$3,$9,$4
	sw	$4,132($sp)
	sw	$7,220($sp)
	beq	$2,$0,$L700
	sw	$3,112($sp)

	lw	$2,-6288($5)
	lw	$3,116($sp)
	addu	$7,$2,$3
	lbu	$4,-1($7)
	li	$2,255			# 0xff
	beq	$4,$2,$L577
	addiu	$2,$3,-1

	sll	$2,$2,2
	addu	$2,$6,$2
	lw	$3,0($2)
	lw	$2,136($sp)
	xor	$3,$2,$3
	andi	$3,$3,0x80
	beq	$3,$0,$L577
	nop

	lw	$2,5340($5)
	beq	$2,$9,$L701
	nop

	lw	$4,216($sp)
$L723:
	li	$3,-2			# 0xfffffffffffffffe
	and	$3,$4,$3
	mul	$4,$3,$8
	addiu	$2,$10,-1
	addu	$5,$4,$2
	lw	$2,136($sp)
	addu	$14,$5,$8
	andi	$4,$2,0x7
	sw	$5,32($sp)
	beq	$4,$0,$L581
	sw	$14,36($sp)

	li	$2,4
	sh	$2,72($sp)
	sh	$2,86($sp)
	sh	$2,84($sp)
	sh	$2,82($sp)
	sh	$2,80($sp)
	sh	$2,78($sp)
	sh	$2,76($sp)
	sh	$2,74($sp)
	addiu	$18,$sp,72
$L582:
	lw	$2,1548($19)
	lw	$8,116($sp)
	addu	$4,$2,$14
	addu	$3,$2,$8
	lb	$7,0($3)
	lb	$9,0($4)
	addu	$2,$2,$5
	lb	$12,0($2)
	andi	$2,$7,0xff
	addu	$2,$19,$2
	andi	$4,$9,0xff
	lbu	$5,12096($2)
	addu	$4,$19,$4
	lbu	$6,12352($2)
	andi	$3,$12,0xff
	lbu	$2,12096($4)
	lbu	$8,12352($4)
	addu	$3,$19,$3
	addiu	$5,$5,1
	lbu	$10,12352($3)
	lbu	$11,12096($3)
	addiu	$6,$6,1
	addu	$2,$5,$2
	addiu	$7,$7,1
	addu	$8,$6,$8
	sra	$2,$2,1
	addu	$9,$9,$7
	sra	$8,$8,1
	lui	$3,%hi(alpha_table+52)
	addu	$5,$5,$11
	addu	$6,$6,$10
	addu	$7,$7,$12
	sw	$2,52($sp)
	li	$2,65536			# 0x10000
	sra	$9,$9,1
	sra	$7,$7,1
	sra	$5,$5,1
	sra	$6,$6,1
	sw	$8,60($sp)
	addu	$16,$19,$2
	addiu	$22,$3,%lo(alpha_table+52)
	lui	$2,%hi(beta_table+52)
	lui	$3,%hi(tc0_table+156)
	lw	$8,220($sp)
	sw	$9,44($sp)
	sw	$7,40($sp)
	sw	$5,48($sp)
	sw	$6,56($sp)
	addiu	$23,$2,%lo(beta_table+52)
	addiu	$24,$3,%lo(tc0_table+156)
	move	$9,$0
	li	$20,-2			# 0xfffffffffffffffe
	addiu	$21,$sp,40
	li	$25,-256			# 0xffffffffffffff00
	li	$fp,16			# 0x10
$L622:
	lw	$4,-6272($16)
	bne	$4,$0,$L592
	sra	$2,$9,1

	and	$3,$2,$20
	andi	$2,$9,0x1
	or	$2,$3,$2
$L592:
	sll	$2,$2,1
	addu	$2,$18,$2
	lh	$6,0($2)
	beq	$6,$0,$L593
	nop

	beq	$4,$0,$L595
	andi	$2,$9,0x1

	sra	$2,$9,3
$L595:
	sll	$2,$2,2
	addu	$2,$2,$21
	lw	$3,0($2)
	lw	$4,5344($16)
	lw	$2,5348($16)
	addu	$5,$3,$4
	addu	$3,$3,$2
	addu	$3,$23,$3
	addu	$2,$22,$5
	slt	$4,$6,4
	lbu	$7,0($2)
	beq	$4,$0,$L596
	lbu	$12,0($3)

	lbu	$10,-1($8)
	lbu	$11,0($8)
	sll	$2,$5,1
	subu	$4,$10,$11
	addu	$2,$2,$5
	slt	$3,$4,0
	subu	$5,$0,$4
	movn	$4,$5,$3
	addu	$2,$24,$2
	addu	$2,$2,$6
	slt	$4,$4,$7
	lbu	$5,-1($2)
	lbu	$6,-2($8)
	lbu	$13,-3($8)
	lbu	$7,1($8)
	beq	$4,$0,$L593
	lbu	$14,2($8)

	subu	$2,$6,$10
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$12
	beq	$2,$0,$L593
	subu	$2,$7,$11

	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$12
	beq	$2,$0,$L593
	subu	$2,$13,$10

	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$12
	bne	$2,$0,$L600
	addu	$2,$10,$11

	move	$13,$5
$L602:
	subu	$2,$14,$11
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$12
	beq	$2,$0,$L720
	addiu	$2,$6,4

	addu	$2,$10,$11
	addiu	$2,$2,1
	sll	$3,$7,1
	sra	$2,$2,1
	subu	$3,$14,$3
	addu	$3,$3,$2
	sra	$3,$3,1
	subu	$4,$0,$5
	slt	$2,$3,$4
	bne	$2,$0,$L721
	addu	$2,$7,$4

	slt	$2,$3,$5
	move	$4,$3
	movz	$4,$5,$2
	addu	$2,$7,$4
$L721:
	sb	$2,1($8)
	addiu	$13,$13,1
	addiu	$2,$6,4
$L720:
	subu	$3,$11,$10
	sll	$3,$3,2
	subu	$2,$2,$7
	addu	$2,$2,$3
	sra	$3,$2,3
	subu	$5,$0,$13
	slt	$2,$3,$5
	bne	$2,$0,$L722
	addu	$4,$5,$10

	slt	$2,$3,$13
	move	$5,$3
	movz	$5,$13,$2
	addu	$4,$5,$10
$L722:
	and	$2,$4,$25
	beq	$2,$0,$L608
	subu	$2,$0,$4

	sra	$2,$2,31
	andi	$4,$2,0x00ff
$L609:
	subu	$3,$11,$5
	and	$2,$3,$25
	beq	$2,$0,$L610
	sb	$4,-1($8)

	subu	$2,$0,$3
	sra	$2,$2,31
	andi	$2,$2,0x00ff
	sb	$2,0($8)
$L593:
	addiu	$9,$9,1
	beq	$9,$fp,$L621
	lw	$2,232($sp)

	b	$L622
	addu	$8,$8,$2

$L701:
	lbu	$2,0($7)
	beq	$2,$4,$L723
	lw	$4,216($sp)

$L577:
	move	$5,$0
$L623:
	lw	$3,136($sp)
	li	$8,1			# 0x1
	andi	$2,$3,0x808
	xori	$2,$2,0x808
	li	$4,4			# 0x4
	li	$3,65536			# 0x10000
	movz	$4,$8,$2
	addu	$3,$19,$3
	lw	$2,236($sp)
	sw	$4,156($sp)
	sw	$3,152($sp)
	lw	$4,232($sp)
	lw	$3,232($sp)
	sll	$2,$2,1
	sw	$2,92($sp)
	sll	$3,$3,1
	sll	$4,$4,2
	addiu	$8,$sp,64
	addiu	$2,$sp,72
	move	$22,$0
	sw	$3,88($sp)
	sw	$4,120($sp)
	sw	$8,160($sp)
	bne	$22,$0,$L624
	sw	$2,164($sp)

$L710:
	lw	$3,116($sp)
	addiu	$3,$3,-1
	sw	$3,108($sp)
$L625:
	lw	$3,108($sp)
	lw	$8,152($sp)
	sll	$3,$3,2
	sw	$3,128($sp)
	li	$2,16			# 0x10
	addu	$3,$6,$3
	lw	$7,-6288($8)
	lw	$4,136($sp)
	sll	$2,$2,$22
	lw	$8,108($sp)
	lw	$3,0($3)
	ori	$2,$2,0x8
	and	$2,$2,$4
	sw	$3,104($sp)
	addu	$4,$7,$8
	beq	$2,$0,$L628
	lbu	$4,0($4)

	li	$2,32			# 0x20
	li	$3,3			# 0x3
	sra	$2,$2,$22
	sw	$3,100($sp)
$L629:
	lw	$3,136($sp)
	ori	$2,$2,0x8
	sw	$2,124($sp)
	and	$2,$2,$3
	beq	$5,$0,$L630
	sw	$2,96($sp)

	lw	$8,152($sp)
	li	$2,2			# 0x2
	lw	$3,5340($8)
	beq	$3,$2,$L702
	li	$16,1			# 0x1

$L632:
	lw	$4,152($sp)
	lw	$2,-6276($4)
	beq	$2,$0,$L646
	move	$17,$16

	li	$8,1			# 0x1
	beq	$22,$8,$L634
	lw	$4,216($sp)

	move	$17,$16
$L646:
	lw	$3,156($sp)
$L730:
	slt	$2,$17,$3
	beq	$2,$0,$L636
	nop

	lw	$6,1568($19)
$L635:
	lw	$2,92($sp)
	lw	$4,220($sp)
	mul	$2,$17,$2
	lw	$8,220($sp)
	mtlo	$4
	lw	$4,120($sp)
	sll	$3,$17,3
	sw	$2,144($sp)
	sll	$2,$17,2
	madd	$17,$4
	addu	$20,$8,$2
	addiu	$23,$3,12
	li	$2,8			# 0x8
	li	$3,1			# 0x1
	movz	$2,$3,$22
	mflo	$21
	sw	$2,148($sp)
	beq	$17,$0,$L648
	move	$fp,$0

$L707:
	lw	$4,140($sp)
	andi	$16,$17,0x1
	addu	$2,$6,$4
	beq	$16,$0,$L703
	lw	$3,0($2)

	lw	$8,136($sp)
	li	$2,16777216			# 0x1000000
	and	$2,$8,$2
	bne	$2,$0,$L724
	lw	$4,156($sp)

	lw	$18,116($sp)
	li	$16,1			# 0x1
$L650:
	lw	$4,136($sp)
	or	$2,$3,$4
	andi	$2,$2,0x7
	bne	$2,$0,$L704
	nop

$L652:
	lw	$4,100($sp)
	and	$2,$17,$4
	beq	$2,$0,$L659
	lw	$8,152($sp)

	sh	$0,70($sp)
	sh	$0,68($sp)
	sh	$0,66($sp)
	sh	$0,64($sp)
	li	$15,1			# 0x1
	addiu	$10,$17,12
$L660:
	lw	$11,160($sp)
	move	$13,$10
	move	$12,$23
	li	$24,2
	li	$25,1
$L686:
	move	$5,$12
	movz	$5,$13,$22
	addu	$2,$19,$5
	lbu	$3,9080($2)
	bne	$3,$0,$L675
	lw	$4,148($sp)

	subu	$6,$5,$4
	addu	$2,$19,$6
	lbu	$3,9080($2)
	bne	$3,$0,$L675
	nop

	bne	$15,$0,$L725
	lw	$4,164($sp)

	lw	$8,152($sp)
	sll	$2,$5,2
	lw	$4,-6284($8)
	sll	$3,$6,2
	addiu	$2,$2,9138
	addiu	$3,$3,9138
	addiu	$5,$5,9456
	addiu	$6,$6,9456
	xori	$4,$4,0x3
	addu	$8,$19,$2
	li	$14,1			# 0x1
	li	$2,2			# 0x2
	sh	$0,0($11)
	addu	$7,$19,$3
	addu	$10,$19,$5
	addu	$6,$19,$6
	movz	$14,$2,$4
	move	$9,$0
$L678:
	slt	$2,$9,$14
	beq	$2,$0,$L677
	addiu	$9,$9,1

	lb	$2,0($10)
	lb	$3,0($6)
	addiu	$2,$2,2
	addiu	$3,$3,2
	lui	$4,%hi(ref2frm.16201)
	addiu	$4,$4,%lo(ref2frm.16201)
	sll	$2,$2,2
	sll	$3,$3,2
	addu	$2,$2,$4
	addu	$3,$3,$4
	lw	$5,0($2)
	lw	$4,0($3)
	addiu	$10,$10,40
	bne	$5,$4,$L679
	addiu	$6,$6,40

	lh	$3,-2($7)
	lh	$2,-2($8)
	subu	$2,$2,$3
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,4
	bne	$2,$0,$L705
	nop

$L679:
	sh	$25,0($11)
$L677:
	lw	$4,164($sp)
$L725:
	addiu	$11,$11,2
	addiu	$12,$12,1
	bne	$4,$11,$L686
	addiu	$13,$13,8

	lh	$2,66($sp)
	lh	$3,64($sp)
	lh	$5,68($sp)
	addu	$2,$2,$3
	lh	$4,70($sp)
	addu	$2,$2,$5
	addu	$2,$2,$4
	beq	$2,$0,$L724
	lw	$4,156($sp)

	lw	$2,1548($19)
	lw	$8,116($sp)
	addu	$4,$2,$8
	lb	$3,0($4)
	addu	$2,$2,$18
	lb	$4,0($2)
	addiu	$3,$3,1
	addu	$3,$3,$4
	bne	$22,$0,$L687
	sra	$3,$3,1

$L708:
	lw	$6,232($sp)
	lw	$7,160($sp)
	move	$4,$19
	move	$5,$20
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$3,16($sp)

	beq	$16,$0,$L706
	lw	$28,24($sp)

$L651:
	lw	$4,156($sp)
$L724:
	addiu	$17,$17,1
	lw	$8,120($sp)
	lw	$3,92($sp)
	slt	$2,$17,$4
	addu	$21,$21,$8
	addu	$fp,$fp,$3
	addiu	$20,$20,4
	beq	$2,$0,$L636
	addiu	$23,$23,8

$L709:
	bne	$17,$0,$L707
	lw	$6,1568($19)

$L648:
	lw	$4,128($sp)
	lw	$18,108($sp)
	addu	$2,$6,$4
	lw	$3,0($2)
	lw	$4,136($sp)
	or	$2,$3,$4
	andi	$2,$2,0x7
	beq	$2,$0,$L652
	move	$16,$0

$L704:
	bne	$17,$0,$L657
	li	$2,3			# 0x3

	lw	$8,132($sp)
	bne	$8,$0,$L726
	lw	$4,152($sp)

	lw	$3,104($sp)
	andi	$2,$3,0x80
	beq	$2,$0,$L657
	li	$2,4			# 0x4

	lw	$4,152($sp)
$L726:
	lw	$2,-6276($4)
	bne	$2,$0,$L656
	li	$8,3			# 0x3

	lw	$2,8500($19)
	beq	$2,$8,$L657
	li	$2,3			# 0x3

$L656:
	beq	$22,$0,$L657
	li	$2,4			# 0x4

	li	$2,3			# 0x3
$L657:
	sh	$2,64($sp)
	sh	$2,70($sp)
	sh	$2,68($sp)
	sh	$2,66($sp)
	lw	$8,116($sp)
	lw	$2,1548($19)
	addu	$4,$2,$8
	lb	$3,0($4)
	addu	$2,$2,$18
	lb	$4,0($2)
	addiu	$3,$3,1
	addu	$3,$3,$4
	beq	$22,$0,$L708
	sra	$3,$3,1

$L687:
	lw	$6,232($sp)
	lw	$7,160($sp)
	move	$4,$19
	move	$5,$21
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$3,16($sp)

	bne	$16,$0,$L651
	lw	$28,24($sp)

	lw	$2,1548($19)
	lw	$8,8740($19)
	addu	$2,$2,$18
	lbu	$3,0($2)
	lw	$4,144($sp)
	addu	$3,$19,$3
	lbu	$2,12096($3)
	addiu	$8,$8,1
	addu	$8,$8,$2
	lw	$2,224($sp)
	addu	$16,$fp,$4
	lw	$6,236($sp)
	lw	$7,160($sp)
	sra	$8,$8,1
	addu	$5,$2,$16
	move	$4,$19
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$8,16($sp)

	lw	$2,1548($19)
	lw	$8,8744($19)
	addu	$2,$2,$18
	lbu	$3,0($2)
	addiu	$8,$8,1
	addu	$3,$19,$3
	lbu	$2,12352($3)
	lw	$3,228($sp)
	addu	$8,$8,$2
	lw	$6,236($sp)
	lw	$7,160($sp)
	sra	$8,$8,1
	addu	$5,$3,$16
	move	$4,$19
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$8,16($sp)

	lw	$4,156($sp)
	addiu	$17,$17,1
	lw	$8,120($sp)
	lw	$3,92($sp)
	slt	$2,$17,$4
	lw	$28,24($sp)
	addu	$21,$21,$8
	addu	$fp,$fp,$3
	addiu	$20,$20,4
	bne	$2,$0,$L709
	addiu	$23,$23,8

$L636:
	addiu	$22,$22,1
	li	$2,2			# 0x2
	beq	$22,$2,$L692
	move	$5,$0

	beq	$22,$0,$L710
	lw	$6,1568($19)

$L624:
	lw	$4,8764($19)
	b	$L625
	sw	$4,108($sp)

$L705:
	lh	$3,0($7)
	lh	$2,0($8)
	addiu	$7,$7,160
	subu	$2,$2,$3
	slt	$3,$2,0
	subu	$4,$0,$2
	movn	$2,$4,$3
	lw	$3,112($sp)
	slt	$2,$2,$3
	bne	$2,$0,$L678
	addiu	$8,$8,160

	b	$L677
	sh	$25,0($11)

$L675:
	b	$L677
	sh	$24,0($11)

$L703:
	b	$L650
	lw	$18,116($sp)

$L706:
	lw	$2,1548($19)
	lw	$8,8740($19)
	addu	$2,$2,$18
	lbu	$3,0($2)
	addiu	$8,$8,1
	addu	$3,$19,$3
	lbu	$2,12096($3)
	sll	$16,$17,1
	addu	$8,$8,$2
	lw	$2,224($sp)
	lw	$6,236($sp)
	lw	$7,160($sp)
	sra	$8,$8,1
	addu	$5,$2,$16
	move	$4,$19
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$8,16($sp)

	lw	$2,1548($19)
	lw	$8,8744($19)
	addu	$2,$2,$18
	lbu	$3,0($2)
	addiu	$8,$8,1
	addu	$3,$19,$3
	lbu	$2,12352($3)
	lw	$3,228($sp)
	addu	$8,$8,$2
	lw	$6,236($sp)
	lw	$7,160($sp)
	sra	$8,$8,1
	addu	$5,$3,$16
	move	$4,$19
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$8,16($sp)

	b	$L651
	lw	$28,24($sp)

$L700:
	lw	$4,11848($19)
	lw	$2,11852($19)
	lw	$9,1548($19)
	slt	$3,$2,$4
	movn	$2,$4,$3
	lw	$3,116($sp)
	lw	$5,5344($5)
	slt	$4,$2,0
	addu	$8,$9,$3
	li	$3,15			# 0xf
	subu	$3,$3,$5
	movn	$2,$0,$4
	lb	$5,0($8)
	subu	$7,$3,$2
	slt	$4,$7,$5
	bne	$4,$0,$L577
	nop

	bne	$10,$0,$L711
	addiu	$2,$5,1

	lw	$4,216($sp)
$L719:
	beq	$4,$0,$L727
	lw	$31,204($sp)

	lw	$3,8764($19)
	addu	$3,$9,$3
	lb	$2,0($3)
	addiu	$2,$2,1
	addu	$2,$2,$5
	sra	$2,$2,1
	slt	$2,$7,$2
	bne	$2,$0,$L623
	move	$5,$0

$L692:
	lw	$31,204($sp)
$L727:
	lw	$fp,200($sp)
	lw	$23,196($sp)
	lw	$22,192($sp)
	lw	$21,188($sp)
	lw	$20,184($sp)
	lw	$19,180($sp)
	lw	$18,176($sp)
	lw	$17,172($sp)
	lw	$16,168($sp)
	j	$31
	addiu	$sp,$sp,208

$L659:
	lw	$2,-6276($8)
	beq	$2,$0,$L728
	lw	$8,96($sp)

	lw	$4,136($sp)
	xor	$2,$3,$4
	andi	$2,$2,0x80
	bne	$2,$0,$L712
	li	$2,1

	lw	$8,96($sp)
$L728:
	beq	$8,$0,$L729
	move	$15,$0

	beq	$17,$0,$L713
	lw	$4,124($sp)

$L663:
	bne	$22,$0,$L664
	move	$6,$23

	addiu	$10,$17,12
	move	$6,$10
	li	$2,1			# 0x1
$L690:
	lw	$8,152($sp)
	subu	$4,$6,$2
	lw	$5,-6284($8)
	sll	$2,$6,2
	addiu	$2,$2,9138
	xori	$5,$5,0x3
	addu	$11,$19,$2
	li	$12,1			# 0x1
	li	$2,2			# 0x2
	sll	$3,$4,2
	movz	$12,$2,$5
	move	$8,$0
	addiu	$3,$3,9138
	addiu	$6,$6,9456
	addiu	$4,$4,9456
	slt	$2,$8,$12
	addu	$9,$19,$3
	addu	$6,$19,$6
	beq	$2,$0,$L714
	addu	$7,$19,$4

$L672:
	lb	$2,0($6)
	lb	$3,0($7)
	addiu	$2,$2,2
	addiu	$3,$3,2
	lui	$4,%hi(ref2frm.16201)
	addiu	$4,$4,%lo(ref2frm.16201)
	sll	$2,$2,2
	sll	$3,$3,2
	addu	$2,$2,$4
	addu	$3,$3,$4
	lw	$5,0($2)
	lw	$4,0($3)
	beq	$5,$4,$L715
	nop

$L666:
	li	$2,1			# 0x1
$L673:
	sh	$2,64($sp)
	sh	$2,70($sp)
	sh	$2,68($sp)
	sh	$2,66($sp)
	b	$L660
	li	$15,1			# 0x1

$L630:
	lw	$8,152($sp)
	xori	$2,$4,0xff
	lw	$3,5340($8)
	sltu	$16,$2,1
	li	$2,2			# 0x2
	bne	$3,$2,$L632
	nop

$L702:
	lw	$2,116($sp)
	addu	$3,$7,$2
	lbu	$2,0($3)
	li	$3,1			# 0x1
	xor	$2,$2,$4
	b	$L632
	movn	$16,$3,$2

$L628:
	li	$2,32			# 0x20
	lw	$8,136($sp)
	sra	$2,$2,$22
	and	$3,$2,$8
	sltu	$3,$0,$3
	b	$L629
	sw	$3,100($sp)

$L713:
	and	$2,$3,$4
	bne	$2,$0,$L663
	move	$15,$0

$L729:
	b	$L660
	addiu	$10,$17,12

$L712:
	sh	$2,64($sp)
	sh	$2,70($sp)
	sh	$2,68($sp)
	sh	$2,66($sp)
	li	$15,1			# 0x1
	b	$L660
	addiu	$10,$17,12

$L715:
	lh	$3,-2($9)
	lh	$2,-2($11)
	subu	$2,$2,$3
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,4
	beq	$2,$0,$L666
	addiu	$6,$6,40

	lh	$3,0($9)
	lh	$2,0($11)
	addiu	$9,$9,160
	subu	$2,$2,$3
	slt	$3,$2,0
	subu	$4,$0,$2
	movn	$2,$4,$3
	lw	$3,112($sp)
	addiu	$11,$11,160
	slt	$2,$2,$3
	beq	$2,$0,$L666
	addiu	$7,$7,40

	addiu	$8,$8,1
	slt	$2,$8,$12
	bne	$2,$0,$L672
	nop

$L714:
	b	$L673
	move	$2,$0

$L634:
	andi	$2,$4,0x1
	bne	$2,$0,$L646
	move	$17,$16

	bne	$16,$0,$L730
	lw	$3,156($sp)

	lw	$8,132($sp)
	bne	$8,$0,$L635
	move	$17,$0

	lw	$3,104($sp)
	andi	$2,$3,0x80
	beq	$2,$0,$L635
	lw	$4,136($sp)

	lw	$2,152($19)
	lw	$8,116($sp)
	sll	$2,$2,1
	lw	$20,220($sp)
	andi	$18,$4,0x7
	subu	$16,$8,$2
	move	$21,$0
	move	$17,$0
	li	$23,3
	li	$fp,2
$L647:
	bne	$18,$0,$L638
	sll	$4,$16,2

	lw	$2,1568($19)
	addu	$2,$2,$4
	lw	$3,0($2)
	andi	$3,$3,0x7
	bne	$3,$0,$L638
	lui	$5,%hi(nnz_idx.16229)

	lw	$3,9128($19)
	sll	$2,$16,4
	addu	$7,$3,$2
	move	$6,$19
	lw	$4,160($sp)
	b	$L644
	addiu	$5,$5,%lo(nnz_idx.16229)

$L716:
	lw	$2,0($5)
	addu	$2,$7,$2
	lbu	$3,0($2)
	bne	$3,$0,$L641
	li	$2,1

	sh	$2,0($4)
$L643:
	lw	$3,164($sp)
	addiu	$4,$4,2
	addiu	$6,$6,1
	beq	$3,$4,$L640
	addiu	$5,$5,4

$L644:
	lbu	$2,9092($6)
	beq	$2,$0,$L716
	nop

$L641:
	b	$L643
	sh	$fp,0($4)

$L664:
	li	$2,8			# 0x8
	b	$L690
	addiu	$10,$17,12

$L711:
	lb	$3,-1($8)
	addu	$2,$2,$3
	sra	$2,$2,1
	slt	$2,$7,$2
	bne	$2,$0,$L577
	lw	$4,216($sp)

	b	$L719
	nop

$L596:
	lbu	$10,-1($8)
	lbu	$11,0($8)
	lbu	$15,-2($8)
	subu	$5,$10,$11
	subu	$2,$0,$5
	slt	$3,$5,0
	movn	$5,$2,$3
	slt	$4,$5,$7
	lbu	$14,-3($8)
	lbu	$13,1($8)
	beq	$4,$0,$L593
	lbu	$17,2($8)

	subu	$2,$15,$10
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$12
	beq	$2,$0,$L593
	subu	$2,$13,$11

	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$12
	beq	$2,$0,$L593
	sra	$2,$7,2

	addiu	$2,$2,1
	slt	$2,$2,$5
	bne	$2,$0,$L615
	addu	$3,$15,$11

	subu	$2,$14,$10
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$12
	beq	$2,$0,$L616
	addu	$2,$10,$13

	addu	$2,$15,$10
	lbu	$5,-4($8)
	addiu	$4,$2,4
	addu	$6,$2,$11
	addu	$4,$4,$11
	sll	$5,$5,1
	addu	$3,$14,$13
	addiu	$2,$2,2
	sll	$7,$14,1
	addu	$4,$4,$5
	addu	$7,$7,$14
	addiu	$3,$3,4
	sll	$6,$6,1
	addu	$2,$2,$14
	addu	$3,$3,$6
	addu	$4,$4,$7
	addu	$2,$2,$11
	sra	$3,$3,3
	sra	$2,$2,2
	sra	$4,$4,3
	sb	$3,-1($8)
	sb	$2,-2($8)
	sb	$4,-3($8)
$L618:
	subu	$2,$17,$11
	subu	$4,$0,$2
	slt	$3,$2,0
	movn	$2,$4,$3
	slt	$2,$2,$12
	beq	$2,$0,$L619
	addu	$2,$15,$11

	addu	$7,$11,$10
	lbu	$4,3($8)
	addiu	$3,$7,4
	sll	$4,$4,1
	addu	$7,$7,$13
	addu	$3,$3,$13
	addu	$2,$15,$17
	sll	$5,$17,1
	addu	$3,$3,$4
	addu	$5,$5,$17
	addiu	$2,$2,4
	sll	$6,$7,1
	addiu	$4,$17,2
	addu	$2,$2,$6
	addu	$4,$4,$7
	addu	$3,$3,$5
	sra	$2,$2,3
	sra	$4,$4,2
	sra	$3,$3,3
	sb	$2,0($8)
	sb	$4,1($8)
	b	$L593
	sb	$3,2($8)

$L621:
	lw	$5,224($sp)
	lw	$6,236($sp)
	addiu	$2,$sp,48
	move	$4,$19
	move	$7,$18
	.option	pic0
	jal	filter_mb_mbaff_edgecv
	.option	pic2
	sw	$2,16($sp)

	lw	$5,228($sp)
	lw	$6,236($sp)
	addiu	$2,$sp,56
	move	$7,$18
	move	$4,$19
	.option	pic0
	jal	filter_mb_mbaff_edgecv
	.option	pic2
	sw	$2,16($sp)

	lw	$28,24($sp)
	li	$5,1			# 0x1
	b	$L623
	lw	$6,1568($19)

$L581:
	lw	$4,216($sp)
	addiu	$18,$sp,72
	andi	$3,$4,0x1
	li	$2,65536			# 0x10000
	sll	$15,$3,1
	addu	$12,$19,$2
	move	$8,$18
	move	$4,$0
	addiu	$11,$sp,32
	li	$16,2
	li	$17,1
	li	$20,4
	b	$L591
	li	$13,8			# 0x8

$L717:
	sll	$2,$2,2
	addu	$2,$11,$2
	lw	$7,0($2)
	sll	$2,$7,2
	addu	$2,$6,$2
	lw	$3,0($2)
	andi	$3,$3,0x7
	beq	$3,$0,$L731
	sra	$2,$4,1

$L718:
	sh	$20,0($8)
$L586:
	addiu	$4,$4,1
	beq	$4,$13,$L582
	addiu	$8,$8,2

$L591:
	lw	$9,-6272($12)
	bne	$9,$0,$L717
	sra	$2,$4,2

	andi	$2,$4,0x1
	sll	$2,$2,2
	addu	$2,$11,$2
	lw	$7,0($2)
	sll	$2,$7,2
	addu	$2,$6,$2
	lw	$3,0($2)
	andi	$3,$3,0x7
	bne	$3,$0,$L718
	sra	$2,$4,1

$L731:
	sll	$2,$2,3
	addu	$2,$19,$2
	lbu	$3,9092($2)
	bne	$3,$0,$L587
	nop

	beq	$9,$0,$L588
	lw	$10,9128($19)

	andi	$3,$4,0x3
$L589:
	sll	$2,$7,4
	addu	$2,$10,$2
	addu	$2,$2,$3
	lbu	$3,0($2)
	bne	$3,$0,$L587
	nop

	b	$L586
	sh	$17,0($8)

$L587:
	b	$L586
	sh	$16,0($8)

$L588:
	sra	$2,$4,2
	b	$L589
	addu	$3,$2,$15

$L615:
	addu	$2,$10,$13
	addiu	$2,$2,2
	addiu	$3,$3,2
	sll	$5,$13,1
	sll	$4,$15,1
	addu	$2,$2,$4
	addu	$3,$3,$5
	sra	$2,$2,2
	sra	$3,$3,2
	sb	$2,-1($8)
	b	$L593
	sb	$3,0($8)

$L600:
	addiu	$2,$2,1
	sll	$3,$6,1
	sra	$2,$2,1
	subu	$3,$13,$3
	addu	$3,$3,$2
	sra	$3,$3,1
	subu	$4,$0,$5
	slt	$2,$3,$4
	bne	$2,$0,$L732
	addu	$2,$6,$4

	slt	$2,$3,$5
	move	$4,$3
	movz	$4,$5,$2
	addu	$2,$6,$4
$L732:
	sb	$2,-2($8)
	b	$L602
	addiu	$13,$5,1

$L638:
	sh	$23,70($sp)
	sh	$23,68($sp)
	sh	$23,66($sp)
	sh	$23,64($sp)
$L640:
	lw	$3,1548($19)
	lw	$8,116($sp)
	lw	$6,88($sp)
	addu	$4,$3,$8
	lb	$2,0($4)
	addu	$3,$3,$16
	lb	$4,0($3)
	addiu	$2,$2,1
	addu	$2,$2,$4
	lw	$7,160($sp)
	move	$5,$20
	sra	$2,$2,1
	move	$4,$19
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$2,16($sp)

	lw	$2,1548($19)
	lw	$8,8740($19)
	addu	$2,$2,$16
	lbu	$3,0($2)
	addiu	$8,$8,1
	addu	$3,$19,$3
	lbu	$2,12096($3)
	lw	$3,224($sp)
	addu	$8,$8,$2
	lw	$6,92($sp)
	lw	$7,160($sp)
	addu	$5,$3,$17
	sra	$8,$8,1
	move	$4,$19
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$8,16($sp)

	lw	$2,1548($19)
	lw	$8,8744($19)
	addu	$2,$2,$16
	lbu	$3,0($2)
	lw	$4,228($sp)
	addu	$3,$19,$3
	lbu	$2,12352($3)
	addiu	$8,$8,1
	addu	$8,$8,$2
	lw	$6,92($sp)
	lw	$7,160($sp)
	sra	$8,$8,1
	addu	$5,$4,$17
	move	$4,$19
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$8,16($sp)

	lw	$2,236($sp)
	lw	$8,232($sp)
	addiu	$21,$21,1
	li	$3,2			# 0x2
	addu	$17,$17,$2
	lw	$28,24($sp)
	addu	$20,$20,$8
	bne	$21,$3,$L645
	lw	$2,152($19)

	b	$L646
	li	$17,1			# 0x1

$L610:
	andi	$2,$3,0x00ff
	b	$L593
	sb	$2,0($8)

$L608:
	b	$L609
	andi	$4,$4,0x00ff

$L645:
	b	$L647
	addu	$16,$16,$2

$L619:
	addiu	$2,$2,2
	sll	$3,$13,1
	addu	$2,$2,$3
	sra	$2,$2,2
	b	$L593
	sb	$2,0($8)

$L616:
	addiu	$2,$2,2
	sll	$3,$15,1
	addu	$2,$2,$3
	sra	$2,$2,2
	b	$L618
	sb	$2,-1($8)

	.set	macro
	.set	reorder
	.end	filter_mb
	.align	2
	.ent	filter_mb_fast
	.type	filter_mb_fast, @function
filter_mb_fast:
	.set	nomips16
	.frame	$sp,200,$31		# vars= 112, regs= 10/0, args= 40, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-200
	sw	$31,196($sp)
	sw	$fp,192($sp)
	sw	$23,188($sp)
	sw	$22,184($sp)
	sw	$21,180($sp)
	sw	$20,176($sp)
	sw	$19,172($sp)
	sw	$18,168($sp)
	sw	$17,164($sp)
	sw	$16,160($sp)
	.cprestore	40
	move	$18,$4
	move	$22,$7
	lw	$23,216($sp)
	lw	$fp,220($sp)
	lw	$19,224($sp)
	lw	$20,228($sp)
	beq	$5,$0,$L734
	lw	$4,152($4)

	beq	$6,$0,$L734
	nop

	lw	$25,4980($18)
	beq	$25,$0,$L734
	nop

	lw	$2,12608($18)
	bne	$2,$0,$L734
	li	$2,65536			# 0x10000

	addu	$7,$18,$2
	mul	$2,$6,$4
	lw	$3,5340($7)
	addu	$12,$2,$5
	li	$2,2			# 0x2
	beq	$3,$2,$L769
	nop

	lw	$13,8764($18)
	lw	$2,1548($18)
$L786:
	lw	$11,1568($18)
	addu	$3,$2,$12
	lb	$4,0($3)
	addu	$2,$2,$13
	sw	$4,144($sp)
	lb	$10,-1($3)
	andi	$3,$4,0xff
	lb	$8,0($2)
	addu	$3,$18,$3
	li	$2,65536			# 0x10000
	lbu	$3,12096($3)
	addu	$2,$18,$2
	andi	$5,$8,0xff
	lw	$7,5344($2)
	sw	$3,140($sp)
	andi	$4,$10,0xff
	addu	$5,$18,$5
	li	$2,15			# 0xf
	lbu	$6,12096($5)
	addu	$4,$18,$4
	subu	$7,$2,$7
	lw	$5,144($sp)
	lw	$2,140($sp)
	lbu	$9,12096($4)
	addiu	$3,$5,1
	addiu	$4,$2,1
	addu	$6,$4,$6
	addu	$8,$8,$3
	addu	$4,$4,$9
	sll	$2,$12,2
	addu	$2,$11,$2
	addu	$3,$3,$10
	sra	$8,$8,1
	sra	$4,$4,1
	sra	$6,$6,1
	slt	$5,$7,$5
	lw	$9,0($2)
	sra	$10,$3,1
	sw	$8,128($sp)
	sw	$4,136($sp)
	bne	$5,$0,$L738
	sw	$6,132($sp)

	slt	$2,$7,$10
	bne	$2,$0,$L787
	andi	$2,$9,0x7

	slt	$2,$7,$8
	bne	$2,$0,$L787
	andi	$2,$9,0x7

	lw	$3,140($sp)
	slt	$2,$7,$3
	bne	$2,$0,$L787
	andi	$2,$9,0x7

	slt	$2,$7,$4
	bne	$2,$0,$L787
	andi	$2,$9,0x7

	slt	$2,$7,$6
	beq	$2,$0,$L788
	lw	$31,196($sp)

$L738:
	andi	$2,$9,0x7
$L787:
	beq	$2,$0,$L739
	li	$2,16777216			# 0x1000000

	lui	$4,%hi(C.668.16107)
	lui	$5,%hi(C.669.16108)
	addiu	$2,$4,%lo(C.668.16107)
	addiu	$3,$5,%lo(C.669.16108)
	lw	$7,4($2)
	lw	$8,4($3)
	lw	$6,%lo(C.668.16107)($4)
	lw	$3,%lo(C.669.16108)($5)
	li	$2,16777216			# 0x1000000
	and	$2,$9,$2
	sw	$6,48($sp)
	sw	$7,52($sp)
	sw	$3,56($sp)
	bne	$2,$0,$L770
	sw	$8,60($sp)

	addiu	$21,$sp,48
	move	$4,$18
	move	$5,$22
	move	$6,$19
	move	$7,$21
	sw	$10,16($sp)
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	addiu	$17,$sp,56

	lw	$9,144($sp)
	move	$4,$18
	addiu	$5,$22,4
	move	$6,$19
	move	$7,$17
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$9,16($sp)

	lw	$2,144($sp)
	move	$4,$18
	addiu	$5,$22,8
	move	$6,$19
	move	$7,$17
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$2,16($sp)

	lw	$3,144($sp)
	move	$4,$18
	addiu	$5,$22,12
	move	$6,$19
	move	$7,$17
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$3,16($sp)

	lw	$9,128($sp)
	move	$4,$18
	move	$5,$22
	move	$6,$19
	move	$7,$21
	sw	$9,16($sp)
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sll	$16,$19,2

	lw	$2,144($sp)
	move	$4,$18
	addu	$5,$22,$16
	move	$6,$19
	move	$7,$17
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$2,16($sp)

	lw	$3,144($sp)
	sll	$5,$19,3
	addu	$5,$22,$5
	move	$4,$18
	move	$6,$19
	move	$7,$17
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$3,16($sp)

	sll	$5,$19,4
	lw	$9,144($sp)
	subu	$5,$5,$16
	addu	$5,$22,$5
	move	$6,$19
	move	$4,$18
	move	$7,$17
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$9,16($sp)

	lw	$2,136($sp)
$L785:
	move	$4,$18
	move	$5,$23
	move	$6,$20
	move	$7,$21
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$2,16($sp)

	lw	$3,140($sp)
	move	$4,$18
	addiu	$5,$23,4
	move	$6,$20
	move	$7,$17
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$3,16($sp)

	lw	$9,136($sp)
	move	$4,$18
	move	$5,$fp
	move	$6,$20
	move	$7,$21
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$9,16($sp)

	lw	$2,140($sp)
	move	$4,$18
	addiu	$5,$fp,4
	move	$6,$20
	move	$7,$17
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$2,16($sp)

	lw	$3,132($sp)
	move	$4,$18
	move	$5,$23
	move	$6,$20
	move	$7,$21
	sw	$3,16($sp)
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sll	$16,$20,2

	lw	$9,140($sp)
	addu	$5,$23,$16
	move	$4,$18
	move	$6,$20
	move	$7,$17
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$9,16($sp)

	lw	$2,132($sp)
	move	$7,$21
	move	$4,$18
	move	$5,$fp
	move	$6,$20
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$2,16($sp)

	addu	$5,$fp,$16
	move	$4,$18
	move	$6,$20
	b	$L768
	move	$7,$17

$L769:
	lw	$2,-6288($7)
	lw	$13,8764($18)
	addu	$7,$2,$12
	addu	$2,$2,$13
	lbu	$4,0($2)
	lbu	$3,0($7)
	beq	$4,$3,$L771
	nop

$L734:
	move	$4,$18
$L792:
	move	$7,$22
	sw	$23,16($sp)
	sw	$fp,20($sp)
	sw	$19,24($sp)
	.option	pic0
	jal	filter_mb
	.option	pic2
	sw	$20,28($sp)

	lw	$28,40($sp)
$L767:
	lw	$31,196($sp)
$L788:
	lw	$fp,192($sp)
	lw	$23,188($sp)
	lw	$22,184($sp)
	lw	$21,180($sp)
	lw	$20,176($sp)
	lw	$19,172($sp)
	lw	$18,168($sp)
	lw	$17,164($sp)
	lw	$16,160($sp)
	j	$31
	addiu	$sp,$sp,200

$L739:
	addiu	$4,$sp,64
	and	$8,$9,$2
	beq	$8,$0,$L742
	sw	$4,148($sp)

	li	$2,131072			# 0x20000
	addu	$2,$18,$2
	lw	$3,8664($2)
	li	$2,7			# 0x7
	andi	$3,$3,0x7
	bne	$3,$2,$L789
	andi	$2,$9,0x28

	lw	$5,148($sp)
	li	$2,131072			# 0x20000
	li	$3,131072			# 0x20000
	ori	$2,$2,0x2
	ori	$3,$3,0x2
	addiu	$21,$sp,96
	addiu	$4,$12,-1
	sw	$2,16($21)
	sw	$3,20($21)
	sll	$17,$4,2
	sw	$2,0($5)
	sw	$3,4($5)
	li	$16,4			# 0x4
	sw	$2,96($sp)
	sw	$3,100($sp)
	sw	$2,16($5)
	sw	$3,20($5)
$L743:
	addu	$3,$11,$17
	lw	$2,0($3)
	andi	$2,$2,0x7
	beq	$2,$0,$L790
	sll	$2,$13,2

	lw	$4,148($sp)
	li	$2,262144			# 0x40000
	li	$3,262144			# 0x40000
	ori	$2,$2,0x4
	ori	$3,$3,0x4
	sw	$2,0($4)
	sw	$3,4($4)
	sll	$2,$13,2
$L790:
	addu	$2,$11,$2
	lw	$3,0($2)
	andi	$3,$3,0x7
	beq	$3,$0,$L791
	li	$2,1			# 0x1

	li	$2,262144			# 0x40000
	li	$3,262144			# 0x40000
	ori	$2,$2,0x4
	ori	$3,$3,0x4
	sw	$2,0($21)
	sw	$3,4($21)
	li	$2,1			# 0x1
$L791:
	beq	$16,$2,$L772
	lw	$5,148($sp)

	beq	$8,$0,$L753
	lw	$4,148($sp)

	lw	$3,148($sp)
	lw	$2,0($3)
	lw	$3,4($3)
	or	$2,$2,$3
	bne	$2,$0,$L773
	lw	$7,148($sp)

$L754:
	lw	$4,148($sp)
	lw	$3,20($4)
	lw	$2,16($4)
	or	$2,$2,$3
	bne	$2,$0,$L774
	addiu	$16,$sp,80

$L755:
	lw	$2,0($21)
	lw	$3,4($21)
	or	$2,$2,$3
	bne	$2,$0,$L775
	addiu	$16,$sp,96

$L756:
	lw	$3,20($21)
	lw	$2,16($21)
	or	$2,$2,$3
	beq	$2,$0,$L788
	lw	$31,196($sp)

	addiu	$16,$sp,112
	lw	$9,144($sp)
	sll	$5,$19,3
	addu	$5,$22,$5
	move	$6,$19
	move	$4,$18
	move	$7,$16
	sll	$17,$20,2
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$9,16($sp)

	lw	$2,140($sp)
	addu	$5,$23,$17
	move	$4,$18
	move	$6,$20
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$2,16($sp)

	addu	$5,$fp,$17
	move	$4,$18
	move	$6,$20
	move	$7,$16
$L768:
	lw	$3,140($sp)
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$3,16($sp)

	b	$L767
	lw	$28,40($sp)

$L742:
	andi	$2,$9,0x28
$L789:
	beq	$2,$0,$L776
	srl	$2,$9,4

	addiu	$2,$12,-1
	sll	$17,$2,2
	addu	$3,$11,$17
	lw	$2,0($3)
	andi	$2,$2,0x28
	beq	$2,$0,$L766
	li	$5,3			# 0x3

	li	$6,3			# 0x3
$L765:
	li	$4,1			# 0x1
	li	$2,2			# 0x2
	andi	$3,$9,0x8
	beq	$3,$0,$L747
	movn	$4,$2,$8

	li	$2,131072			# 0x20000
	addu	$2,$18,$2
	lw	$3,8664($2)
	andi	$3,$3,0xf
	bne	$3,$0,$L747
	nop

	li	$16,1			# 0x1
$L748:
	li	$2,65536			# 0x10000
	addu	$2,$18,$2
	lw	$3,-6284($2)
	sw	$4,24($sp)
	xori	$3,$3,0x3
	sltu	$3,$3,1
	lw	$4,148($sp)
	sw	$6,28($sp)
	sw	$5,32($sp)
	sw	$8,152($sp)
	sw	$10,156($sp)
	sw	$3,16($sp)
	sw	$16,20($sp)
	addiu	$5,$18,9080
	addiu	$6,$18,9456
	jalr	$25
	addiu	$7,$18,9136

	lw	$28,40($sp)
	lw	$11,1568($18)
	lw	$13,8764($18)
	addiu	$21,$sp,96
	lw	$10,156($sp)
	b	$L743
	lw	$8,152($sp)

$L770:
	addiu	$21,$sp,48
	move	$4,$18
	move	$5,$22
	move	$6,$19
	move	$7,$21
	sw	$10,16($sp)
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	addiu	$17,$sp,56

	lw	$9,144($sp)
	move	$4,$18
	addiu	$5,$22,8
	move	$6,$19
	move	$7,$17
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$9,16($sp)

	lw	$2,128($sp)
	move	$4,$18
	move	$5,$22
	move	$6,$19
	move	$7,$21
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$2,16($sp)

	lw	$3,144($sp)
	sll	$5,$19,3
	addu	$5,$22,$5
	move	$6,$19
	move	$4,$18
	move	$7,$17
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$3,16($sp)

	b	$L785
	lw	$2,136($sp)

$L776:
	andi	$5,$2,0x1
$L766:
	addiu	$2,$12,-1
	sll	$17,$2,2
	b	$L765
	move	$6,$0

$L771:
	lbu	$2,-1($7)
	bne	$2,$4,$L792
	move	$4,$18

	b	$L786
	lw	$2,1548($18)

$L747:
	b	$L748
	li	$16,4			# 0x4

$L753:
	lw	$2,0($4)
	lw	$3,4($4)
	or	$2,$2,$3
	bne	$2,$0,$L777
	lw	$7,148($sp)

$L757:
	lw	$3,148($sp)
	lw	$2,8($3)
	lw	$3,12($3)
	or	$2,$2,$3
	bne	$2,$0,$L778
	lw	$9,144($sp)

$L758:
	lw	$3,148($sp)
	lw	$2,16($3)
	lw	$3,20($3)
	or	$2,$2,$3
	bne	$2,$0,$L779
	lw	$9,144($sp)

$L759:
	lw	$4,148($sp)
	lw	$3,28($4)
	lw	$2,24($4)
	or	$2,$2,$3
	bne	$2,$0,$L780
	lw	$9,144($sp)

$L760:
	lw	$2,0($21)
	lw	$3,4($21)
	or	$2,$2,$3
	bne	$2,$0,$L781
	lw	$2,128($sp)

$L761:
	lw	$2,8($21)
	lw	$3,12($21)
	or	$2,$2,$3
	bne	$2,$0,$L782
	lw	$2,144($sp)

$L762:
	lw	$2,16($21)
	lw	$3,20($21)
	or	$2,$2,$3
	bne	$2,$0,$L783
	lw	$3,144($sp)

$L763:
	lw	$3,28($21)
	lw	$2,24($21)
	or	$2,$2,$3
	beq	$2,$0,$L788
	lw	$31,196($sp)

	sll	$2,$19,2
	sll	$5,$19,4
	subu	$5,$5,$2
	lw	$3,144($sp)
	addu	$5,$22,$5
	move	$4,$18
	move	$6,$19
	addiu	$7,$sp,120
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$3,16($sp)

	b	$L767
	lw	$28,40($sp)

$L772:
	lw	$2,0($5)
	lw	$3,4($5)
	or	$2,$2,$3
	bne	$2,$0,$L784
	lw	$7,148($sp)

$L752:
	lw	$3,4($21)
	lw	$2,0($21)
	or	$2,$2,$3
	beq	$2,$0,$L788
	lw	$31,196($sp)

	lw	$3,128($sp)
	addiu	$16,$sp,96
	move	$5,$22
	move	$6,$19
	move	$4,$18
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$3,16($sp)

	lw	$9,132($sp)
	move	$5,$23
	move	$4,$18
	move	$6,$20
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$9,16($sp)

	lw	$2,132($sp)
	move	$4,$18
	move	$5,$fp
	move	$6,$20
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$2,16($sp)

	b	$L767
	lw	$28,40($sp)

$L783:
	addiu	$16,$sp,112
	sll	$5,$19,3
	addu	$5,$22,$5
	move	$4,$18
	move	$6,$19
	move	$7,$16
	sw	$3,16($sp)
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sll	$17,$20,2

	lw	$9,140($sp)
	addu	$5,$23,$17
	move	$4,$18
	move	$6,$20
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$9,16($sp)

	lw	$2,140($sp)
	addu	$5,$fp,$17
	move	$6,$20
	move	$7,$16
	move	$4,$18
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$2,16($sp)

	b	$L763
	lw	$28,40($sp)

$L782:
	sll	$5,$19,2
	addu	$5,$22,$5
	move	$4,$18
	move	$6,$19
	addiu	$7,$sp,104
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$2,16($sp)

	b	$L762
	lw	$28,40($sp)

$L781:
	addiu	$16,$sp,96
	move	$4,$18
	move	$5,$22
	move	$6,$19
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$2,16($sp)

	lw	$3,132($sp)
	move	$4,$18
	move	$5,$23
	move	$6,$20
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$3,16($sp)

	lw	$9,132($sp)
	move	$7,$16
	move	$4,$18
	move	$5,$fp
	move	$6,$20
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$9,16($sp)

	b	$L761
	lw	$28,40($sp)

$L780:
	move	$4,$18
	addiu	$5,$22,12
	move	$6,$19
	addiu	$7,$sp,88
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$9,16($sp)

	b	$L760
	lw	$28,40($sp)

$L779:
	addiu	$16,$sp,80
	move	$4,$18
	addiu	$5,$22,8
	move	$6,$19
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$9,16($sp)

	lw	$2,140($sp)
	move	$4,$18
	addiu	$5,$23,4
	move	$6,$20
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$2,16($sp)

	lw	$3,140($sp)
	move	$7,$16
	move	$4,$18
	addiu	$5,$fp,4
	move	$6,$20
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$3,16($sp)

	b	$L759
	lw	$28,40($sp)

$L778:
	move	$4,$18
	addiu	$5,$22,4
	move	$6,$19
	addiu	$7,$sp,72
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$9,16($sp)

	b	$L758
	lw	$28,40($sp)

$L777:
	move	$4,$18
	move	$5,$22
	move	$6,$19
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$10,16($sp)

	lw	$9,136($sp)
	lw	$7,148($sp)
	move	$4,$18
	move	$5,$23
	move	$6,$20
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$9,16($sp)

	lw	$2,136($sp)
	lw	$7,148($sp)
	move	$4,$18
	move	$5,$fp
	move	$6,$20
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$2,16($sp)

	b	$L757
	lw	$28,40($sp)

$L774:
	lw	$9,144($sp)
	move	$4,$18
	addiu	$5,$22,8
	move	$6,$19
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$9,16($sp)

	lw	$2,140($sp)
	move	$4,$18
	addiu	$5,$23,4
	move	$6,$20
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$2,16($sp)

	lw	$3,140($sp)
	move	$7,$16
	move	$4,$18
	addiu	$5,$fp,4
	move	$6,$20
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$3,16($sp)

	b	$L755
	lw	$28,40($sp)

$L773:
	move	$4,$18
	move	$5,$22
	move	$6,$19
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$10,16($sp)

	lw	$9,136($sp)
	lw	$7,148($sp)
	move	$4,$18
	move	$5,$23
	move	$6,$20
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$9,16($sp)

	lw	$2,136($sp)
	lw	$7,148($sp)
	move	$4,$18
	move	$5,$fp
	move	$6,$20
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$2,16($sp)

	b	$L754
	lw	$28,40($sp)

$L775:
	lw	$9,128($sp)
	move	$4,$18
	move	$5,$22
	move	$6,$19
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgeh
	.option	pic2
	sw	$9,16($sp)

	lw	$2,132($sp)
	move	$4,$18
	move	$5,$23
	move	$6,$20
	move	$7,$16
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$2,16($sp)

	lw	$3,132($sp)
	move	$7,$16
	move	$4,$18
	move	$5,$fp
	move	$6,$20
	.option	pic0
	jal	filter_mb_edgech
	.option	pic2
	sw	$3,16($sp)

	b	$L756
	lw	$28,40($sp)

$L784:
	move	$4,$18
	move	$5,$22
	move	$6,$19
	.option	pic0
	jal	filter_mb_edgev
	.option	pic2
	sw	$10,16($sp)

	lw	$9,136($sp)
	lw	$7,148($sp)
	move	$4,$18
	move	$5,$23
	move	$6,$20
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$9,16($sp)

	lw	$2,136($sp)
	lw	$7,148($sp)
	move	$4,$18
	move	$5,$fp
	move	$6,$20
	.option	pic0
	jal	filter_mb_edgecv
	.option	pic2
	sw	$2,16($sp)

	b	$L752
	lw	$28,40($sp)

	.set	macro
	.set	reorder
	.end	filter_mb_fast
	.align	2
	.ent	svq3_add_idct_c
	.type	svq3_add_idct_c, @function
svq3_add_idct_c:
	.set	nomips16
	.frame	$sp,16,$31		# vars= 0, regs= 4/0, args= 0, gp= 0
	.mask	0x000f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	lui	$2,%hi(svq3_dequant_coeff)
	sw	$16,0($sp)
	sll	$7,$7,2
	addiu	$2,$2,%lo(svq3_dequant_coeff)
	lw	$16,32($sp)
	lui	$28,%hi(__gnu_local_gp)
	addu	$7,$7,$2
	sw	$19,12($sp)
	sw	$18,8($sp)
	sw	$17,4($sp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	move	$19,$4
	move	$8,$5
	move	$18,$6
	beq	$16,$0,$L794
	lw	$17,0($7)

	li	$2,1			# 0x1
	beq	$16,$2,$L802
	li	$2,196608			# 0x30000

	lh	$2,0($5)
	sh	$0,0($8)
	sra	$2,$2,3
	mul	$2,$17,$2
	srl	$4,$2,31
	addu	$4,$4,$2
	sra	$4,$4,1
	sll	$5,$4,3
	sll	$3,$4,5
	subu	$3,$3,$5
	sll	$2,$3,3
	subu	$2,$2,$3
	addu	$16,$2,$4
$L794:
	move	$15,$8
	move	$14,$8
	move	$24,$0
	li	$25,4			# 0x4
$L797:
	lh	$2,0($14)
	lh	$6,4($14)
	lh	$10,2($14)
	lh	$8,6($14)
	subu	$11,$2,$6
	addu	$6,$6,$2
	sll	$13,$6,2
	sll	$5,$6,4
	sll	$3,$8,3
	sll	$9,$10,4
	sll	$12,$11,2
	sll	$4,$11,4
	sll	$7,$8,4
	sll	$2,$10,3
	addu	$7,$7,$8
	subu	$5,$5,$13
	subu	$4,$4,$12
	subu	$2,$2,$10
	subu	$3,$3,$8
	addu	$9,$9,$10
	addu	$5,$5,$6
	subu	$2,$2,$7
	addu	$3,$3,$9
	addu	$4,$4,$11
	andi	$5,$5,0xffff
	andi	$3,$3,0xffff
	andi	$4,$4,0xffff
	andi	$2,$2,0xffff
	subu	$6,$4,$2
	subu	$7,$5,$3
	addu	$2,$2,$4
	addu	$3,$3,$5
	addiu	$24,$24,1
	sh	$3,0($14)
	sh	$2,2($14)
	sh	$6,4($14)
	sh	$7,6($14)
	bne	$24,$25,$L797
	addiu	$14,$14,8

	li	$2,524288			# 0x80000
	move	$12,$19
	sll	$4,$18,1
	addu	$19,$16,$2
	lw	$2,%got(ff_cropTbl)($28)
	addu	$3,$4,$18
	addu	$14,$12,$18
	addu	$24,$12,$3
	addiu	$16,$2,1024
	addu	$13,$12,$4
	move	$25,$0
	li	$18,4			# 0x4
$L798:
	lh	$7,16($15)
	lh	$6,0($15)
	lh	$10,8($15)
	lh	$9,24($15)
	addu	$3,$7,$6
	sll	$4,$3,2
	sll	$5,$3,4
	sll	$11,$9,3
	sll	$2,$10,4
	subu	$5,$5,$4
	addu	$2,$2,$10
	subu	$11,$11,$9
	addu	$5,$5,$3
	addu	$11,$11,$2
	addu	$4,$11,$5
	mul	$2,$17,$4
	subu	$6,$6,$7
	addu	$4,$2,$19
	lbu	$2,0($12)
	sra	$4,$4,20
	addu	$4,$4,$2
	sll	$8,$6,2
	sll	$3,$6,4
	sll	$2,$9,4
	sll	$7,$10,3
	addu	$2,$2,$9
	subu	$3,$3,$8
	subu	$7,$7,$10
	addu	$3,$3,$6
	subu	$7,$7,$2
	addu	$2,$7,$3
	addu	$4,$16,$4
	lbu	$6,0($4)
	mul	$4,$17,$2
	sb	$6,0($12)
	addu	$2,$4,$19
	lbu	$4,0($14)
	sra	$2,$2,20
	addu	$2,$2,$4
	addu	$2,$16,$2
	subu	$3,$3,$7
	lbu	$4,0($2)
	mul	$2,$17,$3
	sb	$4,0($14)
	addu	$3,$2,$19
	lbu	$2,0($13)
	sra	$3,$3,20
	addu	$3,$3,$2
	addu	$3,$16,$3
	lbu	$2,0($3)
	subu	$5,$5,$11
	sb	$2,0($13)
	mul	$2,$17,$5
	addiu	$25,$25,1
	addu	$5,$2,$19
	lbu	$2,0($24)
	sra	$5,$5,20
	addu	$5,$5,$2
	addu	$5,$16,$5
	lbu	$2,0($5)
	addiu	$15,$15,2
	sb	$2,0($24)
	addiu	$12,$12,1
	addiu	$14,$14,1
	addiu	$13,$13,1
	bne	$25,$18,$L798
	addiu	$24,$24,1

	lw	$19,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,16

$L802:
	lh	$3,0($5)
	ori	$2,$2,0xf752
	mul	$16,$3,$2
	b	$L794
	sh	$0,0($8)

	.set	macro
	.set	reorder
	.end	svq3_add_idct_c
	.align	2
	.ent	init_dequant_tables
	.type	init_dequant_tables, @function
init_dequant_tables:
	.set	nomips16
	.frame	$sp,96,$31		# vars= 32, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-96
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,92($sp)
	sw	$fp,88($sp)
	sw	$23,84($sp)
	sw	$22,80($sp)
	sw	$21,76($sp)
	sw	$20,72($sp)
	sw	$19,68($sp)
	sw	$18,64($sp)
	sw	$17,60($sp)
	sw	$16,56($sp)
	.cprestore	16
	li	$2,59204			# 0xe744
	addu	$2,$4,$2
	sw	$2,28($sp)
	addiu	$2,$4,12612
	addiu	$3,$4,11872
	sw	$2,52($sp)
	lui	$2,%hi(ff_div6)
	sw	$3,24($sp)
	sw	$4,96($sp)
	lw	$16,5116($4)
	addiu	$23,$2,%lo(ff_div6)
	lw	$4,52($sp)
	lw	$2,28($sp)
	lui	$3,%hi(ff_rem6)
	lw	$20,%got(ff_h264_idct_add_c)($28)
	lw	$21,24($sp)
	addiu	$fp,$3,%lo(ff_rem6)
	sw	$4,32($sp)
	sw	$2,36($sp)
	move	$22,$0
	li	$19,16			# 0x10
$L812:
	lw	$4,32($sp)
	lw	$3,36($sp)
	beq	$22,$0,$L804
	sw	$4,0($3)

	lw	$17,24($sp)
	b	$L807
	move	$18,$0

$L805:
	addiu	$18,$18,1
	slt	$2,$18,$22
	beq	$2,$0,$L839
	lw	$3,96($sp)

$L807:
	lw	$25,%call16(memcmp)($28)
	move	$4,$17
	move	$5,$21
	jalr	$25
	li	$6,16			# 0x10

	lw	$28,16($sp)
	bne	$2,$0,$L805
	addiu	$17,$17,16

	sll	$3,$18,2
	sll	$2,$18,4
	subu	$2,$2,$3
	addu	$2,$2,$18
	lw	$3,52($sp)
	sll	$2,$2,8
	lw	$4,36($sp)
	addu	$2,$3,$2
	sw	$2,0($4)
	lw	$3,36($sp)
$L838:
	lw	$4,32($sp)
	addiu	$3,$3,4
	addiu	$4,$4,3328
	addiu	$22,$22,1
	li	$2,6			# 0x6
	sw	$3,36($sp)
	sw	$4,32($sp)
	bne	$22,$2,$L812
	addiu	$21,$21,16

	lw	$3,96($sp)
	lw	$2,11868($3)
	beq	$2,$0,$L840
	addiu	$4,$3,32580

	li	$2,65536			# 0x10000
	addu	$2,$3,$2
	addiu	$3,$4,13312
	sw	$3,-6304($2)
	sw	$4,-6308($2)
	lw	$2,96($sp)
	li	$3,59228			# 0xe75c
	addu	$21,$2,$3
	lui	$3,%hi(ff_rem6)
	addiu	$22,$3,%lo(ff_rem6)
	lui	$3,%hi(dequant8_coeff_init)
	lui	$2,%hi(ff_div6)
	addiu	$19,$3,%lo(dequant8_coeff_init)
	lw	$3,96($sp)
	addiu	$23,$2,%lo(ff_div6)
	lui	$2,%hi(dequant8_coeff_init_scan)
	sw	$4,40($sp)
	addiu	$20,$2,%lo(dequant8_coeff_init_scan)
	addiu	$4,$3,11968
	addiu	$2,$3,12032
	lw	$16,5120($3)
	lw	$18,%got(ff_h264_idct8_add_c)($28)
	sw	$4,44($sp)
	sw	$2,48($sp)
	move	$14,$0
	li	$17,64			# 0x40
	li	$fp,52			# 0x34
$L814:
	lw	$3,96($sp)
	sll	$2,$14,6
	addu	$2,$3,$2
	lw	$12,0($21)
	addiu	$13,$2,11968
	move	$11,$0
	addu	$2,$22,$11
$L841:
	lbu	$3,0($2)
	addu	$4,$23,$11
	sll	$5,$3,3
	sll	$2,$11,8
	sll	$3,$3,1
	lbu	$10,0($4)
	subu	$9,$5,$3
	addu	$8,$12,$2
	move	$7,$13
	b	$L819
	move	$6,$0

$L818:
	sra	$2,$6,1
	andi	$3,$6,0x3
	andi	$2,$2,0xc
	or	$2,$2,$3
	addu	$2,$20,$2
	lbu	$3,0($2)
	lbu	$5,0($7)
	addu	$3,$9,$3
	addu	$3,$19,$3
	lbu	$2,0($3)
	sll	$4,$4,2
	mul	$2,$2,$5
	addu	$4,$8,$4
	sll	$2,$2,$10
	addiu	$6,$6,1
	sw	$2,0($4)
	beq	$6,$17,$L836
	addiu	$7,$7,1

$L819:
	andi	$2,$6,0x7
	sll	$2,$2,3
	sra	$3,$6,3
	bne	$16,$18,$L818
	or	$4,$2,$3

	b	$L818
	move	$4,$6

$L836:
	addiu	$11,$11,1
	bne	$11,$fp,$L841
	addu	$2,$22,$11

	li	$2,1			# 0x1
	bne	$14,$2,$L820
	lw	$25,%call16(memcmp)($28)

$L813:
	lw	$3,96($sp)
$L840:
	lw	$2,9924($3)
	beq	$2,$0,$L842
	lw	$31,92($sp)

	move	$7,$0
	li	$6,64			# 0x40
	li	$5,16			# 0x10
	li	$8,6			# 0x6
$L822:
	lw	$2,28($sp)
	move	$3,$0
	lw	$4,0($2)
$L823:
	sll	$2,$3,2
	addu	$2,$4,$2
	addiu	$3,$3,1
	bne	$3,$5,$L823
	sw	$6,0($2)

	lw	$4,28($sp)
	addiu	$7,$7,1
	addiu	$4,$4,4
	bne	$7,$8,$L822
	sw	$4,28($sp)

	lw	$3,96($sp)
	lw	$2,11868($3)
	beq	$2,$0,$L842
	lw	$31,92($sp)

	li	$2,59228			# 0xe75c
	addu	$4,$3,$2
	move	$7,$0
	li	$6,64			# 0x40
	li	$8,2			# 0x2
$L825:
	lw	$5,0($4)
	move	$3,$0
$L826:
	sll	$2,$3,2
	addu	$2,$5,$2
	addiu	$3,$3,1
	bne	$3,$6,$L826
	sw	$6,0($2)

	addiu	$7,$7,1
	bne	$7,$8,$L825
	addiu	$4,$4,4

	lw	$31,92($sp)
$L842:
	lw	$fp,88($sp)
	lw	$23,84($sp)
	lw	$22,80($sp)
	lw	$21,76($sp)
	lw	$20,72($sp)
	lw	$19,68($sp)
	lw	$18,64($sp)
	lw	$17,60($sp)
	lw	$16,56($sp)
	j	$31
	addiu	$sp,$sp,96

$L804:
	lw	$3,96($sp)
$L839:
	lw	$4,36($sp)
	sll	$2,$22,4
	addu	$2,$3,$2
	lw	$12,0($4)
	addiu	$13,$2,11872
	move	$11,$0
	addu	$2,$fp,$11
$L843:
	lbu	$4,0($2)
	addu	$3,$23,$11
	lbu	$5,0($3)
	sll	$3,$11,6
	sll	$2,$4,1
	addu	$10,$12,$3
	lui	$3,%hi(dequant4_coeff_init)
	addu	$2,$2,$4
	addiu	$3,$3,%lo(dequant4_coeff_init)
	addiu	$5,$5,2
	addu	$9,$3,$2
	move	$7,$13
	b	$L810
	move	$6,$0

$L808:
	or	$8,$3,$2
	andi	$2,$2,0x1
	andi	$3,$6,0x1
	addu	$2,$9,$2
	addu	$2,$2,$3
	lbu	$4,0($2)
	lbu	$3,0($7)
	sll	$2,$8,2
	mul	$4,$4,$3
	addu	$2,$10,$2
	sll	$4,$4,$5
	addiu	$6,$6,1
	sw	$4,0($2)
	beq	$6,$19,$L837
	addiu	$7,$7,1

$L810:
	sll	$2,$6,2
	andi	$3,$2,0xf
	bne	$16,$20,$L808
	sra	$2,$6,2

	andi	$2,$2,0x1
	andi	$3,$6,0x1
	addu	$2,$9,$2
	addu	$2,$2,$3
	lbu	$4,0($2)
	lbu	$3,0($7)
	move	$8,$6
	mul	$4,$4,$3
	sll	$2,$8,2
	addu	$2,$10,$2
	sll	$4,$4,$5
	addiu	$6,$6,1
	sw	$4,0($2)
	bne	$6,$19,$L810
	addiu	$7,$7,1

$L837:
	addiu	$11,$11,1
	li	$2,52			# 0x34
	bne	$11,$2,$L843
	addu	$2,$fp,$11

	b	$L838
	lw	$3,36($sp)

$L820:
	lw	$4,44($sp)
	lw	$5,48($sp)
	jalr	$25
	li	$6,64			# 0x40

	beq	$2,$0,$L815
	lw	$28,16($sp)

	addiu	$21,$21,4
	b	$L814
	li	$14,1			# 0x1

$L815:
	lw	$4,96($sp)
	li	$2,65536			# 0x10000
	lw	$3,40($sp)
	addu	$2,$4,$2
	b	$L813
	sw	$3,-6304($2)

	.set	macro
	.set	reorder
	.end	init_dequant_tables
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC0:
	.ascii	"out of range intra chroma pred mode at %d %d\012\000"
	.align	2
$LC1:
	.ascii	"top block unavailable for requested intra mode at %d %d\012"
	.ascii	"\000"
	.align	2
$LC2:
	.ascii	"left block unavailable for requested intra mode at %d %d"
	.ascii	"\012\000"
	.text
	.align	2
	.ent	check_intra_pred_mode
	.type	check_intra_pred_mode, @function
check_intra_pred_mode:
	.set	nomips16
	.frame	$sp,40,$31		# vars= 0, regs= 1/0, args= 24, gp= 8
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-40
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,36($sp)
	.cprestore	24
	sltu	$2,$5,7
	beq	$2,$0,$L850
	move	$3,$4

	lw	$2,8984($4)
	andi	$2,$2,0x8000
	bne	$2,$0,$L847
	lui	$2,%hi(top.8911)

	addiu	$2,$2,%lo(top.8911)
	addu	$2,$5,$2
	lb	$5,0($2)
	bltz	$5,$L851
	lui	$6,%hi($LC1)

$L847:
	lw	$2,8992($3)
	andi	$2,$2,0x8000
	bne	$2,$0,$L853
	lw	$31,36($sp)

	lui	$2,%hi(left.8912)
	addiu	$2,$2,%lo(left.8912)
	addu	$2,$5,$2
	lb	$5,0($2)
	bltz	$5,$L852
	lui	$6,%hi($LC2)

$L846:
	lw	$31,36($sp)
$L853:
	move	$2,$5
	j	$31
	addiu	$sp,$sp,40

$L852:
	lw	$2,6172($3)
	lw	$25,%call16(av_log)($28)
	lw	$4,0($3)
	lw	$7,6168($3)
	addiu	$6,$6,%lo($LC2)
	sw	$2,16($sp)
$L849:
	jalr	$25
	move	$5,$0

	lw	$28,24($sp)
	b	$L846
	li	$5,-1			# 0xffffffffffffffff

$L851:
	lw	$2,6172($4)
	lw	$4,0($4)
	lw	$7,6168($3)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	b	$L849
	addiu	$6,$6,%lo($LC1)

$L850:
	lw	$2,6172($4)
	lui	$6,%hi($LC0)
	lw	$4,0($4)
	lw	$7,6168($3)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	b	$L849
	addiu	$6,$6,%lo($LC0)

	.set	macro
	.set	reorder
	.end	check_intra_pred_mode
	.section	.rodata.str1.4
	.align	2
$LC3:
	.ascii	"short term list:\012\000"
	.align	2
$LC4:
	.ascii	"%d fn:%d poc:%d %p\012\000"
	.text
	.align	2
	.ent	print_short_term
	.type	print_short_term, @function
print_short_term:
	.set	nomips16
	.frame	$sp,64,$31		# vars= 0, regs= 6/0, args= 32, gp= 8
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-64
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,60($sp)
	sw	$20,56($sp)
	sw	$19,52($sp)
	sw	$18,48($sp)
	sw	$17,44($sp)
	sw	$16,40($sp)
	.cprestore	32
	move	$19,$4
	lw	$4,0($4)
	lw	$2,412($4)
	andi	$2,$2,0x800
	bne	$2,$0,$L859
	lw	$25,%call16(av_log)($28)

$L857:
	lw	$31,60($sp)
	lw	$20,56($sp)
	lw	$19,52($sp)
	lw	$18,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	j	$31
	addiu	$sp,$sp,64

$L859:
	lui	$6,%hi($LC3)
	addiu	$6,$6,%lo($LC3)
	jalr	$25
	li	$5,2			# 0x2

	li	$2,131072			# 0x20000
	addu	$4,$19,$2
	lw	$3,6828($4)
	beq	$3,$0,$L857
	lw	$28,32($sp)

	li	$2,65536			# 0x10000
	ori	$2,$2,0x173c
	lui	$3,%hi($LC4)
	addu	$17,$19,$2
	addiu	$20,$3,%lo($LC4)
	move	$18,$4
	move	$16,$0
$L856:
	lw	$2,0($17)
	lw	$4,0($19)
	lw	$3,232($2)
	lw	$25,%call16(av_log)($28)
	sw	$3,16($sp)
	lw	$5,228($2)
	move	$7,$16
	sw	$5,20($sp)
	lw	$3,0($2)
	li	$5,2			# 0x2
	sw	$3,24($sp)
	jalr	$25
	move	$6,$20

	lw	$2,6828($18)
	addiu	$16,$16,1
	sltu	$2,$16,$2
	lw	$28,32($sp)
	bne	$2,$0,$L856
	addiu	$17,$17,4

	lw	$31,60($sp)
	lw	$20,56($sp)
	lw	$19,52($sp)
	lw	$18,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	j	$31
	addiu	$sp,$sp,64

	.set	macro
	.set	reorder
	.end	print_short_term
	.section	.rodata.str1.4
	.align	2
$LC5:
	.ascii	"long term list:\012\000"
	.text
	.align	2
	.ent	print_long_term
	.type	print_long_term, @function
print_long_term:
	.set	nomips16
	.frame	$sp,64,$31		# vars= 0, regs= 6/0, args= 32, gp= 8
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-64
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,60($sp)
	sw	$20,56($sp)
	sw	$19,52($sp)
	sw	$18,48($sp)
	sw	$17,44($sp)
	sw	$16,40($sp)
	.cprestore	32
	move	$18,$4
	lw	$4,0($4)
	lw	$2,412($4)
	andi	$2,$2,0x800
	bne	$2,$0,$L866
	lw	$31,60($sp)

	lw	$20,56($sp)
	lw	$19,52($sp)
	lw	$18,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	j	$31
	addiu	$sp,$sp,64

$L866:
	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC5)
	addiu	$6,$6,%lo($LC5)
	jalr	$25
	li	$5,2			# 0x2

	li	$2,65536			# 0x10000
	ori	$2,$2,0x17bc
	lui	$3,%hi($LC4)
	lw	$28,32($sp)
	addu	$17,$18,$2
	addiu	$20,$3,%lo($LC4)
	move	$16,$0
	li	$19,16			# 0x10
$L863:
	lw	$8,0($17)
	move	$7,$16
	lw	$25,%call16(av_log)($28)
	addiu	$17,$17,4
	addiu	$16,$16,1
	li	$5,2			# 0x2
	beq	$8,$0,$L862
	move	$6,$20

	lw	$2,232($8)
	lw	$4,0($18)
	sw	$2,16($sp)
	lw	$3,228($8)
	sw	$3,20($sp)
	lw	$2,0($8)
	jalr	$25
	sw	$2,24($sp)

	lw	$28,32($sp)
$L862:
	bne	$16,$19,$L863
	lw	$31,60($sp)

	lw	$20,56($sp)
	lw	$19,52($sp)
	lw	$18,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	j	$31
	addiu	$sp,$sp,64

	.set	macro
	.set	reorder
	.end	print_long_term
	.section	.rodata.str1.4
	.align	2
$LC6:
	.ascii	"overflow in decode_cabac_mb_ref\012\000"
	.text
	.align	2
	.ent	decode_cabac_mb_ref
	.type	decode_cabac_mb_ref, @function
decode_cabac_mb_ref:
	.set	nomips16
	.frame	$sp,64,$31		# vars= 0, regs= 9/0, args= 16, gp= 8
	.mask	0x80ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-64
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,60($sp)
	sw	$23,56($sp)
	sw	$22,52($sp)
	sw	$21,48($sp)
	sw	$20,44($sp)
	sw	$19,40($sp)
	sw	$18,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	.cprestore	16
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$2,$6
	move	$19,$4
	sll	$3,$5,5
	lbu	$4,0($2)
	sll	$5,$5,3
	li	$2,65536			# 0x10000
	addu	$5,$5,$3
	addu	$2,$19,$2
	addu	$5,$19,$5
	addiu	$8,$4,-8
	addiu	$7,$4,-1
	lw	$6,-6284($2)
	addu	$3,$5,$8
	li	$2,3			# 0x3
	addu	$5,$5,$7
	lb	$4,9456($5)
	beq	$6,$2,$L879
	lb	$5,9456($3)

	slt	$17,$0,$4
	slt	$3,$0,$5
	addiu	$2,$17,2
	movn	$17,$2,$3
$L871:
	li	$3,131072			# 0x20000
	ori	$2,$3,0x1fd8
	addu	$18,$19,$2
	ori	$23,$3,0x2036
	move	$16,$0
	li	$22,4			# 0x4
	li	$21,5			# 0x5
	li	$20,32			# 0x20
	addu	$5,$17,$23
$L881:
	addu	$5,$19,$5
	addiu	$5,$5,4
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$4,$18

	slt	$3,$17,4
	move	$17,$21
	lw	$28,16($sp)
	beq	$2,$0,$L875
	movn	$17,$22,$3

	addiu	$16,$16,1
	bne	$16,$20,$L881
	addu	$5,$17,$23

	lw	$25,%call16(av_log)($28)
	lw	$4,0($19)
	lui	$6,%hi($LC6)
	addiu	$6,$6,%lo($LC6)
	jalr	$25
	move	$5,$0

	lw	$28,16($sp)
	move	$16,$0
$L875:
	lw	$31,60($sp)
	move	$2,$16
	lw	$23,56($sp)
	lw	$22,52($sp)
	lw	$21,48($sp)
	lw	$20,44($sp)
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	j	$31
	addiu	$sp,$sp,64

$L879:
	blez	$4,$L880
	addu	$2,$19,$7

	li	$3,131072			# 0x20000
	addu	$3,$3,$2
	lbu	$4,9020($3)
	sltu	$17,$4,1
$L870:
	blez	$5,$L871
	addu	$3,$19,$8

	li	$2,131072			# 0x20000
	addu	$2,$2,$3
	lbu	$4,9020($2)
	addiu	$3,$17,2
	b	$L871
	movz	$17,$3,$4

$L880:
	b	$L870
	move	$17,$0

	.set	macro
	.set	reorder
	.end	decode_cabac_mb_ref
	.section	.rodata.str1.4
	.align	2
$LC7:
	.ascii	"overflow in decode_cabac_mb_mvd\012\000"
	.text
	.align	2
	.ent	decode_cabac_mb_mvd
	.type	decode_cabac_mb_mvd, @function
decode_cabac_mb_mvd:
	.set	nomips16
	.frame	$sp,56,$31		# vars= 0, regs= 8/0, args= 16, gp= 8
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-56
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,52($sp)
	sw	$22,48($sp)
	sw	$21,44($sp)
	sw	$20,40($sp)
	sw	$19,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	.cprestore	16
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$2,$6
	lbu	$6,0($2)
	sll	$3,$5,5
	sll	$5,$5,3
	addu	$5,$5,$3
	addu	$5,$5,$6
	li	$9,1			# 0x1
	subu	$2,$5,$9
	addiu	$5,$5,-8
	sll	$5,$5,1
	sll	$2,$2,1
	li	$3,65536			# 0x10000
	ori	$3,$3,0x10fc
	addu	$5,$5,$7
	addu	$2,$2,$7
	addu	$2,$2,$3
	addu	$5,$5,$3
	sll	$5,$5,1
	sll	$2,$2,1
	addu	$2,$4,$2
	addu	$5,$4,$5
	lh	$3,0($2)
	move	$21,$4
	lh	$4,0($5)
	slt	$2,$3,0
	subu	$8,$0,$4
	slt	$5,$4,0
	subu	$6,$0,$3
	movn	$3,$6,$2
	movn	$4,$8,$5
	addu	$4,$4,$3
	li	$19,47			# 0x2f
	li	$2,40			# 0x28
	slt	$3,$4,3
	beq	$3,$0,$L887
	movz	$19,$2,$7

	move	$3,$0
$L888:
	li	$2,131072			# 0x20000
	addu	$5,$3,$19
	ori	$16,$2,0x2000
	addu	$5,$5,$16
	ori	$2,$2,0x1fd8
	addu	$18,$21,$2
	addu	$5,$21,$5
	addiu	$5,$5,4
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$4,$18

	beq	$2,$0,$L891
	lw	$28,16($sp)

	move	$22,$16
	li	$17,1			# 0x1
	li	$16,3			# 0x3
	li	$20,9			# 0x9
	addu	$5,$16,$19
$L907:
	addu	$5,$5,$22
	addu	$5,$21,$5
	move	$4,$18
	.option	pic0
	jal	get_cabac
	.option	pic2
	addiu	$5,$5,4

	slt	$4,$16,6
	addiu	$3,$16,1
	lw	$28,16($sp)
	beq	$2,$0,$L896
	movn	$16,$3,$4

	addiu	$17,$17,1
	bne	$17,$20,$L907
	addu	$5,$16,$19

	li	$16,3			# 0x3
	li	$20,25			# 0x19
	b	$L898
	li	$19,1			# 0x1

$L899:
	addu	$17,$17,$4
	beq	$3,$20,$L906
	move	$16,$3

$L898:
	.option	pic0
	jal	get_cabac_bypass
	.option	pic2
	move	$4,$18

	lw	$28,16($sp)
	sll	$4,$19,$16
	bne	$2,$0,$L899
	addiu	$3,$16,1

	li	$19,1			# 0x1
$L904:
	.option	pic0
	jal	get_cabac_bypass
	.option	pic2
	move	$4,$18

	addiu	$16,$16,-1
	lw	$28,16($sp)
	beq	$2,$0,$L900
	sll	$3,$19,$16

	addu	$17,$17,$3
$L900:
	bne	$16,$0,$L904
	nop

$L896:
	li	$2,131072			# 0x20000
	addu	$7,$21,$2
	lw	$3,8152($7)
	sll	$6,$3,1
	andi	$2,$6,0xffff
	bne	$2,$0,$L902
	sw	$6,8152($7)

	lw	$5,8168($7)
	li	$2,-65536			# 0xffffffffffff0000
	lbu	$3,0($5)
	lbu	$4,1($5)
	ori	$2,$2,0x1
	addu	$2,$6,$2
	sll	$3,$3,9
	addu	$2,$2,$3
	sll	$4,$4,1
	addu	$2,$2,$4
	addiu	$5,$5,2
	sw	$5,8168($7)
	sw	$2,8152($7)
$L902:
	li	$6,131072			# 0x20000
	addu	$6,$21,$6
	lw	$2,8156($6)
	lw	$4,8152($6)
	sll	$2,$2,17
	subu	$4,$4,$2
	sra	$5,$4,31
	and	$2,$5,$2
	subu	$3,$0,$17
	addu	$2,$2,$4
	xor	$3,$3,$5
	sw	$2,8152($6)
	subu	$2,$3,$5
$L891:
	lw	$31,52($sp)
	lw	$22,48($sp)
	lw	$21,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,56

$L887:
	slt	$3,$4,33
	li	$2,2			# 0x2
	movz	$9,$2,$3
	b	$L888
	move	$3,$9

$L906:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($21)
	lui	$6,%hi($LC7)
	addiu	$6,$6,%lo($LC7)
	jalr	$25
	move	$5,$0

	lw	$31,52($sp)
	lw	$28,16($sp)
	li	$2,-2147483648			# 0xffffffff80000000
	lw	$22,48($sp)
	lw	$21,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,56

	.set	macro
	.set	reorder
	.end	decode_cabac_mb_mvd
	.section	.rodata.str1.4
	.align	2
$LC8:
	.ascii	"%s_id (%d) out of range\012\000"
	.align	2
$LC9:
	.ascii	"cannot allocate memory for %s\012\000"
	.text
	.align	2
	.ent	alloc_parameter_set
	.type	alloc_parameter_set, @function
alloc_parameter_set:
	.set	nomips16
	.frame	$sp,48,$31		# vars= 0, regs= 3/0, args= 24, gp= 8
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-48
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,44($sp)
	sw	$17,40($sp)
	sw	$16,36($sp)
	.cprestore	24
	sltu	$7,$6,$7
	beq	$7,$0,$L912
	move	$17,$4

	sll	$2,$6,2
	addu	$16,$5,$2
	lw	$2,0($16)
	beq	$2,$0,$L913
	lw	$25,%call16(av_mallocz)($28)

$L910:
	lw	$31,44($sp)
	lw	$17,40($sp)
	lw	$16,36($sp)
	j	$31
	addiu	$sp,$sp,48

$L913:
	jalr	$25
	lw	$4,64($sp)

	lw	$28,24($sp)
	bne	$2,$0,$L910
	sw	$2,0($16)

	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC9)
	lw	$7,68($sp)
	addiu	$6,$6,%lo($LC9)
	jalr	$25
	move	$5,$0

	lw	$28,24($sp)
	b	$L910
	lw	$2,0($16)

$L912:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($4)
	lw	$7,68($sp)
	sw	$6,16($sp)
	lui	$6,%hi($LC8)
	addiu	$6,$6,%lo($LC8)
	jalr	$25
	move	$5,$0

	lw	$28,24($sp)
	b	$L910
	move	$2,$0

	.set	macro
	.set	reorder
	.end	alloc_parameter_set
	.align	2
	.ent	fill_default_ref_list
	.type	fill_default_ref_list, @function
fill_default_ref_list:
	.set	nomips16
	.frame	$sp,13560,$31		# vars= 13496, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-13560
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,13556($sp)
	sw	$fp,13552($sp)
	sw	$23,13548($sp)
	sw	$22,13544($sp)
	sw	$21,13540($sp)
	sw	$20,13536($sp)
	sw	$19,13532($sp)
	sw	$18,13528($sp)
	sw	$17,13524($sp)
	sw	$16,13520($sp)
	.cprestore	16
	li	$6,65536			# 0x10000
	addu	$2,$4,$6
	move	$16,$4
	ori	$3,$6,0x1840
	lw	$4,-6284($2)
	ori	$2,$6,0x4b40
	addu	$22,$16,$2
	addu	$17,$16,$3
	li	$2,3			# 0x3
	sw	$17,24($sp)
	beq	$4,$2,$L915
	sw	$22,28($sp)

	li	$2,131072			# 0x20000
	addu	$5,$16,$2
	lw	$3,6828($5)
	blez	$3,$L972
	ori	$2,$6,0x173c

	addu	$9,$16,$2
	move	$13,$5
	move	$8,$0
	move	$11,$0
	b	$L952
	li	$14,3			# 0x3

$L950:
	lw	$2,6828($13)
	addiu	$8,$8,1
	slt	$2,$8,$2
	beq	$2,$0,$L917
	addiu	$9,$9,4

$L952:
	lw	$5,0($9)
	lw	$2,80($5)
	bne	$2,$14,$L950
	sll	$2,$11,3

	sll	$3,$11,5
	subu	$3,$3,$2
	sll	$4,$3,4
	addu	$3,$3,$4
	addu	$12,$17,$3
	move	$6,$5
	move	$7,$12
	addiu	$10,$5,400
$L951:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$10,$L951
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$3,0($6)
	sw	$2,4($7)
	sw	$3,0($7)
	lw	$4,0($9)
	addiu	$8,$8,1
	lw	$2,232($4)
	addiu	$11,$11,1
	sw	$2,236($12)
	lw	$2,6828($13)
	slt	$2,$8,$2
	bne	$2,$0,$L952
	addiu	$9,$9,4

$L917:
	li	$2,65536			# 0x10000
	ori	$2,$2,0x17bc
	addu	$9,$16,$2
	move	$8,$0
	li	$14,3			# 0x3
	b	$L955
	li	$13,16			# 0x10

$L953:
	addiu	$8,$8,1
	beq	$8,$13,$L973
	addiu	$9,$9,4

$L955:
	lw	$5,0($9)
	beq	$5,$0,$L953
	nop

	lw	$2,80($5)
	bne	$2,$14,$L953
	sll	$2,$11,3

	sll	$3,$11,5
	subu	$3,$3,$2
	sll	$4,$3,4
	addu	$3,$3,$4
	addu	$12,$17,$3
	move	$6,$5
	move	$7,$12
	addiu	$10,$5,400
$L954:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$10,$L954
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$3,0($6)
	sw	$2,4($7)
	sw	$3,0($7)
	sw	$8,236($12)
	addiu	$8,$8,1
	addiu	$11,$11,1
	bne	$8,$13,$L955
	addiu	$9,$9,4

$L973:
	li	$2,65536			# 0x10000
	addu	$2,$16,$2
	lw	$2,5936($2)
	sltu	$3,$11,$2
	bne	$3,$0,$L974
	subu	$3,$2,$11

	lw	$31,13556($sp)
$L986:
	move	$2,$0
	lw	$fp,13552($sp)
	lw	$23,13548($sp)
	lw	$22,13544($sp)
	lw	$21,13540($sp)
	lw	$20,13536($sp)
	lw	$19,13532($sp)
	lw	$18,13528($sp)
	lw	$17,13524($sp)
	lw	$16,13520($sp)
	j	$31
	addiu	$sp,$sp,13560

$L974:
	sll	$4,$11,5
	sll	$2,$11,3
	subu	$4,$4,$2
	sll	$6,$3,5
	sll	$3,$3,3
	subu	$6,$6,$3
	sll	$2,$4,4
	addu	$4,$4,$2
	sll	$3,$6,4
	lw	$25,%call16(memset)($28)
	addu	$4,$17,$4
	addu	$6,$6,$3
$L971:
	jalr	$25
	move	$5,$0

	lw	$31,13556($sp)
	lw	$28,16($sp)
	move	$2,$0
	lw	$fp,13552($sp)
	lw	$23,13548($sp)
	lw	$22,13544($sp)
	lw	$21,13540($sp)
	lw	$20,13536($sp)
	lw	$19,13532($sp)
	lw	$18,13528($sp)
	lw	$17,13524($sp)
	lw	$16,13520($sp)
	j	$31
	addiu	$sp,$sp,13560

$L915:
	li	$2,131072			# 0x20000
	addu	$2,$16,$2
	lw	$10,6828($2)
	blez	$10,$L918
	ori	$2,$6,0x173c

	li	$3,2147418112			# 0x7fff0000
	addu	$15,$16,$2
	ori	$24,$3,0xffff
	addiu	$13,$sp,448
	li	$14,-1			# 0xffffffffffffffff
	move	$12,$0
	li	$9,-2147483648			# 0xffffffff80000000
	li	$18,-1			# 0xffffffffffffffff
$L919:
	move	$6,$15
	move	$4,$0
	li	$7,-2147483648			# 0xffffffff80000000
	move	$8,$24
$L921:
	lw	$2,0($6)
	addiu	$6,$6,4
	lw	$3,228($2)
	slt	$2,$9,$3
	beq	$2,$0,$L920
	slt	$5,$3,$8

	movn	$8,$3,$5
	movn	$7,$4,$5
$L920:
	addiu	$4,$4,1
	slt	$2,$4,$10
	bne	$2,$0,$L921
	addiu	$2,$7,17870

	sll	$2,$2,2
	addu	$2,$16,$2
	lw	$9,4($2)
	move	$6,$13
	move	$7,$9
	addiu	$11,$9,400
$L922:
	lw	$2,0($7)
	lw	$3,4($7)
	lw	$4,8($7)
	lw	$5,12($7)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	swr	$3,4($6)
	swl	$4,11($6)
	swr	$4,8($6)
	swl	$5,15($6)
	addiu	$7,$7,16
	swr	$5,12($6)
	bne	$7,$11,$L922
	addiu	$6,$6,16

	lw	$2,0($7)
	lw	$3,4($7)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	bne	$14,$18,$L923
	swr	$3,4($6)

	lw	$2,1880($16)
	lw	$3,228($9)
	lw	$4,228($2)
	slt	$3,$3,$4
	movz	$14,$12,$3
$L923:
	addiu	$12,$12,1
	slt	$2,$12,$10
	addiu	$13,$13,408
	bne	$2,$0,$L919
	move	$9,$8

$L924:
	li	$2,65536			# 0x10000
	ori	$2,$2,0x17bc
	addu	$2,$16,$2
	li	$3,131072			# 0x20000
	addu	$3,$16,$3
	sw	$2,13512($sp)
	addiu	$2,$sp,24
	sw	$3,13504($sp)
	li	$7,1			# 0x1
	move	$15,$0
	sw	$2,13508($sp)
	li	$21,-99			# 0xffffffffffffff9d
$L942:
	lw	$3,13504($sp)
	lw	$4,6828($3)
	blez	$4,$L975
	addiu	$18,$15,17868

	sll	$2,$18,2
	addu	$5,$16,$2
	lw	$3,0($5)
	beq	$3,$0,$L925
	lw	$3,13508($sp)

	sll	$2,$15,2
	addu	$fp,$3,$2
	li	$20,1			# 0x1
	li	$2,-1			# 0xffffffffffffffff
	move	$23,$5
	li	$6,-99			# 0xffffffffffffff9d
	move	$11,$0
	move	$10,$0
	move	$8,$0
	movn	$20,$2,$15
$L970:
	bltz	$6,$L931
	slt	$2,$6,$4

$L982:
	bne	$2,$0,$L976
	nop

	beq	$20,$7,$L981
	lw	$31,13556($sp)

$L927:
	subu	$7,$0,$7
	sra	$2,$7,1
	addu	$6,$2,$14
	bgez	$6,$L982
	slt	$2,$6,$4

$L931:
	beq	$6,$21,$L927
	nop

	bne	$20,$7,$L927
	lw	$31,13556($sp)

$L981:
	li	$2,-1			# 0xffffffffffffffff
	lw	$fp,13552($sp)
	lw	$23,13548($sp)
	lw	$22,13544($sp)
	lw	$21,13540($sp)
	lw	$20,13536($sp)
	lw	$19,13532($sp)
	lw	$18,13528($sp)
	lw	$17,13524($sp)
	lw	$16,13520($sp)
	j	$31
	addiu	$sp,$sp,13560

$L976:
	sll	$13,$6,3
	sll	$12,$6,5
	subu	$2,$12,$13
	sll	$3,$2,4
	addu	$2,$2,$3
	lw	$3,13508($sp)
	addu	$5,$3,$2
	lw	$3,504($5)
	li	$2,3			# 0x3
	beq	$3,$2,$L979
	lw	$19,13508($sp)

$L933:
	lw	$3,13504($sp)
	addiu	$11,$11,1
	lw	$4,6828($3)
	slt	$2,$11,$4
	beq	$2,$0,$L983
	sll	$2,$18,2

	lw	$2,0($23)
	sltu	$2,$10,$2
	beq	$2,$0,$L935
	move	$8,$10

	b	$L970
	addu	$6,$6,$7

$L979:
	sll	$3,$8,3
	sll	$2,$8,5
	subu	$2,$2,$3
	sll	$4,$2,4
	lw	$3,0($fp)
	addu	$2,$2,$4
	addu	$24,$3,$2
	addiu	$25,$5,824
	addiu	$8,$5,424
	move	$9,$24
$L934:
	lw	$2,0($8)
	lw	$3,4($8)
	lw	$4,8($8)
	lw	$5,12($8)
	addiu	$8,$8,16
	sw	$2,0($9)
	sw	$3,4($9)
	sw	$4,8($9)
	sw	$5,12($9)
	bne	$8,$25,$L934
	addiu	$9,$9,16

	lw	$4,4($8)
	lw	$5,0($8)
	subu	$3,$12,$13
	sw	$4,4($9)
	sw	$5,0($9)
	sll	$2,$3,4
	addu	$3,$3,$2
	lw	$2,13508($sp)
	addiu	$10,$10,1
	addu	$3,$2,$3
	lw	$2,656($3)
	b	$L933
	sw	$2,236($24)

$L975:
$L925:
	lw	$19,13508($sp)
	move	$10,$0
$L935:
	sll	$2,$18,2
$L983:
	sll	$13,$15,2
	addu	$18,$16,$2
	lw	$9,13512($sp)
	move	$8,$0
	b	$L939
	addu	$20,$19,$13

$L936:
	addiu	$8,$8,1
	li	$2,16			# 0x10
	beq	$8,$2,$L938
	addiu	$9,$9,4

$L939:
	lw	$2,0($18)
	sltu	$2,$10,$2
	beq	$2,$0,$L984
	addu	$2,$19,$13

	lw	$5,0($9)
	beq	$5,$0,$L936
	li	$3,3			# 0x3

	lw	$2,80($5)
	bne	$2,$3,$L936
	sll	$3,$10,3

	sll	$2,$10,5
	subu	$2,$2,$3
	sll	$4,$2,4
	lw	$3,0($20)
	addu	$2,$2,$4
	addu	$11,$3,$2
	move	$6,$5
	move	$7,$11
	addiu	$12,$5,400
$L937:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$12,$L937
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$3,0($6)
	addiu	$10,$10,1
	sw	$2,4($7)
	sw	$3,0($7)
	b	$L936
	sw	$8,236($11)

$L938:
	addu	$2,$19,$13
$L984:
	sw	$10,8($2)
	bne	$15,$0,$L941
	li	$7,-1			# 0xffffffffffffffff

	b	$L942
	li	$15,1			# 0x1

$L941:
	blez	$14,$L943
	li	$2,131072			# 0x20000

	addu	$2,$16,$2
	lw	$3,6828($2)
	slt	$3,$14,$3
	bne	$3,$0,$L985
	li	$2,65536			# 0x10000

$L943:
	slt	$2,$10,2
	bne	$2,$0,$L944
	li	$2,65536			# 0x10000

	addu	$2,$16,$2
	addiu	$10,$sp,40
	addiu	$8,$2,19664
	addiu	$6,$2,19264
	move	$7,$10
$L945:
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	lw	$2,0($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L945
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$4,0($6)
	li	$3,65536			# 0x10000
	addu	$3,$16,$3
	addiu	$8,$22,408
	sw	$2,4($7)
	sw	$4,0($7)
	addiu	$9,$22,808
	addiu	$7,$3,19264
	move	$6,$8
$L946:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$9,$L946
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$3,0($6)
	sw	$2,4($7)
	sw	$3,0($7)
	move	$6,$10
	move	$7,$8
	addiu	$8,$sp,440
$L947:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L947
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$3,0($6)
	sw	$2,4($7)
	sw	$3,0($7)
$L944:
	li	$2,65536			# 0x10000
$L985:
	addu	$2,$16,$2
	lw	$3,5936($2)
	lw	$5,32($sp)
	sltu	$2,$5,$3
	bne	$2,$0,$L980
	sll	$2,$5,3

$L948:
	li	$2,65536			# 0x10000
	addu	$2,$16,$2
	lw	$6,5940($2)
	lw	$5,36($sp)
	sltu	$2,$5,$6
	beq	$2,$0,$L986
	lw	$31,13556($sp)

	sll	$3,$5,3
	sll	$4,$5,5
	subu	$4,$4,$3
	subu	$2,$6,$5
	sll	$6,$2,5
	sll	$3,$4,4
	sll	$2,$2,3
	subu	$6,$6,$2
	addu	$4,$4,$3
	addiu	$4,$4,13056
	sll	$2,$6,4
	lw	$25,%call16(memset)($28)
	addu	$4,$17,$4
	b	$L971
	addu	$6,$6,$2

$L972:
	b	$L917
	move	$11,$0

$L918:
	b	$L924
	li	$14,-1			# 0xffffffffffffffff

$L980:
	subu	$3,$3,$5
	sll	$4,$5,5
	subu	$4,$4,$2
	sll	$6,$3,5
	sll	$3,$3,3
	subu	$6,$6,$3
	sll	$2,$4,4
	lw	$25,%call16(memset)($28)
	addu	$4,$4,$2
	sll	$3,$6,4
	addu	$6,$6,$3
	addu	$4,$17,$4
	jalr	$25
	move	$5,$0

	b	$L948
	lw	$28,16($sp)

	.set	macro
	.set	reorder
	.end	fill_default_ref_list
	.align	2
	.ent	free_tables
	.type	free_tables, @function
free_tables:
	.set	nomips16
	.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-48
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,44($sp)
	sw	$19,40($sp)
	sw	$18,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	.cprestore	16
	lw	$25,%call16(av_freep)($28)
	move	$18,$4
	jalr	$25
	addiu	$4,$4,8816

	lw	$28,16($sp)
	li	$16,131072			# 0x20000
	lw	$25,%call16(av_freep)($28)
	ori	$4,$16,0x21e4
	jalr	$25
	addu	$4,$18,$4

	lw	$28,16($sp)
	ori	$4,$16,0x21d4
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	addu	$4,$18,$4

	lw	$28,16($sp)
	ori	$4,$16,0x21ec
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	addu	$4,$18,$4

	lw	$28,16($sp)
	ori	$4,$16,0x21f0
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	addu	$4,$18,$4

	lw	$28,16($sp)
	ori	$16,$16,0x2338
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	addu	$4,$18,$16

	lw	$28,16($sp)
	addiu	$4,$18,9128
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	move	$16,$0

	lw	$28,16($sp)
	li	$4,59244			# 0xe76c
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	addu	$4,$18,$4

	lw	$28,16($sp)
	li	$2,65536			# 0x10000
	lw	$25,%call16(av_freep)($28)
	addu	$2,$18,$2
	sw	$0,-6288($2)
	jalr	$25
	addiu	$4,$18,9740

	lw	$28,16($sp)
	addiu	$4,$18,9744
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	li	$17,32			# 0x20

	lw	$28,16($sp)
$L988:
	addiu	$4,$16,2446
	sll	$4,$4,2
	lw	$25,%call16(av_freep)($28)
	addu	$4,$18,$4
	addiu	$4,$4,4
	jalr	$25
	addiu	$16,$16,1

	bne	$16,$17,$L988
	lw	$28,16($sp)

	move	$16,$0
	li	$17,256			# 0x100
$L989:
	addiu	$4,$16,2694
	sll	$4,$4,2
	lw	$25,%call16(av_freep)($28)
	addu	$4,$18,$4
	addiu	$4,$4,4
	jalr	$25
	addiu	$16,$16,1

	bne	$16,$17,$L989
	lw	$28,16($sp)

	lw	$3,0($18)
	lw	$2,620($3)
	blez	$2,$L993
	li	$2,131072			# 0x20000

	ori	$2,$2,0x24a0
	addu	$19,$18,$2
	move	$17,$0
$L992:
	lw	$16,0($19)
	lw	$25,%call16(av_freep)($28)
	addiu	$17,$17,1
	addiu	$19,$19,4
	beq	$16,$0,$L991
	addiu	$4,$16,9000

	jalr	$25
	nop

	lw	$28,16($sp)
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	addiu	$4,$16,8996

	lw	$28,16($sp)
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	addiu	$4,$16,2048

	lw	$28,16($sp)
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	addiu	$4,$16,2036

	lw	$28,16($sp)
	lw	$3,0($18)
$L991:
	lw	$2,620($3)
	slt	$2,$17,$2
	bne	$2,$0,$L992
	nop

$L993:
	lw	$31,44($sp)
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	j	$31
	addiu	$sp,$sp,48

	.set	macro
	.set	reorder
	.end	free_tables
	.section	.rodata.str1.4
	.align	2
$LC10:
	.ascii	"malloc\000"
	.text
	.align	2
	.ent	alloc_tables
	.type	alloc_tables, @function
alloc_tables:
	.set	nomips16
	.frame	$sp,40,$31		# vars= 0, regs= 4/0, args= 16, gp= 8
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-40
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	.cprestore	16
	lw	$2,148($4)
	lw	$3,152($4)
	addiu	$2,$2,1
	mul	$18,$2,$3
	lw	$25,%call16(av_mallocz)($28)
	move	$17,$4
	jalr	$25
	sll	$4,$18,3

	lw	$28,16($sp)
	beq	$2,$0,$L1023
	sw	$2,8816($17)

	lw	$25,%call16(av_mallocz)($28)
$L1035:
	jalr	$25
	sll	$4,$18,4

	lw	$28,16($sp)
	beq	$2,$0,$L1024
	sw	$2,9128($17)

	lw	$4,152($17)
	lw	$25,%call16(av_mallocz)($28)
	jalr	$25
	addu	$4,$18,$4

	li	$3,65536			# 0x10000
	addu	$3,$17,$3
	lw	$28,16($sp)
	beq	$2,$0,$L1025
	sw	$2,-6292($3)

$L1001:
	lw	$25,%call16(av_mallocz)($28)
	sll	$16,$18,1
	jalr	$25
	move	$4,$16

	li	$3,131072			# 0x20000
	addu	$3,$17,$3
	lw	$28,16($sp)
	beq	$2,$0,$L1026
	sw	$2,8660($3)

$L1002:
	lw	$2,11808($17)
	beq	$2,$0,$L1003
	lw	$25,%call16(av_mallocz)($28)

	jalr	$25
	move	$4,$18

	li	$3,131072			# 0x20000
	addu	$3,$17,$3
	lw	$28,16($sp)
	beq	$2,$0,$L1027
	sw	$2,8676($3)

$L1004:
	lw	$25,%call16(av_mallocz)($28)
	sll	$16,$18,6
	jalr	$25
	move	$4,$16

	li	$3,131072			# 0x20000
	addu	$3,$17,$3
	lw	$28,16($sp)
	beq	$2,$0,$L1028
	sw	$2,8684($3)

$L1005:
	lw	$25,%call16(av_mallocz)($28)
	jalr	$25
	move	$4,$16

	li	$3,131072			# 0x20000
	addu	$3,$17,$3
	lw	$28,16($sp)
	beq	$2,$0,$L1029
	sw	$2,8688($3)

$L1006:
	lw	$25,%call16(av_mallocz)($28)
	jalr	$25
	sll	$4,$18,5

	li	$3,131072			# 0x20000
	addu	$3,$17,$3
	lw	$28,16($sp)
	beq	$2,$0,$L1030
	sw	$2,9016($3)

$L1003:
	li	$16,65536			# 0x10000
$L1036:
	addu	$16,$17,$16
	lw	$6,152($17)
	lw	$25,%call16(memset)($28)
	lw	$4,-6292($16)
	addu	$6,$18,$6
	jalr	$25
	li	$5,-1			# 0xffffffffffffffff

	lw	$2,152($17)
	lw	$28,16($sp)
	lw	$3,-6292($16)
	sll	$2,$2,1
	addiu	$2,$2,1
	lw	$25,%call16(av_mallocz)($28)
	addu	$3,$3,$2
	sll	$18,$18,2
	sw	$3,-6288($16)
	jalr	$25
	move	$4,$18

	lw	$28,16($sp)
	beq	$2,$0,$L1031
	sw	$2,9740($17)

	lw	$25,%call16(av_mallocz)($28)
	jalr	$25
	move	$4,$18

	lw	$28,16($sp)
	beq	$2,$0,$L1032
	sw	$2,9744($17)

$L1008:
	lw	$4,148($17)
	blez	$4,$L1034
	li	$2,65536			# 0x10000

	lw	$3,144($17)
	move	$8,$0
$L1011:
	blez	$3,$L1014
	nop

	lw	$10,9740($17)
	lw	$9,9744($17)
	move	$7,$0
$L1012:
	lw	$2,152($17)
	lw	$5,9752($17)
	mul	$4,$8,$2
	sll	$5,$5,1
	mul	$11,$5,$8
	lw	$3,9748($17)
	addu	$2,$4,$7
	sll	$3,$3,2
	sll	$4,$7,1
	addu	$5,$11,$4
	mul	$4,$3,$8
	sll	$6,$7,2
	sll	$2,$2,2
	addu	$3,$4,$6
	addu	$4,$9,$2
	addu	$2,$10,$2
	sw	$3,0($2)
	sw	$5,0($4)
	lw	$3,144($17)
	addiu	$7,$7,1
	slt	$2,$7,$3
	bne	$2,$0,$L1012
	nop

	lw	$4,148($17)
$L1014:
	addiu	$8,$8,1
	slt	$2,$8,$4
	bne	$2,$0,$L1011
	li	$2,65536			# 0x10000

$L1034:
	addu	$2,$17,$2
	lw	$3,-6332($2)
	beq	$3,$0,$L1015
	sw	$0,2048($17)

$L1019:
	lw	$31,36($sp)
	move	$2,$0
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,40

$L1023:
	beq	$18,$0,$L1035
	lw	$25,%call16(av_mallocz)($28)

$L1009:
$L999:
	lw	$25,%call16(perror)($28)
$L1033:
	lui	$4,%hi($LC10)
$L1037:
	jalr	$25
	addiu	$4,$4,%lo($LC10)

	.option	pic0
	jal	free_tables
	.option	pic2
	move	$4,$17

	lw	$31,36($sp)
	lw	$28,16($sp)
	li	$2,-1			# 0xffffffffffffffff
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,40

$L1024:
	bne	$18,$0,$L1009
	lw	$25,%call16(av_mallocz)($28)

	lw	$4,152($17)
	jalr	$25
	addu	$4,$18,$4

	li	$3,65536			# 0x10000
	addu	$3,$17,$3
	lw	$28,16($sp)
	bne	$2,$0,$L1001
	sw	$2,-6292($3)

$L1025:
	lw	$2,152($17)
	addu	$2,$18,$2
	bne	$2,$0,$L1009
	lw	$25,%call16(av_mallocz)($28)

	sll	$16,$18,1
	jalr	$25
	move	$4,$16

	li	$3,131072			# 0x20000
	addu	$3,$17,$3
	lw	$28,16($sp)
	bne	$2,$0,$L1002
	sw	$2,8660($3)

$L1026:
	beq	$16,$0,$L1002
	lw	$25,%call16(perror)($28)

	b	$L1037
	lui	$4,%hi($LC10)

$L1031:
	bne	$18,$0,$L1009
	lw	$25,%call16(av_mallocz)($28)

	jalr	$25
	move	$4,$18

	lw	$28,16($sp)
	bne	$2,$0,$L1008
	sw	$2,9744($17)

$L1032:
	beq	$18,$0,$L1008
	lw	$25,%call16(perror)($28)

	b	$L1037
	lui	$4,%hi($LC10)

$L1027:
	beq	$18,$0,$L1004
	lw	$25,%call16(perror)($28)

	b	$L1037
	lui	$4,%hi($LC10)

$L1028:
	beq	$16,$0,$L1005
	lw	$25,%call16(perror)($28)

	b	$L1037
	lui	$4,%hi($LC10)

$L1029:
	beq	$16,$0,$L1006
	lw	$25,%call16(perror)($28)

	b	$L1037
	lui	$4,%hi($LC10)

$L1030:
	beq	$18,$0,$L1036
	li	$16,65536			# 0x10000

	b	$L1033
	lw	$25,%call16(perror)($28)

$L1015:
	.option	pic0
	jal	init_dequant_tables
	.option	pic2
	move	$4,$17

	b	$L1019
	lw	$28,16($sp)

	.set	macro
	.set	reorder
	.end	alloc_tables
	.align	2
	.ent	frame_start
	.type	frame_start, @function
frame_start:
	.set	nomips16
	.frame	$sp,48,$31		# vars= 0, regs= 5/0, args= 16, gp= 8
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-48
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,44($sp)
	sw	$19,40($sp)
	sw	$18,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	.cprestore	16
	lw	$25,%call16(MPV_frame_start)($28)
	lw	$5,0($4)
	jalr	$25
	move	$19,$4

	bltz	$2,$L1053
	lw	$28,16($sp)

	lw	$25,%call16(ff_er_frame_start)($28)
	jalr	$25
	move	$4,$19

	lw	$2,1880($19)
	lui	$3,%hi(scan8+16)
	sw	$0,48($2)
	lw	$4,176($19)
	lui	$2,%hi(scan8+1)
	addiu	$9,$2,%lo(scan8+1)
	sll	$8,$4,3
	lw	$28,16($sp)
	addiu	$10,$3,%lo(scan8+16)
	li	$11,12			# 0xc
	move	$7,$19
	li	$2,12			# 0xc
	move	$6,$19
	move	$5,$9
	b	$L1042
	sll	$4,$4,2

$L1051:
	lbu	$2,0($5)
	addiu	$5,$5,1
$L1042:
	addiu	$2,$2,-12
	andi	$3,$2,0x7
	sra	$2,$2,3
	mul	$12,$8,$2
	sll	$13,$3,2
	addu	$3,$12,$13
	mul	$12,$4,$2
	sw	$3,9644($6)
	addu	$2,$12,$13
	sw	$2,9548($6)
	bne	$10,$5,$L1051
	addiu	$6,$6,4

	lw	$3,180($19)
	lui	$2,%hi(scan8+4)
	addiu	$6,$2,%lo(scan8+4)
	addiu	$2,$11,-12
	sll	$5,$3,3
	sll	$4,$3,2
	andi	$3,$2,0x7
	sra	$2,$2,3
	mul	$8,$5,$2
	sll	$10,$3,2
	addu	$3,$8,$10
	mul	$8,$4,$2
	sw	$3,9708($7)
	addu	$2,$8,$10
	sw	$2,9612($7)
	sw	$2,9628($7)
	sw	$3,9724($7)
	beq	$6,$9,$L1043
	addiu	$7,$7,4

$L1054:
	lbu	$11,0($9)
	addiu	$9,$9,1
	addiu	$2,$11,-12
	andi	$3,$2,0x7
	sra	$2,$2,3
	mul	$8,$5,$2
	sll	$10,$3,2
	addu	$3,$8,$10
	mul	$8,$4,$2
	sw	$3,9708($7)
	addu	$2,$8,$10
	sw	$2,9612($7)
	sw	$2,9628($7)
	sw	$3,9724($7)
	bne	$6,$9,$L1054
	addiu	$7,$7,4

$L1043:
	lw	$3,0($19)
	lw	$4,620($3)
	blez	$4,$L1044
	li	$2,131072			# 0x20000

	ori	$2,$2,0x24a0
	addu	$17,$19,$2
	move	$16,$0
$L1046:
	lw	$18,0($17)
	addiu	$16,$16,1
	lw	$2,2048($18)
	beq	$2,$0,$L1055
	addiu	$17,$17,4

$L1045:
	lw	$4,620($3)
	slt	$2,$16,$4
	bne	$2,$0,$L1046
	nop

$L1044:
	li	$2,65536			# 0x10000
	addu	$2,$19,$2
	lw	$3,-6276($2)
	bne	$3,$0,$L1047
	slt	$2,$4,2

	bne	$2,$0,$L1056
	lw	$31,44($sp)

$L1047:
	lw	$6,152($19)
	lw	$3,148($19)
	li	$2,65536			# 0x10000
	mul	$6,$6,$3
	addu	$2,$19,$2
	lw	$25,%call16(memset)($28)
	lw	$4,-6288($2)
	addiu	$6,$6,-1
	jalr	$25
	li	$5,-1			# 0xffffffffffffffff

	lw	$28,16($sp)
	lw	$31,44($sp)
$L1056:
	move	$2,$0
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	j	$31
	addiu	$sp,$sp,48

$L1053:
	lw	$31,44($sp)
	li	$2,-1			# 0xffffffffffffffff
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	j	$31
	addiu	$sp,$sp,48

$L1055:
	lw	$4,176($19)
	lw	$2,180($19)
	sll	$4,$4,1
	lw	$25,%call16(av_malloc)($28)
	addu	$4,$4,$2
	jalr	$25
	sll	$4,$4,4

	lw	$28,16($sp)
	sw	$2,2048($18)
	b	$L1045
	lw	$3,0($19)

	.set	macro
	.set	reorder
	.end	frame_start
	.align	2
	.ent	init_scan_tables
	.type	init_scan_tables, @function
init_scan_tables:
	.set	nomips16
	.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
	.mask	0x00030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	lw	$3,5116($4)
	lw	$2,%got(ff_h264_idct_add_c)($28)
	addiu	$sp,$sp,-8
	sw	$17,4($sp)
	sw	$16,0($sp)
	beq	$3,$2,$L1077
	move	$17,$4

	li	$2,131072			# 0x20000
	lui	$4,%hi(zigzag_scan)
	lui	$9,%hi(field_scan)
	ori	$2,$2,0x2364
	addu	$7,$17,$2
	addiu	$16,$4,%lo(zigzag_scan)
	addiu	$25,$9,%lo(field_scan)
	move	$6,$0
	li	$8,16			# 0x10
$L1060:
	addu	$2,$16,$6
	addu	$3,$25,$6
	lbu	$4,0($2)
	lbu	$5,0($3)
	sll	$2,$4,2
	sll	$3,$5,2
	andi	$2,$2,0xf
	srl	$4,$4,2
	andi	$3,$3,0xf
	srl	$5,$5,2
	or	$2,$2,$4
	or	$3,$3,$5
	addiu	$6,$6,1
	sb	$2,0($7)
	sb	$3,144($7)
	bne	$6,$8,$L1060
	addiu	$7,$7,1

$L1059:
	lw	$3,5120($17)
	lw	$2,%got(ff_h264_idct8_add_c)($28)
	beq	$3,$2,$L1078
	li	$2,131072			# 0x20000

	lui	$6,%hi(zigzag_scan8x8)
	lui	$3,%hi(zigzag_scan8x8_cavlc)
	lui	$4,%hi(field_scan8x8)
	lui	$5,%hi(field_scan8x8_cavlc)
	ori	$2,$2,0x2374
	addu	$11,$17,$2
	addiu	$15,$6,%lo(zigzag_scan8x8)
	addiu	$14,$3,%lo(zigzag_scan8x8_cavlc)
	addiu	$13,$4,%lo(field_scan8x8)
	addiu	$12,$5,%lo(field_scan8x8_cavlc)
	move	$10,$0
	li	$24,64			# 0x40
$L1067:
	addu	$2,$15,$10
	addu	$3,$14,$10
	addu	$4,$13,$10
	addu	$5,$12,$10
	lbu	$6,0($2)
	lbu	$7,0($3)
	lbu	$8,0($4)
	lbu	$9,0($5)
	andi	$2,$6,0x7
	andi	$3,$7,0x7
	andi	$4,$8,0x7
	andi	$5,$9,0x7
	sll	$2,$2,3
	srl	$6,$6,3
	sll	$3,$3,3
	srl	$7,$7,3
	sll	$4,$4,3
	srl	$8,$8,3
	sll	$5,$5,3
	srl	$9,$9,3
	or	$2,$2,$6
	or	$3,$3,$7
	or	$4,$4,$8
	or	$5,$5,$9
	addiu	$10,$10,1
	sb	$2,0($11)
	sb	$3,64($11)
	sb	$4,144($11)
	sb	$5,208($11)
	bne	$10,$24,$L1067
	addiu	$11,$11,1

	lw	$2,9924($17)
$L1080:
	bne	$2,$0,$L1079
	li	$2,131072			# 0x20000

	ori	$3,$2,0x2444
	ori	$4,$2,0x2364
	ori	$5,$2,0x2374
	ori	$6,$2,0x23b4
	ori	$7,$2,0x23f4
	ori	$8,$2,0x2404
	addu	$3,$17,$3
	addu	$2,$17,$2
	addu	$4,$17,$4
	addu	$5,$17,$5
	addu	$6,$17,$6
	addu	$7,$17,$7
	addu	$8,$17,$8
	lw	$16,0($sp)
	lw	$17,4($sp)
	sw	$3,9368($2)
	sw	$4,9348($2)
	sw	$5,9352($2)
	sw	$6,9356($2)
	sw	$7,9360($2)
	sw	$8,9364($2)
	j	$31
	addiu	$sp,$sp,8

$L1079:
	addu	$2,$17,$2
	sw	$16,9348($2)
	lw	$17,4($sp)
	lw	$16,0($sp)
	sw	$12,9368($2)
	sw	$15,9352($2)
	sw	$14,9356($2)
	sw	$25,9360($2)
	sw	$13,9364($2)
	j	$31
	addiu	$sp,$sp,8

$L1078:
	lui	$6,%hi(zigzag_scan8x8)
	addiu	$15,$6,%lo(zigzag_scan8x8)
	ori	$2,$2,0x2374
	addu	$7,$17,$2
	move	$6,$15
	addiu	$8,$15,64
$L1062:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L1062
	addiu	$7,$7,16

	lui	$3,%hi(zigzag_scan8x8_cavlc)
	li	$2,131072			# 0x20000
	addiu	$14,$3,%lo(zigzag_scan8x8_cavlc)
	ori	$2,$2,0x23b4
	addu	$7,$17,$2
	move	$6,$14
	addiu	$8,$14,64
$L1063:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L1063
	addiu	$7,$7,16

	lui	$4,%hi(field_scan8x8)
	li	$2,131072			# 0x20000
	addiu	$13,$4,%lo(field_scan8x8)
	ori	$2,$2,0x2404
	addu	$7,$17,$2
	move	$6,$13
	addiu	$8,$13,64
$L1064:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L1064
	addiu	$7,$7,16

	lui	$5,%hi(field_scan8x8_cavlc)
	li	$2,131072			# 0x20000
	addiu	$12,$5,%lo(field_scan8x8_cavlc)
	ori	$2,$2,0x2444
	addu	$7,$17,$2
	move	$6,$12
	addiu	$8,$12,64
$L1065:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L1065
	addiu	$7,$7,16

	b	$L1080
	lw	$2,9924($17)

$L1077:
	lui	$4,%hi(zigzag_scan)
	lui	$9,%hi(field_scan)
	addiu	$16,$4,%lo(zigzag_scan)
	addiu	$25,$9,%lo(field_scan)
	li	$2,131072			# 0x20000
	ori	$3,$2,0x23f4
	lw	$6,%lo(zigzag_scan)($4)
	ori	$2,$2,0x2364
	lw	$7,4($16)
	lw	$8,8($16)
	lw	$5,12($16)
	lw	$9,%lo(field_scan)($9)
	lw	$10,4($25)
	lw	$11,8($25)
	lw	$4,12($25)
	addu	$2,$17,$2
	addu	$3,$17,$3
	sw	$5,12($2)
	sw	$4,12($3)
	sw	$6,0($2)
	sw	$7,4($2)
	sw	$8,8($2)
	sw	$9,0($3)
	sw	$10,4($3)
	b	$L1059
	sw	$11,8($3)

	.set	macro
	.set	reorder
	.end	init_scan_tables
	.align	2
	.ent	mc_dir_part
	.type	mc_dir_part, @function
mc_dir_part:
	.set	nomips16
	.frame	$sp,136,$31		# vars= 48, regs= 10/0, args= 40, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-136
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,132($sp)
	sw	$fp,128($sp)
	sw	$23,124($sp)
	sw	$22,120($sp)
	sw	$21,116($sp)
	sw	$20,112($sp)
	sw	$19,108($sp)
	sw	$18,104($sp)
	sw	$17,100($sp)
	sw	$16,96($sp)
	.cprestore	40
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$2,$6
	lw	$3,160($sp)
	lbu	$2,0($2)
	move	$23,$5
	sw	$2,60($sp)
	sll	$2,$3,5
	sll	$3,$3,3
	sw	$2,92($sp)
	sw	$3,88($sp)
	addu	$2,$3,$2
	lw	$3,60($sp)
	lw	$14,156($sp)
	addu	$2,$2,$3
	addiu	$5,$2,2284
	sll	$5,$5,2
	addu	$5,$4,$5
	sll	$2,$2,2
	lh	$6,0($5)
	lw	$5,152($sp)
	addu	$2,$4,$2
	li	$3,65536			# 0x10000
	lh	$9,9138($2)
	sw	$5,68($sp)
	lw	$2,172($sp)
	lw	$5,188($sp)
	lw	$25,168($sp)
	lw	$13,0($23)
	move	$19,$4
	addu	$3,$4,$3
	sw	$7,64($sp)
	lw	$4,-6268($3)
	sw	$2,80($sp)
	sw	$5,84($sp)
	sw	$14,72($sp)
	lw	$21,164($sp)
	sw	$25,76($sp)
	lw	$2,176($sp)
	lw	$3,180($sp)
	lw	$16,184($sp)
	lw	$11,9756($19)
	lw	$7,9764($19)
	lw	$8,9768($19)
	lw	$12,144($19)
	beq	$13,$0,$L1094
	lw	$5,148($19)

	sll	$2,$2,3
	sll	$3,$3,3
	addu	$18,$3,$9
	addu	$20,$2,$6
	andi	$6,$20,0x7
	addiu	$2,$7,-3
	sra	$10,$18,2
	movn	$7,$2,$6
	mul	$2,$10,$11
	sra	$9,$20,2
	subu	$3,$0,$7
	sll	$5,$5,4
	sltu	$4,$0,$4
	andi	$14,$18,0x7
	sw	$6,56($sp)
	sra	$4,$5,$4
	addu	$6,$2,$9
	slt	$3,$9,$3
	addiu	$2,$8,-3
	sw	$14,48($sp)
	movn	$8,$2,$14
	addu	$17,$13,$6
	sw	$4,52($sp)
	bne	$3,$0,$L1085
	sll	$fp,$12,4

	subu	$2,$0,$8
	slt	$2,$10,$2
	beq	$2,$0,$L1095
	addu	$3,$7,$fp

$L1085:
	li	$2,21			# 0x15
$L1099:
	lw	$4,2040($19)
	addiu	$5,$11,1
	sw	$2,16($sp)
	lw	$2,52($sp)
	addiu	$3,$9,-2
	addiu	$6,$10,-2
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sll	$5,$5,1
	subu	$5,$17,$5
	sw	$3,20($sp)
	sw	$6,24($sp)
	sw	$2,32($sp)
	move	$6,$11
	sw	$fp,28($sp)
	jalr	$25
	li	$7,21			# 0x15

	lw	$11,9756($19)
	lw	$3,2040($19)
	addiu	$2,$11,1
	sll	$2,$2,1
	addu	$17,$3,$2
	li	$22,1			# 0x1
$L1086:
	andi	$2,$18,0x3
	andi	$3,$20,0x3
	sll	$2,$2,2
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$16,$16,$2
	lw	$25,0($16)
	move	$6,$11
	move	$4,$21
	jalr	$25
	move	$5,$17

	lw	$3,64($sp)
	beq	$3,$0,$L1096
	lw	$28,40($sp)

$L1087:
	lw	$2,56($19)
	andi	$2,$2,0x2000
	bne	$2,$0,$L1094
	li	$2,65536			# 0x10000

	addu	$2,$19,$2
	lw	$3,-6268($2)
	bne	$3,$0,$L1088
	lw	$5,88($sp)

	lw	$6,9760($19)
	sra	$21,$18,3
	mul	$4,$21,$6
	sra	$20,$20,3
	addu	$3,$4,$20
	lw	$2,8($23)
	lw	$4,4($23)
	addu	$23,$2,$3
	bne	$22,$0,$L1097
	addu	$5,$4,$3

$L1092:
	lw	$2,56($sp)
	lw	$3,48($sp)
	lw	$4,76($sp)
	lw	$7,68($sp)
	lw	$25,84($sp)
	sw	$2,16($sp)
	jalr	$25
	sw	$3,20($sp)

	lw	$28,40($sp)
$L1093:
	lw	$2,56($sp)
	lw	$3,48($sp)
	lw	$6,9760($19)
	lw	$4,80($sp)
	lw	$7,68($sp)
	lw	$25,84($sp)
	move	$5,$23
	sw	$2,152($sp)
	sw	$3,156($sp)
	lw	$31,132($sp)
	lw	$fp,128($sp)
	lw	$23,124($sp)
	lw	$22,120($sp)
	lw	$21,116($sp)
	lw	$20,112($sp)
	lw	$19,108($sp)
	lw	$18,104($sp)
	lw	$17,100($sp)
	lw	$16,96($sp)
	jr	$25
	addiu	$sp,$sp,136

$L1094:
	lw	$31,132($sp)
	lw	$fp,128($sp)
	lw	$23,124($sp)
	lw	$22,120($sp)
	lw	$21,116($sp)
	lw	$20,112($sp)
	lw	$19,108($sp)
	lw	$18,104($sp)
	lw	$17,100($sp)
	lw	$16,96($sp)
	j	$31
	addiu	$sp,$sp,136

$L1095:
	addiu	$2,$9,15
	slt	$2,$2,$3
	beq	$2,$0,$L1099
	li	$2,21			# 0x15

	addu	$3,$8,$4
	addiu	$2,$10,15
	slt	$2,$2,$3
	beq	$2,$0,$L1099
	li	$2,21			# 0x15

	b	$L1086
	move	$22,$0

$L1096:
	lw	$4,72($sp)
	lw	$25,0($16)
	lw	$6,9756($19)
	addu	$5,$17,$4
	jalr	$25
	addu	$4,$21,$4

	b	$L1087
	lw	$28,40($sp)

$L1088:
	lw	$6,92($sp)
	lw	$14,60($sp)
	addu	$2,$5,$6
	addu	$2,$19,$2
	addu	$2,$2,$14
	lbu	$4,9456($2)
	lw	$3,6172($19)
	andi	$4,$4,0x1
	andi	$3,$3,0x1
	subu	$3,$3,$4
	sll	$3,$3,1
	addu	$4,$18,$3
	sra	$21,$4,3
	bltz	$21,$L1098
	lw	$25,52($sp)

	addiu	$2,$21,8
	sra	$3,$25,1
	slt	$2,$2,$3
	xori	$2,$2,0x1
$L1091:
	lw	$6,9760($19)
	andi	$4,$4,0x7
	sw	$4,48($sp)
	mul	$4,$21,$6
	sra	$20,$20,3
	addu	$3,$4,$20
	or	$22,$22,$2
	lw	$4,4($23)
	lw	$2,8($23)
	addu	$5,$4,$3
	beq	$22,$0,$L1092
	addu	$23,$2,$3

$L1097:
	lw	$14,52($sp)
	lw	$4,2040($19)
	sra	$18,$14,1
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sra	$17,$fp,1
	li	$16,9			# 0x9
	li	$7,9			# 0x9
	sw	$16,16($sp)
	sw	$20,20($sp)
	sw	$21,24($sp)
	sw	$17,28($sp)
	jalr	$25
	sw	$18,32($sp)

	lw	$25,56($sp)
	lw	$2,48($sp)
	lw	$5,2040($19)
	lw	$6,9760($19)
	lw	$4,76($sp)
	lw	$7,68($sp)
	sw	$25,16($sp)
	lw	$25,84($sp)
	jalr	$25
	sw	$2,20($sp)

	lw	$28,40($sp)
	lw	$4,2040($19)
	lw	$6,9760($19)
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	move	$5,$23
	sw	$16,16($sp)
	sw	$20,20($sp)
	sw	$21,24($sp)
	sw	$17,28($sp)
	sw	$18,32($sp)
	jalr	$25
	li	$7,9			# 0x9

	lw	$28,40($sp)
	b	$L1093
	lw	$23,2040($19)

$L1098:
	b	$L1091
	li	$2,1			# 0x1

	.set	macro
	.set	reorder
	.end	mc_dir_part
	.align	2
	.ent	decode_end
	.type	decode_end, @function
decode_end:
	.set	nomips16
	.frame	$sp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,28($sp)
	sw	$16,24($sp)
	.cprestore	16
	lw	$16,136($4)
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	addiu	$4,$16,8712

	lw	$28,16($sp)
	lw	$25,%call16(av_freep)($28)
	jalr	$25
	addiu	$4,$16,8716

	.option	pic0
	jal	free_tables
	.option	pic2
	move	$4,$16

	lw	$28,16($sp)
	lw	$25,%call16(MPV_common_end)($28)
	jalr	$25
	move	$4,$16

	lw	$31,28($sp)
	lw	$28,16($sp)
	move	$2,$0
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	decode_end
	.section	.rodata.str1.4
	.align	2
$LC11:
	.ascii	"remove short %d count %d\012\000"
	.align	2
$LC12:
	.ascii	"%d %d %p\012\000"
	.text
	.align	2
	.ent	remove_short
	.type	remove_short, @function
remove_short:
	.set	nomips16
	.frame	$sp,64,$31		# vars= 0, regs= 8/0, args= 24, gp= 8
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-64
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,60($sp)
	sw	$22,56($sp)
	sw	$21,52($sp)
	sw	$20,48($sp)
	sw	$19,44($sp)
	sw	$18,40($sp)
	sw	$17,36($sp)
	sw	$16,32($sp)
	.cprestore	24
	move	$20,$4
	lw	$4,0($4)
	lw	$2,412($4)
	andi	$2,$2,0x800
	bne	$2,$0,$L1111
	move	$21,$5

$L1103:
	li	$2,131072			# 0x20000
	addu	$4,$20,$2
	lw	$3,6828($4)
	blez	$3,$L1104
	li	$2,65536			# 0x10000

	ori	$2,$2,0x173c
	lui	$3,%hi($LC12)
	addu	$17,$20,$2
	addiu	$22,$3,%lo($LC12)
	move	$19,$4
	b	$L1107
	move	$16,$0

$L1105:
	lw	$2,232($18)
	beq	$21,$2,$L1113
	li	$2,131072			# 0x20000

$L1112:
	lw	$2,6828($19)
	addiu	$16,$16,1
	slt	$2,$16,$2
	beq	$2,$0,$L1114
	lw	$31,60($sp)

$L1107:
	lw	$4,0($20)
	lw	$18,0($17)
	lw	$2,412($4)
	andi	$2,$2,0x800
	beq	$2,$0,$L1105
	addiu	$17,$17,4

	lw	$2,232($18)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	sw	$18,20($sp)
	move	$7,$16
	li	$5,2			# 0x2
	jalr	$25
	move	$6,$22

	lw	$2,232($18)
	bne	$21,$2,$L1112
	lw	$28,24($sp)

	li	$2,131072			# 0x20000
$L1113:
	addu	$2,$20,$2
	lw	$4,6828($2)
	addiu	$3,$16,17870
	sll	$3,$3,2
	addu	$7,$20,$3
	addiu	$3,$4,-1
	sw	$3,6828($2)
	beq	$3,$0,$L1108
	sw	$0,4($7)

	addiu	$5,$16,17871
	sll	$5,$5,2
	lw	$25,%call16(memmove)($28)
	subu	$6,$3,$16
	addu	$5,$20,$5
	addiu	$4,$7,4
	addiu	$5,$5,4
	jalr	$25
	sll	$6,$6,2

	lw	$28,24($sp)
$L1108:
	lw	$31,60($sp)
	move	$2,$18
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	j	$31
	addiu	$sp,$sp,64

$L1104:
	lw	$31,60($sp)
$L1114:
	move	$18,$0
	move	$2,$18
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	j	$31
	addiu	$sp,$sp,64

$L1111:
	li	$2,131072			# 0x20000
	addu	$2,$20,$2
	lw	$3,6828($2)
	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC11)
	sw	$3,16($sp)
	addiu	$6,$6,%lo($LC11)
	li	$5,2			# 0x2
	jalr	$25
	move	$7,$21

	b	$L1103
	lw	$28,24($sp)

	.set	macro
	.set	reorder
	.end	remove_short
	.align	2
	.ent	decode_init
	.type	decode_init, @function
decode_init:
	.set	nomips16
	.frame	$sp,104,$31		# vars= 0, regs= 10/0, args= 56, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-104
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,100($sp)
	sw	$fp,96($sp)
	sw	$23,92($sp)
	sw	$22,88($sp)
	sw	$21,84($sp)
	sw	$20,80($sp)
	sw	$19,76($sp)
	sw	$18,72($sp)
	sw	$17,68($sp)
	sw	$16,64($sp)
	.cprestore	56
	lw	$18,136($4)
	lw	$25,%call16(MPV_decode_defaults)($28)
	move	$23,$4
	jalr	$25
	move	$4,$18

	lw	$2,40($23)
	lw	$3,132($23)
	lw	$28,56($sp)
	sw	$2,4($18)
	lw	$4,8($3)
	lw	$2,44($23)
	lw	$25,%call16(ff_h264_pred_init)($28)
	move	$5,$4
	sw	$2,8($18)
	sw	$4,44($18)
	sw	$23,0($18)
	jalr	$25
	addiu	$4,$18,8820

	lw	$28,56($sp)
	li	$3,65536			# 0x10000
	addu	$3,$18,$3
	li	$16,1			# 0x1
	lw	$25,%call16(memset)($28)
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,-6300($3)
	addiu	$4,$18,11872
	li	$5,16			# 0x10
	li	$6,96			# 0x60
	sw	$16,2128($18)
	jalr	$25
	sw	$16,2136($18)

	lw	$28,56($sp)
	addiu	$4,$18,11968
	lw	$25,%call16(memset)($28)
	li	$5,16			# 0x10
	jalr	$25
	li	$6,128			# 0x80

	lui	$5,%hi(done.10759)
	lw	$3,236($23)
	lw	$4,%lo(done.10759)($5)
	li	$2,4			# 0x4
	lw	$28,56($sp)
	sw	$2,24($18)
	sw	$3,80($18)
	sw	$16,8188($18)
	sw	$16,8240($18)
	beq	$4,$0,$L1128
	sw	$0,52($23)

$L1116:
	lw	$2,28($23)
	blez	$2,$L1121
	nop

	lw	$4,24($23)
	beq	$4,$0,$L1121
	li	$2,1			# 0x1

	lb	$4,0($4)
	beq	$4,$2,$L1129
	nop

$L1121:
	sw	$0,8728($18)
$L1122:
	li	$2,131072			# 0x20000
	lw	$31,100($sp)
	addu	$2,$18,$2
	sw	$18,9376($2)
	lw	$fp,96($sp)
	move	$2,$0
	lw	$23,92($sp)
	lw	$22,88($sp)
	lw	$21,84($sp)
	lw	$20,80($sp)
	lw	$19,76($sp)
	lw	$18,72($sp)
	lw	$17,68($sp)
	lw	$16,64($sp)
	j	$31
	addiu	$sp,$sp,104

$L1128:
	lui	$2,%hi(chroma_dc_coeff_token_bits)
	lw	$25,%call16(init_vlc_sparse)($28)
	addiu	$2,$2,%lo(chroma_dc_coeff_token_bits)
	lui	$4,%hi(chroma_dc_coeff_token_vlc)
	lui	$7,%hi(chroma_dc_coeff_token_len)
	sw	$16,%lo(done.10759)($5)
	addiu	$4,$4,%lo(chroma_dc_coeff_token_vlc)
	sw	$16,48($sp)
	sw	$16,16($sp)
	sw	$16,20($sp)
	sw	$16,28($sp)
	sw	$16,32($sp)
	sw	$2,24($sp)
	sw	$0,36($sp)
	sw	$0,40($sp)
	sw	$0,44($sp)
	addiu	$7,$7,%lo(chroma_dc_coeff_token_len)
	li	$5,8			# 0x8
	jalr	$25
	li	$6,20			# 0x14

	lui	$2,%hi(coeff_token_vlc)
	lui	$3,%hi(coeff_token_len)
	addiu	$17,$2,%lo(coeff_token_vlc)
	addiu	$22,$3,%lo(coeff_token_len)
	lui	$2,%hi(coeff_token_bits)
	lui	$3,%hi(coeff_token_vlc+64)
	lw	$28,56($sp)
	addiu	$21,$2,%lo(coeff_token_bits)
	addiu	$20,$3,%lo(coeff_token_vlc+64)
	move	$16,$0
	li	$19,1			# 0x1
$L1117:
	addu	$2,$21,$16
	lw	$25,%call16(init_vlc_sparse)($28)
	move	$4,$17
	addu	$7,$22,$16
	sw	$2,24($sp)
	sw	$19,16($sp)
	sw	$19,20($sp)
	sw	$19,28($sp)
	sw	$19,32($sp)
	sw	$0,36($sp)
	sw	$0,40($sp)
	sw	$0,44($sp)
	sw	$19,48($sp)
	li	$5,8			# 0x8
	li	$6,68			# 0x44
	jalr	$25
	addiu	$17,$17,16

	lw	$28,56($sp)
	bne	$20,$17,$L1117
	addiu	$16,$16,68

	lui	$2,%hi(chroma_dc_total_zeros_vlc)
	lui	$3,%hi(chroma_dc_total_zeros_len)
	addiu	$17,$2,%lo(chroma_dc_total_zeros_vlc)
	addiu	$22,$3,%lo(chroma_dc_total_zeros_len)
	lui	$2,%hi(chroma_dc_total_zeros_bits)
	lui	$3,%hi(chroma_dc_total_zeros_vlc+48)
	addiu	$21,$2,%lo(chroma_dc_total_zeros_bits)
	addiu	$20,$3,%lo(chroma_dc_total_zeros_vlc+48)
	move	$16,$0
	li	$19,1			# 0x1
$L1118:
	addu	$2,$21,$16
	lw	$25,%call16(init_vlc_sparse)($28)
	move	$4,$17
	addu	$7,$22,$16
	sw	$2,24($sp)
	sw	$19,16($sp)
	sw	$19,20($sp)
	sw	$19,28($sp)
	sw	$19,32($sp)
	sw	$0,36($sp)
	sw	$0,40($sp)
	sw	$0,44($sp)
	sw	$19,48($sp)
	li	$5,3			# 0x3
	li	$6,4			# 0x4
	jalr	$25
	addiu	$17,$17,16

	lw	$28,56($sp)
	bne	$20,$17,$L1118
	addiu	$16,$16,4

	lui	$2,%hi(total_zeros_vlc)
	addiu	$22,$2,%lo(total_zeros_vlc)
	lui	$3,%hi(total_zeros_len)
	lui	$2,%hi(total_zeros_bits)
	addiu	$21,$3,%lo(total_zeros_len)
	addiu	$20,$2,%lo(total_zeros_bits)
	move	$16,$0
	li	$17,1			# 0x1
	li	$19,240			# 0xf0
$L1119:
	addu	$2,$20,$16
	lw	$25,%call16(init_vlc_sparse)($28)
	addu	$4,$22,$16
	addu	$7,$21,$16
	sw	$2,24($sp)
	sw	$17,16($sp)
	sw	$17,20($sp)
	sw	$17,28($sp)
	sw	$17,32($sp)
	sw	$0,36($sp)
	sw	$0,40($sp)
	sw	$0,44($sp)
	sw	$17,48($sp)
	li	$5,9			# 0x9
	li	$6,16			# 0x10
	jalr	$25
	addiu	$16,$16,16

	bne	$16,$19,$L1119
	lw	$28,56($sp)

	lui	$2,%hi(run_len)
	lui	$3,%hi(run_bits)
	addiu	$21,$2,%lo(run_len)
	addiu	$20,$3,%lo(run_bits)
	lui	$2,%hi(run_vlc)
	addiu	$22,$2,%lo(run_vlc)
	move	$fp,$20
	move	$16,$0
	li	$17,1			# 0x1
	li	$19,96			# 0x60
$L1120:
	addu	$2,$20,$16
	lw	$25,%call16(init_vlc_sparse)($28)
	addu	$4,$22,$16
	addu	$7,$21,$16
	sw	$2,24($sp)
	sw	$17,16($sp)
	sw	$17,20($sp)
	sw	$17,28($sp)
	sw	$17,32($sp)
	sw	$0,36($sp)
	sw	$0,40($sp)
	sw	$0,44($sp)
	sw	$17,48($sp)
	li	$5,3			# 0x3
	li	$6,7			# 0x7
	jalr	$25
	addiu	$16,$16,16

	bne	$16,$19,$L1120
	lw	$28,56($sp)

	addiu	$2,$fp,96
	sw	$2,24($sp)
	lui	$2,%hi(run_len)
	lw	$25,%call16(init_vlc_sparse)($28)
	addiu	$2,$2,%lo(run_len)
	lui	$4,%hi(run7_vlc)
	sw	$17,48($sp)
	sw	$17,16($sp)
	sw	$17,20($sp)
	sw	$17,28($sp)
	sw	$17,32($sp)
	sw	$0,36($sp)
	sw	$0,40($sp)
	sw	$0,44($sp)
	addiu	$4,$4,%lo(run7_vlc)
	addiu	$7,$2,96
	li	$5,6			# 0x6
	jalr	$25
	li	$6,16			# 0x10

	b	$L1116
	lw	$28,56($sp)

$L1129:
	sw	$4,8728($18)
	b	$L1122
	sw	$0,8732($18)

	.set	macro
	.set	reorder
	.end	decode_init
	.section	.rodata.str1.4
	.align	2
$LC13:
	.ascii	"x264 - core %d\000"
	.align	2
$LC14:
	.ascii	"user data:\"%s\"\012\000"
	.text
	.align	2
	.ent	decode_unregistered_user_data
	.type	decode_unregistered_user_data, @function
decode_unregistered_user_data:
	.set	nomips16
	.frame	$sp,328,$31		# vars= 280, regs= 6/0, args= 16, gp= 8
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-328
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,324($sp)
	sw	$20,320($sp)
	sw	$19,316($sp)
	sw	$18,312($sp)
	sw	$17,308($sp)
	sw	$16,304($sp)
	.cprestore	16
	slt	$2,$5,16
	move	$19,$5
	bne	$2,$0,$L1143
	move	$18,$4

	lw	$7,8456($4)
	lw	$8,8448($4)
	move	$16,$0
	addiu	$10,$sp,28
	li	$9,271			# 0x10f
	sra	$2,$7,3
$L1149:
	addu	$2,$8,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	andi	$2,$7,0x7
	or	$3,$3,$6
	sll	$3,$3,$2
	srl	$3,$3,24
	addu	$2,$10,$16
	addiu	$7,$7,8
	addiu	$16,$16,1
	sb	$3,0($2)
	slt	$17,$16,$19
	beq	$16,$9,$L1133
	sw	$7,8456($18)

	bne	$17,$0,$L1149
	sra	$2,$7,3

$L1133:
	addiu	$6,$sp,24
	lw	$25,%call16(sscanf)($28)
	addu	$2,$6,$16
	addiu	$20,$sp,44
	lui	$5,%hi($LC13)
	sb	$0,4($2)
	addiu	$5,$5,%lo($LC13)
	jalr	$25
	move	$4,$20

	li	$3,1			# 0x1
	beq	$2,$3,$L1145
	lw	$28,16($sp)

$L1135:
	lw	$4,0($18)
	lw	$2,412($4)
	andi	$2,$2,0x1000
	bne	$2,$0,$L1146
	lw	$25,%call16(av_log)($28)

$L1136:
	beq	$17,$0,$L1147
	lw	$31,324($sp)

$L1137:
	lw	$3,8456($18)
	nor	$2,$0,$16
	addu	$2,$2,$19
	addiu	$3,$3,8
	sll	$2,$2,3
	addu	$2,$2,$3
	sw	$2,8456($18)
	lw	$31,324($sp)
$L1147:
	move	$2,$0
	lw	$20,320($sp)
	lw	$19,316($sp)
	lw	$18,312($sp)
	lw	$17,308($sp)
	lw	$16,304($sp)
	j	$31
	addiu	$sp,$sp,328

$L1143:
	lw	$31,324($sp)
	li	$2,-1			# 0xffffffffffffffff
	lw	$20,320($sp)
	lw	$19,316($sp)
	lw	$18,312($sp)
	lw	$17,308($sp)
	lw	$16,304($sp)
	j	$31
	addiu	$sp,$sp,328

$L1146:
	lui	$6,%hi($LC14)
$L1150:
	addiu	$6,$6,%lo($LC14)
	move	$7,$20
	jalr	$25
	li	$5,2			# 0x2

	bne	$17,$0,$L1137
	lw	$28,16($sp)

	b	$L1147
	lw	$31,324($sp)

$L1145:
	lw	$3,24($sp)
	bltz	$3,$L1135
	li	$2,131072			# 0x20000

	addu	$2,$18,$2
	lw	$4,0($18)
	sw	$3,9372($2)
	lw	$2,412($4)
	andi	$2,$2,0x1000
	beq	$2,$0,$L1136
	lw	$25,%call16(av_log)($28)

	b	$L1150
	lui	$6,%hi($LC14)

	.set	macro
	.set	reorder
	.end	decode_unregistered_user_data
	.section	.rodata.str1.4
	.align	2
$LC15:
	.ascii	"corrupted macroblock %d %d (total_coeff=%d)\012\000"
	.align	2
$LC16:
	.ascii	"prefix too large at %d %d\012\000"
	.align	2
$LC17:
	.ascii	"negative number of zero coeffs at %d %d\012\000"
	.text
	.align	2
	.ent	decode_residual
	.type	decode_residual, @function
decode_residual:
	.set	nomips16
	.frame	$sp,136,$31		# vars= 64, regs= 10/0, args= 24, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-136
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,132($sp)
	sw	$fp,128($sp)
	sw	$23,124($sp)
	sw	$22,120($sp)
	sw	$21,116($sp)
	sw	$20,112($sp)
	sw	$19,108($sp)
	sw	$18,104($sp)
	sw	$17,100($sp)
	sw	$16,96($sp)
	.cprestore	24
	li	$2,26			# 0x1a
	sw	$7,148($sp)
	sw	$4,136($sp)
	move	$16,$5
	move	$22,$6
	beq	$7,$2,$L1210
	lw	$23,152($sp)

	lw	$3,148($sp)
	li	$2,25			# 0x19
	beq	$3,$2,$L1211
	lui	$2,%hi(scan8)

	addiu	$12,$2,%lo(scan8)
	lw	$2,148($sp)
	addu	$3,$12,$2
	lbu	$2,0($3)
	lw	$3,136($sp)
	addu	$2,$3,$2
	lbu	$4,9079($2)
	lbu	$3,9072($2)
	addu	$3,$3,$4
	slt	$2,$3,64
	beq	$2,$0,$L1157
	addiu	$2,$3,1

	sra	$3,$2,1
$L1157:
	lw	$9,8($16)
	lw	$11,0($16)
	sra	$4,$9,3
	addu	$4,$11,$4
	andi	$5,$3,0x1f
	lbu	$6,0($4)
	lui	$2,%hi(coeff_token_table_index.13227)
	lbu	$3,3($4)
	lbu	$7,1($4)
	addiu	$2,$2,%lo(coeff_token_table_index.13227)
	sll	$5,$5,2
	addu	$5,$5,$2
	sll	$6,$6,24
	lbu	$2,2($4)
	sll	$7,$7,16
	or	$3,$3,$6
	lw	$4,0($5)
	or	$3,$3,$7
	sll	$2,$2,8
	or	$3,$3,$2
	lui	$2,%hi(coeff_token_vlc)
	sll	$4,$4,4
	andi	$5,$9,0x7
	addiu	$2,$2,%lo(coeff_token_vlc)
	addu	$2,$2,$4
	sll	$3,$3,$5
	lw	$10,4($2)
	srl	$3,$3,24
	sll	$3,$3,2
	addu	$3,$10,$3
	lh	$7,2($3)
	bltz	$7,$L1212
	lh	$8,0($3)

$L1158:
	lw	$4,148($sp)
	sra	$17,$8,2
	addu	$2,$12,$4
	lbu	$3,0($2)
	lw	$2,136($sp)
	addu	$4,$7,$9
	addu	$3,$2,$3
	sw	$4,8($16)
	sb	$17,9080($3)
$L1153:
	beq	$17,$0,$L1231
	lw	$31,132($sp)

$L1220:
	lw	$3,160($sp)
	sltu	$2,$3,$17
	bne	$2,$0,$L1213
	andi	$19,$8,0x3

	beq	$19,$0,$L1214
	sll	$2,$19,2

	addiu	$5,$sp,32
	lw	$7,8($16)
	lw	$10,0($16)
	addu	$6,$5,$2
	li	$8,1			# 0x1
$L1164:
	sra	$2,$7,3
	addu	$2,$10,$2
	lbu	$3,0($2)
	andi	$4,$7,0x7
	sll	$3,$3,$4
	srl	$3,$3,6
	andi	$3,$3,0x2
	subu	$3,$8,$3
	sw	$3,0($5)
	addiu	$7,$7,1
	addiu	$5,$5,4
	bne	$5,$6,$L1164
	sw	$7,8($16)

	move	$20,$19
$L1163:
	slt	$2,$20,$17
	beq	$2,$0,$L1232
	lw	$4,160($sp)

	slt	$2,$17,11
	bne	$2,$0,$L1167
	move	$21,$0

	xori	$2,$19,0x3
	sltu	$21,$0,$2
$L1167:
	lw	$7,8($16)
	lw	$10,0($16)
	sra	$2,$7,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$7,0x7
	sll	$3,$3,$4
	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$3,$2
	bne	$2,$0,$L1168
	nop

	move	$5,$0
$L1169:
	andi	$2,$3,0xff00
	beq	$2,$0,$L1233
	lw	$fp,%got(ff_log2_tab)($28)

	srl	$3,$3,8
	addiu	$5,$5,8
$L1233:
	li	$2,32			# 0x20
	addu	$3,$fp,$3
	lbu	$4,0($3)
	subu	$2,$2,$5
	subu	$2,$2,$4
	addiu	$18,$2,-1
	slt	$3,$18,14
	addu	$2,$2,$7
	beq	$3,$0,$L1171
	sw	$2,8($16)

	bne	$21,$0,$L1216
	li	$5,1			# 0x1

	move	$5,$18
$L1173:
	xori	$4,$19,0x3
	addiu	$2,$5,2
	movn	$5,$2,$4
	addiu	$3,$5,2
	andi	$2,$5,0x1
	subu	$2,$0,$2
	sra	$3,$3,1
	xor	$3,$3,$2
	addiu	$13,$20,1
	sll	$4,$20,2
	addiu	$7,$sp,32
	subu	$3,$3,$2
	addu	$4,$7,$4
	slt	$5,$5,6
	li	$9,2			# 0x2
	li	$2,1			# 0x1
	slt	$6,$13,$17
	movn	$9,$2,$5
	beq	$6,$0,$L1165
	sw	$3,0($4)

	sll	$3,$13,2
	lui	$2,%hi(suffix_limit.13244)
	lw	$10,0($16)
	addu	$12,$7,$3
	addiu	$20,$2,%lo(suffix_limit.13244)
	li	$19,-65536			# 0xffffffffffff0000
	li	$18,32			# 0x20
	b	$L1187
	li	$15,15			# 0xf

$L1218:
	move	$8,$0
$L1181:
	andi	$2,$3,0xff00
	beq	$2,$0,$L1182
	sll	$14,$15,$9

	srl	$3,$3,8
	addiu	$8,$8,8
$L1182:
	addu	$3,$fp,$3
	lbu	$4,0($3)
	subu	$2,$18,$8
	subu	$2,$2,$4
	addu	$7,$2,$7
	addiu	$8,$2,-1
	sra	$3,$7,3
	slt	$2,$8,15
	addu	$5,$10,$3
	andi	$6,$7,0x7
	addiu	$11,$7,12
	bne	$2,$0,$L1217
	sw	$7,8($16)

	bne	$8,$15,$L1234
	lw	$4,136($sp)

	lbu	$3,0($5)
	lbu	$2,3($5)
	lbu	$4,1($5)
	sll	$3,$3,24
	lbu	$5,2($5)
	or	$2,$2,$3
	sll	$4,$4,16
	or	$2,$2,$4
	sll	$5,$5,8
	or	$2,$2,$5
	sll	$2,$2,$6
	srl	$2,$2,20
	sw	$11,8($16)
	addu	$6,$2,$14
$L1184:
	sll	$4,$9,2
	addu	$4,$4,$20
	andi	$3,$6,0x1
	addiu	$2,$6,2
	subu	$3,$0,$3
	sra	$2,$2,1
	lw	$5,0($4)
	xor	$2,$2,$3
	addiu	$13,$13,1
	subu	$2,$2,$3
	slt	$5,$5,$6
	slt	$3,$13,$17
	sw	$2,0($12)
	addu	$9,$5,$9
	beq	$3,$0,$L1165
	addiu	$12,$12,4

$L1187:
	lw	$7,8($16)
	sra	$2,$7,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$2,$7,0x7
	sll	$3,$3,$2
	and	$4,$3,$19
	beq	$4,$0,$L1218
	li	$8,16			# 0x10

	b	$L1181
	srl	$3,$3,16

$L1211:
	lw	$4,136($sp)
	lbu	$2,9084($4)
	lbu	$3,9091($4)
	addu	$2,$2,$3
	slt	$4,$2,64
	beq	$4,$0,$L1155
	nop

	addiu	$2,$2,1
	sra	$2,$2,1
$L1155:
	lw	$9,8($16)
	lw	$10,0($16)
	sra	$4,$9,3
	addu	$4,$10,$4
	andi	$5,$2,0x1f
	lbu	$6,0($4)
	lui	$2,%hi(coeff_token_table_index.13227)
	lbu	$3,3($4)
	lbu	$7,1($4)
	addiu	$2,$2,%lo(coeff_token_table_index.13227)
	sll	$5,$5,2
	addu	$5,$5,$2
	sll	$6,$6,24
	lbu	$2,2($4)
	sll	$7,$7,16
	or	$3,$3,$6
	lw	$4,0($5)
	or	$3,$3,$7
	sll	$2,$2,8
	or	$3,$3,$2
	lui	$2,%hi(coeff_token_vlc)
	sll	$4,$4,4
	andi	$5,$9,0x7
	addiu	$2,$2,%lo(coeff_token_vlc)
	addu	$2,$2,$4
	sll	$3,$3,$5
	lw	$11,4($2)
	srl	$3,$3,24
	sll	$3,$3,2
	addu	$3,$11,$3
	lh	$7,2($3)
	bltz	$7,$L1219
	lh	$8,0($3)

$L1156:
	addu	$2,$7,$9
	sra	$17,$8,2
	bne	$17,$0,$L1220
	sw	$2,8($16)

	lw	$31,132($sp)
$L1231:
	move	$2,$0
	lw	$fp,128($sp)
	lw	$23,124($sp)
	lw	$22,120($sp)
	lw	$21,116($sp)
	lw	$20,112($sp)
	lw	$19,108($sp)
	lw	$18,104($sp)
	lw	$17,100($sp)
	lw	$16,96($sp)
	j	$31
	addiu	$sp,$sp,136

$L1165:
	lw	$4,160($sp)
$L1232:
	beq	$17,$4,$L1221
	lw	$3,148($sp)

	li	$2,26			# 0x1a
	beq	$3,$2,$L1222
	addiu	$8,$17,-1

	lw	$7,8($16)
	lw	$2,0($16)
	sra	$3,$7,3
	addu	$2,$2,$3
	lbu	$5,0($2)
	lbu	$4,3($2)
	lbu	$3,1($2)
	lbu	$6,2($2)
	sll	$5,$5,24
	or	$4,$4,$5
	sll	$3,$3,16
	or	$4,$4,$3
	sll	$6,$6,8
	lui	$2,%hi(total_zeros_vlc)
	sll	$3,$8,4
	or	$4,$4,$6
	andi	$5,$7,0x7
	addiu	$2,$2,%lo(total_zeros_vlc)
	addu	$2,$2,$3
	sll	$4,$4,$5
	lw	$3,4($2)
	srl	$4,$4,23
	sll	$4,$4,2
	addu	$3,$3,$4
	lh	$2,2($3)
	lh	$9,0($3)
	addu	$2,$2,$7
	sw	$2,8($16)
$L1189:
	lw	$4,148($sp)
	addu	$12,$8,$9
	slt	$3,$4,25
	addu	$2,$23,$12
	beq	$3,$0,$L1191
	lbu	$4,0($2)

	lw	$3,156($sp)
	sll	$2,$4,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,32($sp)
	sll	$4,$4,1
	mul	$3,$3,$2
	addu	$4,$22,$4
	addiu	$3,$3,32
	srl	$3,$3,6
	slt	$2,$17,2
	bne	$2,$0,$L1193
	sh	$3,0($4)

	sll	$2,$17,2
	addiu	$7,$sp,32
	addu	$15,$7,$2
	lui	$3,%hi(run_vlc)
	lui	$2,%hi(run7_vlc)
	addiu	$18,$2,%lo(run7_vlc)
	addiu	$17,$3,%lo(run_vlc)
	b	$L1203
	addiu	$11,$sp,36

$L1224:
	lw	$7,8($16)
	lw	$3,0($16)
	sra	$2,$7,3
	addu	$3,$3,$2
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	lbu	$6,2($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	andi	$3,$7,0x7
	or	$2,$2,$6
	sll	$2,$2,$3
	lw	$4,4($8)
	srl	$2,$2,29
	sll	$2,$2,2
	addu	$4,$4,$2
	lh	$3,2($4)
	lh	$8,0($4)
	addu	$3,$3,$7
	sw	$3,8($16)
	nor	$2,$0,$8
$L1200:
	addu	$12,$12,$2
	addu	$2,$23,$12
	lbu	$4,0($2)
	lw	$3,156($sp)
	sll	$2,$4,2
	addu	$2,$3,$2
	lw	$5,0($11)
	lw	$3,0($2)
	sll	$4,$4,1
	mul	$3,$3,$5
	addu	$4,$22,$4
	addiu	$3,$3,32
	srl	$3,$3,6
	addiu	$11,$11,4
	sh	$3,0($4)
	beq	$11,$15,$L1193
	subu	$9,$9,$8

$L1203:
	blez	$9,$L1223
	slt	$3,$9,7

	addiu	$2,$9,-1
	sll	$2,$2,4
	bne	$3,$0,$L1224
	addu	$8,$17,$2

	lw	$7,8($16)
	lw	$14,0($16)
	sra	$3,$7,3
	addu	$3,$14,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	lbu	$6,2($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	srl	$2,$2,26
	lw	$13,4($18)
	sll	$2,$2,2
	addu	$2,$13,$2
	lh	$10,2($2)
	bltz	$10,$L1225
	lh	$8,0($2)

$L1202:
	addu	$2,$10,$7
	sw	$2,8($16)
	b	$L1200
	nor	$2,$0,$8

$L1222:
	lw	$7,8($16)
	lw	$2,0($16)
	sra	$3,$7,3
	addu	$2,$2,$3
	lbu	$5,0($2)
	lbu	$4,3($2)
	lbu	$3,1($2)
	lbu	$6,2($2)
	sll	$5,$5,24
	or	$4,$4,$5
	sll	$3,$3,16
	or	$4,$4,$3
	sll	$6,$6,8
	addiu	$2,$17,-1
	lui	$3,%hi(chroma_dc_total_zeros_vlc)
	sll	$2,$2,4
	or	$4,$4,$6
	andi	$5,$7,0x7
	addiu	$3,$3,%lo(chroma_dc_total_zeros_vlc)
	addu	$3,$3,$2
	sll	$4,$4,$5
	lw	$2,4($3)
	srl	$4,$4,29
	sll	$4,$4,2
	addu	$2,$2,$4
	lh	$9,0($2)
	lh	$3,2($2)
	addiu	$4,$9,-1
	addu	$12,$4,$17
	addu	$3,$3,$7
	sw	$3,8($16)
	addu	$2,$23,$12
	lbu	$4,0($2)
$L1191:
	sll	$2,$4,1
	lw	$3,32($sp)
	addu	$2,$22,$2
	slt	$4,$17,2
	beq	$4,$0,$L1226
	sh	$3,0($2)

$L1193:
	bgez	$9,$L1231
	lw	$31,132($sp)

	lw	$3,136($sp)
	lui	$6,%hi($LC17)
	lw	$2,6172($3)
	lw	$4,0($3)
	lw	$7,6168($3)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	b	$L1209
	addiu	$6,$6,%lo($LC17)

$L1210:
	lw	$7,8($5)
	lw	$10,0($5)
	sra	$2,$7,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	andi	$2,$7,0x7
	or	$3,$3,$6
	sll	$3,$3,$2
	lui	$2,%hi(chroma_dc_coeff_token_vlc+4)
	lw	$4,%lo(chroma_dc_coeff_token_vlc+4)($2)
	srl	$3,$3,24
	sll	$3,$3,2
	addu	$4,$4,$3
	lh	$2,2($4)
	lh	$8,0($4)
	addu	$2,$2,$7
	sw	$2,8($16)
	b	$L1153
	sra	$17,$8,2

$L1226:
	sll	$2,$17,2
	addiu	$7,$sp,32
	addu	$15,$7,$2
	lui	$3,%hi(run_vlc)
	lui	$2,%hi(run7_vlc)
	addiu	$18,$2,%lo(run7_vlc)
	addiu	$17,$3,%lo(run_vlc)
	b	$L1198
	addiu	$11,$sp,36

$L1228:
	lw	$7,8($16)
	lw	$3,0($16)
	sra	$2,$7,3
	addu	$3,$3,$2
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	lbu	$6,2($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	andi	$3,$7,0x7
	or	$2,$2,$6
	sll	$2,$2,$3
	lw	$4,4($8)
	srl	$2,$2,29
	sll	$2,$2,2
	addu	$4,$4,$2
	lh	$3,2($4)
	lh	$8,0($4)
	addu	$3,$3,$7
	sw	$3,8($16)
	nor	$2,$0,$8
$L1195:
	addu	$12,$12,$2
	addu	$2,$23,$12
	lbu	$3,0($2)
	lw	$4,0($11)
	sll	$3,$3,1
	addu	$3,$22,$3
	addiu	$11,$11,4
	sh	$4,0($3)
	beq	$11,$15,$L1193
	subu	$9,$9,$8

$L1198:
	blez	$9,$L1227
	slt	$3,$9,7

	addiu	$2,$9,-1
	sll	$2,$2,4
	bne	$3,$0,$L1228
	addu	$8,$17,$2

	lw	$7,8($16)
	lw	$13,0($16)
	sra	$3,$7,3
	addu	$3,$13,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	lbu	$6,2($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	srl	$2,$2,26
	lw	$14,4($18)
	sll	$2,$2,2
	addu	$2,$14,$2
	lh	$10,2($2)
	bltz	$10,$L1229
	lh	$8,0($2)

$L1197:
	addu	$2,$10,$7
	sw	$2,8($16)
	b	$L1195
	nor	$2,$0,$8

$L1219:
	addiu	$9,$9,8
	sra	$3,$9,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	lbu	$6,2($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$9,0x7
	sll	$2,$2,$3
	srl	$2,$2,$7
	addu	$2,$2,$8
	sll	$2,$2,2
	addu	$2,$11,$2
	lh	$7,2($2)
	b	$L1156
	lh	$8,0($2)

$L1217:
	lbu	$4,0($5)
	move	$2,$5
	lbu	$3,3($5)
	lbu	$5,1($5)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$2,$7,0x7
	sll	$3,$3,$2
	subu	$4,$18,$9
	srl	$3,$3,$4
	addu	$2,$7,$9
	sll	$4,$8,$9
	sw	$2,8($16)
	b	$L1184
	addu	$6,$3,$4

$L1227:
	move	$8,$0
	b	$L1195
	li	$2,-1			# 0xffffffffffffffff

$L1223:
	move	$8,$0
	b	$L1200
	li	$2,-1			# 0xffffffffffffffff

$L1225:
	addiu	$7,$7,6
	sra	$3,$7,3
	addu	$3,$14,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	lbu	$6,2($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	srl	$2,$2,$10
	addu	$2,$2,$8
	sll	$2,$2,2
	addu	$2,$13,$2
	lh	$10,2($2)
	b	$L1202
	lh	$8,0($2)

$L1229:
	addiu	$7,$7,6
	sra	$3,$7,3
	addu	$3,$13,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	lbu	$6,2($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	srl	$2,$2,$10
	addu	$2,$2,$8
	sll	$2,$2,2
	addu	$2,$14,$2
	lh	$10,2($2)
	b	$L1197
	lh	$8,0($2)

$L1212:
	addiu	$9,$9,8
	sra	$3,$9,3
	addu	$3,$11,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	lbu	$6,2($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$9,0x7
	sll	$2,$2,$3
	srl	$2,$2,$7
	addu	$2,$2,$8
	sll	$2,$2,2
	addu	$2,$10,$2
	lh	$7,2($2)
	b	$L1158
	lh	$8,0($2)

$L1171:
	li	$2,14			# 0xe
	beq	$18,$2,$L1230
	li	$2,15			# 0xf

	bne	$18,$2,$L1185
	li	$5,12			# 0xc

	.option	pic0
	jal	get_bits
	.option	pic2
	move	$4,$16

	sll	$3,$18,$21
	addu	$5,$2,$3
	addiu	$2,$5,15
	lw	$28,24($sp)
	b	$L1173
	movz	$5,$2,$21

$L1168:
	srl	$3,$3,16
	b	$L1169
	li	$5,16			# 0x10

$L1221:
	addiu	$8,$17,-1
	b	$L1189
	move	$9,$0

$L1185:
	lw	$4,136($sp)
$L1234:
	lw	$3,136($sp)
	lw	$2,6172($4)
	lui	$6,%hi($LC16)
	lw	$25,%call16(av_log)($28)
	lw	$4,0($4)
	lw	$7,6168($3)
	addiu	$6,$6,%lo($LC16)
	sw	$2,16($sp)
$L1209:
	jalr	$25
	move	$5,$0

	lw	$31,132($sp)
	lw	$28,24($sp)
	li	$2,-1			# 0xffffffffffffffff
	lw	$fp,128($sp)
	lw	$23,124($sp)
	lw	$22,120($sp)
	lw	$21,116($sp)
	lw	$20,112($sp)
	lw	$19,108($sp)
	lw	$18,104($sp)
	lw	$17,100($sp)
	lw	$16,96($sp)
	j	$31
	addiu	$sp,$sp,136

$L1216:
	.option	pic0
	jal	get_bits
	.option	pic2
	move	$4,$16

	sll	$3,$18,1
	lw	$28,24($sp)
	b	$L1173
	addu	$5,$2,$3

$L1230:
	beq	$21,$0,$L1175
	nop

	li	$5,1			# 0x1
	.option	pic0
	jal	get_bits
	.option	pic2
	move	$4,$16

	lw	$28,24($sp)
	b	$L1173
	addiu	$5,$2,28

$L1214:
	b	$L1163
	move	$20,$0

$L1175:
	li	$5,4			# 0x4
	.option	pic0
	jal	get_bits
	.option	pic2
	move	$4,$16

	lw	$28,24($sp)
	b	$L1173
	addiu	$5,$2,14

$L1213:
	lw	$4,136($sp)
	lw	$3,136($sp)
	lw	$2,6172($4)
	lui	$6,%hi($LC15)
	lw	$4,0($4)
	lw	$7,6168($3)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	sw	$17,20($sp)
	b	$L1209
	addiu	$6,$6,%lo($LC15)

	.set	macro
	.set	reorder
	.end	decode_residual
	.align	2
	.ent	get_bits_long
	.type	get_bits_long, @function
get_bits_long:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	slt	$2,$5,18
	move	$14,$5
	bne	$2,$0,$L1239
	move	$13,$4

	lw	$11,8($4)
	lw	$4,0($4)
	addiu	$12,$11,16
	sra	$2,$11,3
	addu	$2,$4,$2
	sra	$3,$12,3
	addu	$4,$4,$3
	lbu	$10,2($2)
	lbu	$6,3($2)
	lbu	$3,0($2)
	lbu	$7,1($2)
	sw	$12,8($13)
	lbu	$2,0($4)
	lbu	$5,3($4)
	lbu	$8,1($4)
	sll	$3,$3,24
	lbu	$9,2($4)
	or	$6,$6,$3
	sll	$7,$7,16
	sll	$2,$2,24
	or	$6,$6,$7
	or	$5,$5,$2
	sll	$10,$10,8
	sll	$8,$8,16
	or	$6,$6,$10
	or	$5,$5,$8
	sll	$9,$9,8
	andi	$11,$11,0x7
	addiu	$3,$14,-16
	andi	$2,$12,0x7
	sll	$6,$6,$11
	or	$5,$5,$9
	sll	$5,$5,$2
	srl	$6,$6,16
	subu	$2,$0,$3
	sll	$6,$6,$3
	srl	$5,$5,$2
	addu	$3,$3,$12
	sw	$3,8($13)
	j	$31
	or	$2,$5,$6

$L1239:
	lw	$7,8($4)
	lw	$2,0($4)
	sra	$3,$7,3
	addu	$2,$2,$3
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	andi	$2,$7,0x7
	or	$3,$3,$6
	sll	$3,$3,$2
	addu	$7,$14,$7
	subu	$2,$0,$14
	sw	$7,8($13)
	j	$31
	srl	$2,$3,$2

	.set	macro
	.set	reorder
	.end	get_bits_long
	.section	.rodata.str1.4
	.align	2
$LC18:
	.ascii	"unsupported slice header (%02X)\012\000"
	.align	2
$LC19:
	.ascii	"slice after bitstream end\012\000"
	.align	2
$LC20:
	.ascii	"illegal slice type %d \012\000"
	.text
	.align	2
	.ent	svq3_decode_slice_header
	.type	svq3_decode_slice_header, @function
svq3_decode_slice_header:
	.set	nomips16
	.frame	$sp,48,$31		# vars= 0, regs= 6/0, args= 16, gp= 8
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-48
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,44($sp)
	sw	$20,40($sp)
	sw	$19,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	.cprestore	16
	lw	$9,8456($4)
	lw	$11,8448($4)
	sra	$2,$9,3
	addu	$2,$11,$2
	move	$16,$4
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	andi	$2,$9,0x7
	or	$3,$3,$6
	sll	$3,$3,$2
	srl	$7,$3,24
	andi	$17,$7,0x9f
	addiu	$2,$17,-1
	addiu	$8,$9,8
	sltu	$2,$2,2
	sw	$8,8456($16)
	lw	$20,6168($16)
	lw	$19,6172($16)
	beq	$2,$0,$L1241
	lw	$18,152($16)

	andi	$2,$7,0x60
	bne	$2,$0,$L1242
	sra	$3,$8,3

$L1241:
	lui	$6,%hi($LC18)
	lw	$4,0($16)
	lw	$25,%call16(av_log)($28)
	addiu	$6,$6,%lo($LC18)
$L1275:
	jalr	$25
	move	$5,$0

	lw	$28,16($sp)
	li	$2,-1			# 0xffffffffffffffff
$L1243:
	lw	$31,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,48

$L1242:
	addu	$3,$11,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	lbu	$6,2($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sra	$3,$7,5
	sll	$5,$5,16
	andi	$7,$3,0x3
	or	$2,$2,$5
	sll	$6,$6,8
	andi	$4,$8,0x7
	or	$2,$2,$6
	sll	$3,$7,3
	sll	$2,$2,$4
	subu	$3,$0,$3
	srl	$2,$2,$3
	addu	$2,$2,$7
	sll	$2,$2,3
	lw	$3,8460($16)
	addu	$4,$2,$8
	slt	$3,$3,$4
	bne	$3,$0,$L1276
	sw	$4,9784($16)

	li	$2,1			# 0x1
	subu	$2,$2,$7
	sll	$2,$2,3
	addu	$3,$4,$2
	addiu	$2,$9,16
	sw	$3,8460($16)
	beq	$7,$0,$L1245
	sw	$2,8456($16)

	lw	$25,%call16(memcpy)($28)
	sra	$4,$2,3
	sra	$5,$3,3
	addu	$5,$11,$5
	addu	$4,$11,$4
	jalr	$25
	addiu	$6,$7,-1

	lw	$28,16($sp)
	lw	$11,8448($16)
$L1245:
	lw	$8,8456($16)
	sra	$2,$8,3
	addu	$2,$11,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$3,$3,$4
	li	$2,-1434451968			# 0xffffffffaa800000
	and	$2,$3,$2
	bne	$2,$0,$L1246
	lw	$12,%got(ff_interleaved_golomb_vlc_len)($28)

	srl	$7,$3,24
	addu	$2,$12,$7
	lbu	$6,0($2)
	sltu	$3,$6,9
	beq	$3,$0,$L1277
	li	$2,9			# 0x9

	lw	$10,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	li	$9,1			# 0x1
$L1254:
	addu	$8,$8,$6
$L1251:
	addu	$4,$10,$7
$L1281:
	addiu	$2,$6,-1
	sra	$2,$2,1
	lbu	$3,0($4)
	sll	$2,$9,$2
	or	$3,$3,$2
	addiu	$7,$3,-1
	li	$2,-2147483648			# 0xffffffff80000000
	bne	$7,$2,$L1249
	sw	$8,8456($16)

$L1253:
	lui	$6,%hi($LC20)
	lw	$4,0($16)
	lw	$25,%call16(av_log)($28)
	b	$L1275
	addiu	$6,$6,%lo($LC20)

$L1246:
	lw	$2,%got(ff_interleaved_golomb_vlc_len)($28)
	srl	$4,$3,24
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_interleaved_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lbu	$7,0($2)
	sw	$3,8456($16)
$L1249:
	slt	$2,$7,3
	beq	$2,$0,$L1253
	lui	$2,%hi(golomb_to_pict_type)

	addiu	$2,$2,%lo(golomb_to_pict_type)
	addu	$2,$7,$2
	lbu	$4,0($2)
	li	$3,65536			# 0x10000
	addu	$3,$16,$3
	li	$2,2			# 0x2
	beq	$17,$2,$L1278
	sw	$4,-6284($3)

	lw	$8,8456($16)
	lw	$9,6168($16)
	addiu	$8,$8,1
	sw	$8,8456($16)
	sw	$0,6176($16)
$L1263:
	sra	$2,$8,3
	addu	$2,$11,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	andi	$2,$8,0x7
	or	$3,$3,$6
	addiu	$7,$8,8
	sll	$3,$3,$2
	li	$2,65536			# 0x10000
	srl	$3,$3,24
	addu	$2,$16,$2
	sra	$4,$7,3
	sw	$7,8456($16)
	sw	$3,-6296($2)
	addu	$4,$11,$4
	lbu	$3,0($4)
	lbu	$2,3($4)
	lbu	$5,1($4)
	lbu	$6,2($4)
	sll	$3,$3,24
	or	$2,$2,$3
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$7,$7,0x7
	addiu	$4,$8,13
	sll	$2,$2,$7
	srl	$2,$2,27
	sra	$3,$4,3
	sw	$4,8456($16)
	addu	$3,$11,$3
	sw	$2,2056($16)
	lbu	$2,0($3)
	andi	$4,$4,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	lw	$3,9780($16)
	srl	$2,$2,7
	move	$4,$8
	addiu	$8,$8,15
	sw	$2,2076($16)
	beq	$3,$0,$L1264
	sw	$8,8456($16)

	addiu	$2,$4,16
	sw	$2,8456($16)
	move	$8,$2
$L1264:
	addiu	$4,$8,3
	sra	$3,$4,3
	sw	$4,8456($16)
	addu	$3,$11,$3
	lbu	$2,0($3)
	andi	$4,$4,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$7,$8,4
	srl	$2,$2,7
	beq	$2,$0,$L1265
	sw	$7,8456($16)

$L1270:
	addiu	$4,$7,8
	sra	$3,$4,3
	sw	$4,8456($16)
	addu	$3,$11,$3
	lbu	$2,0($3)
	andi	$4,$4,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$7,$7,9
	srl	$2,$2,7
	bne	$2,$0,$L1270
	sw	$7,8456($16)

$L1265:
	mul	$2,$18,$19
	blez	$9,$L1267
	addu	$17,$2,$20

	lw	$2,8816($16)
	addiu	$4,$17,-1
	lw	$25,%call16(memset)($28)
	sll	$4,$4,3
	addu	$4,$2,$4
	li	$5,-1			# 0xffffffffffffffff
	jalr	$25
	li	$6,4			# 0x4

	lw	$6,6168($16)
	lw	$28,16($sp)
	lw	$2,8816($16)
	subu	$4,$17,$6
	lw	$25,%call16(memset)($28)
	sll	$4,$4,3
	addu	$4,$2,$4
	sll	$6,$6,3
	jalr	$25
	li	$5,-1			# 0xffffffffffffffff

	lw	$28,16($sp)
$L1267:
	lw	$2,6172($16)
	blez	$2,$L1268
	lw	$25,%call16(memset)($28)

	lw	$4,152($16)
	lw	$6,144($16)
	lw	$2,6168($16)
	lw	$3,8816($16)
	subu	$4,$17,$4
	subu	$6,$6,$2
	sll	$4,$4,3
	addu	$4,$3,$4
	sll	$6,$6,3
	jalr	$25
	li	$5,-1			# 0xffffffffffffffff

	lw	$2,6168($16)
	blez	$2,$L1268
	lw	$28,16($sp)

	lw	$2,152($16)
	lw	$4,8816($16)
	subu	$2,$2,$17
	addiu	$2,$2,1
	sll	$2,$2,3
	subu	$4,$4,$2
	li	$3,-1
	sb	$3,3($4)
	b	$L1243
	move	$2,$0

$L1268:
	lw	$31,44($sp)
	move	$2,$0
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	j	$31
	addiu	$sp,$sp,48

$L1277:
	bne	$6,$2,$L1279
	addiu	$8,$8,8

	lw	$10,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	li	$9,1			# 0x1
	li	$13,9			# 0x9
$L1252:
	sra	$3,$8,3
	addu	$3,$11,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$8,0x7
	sll	$2,$2,$3
	addu	$5,$10,$7
	srl	$7,$2,24
	addu	$3,$12,$7
	lbu	$6,0($3)
	lbu	$4,0($5)
	sll	$2,$9,4
	sltu	$3,$6,9
	bne	$3,$0,$L1254
	or	$9,$4,$2

	beq	$6,$13,$L1252
	addiu	$8,$8,8

	b	$L1281
	addu	$4,$10,$7

$L1278:
	lw	$3,172($16)
	slt	$2,$3,64
	bne	$2,$0,$L1280
	li	$5,6			# 0x6

	addiu	$4,$3,-1
	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$4,$2
	bne	$2,$0,$L1260
	nop

	move	$3,$0
$L1261:
	andi	$2,$4,0xff00
	beq	$2,$0,$L1282
	addiu	$2,$3,1

	srl	$4,$4,8
	addiu	$3,$3,8
	addiu	$2,$3,1
$L1282:
	lw	$3,%got(ff_log2_tab)($28)
	addu	$3,$3,$4
	lbu	$4,0($3)
	addu	$5,$2,$4
$L1280:
	.option	pic0
	jal	get_bits
	.option	pic2
	addiu	$4,$16,8448

	lw	$3,144($16)
	lw	$4,6172($16)
	lw	$9,6168($16)
	mul	$5,$3,$4
	lw	$28,16($sp)
	addu	$3,$5,$9
	subu	$2,$2,$3
	lw	$8,8456($16)
	lw	$11,8448($16)
	b	$L1263
	sw	$2,6176($16)

$L1260:
	srl	$4,$4,16
	b	$L1261
	li	$3,16			# 0x10

$L1276:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($16)
	lui	$6,%hi($LC19)
	addiu	$6,$6,%lo($LC19)
	jalr	$25
	move	$5,$0

	lw	$28,16($sp)
	b	$L1243
	li	$2,-1			# 0xffffffffffffffff

$L1279:
	li	$9,1			# 0x1
	b	$L1251
	lw	$10,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

	.set	macro
	.set	reorder
	.end	svq3_decode_slice_header
	.align	2
	.ent	pred_motion
	.type	pred_motion, @function
pred_motion:
	.set	nomips16
	.frame	$sp,24,$31		# vars= 0, regs= 6/0, args= 0, gp= 0
	.mask	0x003f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(scan8)
	sll	$11,$7,2
	addiu	$2,$2,%lo(scan8)
	addu	$2,$2,$5
	addu	$5,$11,$7
	lbu	$8,0($2)
	sll	$12,$7,3
	sll	$24,$7,5
	subu	$5,$0,$5
	addiu	$sp,$sp,-24
	addu	$3,$12,$24
	li	$2,65536			# 0x10000
	addiu	$5,$5,1
	sw	$20,16($sp)
	move	$14,$4
	addu	$10,$4,$2
	move	$20,$6
	addiu	$4,$8,-8
	addiu	$6,$3,-1
	sll	$5,$5,3
	addu	$3,$14,$3
	addu	$15,$4,$20
	move	$13,$7
	addu	$6,$6,$8
	subu	$5,$8,$5
	lw	$7,-6276($10)
	sw	$18,8($sp)
	sw	$16,0($sp)
	sw	$21,20($sp)
	sw	$19,12($sp)
	sw	$17,4($sp)
	sll	$5,$5,2
	addu	$2,$3,$15
	addiu	$9,$14,9136
	addu	$4,$3,$4
	sll	$6,$6,2
	addu	$3,$3,$8
	addu	$16,$9,$5
	lb	$17,9456($4)
	lb	$19,9455($3)
	addu	$25,$9,$6
	lb	$5,9456($2)
	beq	$7,$0,$L1284
	lw	$18,40($sp)

	sll	$2,$13,4
	addu	$2,$11,$2
	subu	$2,$0,$2
	addiu	$2,$2,1
	sll	$2,$2,1
	subu	$2,$0,$2
	addiu	$2,$2,12
	sll	$2,$2,2
	addu	$2,$9,$2
	sw	$0,0($2)
	lw	$6,-6272($10)
	lw	$11,1880($14)
	move	$10,$2
	bne	$6,$0,$L1285
	lw	$7,104($11)

	lw	$4,6172($14)
	andi	$2,$4,0x1
	beq	$2,$0,$L1336
	li	$2,-2			# 0xfffffffffffffffe

	slt	$2,$8,20
	beq	$2,$0,$L1336
	li	$2,-2			# 0xfffffffffffffffe

	beq	$5,$2,$L1326
	addiu	$2,$4,-1

	lw	$21,152($14)
	mul	$3,$2,$21
	lw	$6,6168($14)
	addu	$2,$3,$6
	xori	$3,$8,0xf
	sltu	$3,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$2,$7,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L1337
	addu	$2,$12,$24

	sll	$2,$6,2
	sll	$4,$4,2
	addiu	$2,$2,-4
	andi	$3,$8,0x7
	addu	$2,$2,$20
	addiu	$8,$4,-1
	addu	$5,$2,$3
	sra	$2,$8,2
	mul	$4,$2,$21
	sra	$3,$5,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$7,$2
	sll	$4,$13,1
	lw	$2,0($2)
	li	$3,12288			# 0x3000
	sll	$3,$3,$4
	and	$3,$2,$3
	beq	$3,$0,$L1327
	andi	$2,$2,0x40

$L1289:
	lw	$3,9748($14)
	addiu	$2,$13,24
	mul	$4,$8,$3
	sll	$2,$2,2
	addu	$2,$11,$2
	addu	$3,$4,$5
	lw	$7,0($2)
	sll	$3,$3,2
	addu	$7,$7,$3
	sll	$6,$13,7
	lhu	$4,0($7)
	addiu	$2,$13,46
	addu	$6,$24,$6
	addu	$6,$14,$6
	sll	$2,$2,2
	addu	$2,$11,$2
	sh	$4,9176($6)
	lh	$4,2($7)
	lw	$3,4($2)
	lw	$7,9752($14)
	sra	$5,$5,1
	sra	$2,$8,1
	addu	$3,$3,$5
	mul	$5,$2,$7
	sll	$4,$4,1
	addu	$2,$5,$3
	sh	$4,9178($6)
	lb	$3,0($2)
	b	$L1291
	sra	$5,$3,1

$L1284:
	li	$2,-2			# 0xfffffffffffffffe
	beq	$5,$2,$L1338
	addu	$2,$12,$24

$L1337:
	addu	$2,$15,$2
	sll	$2,$2,2
	addu	$10,$9,$2
$L1291:
	xor	$4,$19,$18
	xor	$3,$17,$18
	sltu	$3,$3,1
	sltu	$4,$4,1
	xor	$2,$18,$5
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	bne	$3,$0,$L1339
	li	$2,1			# 0x1

$L1305:
	lh	$5,0($25)
	lh	$3,0($16)
	slt	$2,$3,$5
	bne	$2,$0,$L1328
	lh	$4,0($10)

	slt	$2,$4,$3
	beq	$2,$0,$L1340
	lw	$2,44($sp)

	slt	$2,$4,$5
	move	$3,$5
	movz	$3,$4,$2
	lw	$2,44($sp)
$L1340:
	lh	$4,2($25)
	lh	$7,2($16)
	sw	$3,0($2)
	slt	$2,$7,$4
	beq	$2,$0,$L1308
	lh	$3,2($10)

$L1329:
	slt	$2,$7,$3
	beq	$2,$0,$L1309
	slt	$2,$4,$3

	move	$7,$4
	movz	$7,$3,$2
$L1309:
	lw	$3,48($sp)
	sw	$7,0($3)
$L1310:
	lw	$21,20($sp)
	lw	$20,16($sp)
	lw	$19,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,24

$L1328:
	slt	$2,$3,$4
	beq	$2,$0,$L1340
	lw	$2,44($sp)

	slt	$2,$5,$4
	move	$3,$5
	movz	$3,$4,$2
	lh	$7,2($16)
	lw	$2,44($sp)
	lh	$4,2($25)
	sw	$3,0($2)
	slt	$2,$7,$4
	bne	$2,$0,$L1329
	lh	$3,2($10)

$L1308:
	slt	$2,$3,$7
	beq	$2,$0,$L1309
	slt	$2,$3,$4

	move	$7,$4
	b	$L1309
	movz	$7,$3,$2

$L1285:
	li	$2,-2			# 0xfffffffffffffffe
$L1336:
	bne	$5,$2,$L1337
	addu	$2,$12,$24

	lw	$4,6172($14)
	andi	$5,$4,0x1
	bne	$5,$0,$L1287
	slt	$2,$8,20

	bne	$2,$0,$L1338
	addu	$2,$12,$24

$L1287:
	andi	$3,$8,0x7
	li	$2,4			# 0x4
	beq	$3,$2,$L1330
	addu	$2,$12,$24

$L1338:
	addu	$4,$14,$2
	addiu	$3,$8,-9
	addu	$3,$3,$2
	addu	$4,$4,$8
	sll	$3,$3,2
	lb	$5,9447($4)
	addu	$10,$9,$3
	xor	$4,$19,$18
	xor	$3,$17,$18
	sltu	$3,$3,1
	sltu	$4,$4,1
	xor	$2,$18,$5
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	beq	$3,$0,$L1305
	li	$2,1			# 0x1

$L1339:
	beq	$4,$2,$L1331
	li	$2,-2			# 0xfffffffffffffffe

	bne	$17,$2,$L1305
	nop

	bne	$5,$17,$L1305
	nop

	beq	$19,$5,$L1305
	nop

$L1311:
	lh	$3,2($25)
	lh	$2,0($25)
	lw	$4,44($sp)
	lw	$5,48($sp)
	sw	$2,0($4)
	b	$L1310
	sw	$3,0($5)

$L1331:
	beq	$19,$18,$L1311
	nop

	beq	$17,$18,$L1332
	lw	$4,44($sp)

	lh	$3,2($10)
	lh	$2,0($10)
	lw	$5,48($sp)
	sw	$2,0($4)
	b	$L1310
	sw	$3,0($5)

$L1330:
	addu	$2,$14,$2
	lb	$3,9467($2)
	li	$15,-2			# 0xfffffffffffffffe
	beq	$3,$15,$L1338
	addu	$2,$12,$24

	beq	$6,$0,$L1333
	nop

	lw	$2,8768($14)
	sll	$2,$2,2
	addu	$2,$7,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	bne	$3,$0,$L1338
	addu	$2,$12,$24

	slt	$2,$8,20
	bne	$2,$0,$L1338
	addu	$2,$12,$24

	and	$2,$4,$15
	addiu	$3,$8,-12
	sra	$3,$3,3
	sll	$2,$2,1
	lw	$4,6168($14)
	addu	$2,$2,$3
	sll	$4,$4,2
	sll	$2,$2,1
	addiu	$8,$4,-1
	addiu	$9,$2,-1
	lw	$4,152($14)
	sra	$2,$9,2
	mul	$5,$2,$4
	sra	$3,$8,2
	addu	$2,$5,$3
	sll	$2,$2,2
	addu	$2,$7,$2
	sll	$5,$13,1
	lw	$2,0($2)
	li	$3,12288			# 0x3000
	sll	$3,$3,$5
	and	$3,$2,$3
	beq	$3,$0,$L1334
	andi	$2,$2,0x40

$L1295:
	lw	$3,9748($14)
	addiu	$2,$13,24
	mul	$4,$9,$3
	sll	$2,$2,2
	addu	$2,$11,$2
	addu	$3,$4,$8
	lw	$5,0($2)
	sll	$3,$3,2
	addu	$5,$5,$3
	addiu	$2,$13,46
	sll	$4,$13,7
	lhu	$3,0($5)
	addu	$4,$24,$4
	sll	$2,$2,2
	addu	$2,$11,$2
	addu	$4,$14,$4
	lw	$7,9752($14)
	sh	$3,9176($4)
	lw	$6,4($2)
	sra	$2,$9,1
	lh	$3,2($5)
	mul	$5,$2,$7
	sra	$3,$3,1
	addu	$2,$5,$6
	sra	$5,$8,1
	addu	$2,$2,$5
	sh	$3,9178($4)
	lb	$3,0($2)
	b	$L1291
	sll	$5,$3,1

$L1332:
	lh	$3,2($16)
	lh	$2,0($16)
	lw	$5,48($sp)
	sw	$2,0($4)
	b	$L1310
	sw	$3,0($5)

$L1326:
	b	$L1287
	li	$5,1			# 0x1

$L1333:
	lw	$2,8768($14)
	sll	$2,$2,2
	addu	$2,$7,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L1338
	addu	$2,$12,$24

	ori	$2,$4,0x1
	sll	$2,$2,1
	addu	$2,$2,$5
	sra	$3,$8,4
	addiu	$3,$3,-1
	sll	$2,$2,1
	lw	$4,6168($14)
	addu	$8,$3,$2
	lw	$5,152($14)
	sll	$4,$4,2
	sra	$2,$8,2
	addiu	$9,$4,-1
	mul	$4,$2,$5
	sra	$3,$9,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$7,$2
	sll	$4,$13,1
	lw	$2,0($2)
	li	$3,12288			# 0x3000
	sll	$3,$3,$4
	and	$3,$2,$3
	beq	$3,$0,$L1335
	andi	$2,$2,0x40

$L1294:
	lw	$3,9748($14)
	addiu	$2,$13,24
	mul	$4,$8,$3
	sll	$2,$2,2
	addu	$2,$11,$2
	addu	$3,$4,$9
	lw	$5,0($2)
	sll	$3,$3,2
	addu	$5,$5,$3
	addiu	$2,$13,46
	sll	$4,$13,7
	lhu	$3,0($5)
	addu	$4,$24,$4
	sll	$2,$2,2
	addu	$2,$11,$2
	addu	$4,$14,$4
	lw	$7,9752($14)
	sh	$3,9176($4)
	lw	$6,4($2)
	sra	$2,$8,1
	lh	$3,2($5)
	mul	$5,$2,$7
	sll	$3,$3,1
	addu	$2,$5,$6
	sra	$5,$9,1
	addu	$2,$2,$5
	sh	$3,9178($4)
	lb	$3,0($2)
	b	$L1291
	sra	$5,$3,1

$L1327:
	bne	$2,$0,$L1289
	nop

	b	$L1291
	li	$5,-1			# 0xffffffffffffffff

$L1335:
	bne	$2,$0,$L1294
	nop

	b	$L1291
	li	$5,-1			# 0xffffffffffffffff

$L1334:
	bne	$2,$0,$L1295
	nop

	b	$L1291
	li	$5,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	pred_motion
	.section	.rodata.str1.4
	.align	2
$LC21:
	.ascii	"invalid MV vlc\012\000"
	.text
	.align	2
	.ent	svq3_mc_dir
	.type	svq3_mc_dir, @function
svq3_mc_dir:
	.set	nomips16
	.frame	$sp,320,$31		# vars= 232, regs= 10/0, args= 40, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-320
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,316($sp)
	sw	$fp,312($sp)
	sw	$23,308($sp)
	sw	$22,304($sp)
	sw	$21,300($sp)
	sw	$20,296($sp)
	sw	$19,292($sp)
	sw	$18,288($sp)
	sw	$17,284($sp)
	sw	$16,280($sp)
	.cprestore	40
	andi	$3,$5,0x5
	li	$2,4			# 0x4
	move	$20,$4
	sw	$6,328($sp)
	beq	$3,$2,$L1473
	sw	$7,332($sp)

	andi	$3,$5,0x1
	li	$2,16			# 0x10
	sra	$2,$2,$3
$L1473:
	sw	$2,168($sp)
	lw	$2,332($sp)
	addiu	$4,$5,1
	sll	$7,$2,2
	sll	$3,$2,4
	li	$2,-1431699456			# 0xffffffffaaaa0000
	ori	$2,$2,0xaaab
	multu	$4,$2
	li	$2,16			# 0x10
	mfhi	$4
	addu	$3,$7,$3
	srl	$4,$4,1
	sra	$2,$2,$4
	sw	$2,164($sp)
	lw	$4,168($sp)
	lw	$2,332($sp)
	li	$8,2			# 0x2
	addu	$7,$7,$2
	sra	$2,$4,3
	subu	$8,$8,$2
	lw	$2,332($sp)
	lw	$9,164($sp)
	sll	$17,$2,5
	lw	$5,164($20)
	lw	$2,328($sp)
	lw	$6,168($20)
	subu	$5,$5,$4
	subu	$6,$6,$9
	xori	$4,$2,0x4
	lw	$2,332($sp)
	sll	$16,$6,3
	sll	$6,$6,1
	sll	$14,$2,3
	sll	$12,$2,7
	addiu	$13,$2,390
	subu	$16,$16,$6
	subu	$3,$0,$3
	lw	$6,168($sp)
	li	$2,-96			# 0xffffffffffffffa0
	movn	$2,$0,$4
	sll	$15,$5,3
	lw	$4,336($sp)
	addiu	$18,$20,2596
	sll	$5,$5,1
	addiu	$3,$3,1
	sw	$2,160($sp)
	addiu	$11,$8,1
	addiu	$9,$20,2660
	subu	$15,$15,$5
	sra	$6,$6,2
	addiu	$2,$20,9136
	sll	$3,$3,1
	move	$5,$18
	movn	$5,$9,$4
	sw	$2,140($sp)
	movz	$9,$18,$4
	sw	$6,200($sp)
	subu	$3,$0,$3
	lw	$6,332($sp)
	sll	$11,$11,4
	addu	$11,$9,$11
	subu	$10,$0,$7
	lw	$9,140($sp)
	sll	$8,$8,4
	addiu	$3,$3,12
	sll	$4,$6,1
	addu	$5,$5,$8
	addiu	$10,$10,1
	lw	$8,160($sp)
	sll	$3,$3,2
	li	$2,12288			# 0x3000
	sll	$2,$2,$4
	addu	$3,$9,$3
	addu	$12,$17,$12
	sll	$10,$10,3
	addu	$17,$14,$17
	addiu	$7,$7,1
	sll	$13,$13,2
	sw	$2,124($sp)
	sw	$11,260($sp)
	subu	$15,$15,$8
	subu	$16,$16,$8
	sw	$3,120($sp)
	addiu	$11,$17,-1
	addiu	$2,$17,-9
	addiu	$3,$20,240
	addiu	$4,$20,648
	subu	$10,$0,$10
	sll	$7,$7,3
	addu	$12,$20,$12
	addu	$13,$20,$13
	sw	$5,256($sp)
	sw	$11,136($sp)
	sw	$2,128($sp)
	sw	$3,100($sp)
	sw	$17,204($sp)
	sw	$15,156($sp)
	sw	$16,152($sp)
	sw	$10,132($sp)
	sw	$7,196($sp)
	sw	$12,252($sp)
	sw	$13,264($sp)
	sw	$4,64($sp)
	lw	$8,168($sp)
	lw	$9,164($sp)
	lw	$3,164($sp)
	lw	$4,200($sp)
	addiu	$5,$20,2904
	sw	$5,104($sp)
	addiu	$6,$20,2860
	sra	$8,$8,1
	sra	$9,$9,1
	addiu	$11,$17,9
	addiu	$2,$17,1
	sra	$3,$3,2
	sll	$4,$4,2
	addu	$5,$20,$17
	sw	$6,56($sp)
	sw	$8,112($sp)
	sw	$9,116($sp)
	sw	$11,192($sp)
	sw	$2,188($sp)
	sw	$3,184($sp)
	sw	$4,144($sp)
	sw	$0,180($sp)
	sw	$5,248($sp)
$L1346:
	lw	$5,180($sp)
	lw	$6,332($sp)
	sra	$2,$5,1
	andi	$2,$2,0x2
	andi	$3,$5,0x8
	addu	$3,$2,$3
	lw	$8,180($sp)
	lw	$9,104($sp)
	lw	$11,336($sp)
	lw	$2,56($sp)
	addiu	$4,$6,24
	addiu	$5,$6,46
	sll	$4,$4,2
	sll	$5,$5,2
	sra	$8,$8,2
	movz	$9,$2,$11
	sw	$3,72($sp)
	sw	$4,236($sp)
	sw	$5,240($sp)
	sw	$8,68($sp)
	sw	$0,176($sp)
	sw	$9,244($sp)
$L1461:
	lw	$7,6172($20)
	lw	$9,68($sp)
	sll	$3,$7,2
	lw	$8,9748($20)
	addu	$3,$9,$3
	mul	$5,$3,$8
	lw	$11,176($sp)
	lw	$6,6168($20)
	sra	$9,$11,2
	sll	$4,$6,2
	sra	$2,$11,1
	addu	$3,$5,$4
	andi	$2,$2,0x4
	andi	$5,$9,0x1
	sll	$6,$6,4
	lw	$8,72($sp)
	addu	$5,$5,$2
	addu	$3,$3,$9
	addu	$15,$11,$6
	lw	$9,328($sp)
	lw	$6,180($sp)
	sll	$7,$7,4
	addu	$5,$5,$8
	li	$2,4			# 0x4
	sw	$3,148($sp)
	addu	$14,$6,$7
	beq	$9,$2,$L1347
	sw	$5,172($sp)

	lui	$11,%hi(scan8)
	addiu	$11,$11,%lo(scan8)
	addu	$2,$5,$11
	lbu	$8,0($2)
	li	$3,65536			# 0x10000
	lw	$6,248($sp)
	addu	$9,$20,$3
	lw	$3,200($sp)
	addiu	$2,$8,-8
	lw	$4,136($sp)
	lw	$5,132($sp)
	addu	$10,$2,$3
	addu	$2,$6,$2
	addu	$3,$8,$4
	lb	$13,9456($2)
	addu	$4,$8,$5
	lw	$2,140($sp)
	lw	$7,-6276($9)
	sll	$4,$4,2
	addu	$5,$6,$8
	sll	$3,$3,2
	addu	$6,$6,$10
	addu	$12,$2,$4
	lb	$17,9455($5)
	addu	$11,$2,$3
	beq	$7,$0,$L1348
	lb	$4,9456($6)

	lw	$3,120($sp)
	sw	$0,0($3)
	lw	$6,-6272($9)
	lw	$9,1880($20)
	bne	$6,$0,$L1349
	lw	$18,104($9)

	lw	$5,6172($20)
	andi	$2,$5,0x1
	beq	$2,$0,$L1511
	li	$2,-2			# 0xfffffffffffffffe

	slt	$2,$8,20
	beq	$2,$0,$L1511
	li	$2,-2			# 0xfffffffffffffffe

	beq	$4,$2,$L1485
	addiu	$2,$5,-1

	lw	$19,152($20)
	mul	$3,$2,$19
	lw	$6,6168($20)
	addu	$2,$3,$6
	xori	$3,$8,0xf
	sltu	$3,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$2,$18,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	bne	$3,$0,$L1486
	sll	$2,$6,2

$L1352:
	lw	$6,204($sp)
$L1514:
	lw	$9,140($sp)
	addu	$2,$10,$6
	sll	$2,$2,2
	xori	$3,$4,0x1
	addu	$8,$9,$2
	sltu	$5,$3,1
$L1355:
	xori	$2,$17,0x1
	xori	$3,$13,0x1
	sltu	$3,$3,1
	sltu	$2,$2,1
	addu	$2,$2,$3
	addu	$5,$2,$5
	slt	$3,$5,2
	bne	$3,$0,$L1512
	li	$2,1			# 0x1

$L1497:
	lh	$7,0($11)
	lh	$5,0($12)
	slt	$2,$5,$7
	beq	$2,$0,$L1361
	lh	$6,0($8)

	slt	$2,$5,$6
	beq	$2,$0,$L1370
	slt	$2,$7,$6

	move	$5,$7
	movz	$5,$6,$2
$L1370:
	lh	$6,2($11)
	lh	$4,2($12)
	slt	$2,$4,$6
	beq	$2,$0,$L1371
	lh	$3,2($8)

$L1500:
	slt	$2,$4,$3
	beq	$2,$0,$L1364
	slt	$2,$6,$3

	move	$4,$6
	movz	$4,$3,$2
$L1364:
	sll	$2,$15,1
	sll	$3,$15,3
	subu	$3,$2,$3
	lw	$2,160($sp)
	addu	$12,$3,$2
	slt	$2,$5,$12
	bne	$2,$0,$L1513
	sll	$2,$14,1

	lw	$6,156($sp)
	addu	$3,$3,$6
	slt	$2,$3,$5
	move	$12,$3
	movz	$12,$5,$2
	sll	$2,$14,1
$L1513:
	sll	$3,$14,3
	lw	$8,160($sp)
	subu	$3,$2,$3
	addu	$11,$3,$8
	slt	$2,$4,$11
	bne	$2,$0,$L1374
	lw	$9,152($sp)

	addu	$3,$3,$9
	slt	$2,$3,$4
	move	$11,$3
	movz	$11,$4,$2
$L1374:
	lw	$3,328($sp)
	li	$2,4			# 0x4
	beq	$3,$2,$L1375
	move	$5,$0

	lw	$8,8456($20)
	lw	$13,8448($20)
	sra	$3,$8,3
	addu	$3,$13,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	lbu	$6,2($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$8,0x7
	sll	$7,$2,$3
	li	$10,-1434451968			# 0xffffffffaa800000
	and	$2,$7,$10
	beq	$2,$0,$L1376
	lw	$2,%got(ff_interleaved_golomb_vlc_len)($28)

	srl	$7,$7,24
	addu	$2,$2,$7
	lbu	$3,0($2)
	addu	$8,$8,$3
	sra	$2,$8,3
	addu	$2,$13,$2
	sw	$8,8456($20)
	lbu	$3,0($2)
	lbu	$6,3($2)
	lbu	$4,2($2)
	lbu	$5,1($2)
	sll	$3,$3,24
	sll	$4,$4,8
	or	$3,$3,$6
	or	$3,$3,$4
	sll	$5,$5,16
	lw	$2,%got(ff_interleaved_se_golomb_vlc_code)($28)
	or	$3,$3,$5
	andi	$4,$8,0x7
	addu	$2,$2,$7
	sll	$7,$3,$4
	lb	$9,0($2)
	and	$2,$7,$10
	beq	$2,$0,$L1487
	lw	$2,%got(ff_interleaved_golomb_vlc_len)($28)

$L1519:
	srl	$4,$7,24
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_interleaved_se_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lb	$7,0($2)
	sw	$3,8456($20)
$L1383:
	li	$2,-2147483648			# 0xffffffff80000000
	beq	$9,$2,$L1384
	lw	$4,328($sp)

	li	$2,3			# 0x3
	beq	$4,$2,$L1488
	li	$2,2			# 0x2

	beq	$4,$2,$L1489
	li	$2,-1431699456			# 0xffffffffaaaa0000

	ori	$2,$2,0xaaab
	addiu	$3,$12,24579
	multu	$3,$2
	addiu	$4,$11,24579
	mfhi	$3
	multu	$4,$2
	srl	$3,$3,2
	mfhi	$4
	addiu	$3,$3,-4096
	srl	$4,$4,2
	addiu	$4,$4,-4096
	addu	$16,$3,$7
	addu	$fp,$4,$9
	lw	$2,100($sp)
	lw	$3,332($sp)
	lw	$4,64($sp)
	addu	$18,$16,$15
	movn	$2,$4,$3
	sw	$2,48($sp)
	bltz	$18,$L1490
	addu	$17,$fp,$14

	lw	$8,164($20)
	lw	$9,168($sp)
	addiu	$2,$8,-1
	subu	$2,$2,$9
	slt	$2,$18,$2
	beq	$2,$0,$L1480
	nop

	bltz	$17,$L1480
	lw	$11,164($sp)

	lw	$7,168($20)
	addiu	$2,$7,-1
	subu	$2,$2,$11
	slt	$2,$17,$2
	beq	$2,$0,$L1440
	lw	$2,48($sp)

	lw	$6,176($20)
	mul	$4,$6,$17
	lw	$3,0($2)
	lw	$21,1464($20)
	addu	$2,$4,$18
	addu	$5,$3,$2
	move	$19,$6
	move	$22,$0
$L1442:
	mul	$2,$14,$19
	lw	$3,256($sp)
	addu	$4,$2,$15
	lw	$25,0($3)
	lw	$7,164($sp)
	sw	$14,268($sp)
	sw	$15,272($sp)
	jalr	$25
	addu	$4,$21,$4

	lw	$2,56($20)
	lw	$28,40($sp)
	andi	$2,$2,0x2000
	lw	$14,268($sp)
	bne	$2,$0,$L1447
	lw	$15,272($sp)

	lw	$4,112($sp)
	lw	$5,116($sp)
	slt	$2,$18,$15
	slt	$3,$17,$14
	addu	$2,$2,$18
	addu	$3,$3,$17
	sra	$15,$15,1
	sra	$14,$14,1
	addiu	$4,$4,1
	addiu	$5,$5,1
	sra	$23,$2,1
	sra	$21,$3,1
	sw	$15,88($sp)
	sw	$14,84($sp)
	move	$18,$0
	sw	$4,228($sp)
	sw	$5,232($sp)
$L1452:
	lw	$6,48($sp)
	lw	$17,180($20)
	addu	$2,$6,$18
	lw	$4,4($2)
	mul	$2,$21,$17
	addu	$3,$2,$23
	addu	$2,$20,$18
	addu	$5,$4,$3
	bne	$22,$0,$L1448
	lw	$19,1468($2)

	move	$6,$17
$L1449:
	lw	$2,88($sp)
	lw	$3,260($sp)
	mtlo	$2
	lw	$2,84($sp)
	lw	$25,0($3)
	madd	$2,$17
	lw	$7,116($sp)
	mflo	$4
	addiu	$18,$18,4
	jalr	$25
	addu	$4,$19,$4

	li	$4,8			# 0x8
	bne	$18,$4,$L1452
	lw	$28,40($sp)

$L1447:
	sll	$4,$16,3
	sll	$5,$fp,3
	sll	$2,$16,1
	sll	$3,$fp,1
	subu	$4,$4,$2
	subu	$3,$5,$3
$L1410:
	lw	$5,164($sp)
	sll	$2,$3,16
	andi	$3,$4,0xffff
	li	$4,8			# 0x8
	beq	$5,$4,$L1491
	addu	$7,$2,$3

	lw	$3,168($sp)
$L1516:
	li	$2,8			# 0x8
	beq	$3,$2,$L1492
	nop

$L1454:
	lw	$11,168($sp)
	li	$2,4			# 0x4
	beq	$11,$2,$L1457
	nop

$L1456:
	lw	$3,164($sp)
$L1517:
	li	$2,4			# 0x4
	beq	$3,$2,$L1457
	nop

$L1435:
	lw	$9,264($sp)
	lw	$11,148($sp)
	lw	$2,0($9)
	sll	$3,$11,2
	addu	$8,$2,$3
	lw	$6,9748($20)
	lw	$3,144($sp)
	li	$2,4			# 0x4
	beq	$3,$2,$L1493
	sll	$5,$6,2

$L1458:
	lw	$9,144($sp)
	li	$2,8			# 0x8
	beq	$9,$2,$L1494
	lw	$3,144($sp)

	li	$2,16			# 0x10
	beq	$3,$2,$L1495
	addiu	$4,$5,4

$L1459:
	lw	$11,176($sp)
	lw	$2,168($sp)
	addu	$11,$11,$2
	slt	$2,$11,16
	bne	$2,$0,$L1461
	sw	$11,176($sp)

	lw	$3,180($sp)
	lw	$4,164($sp)
	addu	$3,$3,$4
	slt	$2,$3,16
	bne	$2,$0,$L1346
	sw	$3,180($sp)

	b	$L1389
	move	$2,$0

$L1375:
	move	$7,$0
$L1412:
	li	$4,-1431699456			# 0xffffffffaaaa0000
	ori	$4,$4,0xaaab
	addiu	$3,$11,12289
	multu	$3,$4
	addiu	$2,$12,12289
	mfhi	$3
	multu	$2,$4
	srl	$3,$3,1
	mfhi	$2
	addiu	$3,$3,-4096
	srl	$2,$2,1
	addiu	$2,$2,-4096
	addu	$22,$2,$5
	addu	$21,$3,$7
	lw	$6,64($sp)
	lw	$8,332($sp)
	lw	$9,100($sp)
	sra	$3,$22,1
	andi	$2,$21,0x1
	movz	$6,$9,$8
	sll	$2,$2,1
	addu	$16,$3,$15
	andi	$4,$22,0x1
	sra	$3,$21,1
	sw	$6,52($sp)
	addu	$19,$2,$4
	bltz	$16,$L1496
	addu	$18,$3,$14

	lw	$8,164($20)
	lw	$3,168($sp)
	addiu	$2,$8,-1
	subu	$2,$2,$3
	slt	$2,$16,$2
	beq	$2,$0,$L1479
	nop

	bltz	$18,$L1479
	lw	$4,164($sp)

	lw	$7,168($20)
	addiu	$2,$7,-1
	subu	$2,$2,$4
	slt	$2,$18,$2
	beq	$2,$0,$L1421
	lw	$5,52($sp)

	lw	$6,176($20)
	mul	$4,$6,$18
	lw	$3,0($5)
	addu	$2,$4,$16
	lw	$23,1464($20)
	addu	$5,$3,$2
	move	$17,$6
	move	$fp,$0
$L1423:
	mul	$2,$14,$17
	lw	$3,256($sp)
	sll	$19,$19,2
	addu	$4,$2,$15
	addu	$2,$3,$19
	lw	$25,0($2)
	lw	$7,164($sp)
	sw	$14,268($sp)
	sw	$15,272($sp)
	jalr	$25
	addu	$4,$23,$4

	lw	$2,56($20)
	lw	$28,40($sp)
	andi	$2,$2,0x2000
	lw	$14,268($sp)
	bne	$2,$0,$L1429
	lw	$15,272($sp)

	lw	$4,260($sp)
	lw	$5,112($sp)
	lw	$6,116($sp)
	slt	$2,$16,$15
	slt	$3,$18,$14
	addu	$3,$3,$18
	addu	$2,$2,$16
	sra	$15,$15,1
	sra	$14,$14,1
	addu	$19,$4,$19
	addiu	$5,$5,1
	addiu	$6,$6,1
	sra	$16,$2,1
	sra	$23,$3,1
	sw	$15,96($sp)
	sw	$14,92($sp)
	sw	$19,216($sp)
	move	$18,$0
	sw	$5,208($sp)
	sw	$6,212($sp)
$L1434:
	lw	$8,52($sp)
	lw	$17,180($20)
	addu	$2,$8,$18
	lw	$4,4($2)
	mul	$2,$23,$17
	addu	$3,$2,$16
	addu	$2,$20,$18
	addu	$5,$4,$3
	bne	$fp,$0,$L1430
	lw	$19,1468($2)

	move	$6,$17
$L1431:
	lw	$2,96($sp)
	lw	$3,216($sp)
	mtlo	$2
	lw	$2,92($sp)
	lw	$25,0($3)
	madd	$2,$17
	lw	$7,116($sp)
	mflo	$4
	addiu	$18,$18,4
	jalr	$25
	addu	$4,$19,$4

	li	$4,8			# 0x8
	bne	$18,$4,$L1434
	lw	$28,40($sp)

$L1429:
	sll	$2,$22,1
	sll	$3,$21,1
	lw	$6,328($sp)
	addu	$7,$2,$22
	addu	$5,$3,$21
	li	$2,4			# 0x4
	move	$4,$7
	bne	$6,$2,$L1410
	move	$3,$5

	lw	$9,264($sp)
	sll	$2,$5,16
	andi	$3,$7,0xffff
	lw	$11,148($sp)
	addu	$7,$3,$2
	lw	$2,0($9)
	sll	$3,$11,2
	addu	$8,$2,$3
	lw	$6,9748($20)
	lw	$3,144($sp)
	li	$2,4			# 0x4
	bne	$3,$2,$L1458
	sll	$5,$6,2

$L1493:
	lw	$4,184($sp)
	li	$2,1			# 0x1
	beq	$4,$2,$L1459
	sw	$7,0($8)

	addu	$2,$8,$5
	li	$3,2			# 0x2
	beq	$4,$3,$L1459
	sw	$7,0($2)

	sll	$2,$6,3
	addu	$3,$2,$5
	addu	$3,$8,$3
	addu	$2,$8,$2
	sw	$7,0($2)
	b	$L1459
	sw	$7,0($3)

$L1347:
	lw	$8,148($sp)
	lw	$2,744($20)
	sll	$3,$8,2
	addu	$2,$2,$3
	lh	$4,2($2)
	lh	$3,0($2)
	lw	$9,332($sp)
	sll	$6,$4,1
	bne	$9,$0,$L1372
	sll	$7,$3,1

	li	$2,65536			# 0x10000
	addu	$2,$20,$2
	lw	$3,-6216($2)
	lw	$5,-6212($2)
	mul	$4,$6,$3
	mul	$3,$7,$3
	div	$0,$4,$5
	teq	$5,$0,7
	mflo	$4
	div	$0,$3,$5
	teq	$5,$0,7
	addiu	$4,$4,1
	sra	$4,$4,1
	mflo	$3
	addiu	$3,$3,1
	b	$L1364
	sra	$5,$3,1

$L1457:
	lw	$4,172($sp)
	lui	$5,%hi(scan8)
	addiu	$5,$5,%lo(scan8)
	addu	$3,$4,$5
	lbu	$2,0($3)
	lw	$6,204($sp)
	lw	$8,140($sp)
	addu	$2,$2,$6
	sll	$2,$2,2
	addu	$2,$8,$2
	b	$L1435
	sw	$7,0($2)

$L1479:
	lw	$7,168($20)
$L1421:
	lw	$2,56($20)
	srl	$2,$2,14
	andi	$fp,$2,0x1
$L1418:
	lw	$5,168($sp)
	subu	$2,$8,$5
	addiu	$2,$2,15
	slt	$3,$2,$16
	movn	$16,$2,$3
	mtlo	$16
$L1419:
	slt	$2,$18,-16
	beq	$2,$0,$L1424
	lw	$6,164($sp)

	lw	$17,176($20)
	li	$18,-16			# 0xfffffffffffffff0
	lw	$9,52($sp)
	madd	$18,$17
	lw	$3,0($9)
	mflo	$2
	lw	$23,1464($20)
	bne	$fp,$0,$L1521
	addu	$5,$3,$2

$L1502:
	b	$L1423
	move	$6,$17

$L1372:
	li	$3,65536			# 0x10000
	addu	$3,$20,$3
	lw	$4,-6212($3)
	lw	$2,-6216($3)
	subu	$2,$2,$4
	mul	$3,$6,$2
	mul	$2,$7,$2
	div	$0,$3,$4
	teq	$4,$0,7
	mflo	$3
	div	$0,$2,$4
	teq	$4,$0,7
	addiu	$3,$3,1
	sra	$4,$3,1
	mflo	$2
	addiu	$2,$2,1
	b	$L1364
	sra	$5,$2,1

$L1348:
	li	$2,-2			# 0xfffffffffffffffe
	bne	$4,$2,$L1514
	lw	$6,204($sp)

	lw	$3,248($sp)
$L1515:
	lw	$5,128($sp)
	addu	$2,$3,$8
	lb	$4,9447($2)
	addu	$3,$8,$5
	lw	$6,140($sp)
	sll	$3,$3,2
	xori	$2,$4,0x1
	sltu	$5,$2,1
	addu	$8,$6,$3
	xori	$2,$17,0x1
	xori	$3,$13,0x1
	sltu	$3,$3,1
	sltu	$2,$2,1
	addu	$2,$2,$3
	addu	$5,$2,$5
	slt	$3,$5,2
	beq	$3,$0,$L1497
	li	$2,1			# 0x1

$L1512:
	beq	$5,$2,$L1498
	li	$2,-2			# 0xfffffffffffffffe

	beq	$13,$2,$L1499
	nop

$L1368:
	lh	$6,0($11)
	lh	$5,0($12)
	slt	$2,$5,$6
	beq	$2,$0,$L1369
	lh	$4,0($8)

	slt	$2,$5,$4
	beq	$2,$0,$L1370
	slt	$2,$6,$4

	move	$5,$6
	movz	$5,$4,$2
	lh	$6,2($11)
	lh	$4,2($12)
	slt	$2,$4,$6
	bne	$2,$0,$L1500
	lh	$3,2($8)

$L1371:
	slt	$2,$3,$4
	beq	$2,$0,$L1364
	slt	$2,$3,$6

	move	$4,$6
	b	$L1364
	movz	$4,$3,$2

$L1349:
	li	$2,-2			# 0xfffffffffffffffe
$L1511:
	bne	$4,$2,$L1352
	nop

	lw	$5,6172($20)
	andi	$7,$5,0x1
	bne	$7,$0,$L1351
	slt	$2,$8,20

	bne	$2,$0,$L1515
	lw	$3,248($sp)

$L1351:
	andi	$3,$8,0x7
	li	$2,4			# 0x4
	bne	$3,$2,$L1515
	lw	$3,248($sp)

	li	$4,-2			# 0xfffffffffffffffe
	lb	$2,9467($3)
	beq	$2,$4,$L1515
	nop

	bne	$6,$0,$L1357
	nop

	lw	$2,8768($20)
	sll	$2,$2,2
	addu	$2,$18,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L1515
	lw	$3,248($sp)

	ori	$2,$5,0x1
	sll	$2,$2,1
	addu	$2,$2,$7
	sra	$3,$8,4
	addiu	$3,$3,-1
	sll	$2,$2,1
	lw	$4,6168($20)
	addu	$7,$3,$2
	lw	$5,152($20)
	sll	$4,$4,2
	sra	$2,$7,2
	addiu	$8,$4,-1
	mul	$4,$2,$5
	sra	$3,$8,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$18,$2
	lw	$2,0($2)
	lw	$5,124($sp)
	and	$3,$5,$2
	beq	$3,$0,$L1501
	nop

	lw	$2,9748($20)
$L1509:
	lw	$6,236($sp)
	mul	$4,$7,$2
	addu	$3,$9,$6
	addu	$2,$4,$8
	lw	$4,0($3)
	sll	$2,$2,2
	addu	$4,$4,$2
	lw	$5,240($sp)
	lhu	$3,0($4)
	lw	$6,252($sp)
	addu	$2,$9,$5
	lw	$5,9752($20)
	sh	$3,9176($6)
	lw	$6,4($2)
	sra	$2,$7,1
	lh	$3,2($4)
	mul	$4,$2,$5
	lw	$5,252($sp)
	addu	$2,$4,$6
	sll	$3,$3,1
	sra	$4,$8,1
	sh	$3,9178($5)
	b	$L1474
	addu	$2,$2,$4

$L1491:
	lw	$6,180($sp)
	slt	$2,$6,8
	beq	$2,$0,$L1516
	lw	$3,168($sp)

	lw	$8,172($sp)
	lui	$9,%hi(scan8)
	addiu	$9,$9,%lo(scan8)
	addu	$3,$8,$9
	lbu	$4,0($3)
	lw	$11,196($sp)
	lw	$3,140($sp)
	addu	$2,$4,$11
	sll	$2,$2,2
	lw	$6,168($sp)
	addu	$2,$3,$2
	bne	$6,$5,$L1454
	sw	$7,0($2)

	lw	$8,176($sp)
	slt	$3,$8,8
	beq	$3,$0,$L1455
	lw	$9,192($sp)

	lw	$11,140($sp)
	addu	$2,$4,$9
	sll	$2,$2,2
	addu	$2,$11,$2
	sw	$7,0($2)
$L1455:
	beq	$3,$0,$L1517
	lw	$3,164($sp)

	lw	$5,172($sp)
	lui	$6,%hi(scan8)
	addiu	$6,$6,%lo(scan8)
	addu	$3,$5,$6
	lbu	$2,0($3)
	lw	$8,188($sp)
	lw	$9,140($sp)
	addu	$2,$2,$8
	sll	$2,$2,2
	addu	$2,$9,$2
	b	$L1456
	sw	$7,0($2)

$L1424:
	lw	$17,176($20)
	subu	$2,$7,$6
	addiu	$2,$2,15
	slt	$3,$2,$18
	movn	$18,$2,$3
	lw	$9,52($sp)
	madd	$18,$17
	lw	$3,0($9)
	mflo	$2
	lw	$23,1464($20)
	beq	$fp,$0,$L1502
	addu	$5,$3,$2

	lw	$6,164($sp)
$L1521:
	lw	$4,2040($20)
	sw	$8,28($sp)
	lw	$8,168($sp)
	addiu	$2,$6,1
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sw	$7,32($sp)
	move	$6,$17
	sw	$14,268($sp)
	sw	$15,272($sp)
	sw	$2,16($sp)
	sw	$16,20($sp)
	sw	$18,24($sp)
	jalr	$25
	addiu	$7,$8,1

	lw	$5,2040($20)
	lw	$6,176($20)
	lw	$15,272($sp)
	b	$L1423
	lw	$14,268($sp)

$L1480:
	lw	$7,168($20)
$L1440:
	lw	$2,56($20)
	srl	$2,$2,14
	andi	$22,$2,0x1
$L1437:
	lw	$5,168($sp)
	subu	$2,$8,$5
	addiu	$2,$2,15
	slt	$3,$2,$18
	movn	$18,$2,$3
	mtlo	$18
$L1438:
	slt	$2,$17,-16
	beq	$2,$0,$L1443
	lw	$6,164($sp)

	li	$17,-16			# 0xfffffffffffffff0
$L1444:
	lw	$6,176($20)
	lw	$9,48($sp)
	madd	$17,$6
	lw	$3,0($9)
	mflo	$2
	lw	$21,1464($20)
	addu	$5,$3,$2
	beq	$22,$0,$L1442
	move	$19,$6

	lw	$9,164($sp)
	lw	$11,168($sp)
	lw	$4,2040($20)
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	addiu	$2,$9,1
	sw	$7,32($sp)
	sw	$14,268($sp)
	sw	$15,272($sp)
	sw	$2,16($sp)
	sw	$8,28($sp)
	sw	$18,20($sp)
	sw	$17,24($sp)
	jalr	$25
	addiu	$7,$11,1

	lw	$5,2040($20)
	lw	$6,176($20)
	lw	$15,272($sp)
	b	$L1442
	lw	$14,268($sp)

$L1492:
	lw	$4,176($sp)
	b	$L1455
	slt	$3,$4,8

$L1361:
	slt	$2,$6,$5
	beq	$2,$0,$L1370
	slt	$2,$6,$7

	move	$5,$7
	b	$L1370
	movz	$5,$6,$2

$L1488:
	addiu	$2,$12,1
	sra	$2,$2,1
	addiu	$3,$11,1
	addu	$16,$7,$2
	li	$4,-1431699456			# 0xffffffffaaaa0000
	ori	$4,$4,0xaaab
	sra	$3,$3,1
	addiu	$2,$16,12288
	multu	$2,$4
	addu	$fp,$9,$3
	addiu	$3,$fp,12288
	mfhi	$2
	multu	$3,$4
	srl	$2,$2,1
	mfhi	$3
	addiu	$21,$2,-4096
	srl	$3,$3,1
	addiu	$19,$3,-4096
	lw	$2,100($sp)
	lw	$3,332($sp)
	lw	$4,64($sp)
	addu	$18,$21,$15
	movn	$2,$4,$3
	sw	$2,60($sp)
	bltz	$18,$L1503
	addu	$17,$19,$14

	lw	$8,164($20)
	lw	$5,168($sp)
	addiu	$2,$8,-1
	subu	$2,$2,$5
	slt	$2,$18,$2
	beq	$2,$0,$L1478
	nop

	bltz	$17,$L1478
	lw	$6,164($sp)

	lw	$7,168($20)
	addiu	$2,$7,-1
	subu	$2,$2,$6
	slt	$2,$17,$2
	beq	$2,$0,$L1397
	nop

	lw	$6,176($20)
	lw	$8,60($sp)
	mul	$4,$6,$17
	lw	$3,0($8)
	addu	$2,$4,$18
	lw	$23,1464($20)
	addu	$5,$3,$2
	move	$22,$6
	sw	$0,108($sp)
$L1399:
	sll	$2,$19,1
	addu	$2,$2,$19
	subu	$2,$fp,$2
	sll	$2,$2,2
	sll	$3,$21,1
	addu	$3,$3,$21
	addu	$2,$16,$2
	subu	$2,$2,$3
	lw	$4,336($sp)
	sll	$19,$2,2
	lw	$3,56($sp)
	mul	$2,$14,$22
	lw	$8,104($sp)
	lw	$9,164($sp)
	movn	$3,$8,$4
	addu	$3,$3,$19
	sw	$9,16($sp)
	addu	$4,$2,$15
	lw	$25,0($3)
	lw	$7,168($sp)
	sw	$14,268($sp)
	sw	$15,272($sp)
	jalr	$25
	addu	$4,$23,$4

	lw	$2,56($20)
	lw	$28,40($sp)
	andi	$2,$2,0x2000
	lw	$14,268($sp)
	bne	$2,$0,$L1404
	lw	$15,272($sp)

	slt	$3,$17,$14
	addu	$3,$3,$17
	lw	$4,112($sp)
	lw	$5,116($sp)
	slt	$2,$18,$15
	sra	$21,$3,1
	lw	$3,244($sp)
	addu	$2,$2,$18
	sra	$15,$15,1
	sra	$14,$14,1
	addiu	$4,$4,1
	addiu	$5,$5,1
	sra	$22,$2,1
	sw	$15,80($sp)
	sw	$14,76($sp)
	addu	$23,$3,$19
	move	$18,$0
	sw	$4,220($sp)
	sw	$5,224($sp)
$L1409:
	lw	$6,60($sp)
	lw	$17,180($20)
	addu	$2,$6,$18
	lw	$4,4($2)
	mul	$2,$21,$17
	addu	$3,$2,$22
	addu	$5,$4,$3
	lw	$3,108($sp)
	addu	$2,$20,$18
	bne	$3,$0,$L1405
	lw	$19,1468($2)

	move	$6,$17
$L1406:
	lw	$2,80($sp)
	lw	$8,116($sp)
	mtlo	$2
	lw	$2,76($sp)
	sw	$8,16($sp)
	madd	$2,$17
	lw	$25,0($23)
	mflo	$4
	lw	$7,112($sp)
	jalr	$25
	addu	$4,$19,$4

	addiu	$18,$18,4
	li	$3,8			# 0x8
	bne	$18,$3,$L1409
	lw	$28,40($sp)

$L1404:
	sll	$4,$16,1
	b	$L1410
	sll	$3,$fp,1

$L1430:
	lw	$3,168($20)
	lw	$2,164($20)
	sra	$3,$3,1
	lw	$4,2040($20)
	sw	$3,32($sp)
	lw	$3,212($sp)
	sra	$2,$2,1
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	lw	$7,208($sp)
	move	$6,$17
	sw	$2,28($sp)
	sw	$3,16($sp)
	sw	$16,20($sp)
	jalr	$25
	sw	$23,24($sp)

	lw	$5,2040($20)
	b	$L1431
	lw	$6,180($20)

$L1443:
	subu	$2,$7,$6
	addiu	$2,$2,15
	slt	$3,$2,$17
	b	$L1444
	movn	$17,$2,$3

$L1494:
	lw	$11,184($sp)
	li	$2,1			# 0x1
	sw	$7,0($8)
	beq	$11,$2,$L1459
	sw	$7,4($8)

	addu	$3,$8,$5
	li	$2,2			# 0x2
	sw	$7,4($3)
	beq	$11,$2,$L1459
	sw	$7,0($3)

	sll	$2,$6,3
	addiu	$3,$5,2
	addu	$4,$2,$5
	sll	$3,$3,1
	addu	$4,$8,$4
	addu	$3,$8,$3
	addu	$2,$8,$2
	sw	$7,0($2)
	sw	$7,0($3)
	sw	$7,4($4)
	b	$L1459
	sw	$7,0($4)

$L1496:
	lw	$2,56($20)
	slt	$3,$16,-16
	srl	$2,$2,14
	andi	$fp,$2,0x1
	lw	$8,164($20)
	beq	$3,$0,$L1418
	lw	$7,168($20)

	li	$16,-16			# 0xfffffffffffffff0
	b	$L1419
	mtlo	$16

$L1489:
	move	$5,$7
	b	$L1412
	move	$7,$9

$L1448:
	lw	$3,168($20)
	lw	$2,164($20)
	sra	$3,$3,1
	lw	$4,2040($20)
	sw	$3,32($sp)
	lw	$3,232($sp)
	sra	$2,$2,1
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	lw	$7,228($sp)
	move	$6,$17
	sw	$2,28($sp)
	sw	$3,16($sp)
	sw	$23,20($sp)
	jalr	$25
	sw	$21,24($sp)

	lw	$5,2040($20)
	b	$L1449
	lw	$6,180($20)

$L1490:
	lw	$2,56($20)
	slt	$3,$18,-16
	srl	$2,$2,14
	andi	$22,$2,0x1
	lw	$8,164($20)
	beq	$3,$0,$L1437
	lw	$7,168($20)

	li	$18,-16			# 0xfffffffffffffff0
	b	$L1438
	mtlo	$18

$L1495:
	addu	$2,$8,$5
	addu	$3,$8,$4
	lw	$9,184($sp)
	sw	$7,0($8)
	sw	$7,4($8)
	sw	$7,8($8)
	sw	$7,12($8)
	sw	$7,0($2)
	sw	$7,0($3)
	li	$3,2			# 0x2
	sw	$7,12($2)
	beq	$9,$3,$L1459
	sw	$7,8($2)

	sll	$6,$6,3
	addiu	$2,$5,2
	addiu	$3,$5,6
	sll	$2,$2,1
	addu	$5,$6,$5
	sll	$4,$4,1
	sll	$3,$3,1
	addu	$5,$8,$5
	addu	$2,$8,$2
	addu	$4,$8,$4
	addu	$3,$8,$3
	addu	$6,$8,$6
	sw	$7,0($6)
	sw	$7,0($2)
	sw	$7,0($4)
	sw	$7,0($3)
	sw	$7,12($5)
	sw	$7,0($5)
	sw	$7,4($5)
	b	$L1459
	sw	$7,8($5)

$L1478:
	lw	$7,168($20)
$L1397:
	lw	$2,56($20)
	srl	$2,$2,14
	andi	$2,$2,0x1
	sw	$2,108($sp)
$L1394:
	lw	$5,168($sp)
	subu	$2,$8,$5
	addiu	$2,$2,15
	slt	$3,$2,$18
	movn	$18,$2,$3
	mtlo	$18
$L1395:
	slt	$2,$17,-16
	beq	$2,$0,$L1400
	lw	$6,164($sp)

	li	$17,-16			# 0xfffffffffffffff0
$L1401:
	lw	$6,176($20)
	lw	$9,60($sp)
	madd	$17,$6
	lw	$3,0($9)
	mflo	$2
	lw	$9,108($sp)
	lw	$23,1464($20)
	addu	$5,$3,$2
	beq	$9,$0,$L1399
	move	$22,$6

	lw	$11,164($sp)
	lw	$4,2040($20)
	addiu	$2,$11,1
	sw	$2,16($sp)
	lw	$2,168($sp)
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sw	$7,32($sp)
	sw	$14,268($sp)
	sw	$15,272($sp)
	sw	$8,28($sp)
	sw	$18,20($sp)
	sw	$17,24($sp)
	jalr	$25
	addiu	$7,$2,1

	lw	$5,2040($20)
	lw	$6,176($20)
	lw	$15,272($sp)
	b	$L1399
	lw	$14,268($sp)

$L1400:
	subu	$2,$7,$6
	addiu	$2,$2,15
	slt	$3,$2,$17
	b	$L1401
	movn	$17,$2,$3

$L1405:
	lw	$2,164($20)
	lw	$3,168($20)
	lw	$6,224($sp)
	lw	$4,2040($20)
	sra	$2,$2,1
	sra	$3,$3,1
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	lw	$7,220($sp)
	sw	$6,16($sp)
	sw	$2,28($sp)
	move	$6,$17
	sw	$3,32($sp)
	sw	$22,20($sp)
	jalr	$25
	sw	$21,24($sp)

	lw	$5,2040($20)
	b	$L1406
	lw	$6,180($20)

$L1503:
	lw	$2,56($20)
	slt	$3,$18,-16
	srl	$2,$2,14
	andi	$2,$2,0x1
	sw	$2,108($sp)
	lw	$8,164($20)
	beq	$3,$0,$L1394
	lw	$7,168($20)

	li	$18,-16			# 0xfffffffffffffff0
	b	$L1395
	mtlo	$18

$L1369:
	slt	$2,$4,$5
	beq	$2,$0,$L1370
	slt	$2,$4,$6

	move	$5,$6
	b	$L1370
	movz	$5,$4,$2

$L1498:
	beq	$17,$5,$L1477
	nop

	beq	$13,$5,$L1504
	nop

	lh	$4,2($8)
	b	$L1364
	lh	$5,0($8)

$L1499:
	bne	$4,$13,$L1368
	nop

	beq	$17,$4,$L1368
	nop

$L1477:
	lh	$4,2($11)
	b	$L1364
	lh	$5,0($11)

$L1384:
	lw	$25,%call16(av_log)($28)
$L1520:
	lw	$4,0($20)
	lui	$6,%hi($LC21)
	addiu	$6,$6,%lo($LC21)
	jalr	$25
	move	$5,$0

	lw	$28,40($sp)
	li	$2,-1			# 0xffffffffffffffff
$L1389:
	lw	$31,316($sp)
	lw	$fp,312($sp)
	lw	$23,308($sp)
	lw	$22,304($sp)
	lw	$21,300($sp)
	lw	$20,296($sp)
	lw	$19,292($sp)
	lw	$18,288($sp)
	lw	$17,284($sp)
	lw	$16,280($sp)
	j	$31
	addiu	$sp,$sp,320

$L1376:
	addiu	$8,$8,8
	sra	$2,$8,3
	addu	$2,$13,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	andi	$2,$8,0x7
	or	$3,$3,$6
	sll	$3,$3,$2
	ori	$7,$7,0x1
	srl	$3,$3,8
	li	$2,-1431699456			# 0xffffffffaaaa0000
	or	$9,$7,$3
	ori	$2,$2,0xaaaa
	and	$2,$9,$2
	beq	$2,$0,$L1378
	nop

	bltz	$9,$L1505
	li	$10,31			# 0x1f

	sll	$3,$9,$10
$L1518:
	sll	$4,$9,2
	srl	$2,$9,30
	addiu	$10,$10,-1
	addu	$2,$2,$4
	srl	$3,$3,$10
	subu	$9,$2,$3
	bgez	$9,$L1518
	sll	$3,$9,$10

	sll	$2,$10,1
	subu	$3,$0,$2
$L1380:
	addiu	$2,$8,55
	addu	$8,$2,$3
	sra	$3,$8,3
	addu	$3,$13,$3
	sw	$8,8456($20)
	lbu	$5,0($3)
	lbu	$4,3($3)
	lbu	$6,2($3)
	sll	$2,$9,$10
	lbu	$7,1($3)
	sll	$5,$5,24
	andi	$3,$9,0x1
	srl	$2,$2,$10
	or	$4,$4,$5
	sll	$6,$6,8
	subu	$3,$0,$3
	sll	$7,$7,16
	or	$4,$4,$6
	addiu	$2,$2,-1
	xor	$2,$2,$3
	or	$4,$4,$7
	andi	$3,$8,0x7
	sll	$7,$4,$3
	addiu	$2,$2,1
	li	$3,-1434451968			# 0xffffffffaa800000
	sra	$9,$2,1
	and	$2,$7,$3
	bne	$2,$0,$L1519
	lw	$2,%got(ff_interleaved_golomb_vlc_len)($28)

$L1487:
	addiu	$8,$8,8
	b	$L1382
	ori	$7,$7,0x1

$L1486:
	lw	$4,200($sp)
	addiu	$2,$2,-4
	addu	$2,$2,$4
	sll	$4,$5,2
	andi	$3,$8,0x7
	addiu	$7,$4,-1
	addu	$6,$2,$3
	sra	$2,$7,2
	mul	$4,$2,$19
	sra	$3,$6,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$18,$2
	lw	$2,0($2)
	lw	$5,124($sp)
	and	$3,$2,$5
	beq	$3,$0,$L1506
	andi	$2,$2,0x40

$L1353:
	lw	$2,9748($20)
	lw	$8,236($sp)
	mul	$3,$7,$2
	addu	$4,$9,$8
	addu	$2,$3,$6
	lw	$3,0($4)
	sll	$2,$2,2
	addu	$3,$3,$2
	lhu	$5,0($3)
	lw	$4,240($sp)
	lw	$8,252($sp)
	addu	$2,$9,$4
	sh	$5,9176($8)
	lh	$5,2($3)
	lw	$4,4($2)
	lw	$3,9752($20)
	sra	$6,$6,1
	sra	$2,$7,1
	addu	$4,$4,$6
	mul	$6,$2,$3
	sll	$5,$5,1
	addu	$2,$6,$4
	sh	$5,9178($8)
$L1474:
	lb	$3,0($2)
	lw	$8,120($sp)
	sra	$4,$3,1
	xori	$2,$4,0x1
	b	$L1355
	sltu	$5,$2,1

$L1378:
	li	$9,-2147483648			# 0xffffffff80000000
$L1382:
	sra	$2,$8,3
	addu	$2,$13,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	andi	$2,$8,0x7
	or	$3,$3,$6
	sll	$3,$3,$2
	srl	$3,$3,8
	li	$2,-1431699456			# 0xffffffffaaaa0000
	or	$7,$7,$3
	ori	$2,$2,0xaaaa
	and	$2,$7,$2
	beq	$2,$0,$L1520
	lw	$25,%call16(av_log)($28)

	bltz	$7,$L1507
	li	$5,31			# 0x1f

$L1387:
	sll	$3,$7,$5
	sll	$4,$7,2
	srl	$2,$7,30
	addiu	$5,$5,-1
	addu	$2,$2,$4
	srl	$3,$3,$5
	subu	$7,$2,$3
	bgez	$7,$L1387
	sll	$2,$5,1

	subu	$6,$0,$2
$L1386:
	sll	$2,$7,$5
	andi	$3,$7,0x1
	srl	$2,$2,$5
	addiu	$2,$2,-1
	subu	$3,$0,$3
	xor	$2,$2,$3
	addiu	$4,$8,55
	addu	$4,$4,$6
	addiu	$2,$2,1
	sw	$4,8456($20)
	b	$L1383
	sra	$7,$2,1

$L1504:
	lh	$4,2($12)
	b	$L1364
	lh	$5,0($12)

$L1485:
	b	$L1351
	li	$7,1			# 0x1

$L1357:
	lw	$2,8768($20)
	sll	$2,$2,2
	addu	$2,$18,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	bne	$3,$0,$L1515
	lw	$3,248($sp)

	slt	$2,$8,20
	bne	$2,$0,$L1515
	and	$2,$5,$4

	addiu	$3,$8,-12
	sra	$3,$3,3
	sll	$2,$2,1
	lw	$4,6168($20)
	addu	$2,$2,$3
	sll	$4,$4,2
	sll	$2,$2,1
	addiu	$8,$4,-1
	addiu	$7,$2,-1
	lw	$4,152($20)
	sra	$2,$7,2
	mul	$5,$2,$4
	sra	$3,$8,2
	addu	$2,$5,$3
	sll	$2,$2,2
	addu	$2,$18,$2
	lw	$2,0($2)
	lw	$6,124($sp)
	and	$3,$6,$2
	beq	$3,$0,$L1508
	andi	$2,$2,0x40

	lw	$2,9748($20)
$L1510:
	lw	$4,236($sp)
	lw	$5,240($sp)
	addu	$3,$9,$4
	mul	$4,$7,$2
	lw	$6,252($sp)
	addu	$2,$4,$8
	lw	$4,0($3)
	sll	$2,$2,2
	addu	$4,$4,$2
	lhu	$3,0($4)
	addu	$2,$9,$5
	lw	$5,9752($20)
	sh	$3,9176($6)
	lw	$6,4($2)
	sra	$2,$7,1
	lh	$3,2($4)
	mul	$4,$2,$5
	lw	$5,252($sp)
	addu	$2,$4,$6
	sra	$3,$3,1
	sra	$4,$8,1
	sh	$3,9178($5)
	addu	$2,$2,$4
	lb	$3,0($2)
	move	$5,$0
	sll	$4,$3,1
	b	$L1355
	lw	$8,120($sp)

$L1505:
	b	$L1380
	li	$3,-62			# 0xffffffffffffffc2

$L1507:
	b	$L1386
	li	$6,-62			# 0xffffffffffffffc2

$L1506:
	bne	$2,$0,$L1353
	nop

$L1354:
	lw	$8,120($sp)
	li	$4,-1			# 0xffffffffffffffff
	b	$L1355
	move	$5,$0

$L1501:
	andi	$2,$2,0x40
	beq	$2,$0,$L1354
	nop

	b	$L1509
	lw	$2,9748($20)

$L1508:
	beq	$2,$0,$L1354
	nop

	b	$L1510
	lw	$2,9748($20)

	.set	macro
	.set	reorder
	.end	svq3_mc_dir
	.align	2
	.ent	decode_scaling_list
	.type	decode_scaling_list, @function
decode_scaling_list:
	.set	nomips16
	.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
	.mask	0x00030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-8
	lui	$28,%hi(__gnu_local_gp)
	move	$12,$6
	li	$2,16			# 0x10
	sw	$17,4($sp)
	sw	$16,0($sp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	move	$11,$4
	move	$14,$5
	move	$17,$7
	beq	$12,$2,$L1523
	lw	$6,24($sp)

	lw	$5,8456($11)
	lw	$3,8448($11)
	sra	$4,$5,3
	lui	$2,%hi(zigzag_scan8x8)
	addu	$3,$3,$4
	addiu	$13,$2,%lo(zigzag_scan8x8)
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,1
	srl	$2,$2,7
	beq	$2,$0,$L1525
	sw	$5,8456($11)

$L1550:
	blez	$12,$L1542
	lw	$16,%got(ff_se_golomb_vlc_code)($28)

	li	$4,8			# 0x8
	lw	$25,%got(ff_log2_tab)($28)
	lw	$7,%got(ff_golomb_vlc_len)($28)
	li	$10,8			# 0x8
	move	$8,$0
	li	$15,134217728			# 0x8000000
	bne	$4,$0,$L1544
	li	$24,-65536			# 0xffffffffffff0000

$L1528:
	bne	$8,$0,$L1551
	addu	$2,$13,$8

$L1547:
	beq	$4,$0,$L1545
	move	$5,$17

	lbu	$2,0($13)
	addu	$5,$14,$2
$L1541:
	addiu	$8,$8,1
	andi	$3,$4,0x00ff
	slt	$2,$8,$12
	beq	$2,$0,$L1542
	sb	$3,0($5)

$L1548:
	beq	$4,$0,$L1528
	move	$10,$3

$L1544:
	lw	$9,8456($11)
	lw	$3,8448($11)
	sra	$2,$9,3
	addu	$3,$3,$2
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$9,0x7
	sll	$5,$2,$3
	sltu	$4,$5,$15
	beq	$4,$0,$L1546
	and	$2,$5,$24

	bne	$2,$0,$L1531
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L1532:
	andi	$2,$3,0xff00
	beq	$2,$0,$L1533
	nop

	srl	$3,$3,8
	addiu	$6,$6,8
$L1533:
	addu	$3,$25,$3
	lbu	$2,0($3)
	addiu	$4,$9,32
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$5,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L1534
	sw	$4,8456($11)

	srl	$2,$5,1
	subu	$2,$0,$2
	addu	$2,$2,$10
	andi	$4,$2,0xff
$L1549:
	beq	$8,$0,$L1547
	addu	$2,$13,$8

$L1551:
	lbu	$3,0($2)
	bne	$4,$0,$L1541
	addu	$5,$14,$3

	addiu	$8,$8,1
	andi	$3,$10,0x00ff
	slt	$2,$8,$12
	bne	$2,$0,$L1548
	sb	$3,0($5)

$L1542:
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,8

$L1546:
	srl	$4,$5,23
	addu	$3,$7,$4
	lbu	$2,0($3)
	addu	$4,$16,$4
	addu	$2,$2,$9
	sw	$2,8456($11)
	lb	$2,0($4)
	addu	$2,$2,$10
	b	$L1549
	andi	$4,$2,0xff

$L1531:
	b	$L1532
	li	$6,16			# 0x10

$L1534:
	srl	$2,$5,1
	addu	$2,$2,$10
	b	$L1549
	andi	$4,$2,0xff

$L1523:
	lw	$5,8456($11)
	lw	$3,8448($11)
	sra	$4,$5,3
	lui	$2,%hi(zigzag_scan)
	addu	$3,$3,$4
	addiu	$13,$2,%lo(zigzag_scan)
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,1
	srl	$2,$2,7
	bne	$2,$0,$L1550
	sw	$5,8456($11)

$L1525:
	lw	$25,%call16(memcpy)($28)
	move	$5,$6
	lw	$17,4($sp)
	lw	$16,0($sp)
	move	$4,$14
	move	$6,$12
	jr	$25
	addiu	$sp,$sp,8

$L1545:
	lw	$25,%call16(memcpy)($28)
	lw	$16,0($sp)
	lw	$17,4($sp)
	move	$4,$14
	move	$6,$12
	jr	$25
	addiu	$sp,$sp,8

	.set	macro
	.set	reorder
	.end	decode_scaling_list
	.align	2
	.ent	decode_scaling_matrices
	.type	decode_scaling_matrices, @function
decode_scaling_matrices:
	.set	nomips16
	.frame	$sp,80,$31		# vars= 8, regs= 10/0, args= 24, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-80
	sw	$31,76($sp)
	sw	$fp,72($sp)
	sw	$23,68($sp)
	sw	$22,64($sp)
	sw	$21,60($sp)
	sw	$20,56($sp)
	sw	$19,52($sp)
	sw	$18,48($sp)
	sw	$17,44($sp)
	sw	$16,40($sp)
	.cprestore	24
	move	$21,$7
	move	$19,$4
	move	$7,$5
	sw	$6,36($sp)
	lw	$20,96($sp)
	bne	$21,$0,$L1553
	lw	$22,100($sp)

	lw	$2,636($5)
	bne	$2,$0,$L1563
	addiu	$2,$5,800

$L1553:
	lui	$3,%hi(default_scaling4+16)
	addiu	$23,$3,%lo(default_scaling4+16)
	lui	$3,%hi(default_scaling8+64)
	lw	$5,8456($19)
	addiu	$3,$3,%lo(default_scaling8+64)
	sw	$3,32($sp)
	lw	$3,8448($19)
	sra	$4,$5,3
	lui	$2,%hi(default_scaling4)
	addu	$3,$3,$4
	addiu	$8,$2,%lo(default_scaling4)
	lui	$2,%hi(default_scaling8)
	addiu	$fp,$2,%lo(default_scaling8)
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,1
	srl	$2,$2,7
	move	$6,$0
	bne	$2,$0,$L1564
	sw	$5,8456($19)

$L1554:
	bne	$6,$0,$L1565
	move	$17,$20

	lw	$31,76($sp)
$L1566:
	lw	$fp,72($sp)
	lw	$23,68($sp)
	lw	$22,64($sp)
	lw	$21,60($sp)
	lw	$20,56($sp)
	lw	$19,52($sp)
	lw	$18,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	j	$31
	addiu	$sp,$sp,80

$L1563:
	addiu	$8,$5,640
	addiu	$23,$5,688
	addiu	$fp,$5,736
	lw	$5,8456($19)
	lw	$3,8448($19)
	sra	$4,$5,3
	addu	$3,$3,$4
	sw	$2,32($sp)
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,1
	srl	$2,$2,7
	li	$6,1			# 0x1
	beq	$2,$0,$L1554
	sw	$5,8456($19)

$L1564:
	lw	$2,636($7)
	lui	$16,%hi(default_scaling4)
	or	$2,$2,$21
	addiu	$16,$16,%lo(default_scaling4)
	sw	$2,636($7)
	addiu	$17,$20,16
	move	$7,$16
	move	$4,$19
	move	$5,$20
	li	$6,16			# 0x10
	.option	pic0
	jal	decode_scaling_list
	.option	pic2
	sw	$8,16($sp)

	move	$5,$17
	move	$7,$16
	move	$4,$19
	li	$6,16			# 0x10
	.option	pic0
	jal	decode_scaling_list
	.option	pic2
	sw	$20,16($sp)

	move	$7,$16
	lui	$16,%hi(default_scaling4+16)
	addiu	$16,$16,%lo(default_scaling4+16)
	move	$4,$19
	addiu	$5,$20,32
	li	$6,16			# 0x10
	sw	$17,16($sp)
	.option	pic0
	jal	decode_scaling_list
	.option	pic2
	addiu	$17,$20,48

	move	$4,$19
	move	$5,$17
	li	$6,16			# 0x10
	move	$7,$16
	addiu	$18,$20,64
	.option	pic0
	jal	decode_scaling_list
	.option	pic2
	sw	$23,16($sp)

	move	$4,$19
	move	$5,$18
	li	$6,16			# 0x10
	move	$7,$16
	.option	pic0
	jal	decode_scaling_list
	.option	pic2
	sw	$17,16($sp)

	addiu	$5,$20,80
	move	$7,$16
	move	$4,$19
	li	$6,16			# 0x10
	.option	pic0
	jal	decode_scaling_list
	.option	pic2
	sw	$18,16($sp)

	bne	$21,$0,$L1555
	lw	$28,24($sp)

	lw	$3,36($sp)
	lw	$2,64($3)
	beq	$2,$0,$L1566
	lw	$31,76($sp)

$L1555:
	lui	$7,%hi(default_scaling8)
	move	$4,$19
	move	$5,$22
	addiu	$7,$7,%lo(default_scaling8)
	li	$6,64			# 0x40
	.option	pic0
	jal	decode_scaling_list
	.option	pic2
	sw	$fp,16($sp)

	lw	$2,32($sp)
	lw	$28,24($sp)
	lui	$7,%hi(default_scaling8+64)
	move	$4,$19
	addiu	$5,$22,64
	sw	$2,96($sp)
	lw	$31,76($sp)
	lw	$fp,72($sp)
	lw	$23,68($sp)
	lw	$22,64($sp)
	lw	$21,60($sp)
	lw	$20,56($sp)
	lw	$19,52($sp)
	lw	$18,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	addiu	$7,$7,%lo(default_scaling8+64)
	li	$6,64			# 0x40
	.option	pic0
	j	decode_scaling_list
	.option	pic2
	addiu	$sp,$sp,80

$L1565:
	addiu	$6,$7,640
	addiu	$8,$7,736
$L1557:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	swl	$2,3($17)
	swr	$2,0($17)
	swl	$3,7($17)
	swr	$3,4($17)
	swl	$4,11($17)
	swr	$4,8($17)
	swl	$5,15($17)
	addiu	$6,$6,16
	swr	$5,12($17)
	bne	$6,$8,$L1557
	addiu	$17,$17,16

	move	$8,$6
	addiu	$7,$7,864
	move	$6,$22
$L1558:
	lw	$2,0($8)
	lw	$3,4($8)
	lw	$4,8($8)
	lw	$5,12($8)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	swr	$3,4($6)
	swl	$4,11($6)
	swr	$4,8($6)
	swl	$5,15($6)
	addiu	$8,$8,16
	swr	$5,12($6)
	bne	$8,$7,$L1558
	addiu	$6,$6,16

	b	$L1566
	lw	$31,76($sp)

	.set	macro
	.set	reorder
	.end	decode_scaling_matrices
	.align	2
	.ent	pred_16x8_motion
	.type	pred_16x8_motion, @function
pred_16x8_motion:
	.set	nomips16
	.frame	$sp,24,$31		# vars= 0, regs= 6/0, args= 0, gp= 0
	.mask	0x003f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
	sw	$16,0($sp)
	sw	$21,20($sp)
	sw	$20,16($sp)
	sw	$19,12($sp)
	sw	$18,8($sp)
	sw	$17,4($sp)
	move	$8,$5
	move	$15,$4
	move	$14,$6
	bne	$5,$0,$L1568
	move	$16,$7

	sll	$9,$6,2
	sll	$10,$6,3
	sll	$13,$6,5
	addu	$2,$9,$6
	addu	$6,$10,$13
	subu	$2,$0,$2
	addu	$3,$4,$6
	addiu	$2,$2,1
	lb	$4,9460($3)
	sll	$2,$2,3
	beq	$4,$7,$L1615
	subu	$5,$0,$2

	b	$L1572
	addiu	$6,$6,-1

$L1568:
	sll	$10,$6,3
	sll	$13,$6,5
	addu	$2,$10,$13
	addu	$3,$4,$2
	lb	$4,9483($3)
	beq	$4,$7,$L1571
	addiu	$6,$2,-1

	sll	$9,$14,2
	addu	$2,$9,$14
	subu	$2,$0,$2
	addiu	$2,$2,1
	sll	$2,$2,3
	subu	$5,$0,$2
$L1572:
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$8,$2
	lbu	$8,0($2)
	li	$3,65536			# 0x10000
	addu	$12,$15,$3
	addu	$2,$10,$13
	addu	$2,$15,$2
	addu	$4,$6,$8
	addu	$5,$5,$8
	addiu	$24,$8,-4
	lw	$7,-6276($12)
	sll	$5,$5,2
	addiu	$11,$15,9136
	addu	$3,$8,$2
	sll	$4,$4,2
	addu	$6,$2,$24
	addu	$17,$11,$5
	lb	$18,9448($3)
	lb	$19,9455($3)
	addu	$25,$11,$4
	beq	$7,$0,$L1573
	lb	$5,9456($6)

	sll	$2,$14,4
	addu	$2,$9,$2
	subu	$2,$0,$2
	addiu	$2,$2,1
	sll	$2,$2,1
	subu	$2,$0,$2
	addiu	$2,$2,12
	sll	$2,$2,2
	addu	$2,$11,$2
	sw	$0,0($2)
	lw	$4,-6272($12)
	lw	$12,1880($15)
	move	$9,$2
	beq	$4,$0,$L1616
	lw	$7,104($12)

	li	$2,-2			# 0xfffffffffffffffe
$L1629:
	beq	$5,$2,$L1617
	addu	$2,$10,$13

$L1627:
	addu	$2,$2,$24
	sll	$2,$2,2
	addu	$9,$11,$2
$L1580:
	xor	$4,$16,$19
	xor	$3,$16,$18
	sltu	$3,$3,1
	sltu	$4,$4,1
	xor	$2,$16,$5
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	bne	$3,$0,$L1626
	li	$2,1			# 0x1

$L1593:
	lh	$5,0($25)
	lh	$3,0($17)
	slt	$2,$3,$5
	beq	$2,$0,$L1594
	lh	$4,0($9)

	slt	$2,$3,$4
	bne	$2,$0,$L1618
	slt	$2,$5,$4

$L1595:
	lw	$2,40($sp)
$L1628:
	lh	$6,2($25)
	lh	$5,2($17)
	sw	$3,0($2)
	slt	$2,$5,$6
	beq	$2,$0,$L1596
	lh	$4,2($9)

	slt	$2,$5,$4
	beq	$2,$0,$L1597
	slt	$2,$6,$4

	move	$5,$6
	movz	$5,$4,$2
$L1597:
	lw	$3,44($sp)
	sw	$5,0($3)
$L1598:
	lw	$21,20($sp)
	lw	$20,16($sp)
	lw	$19,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,24

$L1573:
	li	$2,-2			# 0xfffffffffffffffe
	bne	$5,$2,$L1627
	addu	$2,$10,$13

$L1630:
	addu	$4,$15,$2
	addiu	$3,$8,-9
	addu	$3,$3,$2
	addu	$4,$4,$8
	sll	$3,$3,2
	lb	$5,9447($4)
	addu	$9,$11,$3
	xor	$4,$16,$19
	xor	$3,$16,$18
	sltu	$3,$3,1
	sltu	$4,$4,1
	xor	$2,$16,$5
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	beq	$3,$0,$L1593
	li	$2,1			# 0x1

$L1626:
	beq	$4,$2,$L1619
	li	$2,-2			# 0xfffffffffffffffe

	bne	$18,$2,$L1593
	nop

	bne	$5,$18,$L1593
	nop

	beq	$19,$5,$L1593
	nop

$L1600:
	lh	$3,2($25)
	lh	$2,0($25)
	lw	$4,40($sp)
	lw	$5,44($sp)
	sw	$2,0($4)
	b	$L1598
	sw	$3,0($5)

$L1596:
	slt	$2,$4,$5
	beq	$2,$0,$L1597
	slt	$2,$4,$6

	move	$5,$6
	b	$L1597
	movz	$5,$4,$2

$L1594:
	slt	$2,$4,$3
	beq	$2,$0,$L1628
	lw	$2,40($sp)

	slt	$2,$4,$5
	move	$3,$5
	b	$L1595
	movz	$3,$4,$2

$L1616:
	lw	$6,6172($15)
	andi	$2,$6,0x1
	beq	$2,$0,$L1629
	li	$2,-2			# 0xfffffffffffffffe

	slt	$2,$8,20
	beq	$2,$0,$L1629
	li	$2,-2			# 0xfffffffffffffffe

	beq	$5,$2,$L1620
	addiu	$2,$6,-1

	lw	$21,152($15)
	mul	$3,$2,$21
	lw	$20,6168($15)
	addu	$2,$3,$20
	xori	$3,$8,0xf
	sltu	$3,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$2,$7,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L1627
	addu	$2,$10,$13

	sll	$3,$6,2
	andi	$4,$8,0x7
	sll	$2,$20,2
	addiu	$10,$3,-1
	addu	$8,$4,$2
	sra	$2,$10,2
	mul	$3,$2,$21
	sra	$4,$8,2
	addu	$2,$3,$4
	sll	$2,$2,2
	addu	$2,$7,$2
	sll	$5,$14,1
	lw	$2,0($2)
	li	$3,12288			# 0x3000
	sll	$3,$3,$5
	and	$3,$2,$3
	beq	$3,$0,$L1621
	andi	$2,$2,0x40

$L1578:
	lw	$3,9748($15)
	addiu	$2,$14,24
	mul	$4,$10,$3
	sll	$2,$2,2
	addu	$2,$12,$2
	addu	$3,$4,$8
	lw	$7,0($2)
	sll	$3,$3,2
	addu	$7,$7,$3
	sll	$6,$14,7
	lhu	$4,0($7)
	addiu	$2,$14,46
	addu	$6,$13,$6
	addu	$6,$15,$6
	sll	$2,$2,2
	addu	$2,$12,$2
	sh	$4,9176($6)
	lh	$4,2($7)
	lw	$3,4($2)
	lw	$7,9752($15)
	sra	$5,$8,1
	sra	$2,$10,1
	addu	$3,$3,$5
	mul	$5,$2,$7
	sll	$4,$4,1
	addu	$2,$5,$3
	sh	$4,9178($6)
	lb	$3,0($2)
	b	$L1580
	sra	$5,$3,1

$L1618:
	move	$3,$5
	b	$L1595
	movz	$3,$4,$2

$L1615:
	addiu	$2,$5,12
$L1599:
	sll	$2,$2,2
	addiu	$3,$15,9136
	addu	$3,$3,$2
	lh	$4,2($3)
	lh	$2,0($3)
	lw	$5,44($sp)
	lw	$3,40($sp)
	lw	$21,20($sp)
	sw	$2,0($3)
	lw	$20,16($sp)
	lw	$19,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	sw	$4,0($5)
	j	$31
	addiu	$sp,$sp,24

$L1571:
	b	$L1599
	addiu	$2,$6,28

$L1619:
	beq	$16,$19,$L1600
	nop

	beq	$16,$18,$L1622
	lw	$4,40($sp)

	lh	$3,2($9)
	lh	$2,0($9)
	lw	$5,44($sp)
	sw	$2,0($4)
	b	$L1598
	sw	$3,0($5)

$L1617:
	lw	$6,6172($15)
	andi	$5,$6,0x1
	bne	$5,$0,$L1576
	slt	$2,$8,20

	bne	$2,$0,$L1630
	addu	$2,$10,$13

$L1576:
	andi	$3,$8,0x7
	li	$2,4			# 0x4
	bne	$3,$2,$L1630
	addu	$2,$10,$13

	addu	$2,$15,$2
	lb	$3,9467($2)
	li	$20,-2			# 0xfffffffffffffffe
	beq	$3,$20,$L1630
	addu	$2,$10,$13

	beq	$4,$0,$L1623
	nop

	lw	$2,8768($15)
	sll	$2,$2,2
	addu	$2,$7,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	bne	$3,$0,$L1630
	addu	$2,$10,$13

	slt	$2,$8,20
	bne	$2,$0,$L1630
	addu	$2,$10,$13

	addiu	$3,$8,-12
	and	$2,$6,$20
	sra	$3,$3,3
	sll	$2,$2,1
	lw	$4,6168($15)
	addu	$2,$2,$3
	sll	$4,$4,2
	sll	$2,$2,1
	addiu	$8,$4,-1
	addiu	$10,$2,-1
	lw	$4,152($15)
	sra	$2,$10,2
	mul	$5,$2,$4
	sra	$3,$8,2
	addu	$2,$5,$3
	sll	$2,$2,2
	addu	$2,$7,$2
	sll	$5,$14,1
	lw	$2,0($2)
	li	$3,12288			# 0x3000
	sll	$3,$3,$5
	and	$3,$2,$3
	beq	$3,$0,$L1624
	andi	$2,$2,0x40

$L1584:
	lw	$3,9748($15)
	addiu	$2,$14,24
	mul	$4,$10,$3
	sll	$2,$2,2
	addu	$2,$12,$2
	addu	$3,$4,$8
	lw	$5,0($2)
	sll	$3,$3,2
	addu	$5,$5,$3
	addiu	$2,$14,46
	sll	$4,$14,7
	lhu	$3,0($5)
	addu	$4,$13,$4
	sll	$2,$2,2
	addu	$2,$12,$2
	addu	$4,$15,$4
	lw	$7,9752($15)
	sh	$3,9176($4)
	lw	$6,4($2)
	sra	$2,$10,1
	lh	$3,2($5)
	mul	$5,$2,$7
	sra	$3,$3,1
	addu	$2,$5,$6
	sra	$5,$8,1
	addu	$2,$2,$5
	sh	$3,9178($4)
	lb	$3,0($2)
	b	$L1580
	sll	$5,$3,1

$L1622:
	lh	$3,2($17)
	lh	$2,0($17)
	lw	$5,44($sp)
	sw	$2,0($4)
	b	$L1598
	sw	$3,0($5)

$L1620:
	b	$L1576
	li	$5,1			# 0x1

$L1623:
	lw	$2,8768($15)
	sll	$2,$2,2
	addu	$2,$7,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L1630
	addu	$2,$10,$13

	ori	$2,$6,0x1
	sll	$2,$2,1
	addu	$2,$2,$5
	sra	$3,$8,4
	addiu	$3,$3,-1
	sll	$2,$2,1
	lw	$4,6168($15)
	addu	$10,$3,$2
	lw	$5,152($15)
	sll	$4,$4,2
	sra	$2,$10,2
	addiu	$8,$4,-1
	mul	$4,$2,$5
	sra	$3,$8,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$7,$2
	sll	$4,$14,1
	lw	$2,0($2)
	li	$3,12288			# 0x3000
	sll	$3,$3,$4
	and	$3,$2,$3
	beq	$3,$0,$L1625
	andi	$2,$2,0x40

$L1583:
	lw	$3,9748($15)
	addiu	$2,$14,24
	mul	$4,$10,$3
	sll	$2,$2,2
	addu	$2,$12,$2
	addu	$3,$4,$8
	lw	$5,0($2)
	sll	$3,$3,2
	addu	$5,$5,$3
	addiu	$2,$14,46
	sll	$4,$14,7
	lhu	$3,0($5)
	addu	$4,$13,$4
	sll	$2,$2,2
	addu	$2,$12,$2
	addu	$4,$15,$4
	lw	$7,9752($15)
	sh	$3,9176($4)
	lw	$6,4($2)
	sra	$2,$10,1
	lh	$3,2($5)
	mul	$5,$2,$7
	sll	$3,$3,1
	addu	$2,$5,$6
	sra	$5,$8,1
	addu	$2,$2,$5
	sh	$3,9178($4)
	lb	$3,0($2)
	b	$L1580
	sra	$5,$3,1

$L1621:
	bne	$2,$0,$L1578
	nop

	b	$L1580
	li	$5,-1			# 0xffffffffffffffff

$L1625:
	bne	$2,$0,$L1583
	nop

	b	$L1580
	li	$5,-1			# 0xffffffffffffffff

$L1624:
	bne	$2,$0,$L1584
	nop

	b	$L1580
	li	$5,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	pred_16x8_motion
	.align	2
	.ent	pred_8x16_motion
	.type	pred_8x16_motion, @function
pred_8x16_motion:
	.set	nomips16
	.frame	$sp,24,$31		# vars= 0, regs= 5/0, args= 0, gp= 0
	.mask	0x001f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
	sw	$16,4($sp)
	sw	$20,20($sp)
	sw	$19,16($sp)
	sw	$18,12($sp)
	sw	$17,8($sp)
	move	$15,$5
	move	$13,$4
	move	$24,$6
	bne	$5,$0,$L1632
	move	$16,$7

	sll	$12,$6,3
	sll	$14,$6,5
	addu	$2,$12,$14
	addu	$3,$4,$2
	lb	$4,9467($3)
	beq	$4,$7,$L1670
	addiu	$5,$2,-1

	addiu	$11,$13,9136
$L1633:
	sll	$9,$24,2
	lui	$2,%hi(scan8)
	addu	$4,$9,$24
	addiu	$2,$2,%lo(scan8)
	addu	$2,$15,$2
	subu	$4,$0,$4
	lbu	$8,0($2)
	addiu	$4,$4,1
	li	$2,65536			# 0x10000
	addu	$10,$13,$2
	sll	$4,$4,3
	addu	$3,$12,$14
	addu	$3,$13,$3
	addu	$5,$5,$8
	subu	$4,$8,$4
	addiu	$15,$8,-6
	lw	$7,-6276($10)
	sll	$5,$5,2
	addu	$2,$8,$3
	sll	$4,$4,2
	addu	$6,$3,$15
	addu	$25,$11,$5
	lb	$18,9448($2)
	lb	$19,9455($2)
	addu	$17,$11,$4
	beq	$7,$0,$L1642
	lb	$5,9456($6)

	sll	$2,$24,4
	addu	$2,$9,$2
	subu	$2,$0,$2
	addiu	$2,$2,1
	sll	$2,$2,1
	subu	$2,$0,$2
	addiu	$2,$2,12
	sll	$2,$2,2
	addu	$2,$11,$2
	sw	$0,0($2)
	lw	$6,-6272($10)
	lw	$10,1880($13)
	move	$9,$2
	beq	$6,$0,$L1687
	lw	$7,104($10)

	li	$2,-2			# 0xfffffffffffffffe
$L1703:
	beq	$5,$2,$L1688
	addu	$2,$12,$14

$L1701:
	addu	$2,$2,$15
	sll	$2,$2,2
	addu	$9,$11,$2
$L1649:
	xor	$4,$16,$19
	xor	$3,$16,$18
	sltu	$3,$3,1
	sltu	$4,$4,1
	xor	$2,$16,$5
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	bne	$3,$0,$L1700
	li	$2,1			# 0x1

$L1662:
	lh	$5,0($25)
	lh	$3,0($17)
	slt	$2,$3,$5
	beq	$2,$0,$L1663
	lh	$4,0($9)

	slt	$2,$3,$4
	bne	$2,$0,$L1689
	slt	$2,$5,$4

$L1664:
	lw	$2,40($sp)
$L1702:
	lh	$5,2($25)
	lh	$7,2($17)
	sw	$3,0($2)
	slt	$2,$7,$5
	beq	$2,$0,$L1665
	lh	$3,2($9)

	slt	$2,$7,$3
	beq	$2,$0,$L1666
	slt	$2,$5,$3

	move	$7,$5
	movz	$7,$3,$2
$L1666:
	lw	$3,44($sp)
	sw	$7,0($3)
$L1667:
	lw	$20,20($sp)
	lw	$19,16($sp)
	lw	$18,12($sp)
	lw	$17,8($sp)
	lw	$16,4($sp)
	j	$31
	addiu	$sp,$sp,24

$L1642:
	li	$2,-2			# 0xfffffffffffffffe
	bne	$5,$2,$L1701
	addu	$2,$12,$14

$L1706:
	addu	$4,$13,$2
	addiu	$3,$8,-9
	addu	$3,$3,$2
	addu	$4,$4,$8
	sll	$3,$3,2
	lb	$5,9447($4)
	addu	$9,$11,$3
	xor	$4,$16,$19
	xor	$3,$16,$18
	sltu	$3,$3,1
	sltu	$4,$4,1
	xor	$2,$16,$5
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	beq	$3,$0,$L1662
	li	$2,1			# 0x1

$L1700:
	beq	$4,$2,$L1690
	li	$2,-2			# 0xfffffffffffffffe

	bne	$18,$2,$L1662
	nop

	bne	$5,$18,$L1662
	nop

	beq	$19,$5,$L1662
	nop

$L1672:
	lh	$3,2($25)
	lh	$2,0($25)
	lw	$4,40($sp)
	lw	$5,44($sp)
	sw	$2,0($4)
	b	$L1667
	sw	$3,0($5)

$L1665:
	slt	$2,$3,$7
	beq	$2,$0,$L1666
	slt	$2,$3,$5

	move	$7,$5
	b	$L1666
	movz	$7,$3,$2

$L1663:
	slt	$2,$4,$3
	beq	$2,$0,$L1702
	lw	$2,40($sp)

	slt	$2,$4,$5
	move	$3,$5
	b	$L1664
	movz	$3,$4,$2

$L1632:
	li	$2,65536			# 0x10000
	addu	$5,$4,$2
	sll	$12,$6,3
	sll	$14,$6,5
	addu	$2,$12,$14
	lw	$3,-6276($5)
	addu	$2,$4,$2
	bne	$3,$0,$L1691
	lb	$4,9464($2)

	li	$2,-2			# 0xfffffffffffffffe
	beq	$4,$2,$L1637
	addiu	$11,$13,9136

	addu	$2,$12,$14
$L1705:
	addiu	$2,$2,8
	sll	$2,$2,2
	addu	$8,$11,$2
$L1640:
	beq	$16,$4,$L1641
	addu	$2,$12,$14

	b	$L1633
	addiu	$5,$2,-1

$L1670:
	addiu	$2,$5,12
	sll	$2,$2,2
	addiu	$3,$13,9136
	addu	$3,$3,$2
	lh	$4,2($3)
	lh	$2,0($3)
	lw	$5,44($sp)
	lw	$3,40($sp)
	lw	$20,20($sp)
	sw	$2,0($3)
	lw	$19,16($sp)
	lw	$18,12($sp)
	lw	$17,8($sp)
	lw	$16,4($sp)
	sw	$4,0($5)
	j	$31
	addiu	$sp,$sp,24

$L1687:
	lw	$4,6172($13)
	andi	$2,$4,0x1
	beq	$2,$0,$L1703
	li	$2,-2			# 0xfffffffffffffffe

	slt	$2,$8,20
	beq	$2,$0,$L1703
	li	$2,-2			# 0xfffffffffffffffe

	beq	$5,$2,$L1693
	addiu	$2,$4,-1

	lw	$20,152($13)
	mul	$3,$2,$20
	lw	$6,6168($13)
	addu	$2,$3,$6
	xori	$3,$8,0xf
	sltu	$3,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$2,$7,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L1701
	addu	$2,$12,$14

	sll	$4,$4,2
	sll	$2,$6,2
	andi	$3,$8,0x7
	addiu	$2,$2,-2
	addiu	$8,$4,-1
	addu	$5,$2,$3
	sra	$2,$8,2
	mul	$4,$2,$20
	sra	$3,$5,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$7,$2
	sll	$4,$24,1
	lw	$2,0($2)
	li	$3,12288			# 0x3000
	sll	$3,$3,$4
	and	$3,$2,$3
	beq	$3,$0,$L1694
	andi	$2,$2,0x40

$L1647:
	lw	$3,9748($13)
	addiu	$2,$24,24
	mul	$4,$8,$3
	sll	$2,$2,2
	addu	$2,$10,$2
	addu	$3,$4,$5
	lw	$7,0($2)
	sll	$3,$3,2
	addu	$7,$7,$3
	sll	$6,$24,7
	lhu	$4,0($7)
	addiu	$2,$24,46
	addu	$6,$14,$6
	addu	$6,$13,$6
	sll	$2,$2,2
	addu	$2,$10,$2
	sh	$4,9176($6)
	lh	$4,2($7)
	lw	$3,4($2)
	lw	$7,9752($13)
	sra	$5,$5,1
	sra	$2,$8,1
	addu	$3,$3,$5
	mul	$5,$2,$7
	sll	$4,$4,1
	addu	$2,$5,$3
	sh	$4,9178($6)
	lb	$3,0($2)
	b	$L1649
	sra	$5,$3,1

$L1689:
	move	$3,$5
	b	$L1664
	movz	$3,$4,$2

$L1691:
	sll	$3,$6,4
	sll	$2,$6,2
	addu	$2,$2,$3
	subu	$2,$0,$2
	addiu	$2,$2,1
	sll	$2,$2,1
	subu	$2,$0,$2
	addiu	$2,$2,12
	sll	$2,$2,2
	addiu	$11,$13,9136
	addu	$2,$11,$2
	sw	$0,0($2)
	lw	$10,1880($13)
	lw	$3,-6272($5)
	move	$8,$2
	bne	$3,$0,$L1636
	lw	$6,104($10)

	lw	$5,6172($13)
	andi	$2,$5,0x1
	beq	$2,$0,$L1704
	li	$2,-2			# 0xfffffffffffffffe

	beq	$4,$2,$L1637
	addiu	$2,$5,-1

	lw	$9,152($13)
	mul	$3,$2,$9
	lw	$7,6168($13)
	addu	$2,$3,$7
	sll	$2,$2,2
	addu	$2,$6,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L1705
	addu	$2,$12,$14

	sll	$3,$5,2
	sll	$2,$7,2
	addiu	$17,$3,-1
	addiu	$18,$2,4
	sra	$2,$17,2
	mul	$4,$2,$9
	sra	$3,$18,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$6,$2
	sll	$4,$24,1
	lw	$2,0($2)
	li	$3,12288			# 0x3000
	sll	$3,$3,$4
	and	$3,$2,$3
	beq	$3,$0,$L1695
	andi	$2,$2,0x40

$L1639:
	lw	$3,9748($13)
	addiu	$2,$24,24
	mul	$4,$17,$3
	sll	$2,$2,2
	addu	$2,$10,$2
	addu	$3,$4,$18
	lw	$4,0($2)
	sll	$3,$3,2
	addu	$4,$4,$3
	sll	$5,$24,7
	addiu	$2,$24,46
	lhu	$3,0($4)
	addu	$5,$14,$5
	sll	$2,$2,2
	addu	$2,$10,$2
	addu	$5,$13,$5
	lw	$6,9752($13)
	sh	$3,9176($5)
	lw	$7,4($2)
	sra	$2,$17,1
	lh	$3,2($4)
	mul	$4,$2,$6
	sll	$3,$3,1
	addu	$2,$4,$7
	sra	$4,$18,1
	addu	$2,$2,$4
	sh	$3,9178($5)
	lb	$3,0($2)
	b	$L1640
	sra	$4,$3,1

$L1690:
	beq	$16,$19,$L1672
	nop

	beq	$16,$18,$L1696
	lw	$5,44($sp)

	lh	$3,2($9)
	lh	$2,0($9)
	lw	$4,40($sp)
	sw	$2,0($4)
	b	$L1667
	sw	$3,0($5)

$L1636:
	li	$2,-2			# 0xfffffffffffffffe
$L1704:
	bne	$4,$2,$L1705
	addu	$2,$12,$14

$L1637:
	addu	$2,$12,$14
	addu	$3,$13,$2
	addiu	$2,$2,5
	sll	$2,$2,2
	lb	$4,9461($3)
	b	$L1640
	addu	$8,$11,$2

$L1688:
	lw	$4,6172($13)
	andi	$5,$4,0x1
	bne	$5,$0,$L1645
	slt	$2,$8,20

	bne	$2,$0,$L1706
	addu	$2,$12,$14

$L1645:
	andi	$3,$8,0x7
	li	$2,4			# 0x4
	bne	$3,$2,$L1706
	addu	$2,$12,$14

	addu	$2,$13,$2
	lb	$3,9467($2)
	li	$15,-2			# 0xfffffffffffffffe
	beq	$3,$15,$L1706
	addu	$2,$12,$14

	beq	$6,$0,$L1697
	nop

	lw	$2,8768($13)
	sll	$2,$2,2
	addu	$2,$7,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	bne	$3,$0,$L1706
	addu	$2,$12,$14

	slt	$2,$8,20
	bne	$2,$0,$L1706
	addu	$2,$12,$14

	and	$2,$4,$15
	addiu	$3,$8,-12
	sra	$3,$3,3
	sll	$2,$2,1
	lw	$4,6168($13)
	addu	$2,$2,$3
	sll	$4,$4,2
	sll	$2,$2,1
	addiu	$8,$4,-1
	addiu	$11,$2,-1
	lw	$4,152($13)
	sra	$2,$11,2
	mul	$5,$2,$4
	sra	$3,$8,2
	addu	$2,$5,$3
	sll	$2,$2,2
	addu	$2,$7,$2
	sll	$5,$24,1
	lw	$2,0($2)
	li	$3,12288			# 0x3000
	sll	$3,$3,$5
	and	$3,$2,$3
	beq	$3,$0,$L1698
	andi	$2,$2,0x40

$L1653:
	lw	$3,9748($13)
	addiu	$2,$24,24
	mul	$4,$11,$3
	sll	$2,$2,2
	addu	$2,$10,$2
	addu	$3,$4,$8
	lw	$5,0($2)
	sll	$3,$3,2
	addu	$5,$5,$3
	addiu	$2,$24,46
	sll	$4,$24,7
	lhu	$3,0($5)
	addu	$4,$14,$4
	sll	$2,$2,2
	addu	$2,$10,$2
	addu	$4,$13,$4
	lw	$7,9752($13)
	sh	$3,9176($4)
	lw	$6,4($2)
	sra	$2,$11,1
	lh	$3,2($5)
	mul	$5,$2,$7
	sra	$3,$3,1
	addu	$2,$5,$6
	sra	$5,$8,1
	addu	$2,$2,$5
	sh	$3,9178($4)
	lb	$3,0($2)
	b	$L1649
	sll	$5,$3,1

$L1641:
	lh	$2,0($8)
	lw	$5,40($sp)
	lh	$3,2($8)
	sw	$2,0($5)
	lw	$2,44($sp)
	b	$L1667
	sw	$3,0($2)

$L1696:
	lh	$3,2($17)
	lh	$2,0($17)
	lw	$4,40($sp)
	sw	$2,0($4)
	b	$L1667
	sw	$3,0($5)

$L1693:
	b	$L1645
	li	$5,1			# 0x1

$L1697:
	lw	$2,8768($13)
	sll	$2,$2,2
	addu	$2,$7,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L1706
	addu	$2,$12,$14

	ori	$2,$4,0x1
	sll	$2,$2,1
	addu	$2,$2,$5
	sra	$3,$8,4
	addiu	$3,$3,-1
	sll	$2,$2,1
	lw	$4,6168($13)
	addu	$11,$3,$2
	lw	$5,152($13)
	sll	$4,$4,2
	sra	$2,$11,2
	addiu	$8,$4,-1
	mul	$4,$2,$5
	sra	$3,$8,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$7,$2
	sll	$4,$24,1
	lw	$2,0($2)
	li	$3,12288			# 0x3000
	sll	$3,$3,$4
	and	$3,$2,$3
	beq	$3,$0,$L1699
	andi	$2,$2,0x40

$L1652:
	lw	$3,9748($13)
	addiu	$2,$24,24
	mul	$4,$11,$3
	sll	$2,$2,2
	addu	$2,$10,$2
	addu	$3,$4,$8
	lw	$5,0($2)
	sll	$3,$3,2
	addu	$5,$5,$3
	addiu	$2,$24,46
	sll	$4,$24,7
	lhu	$3,0($5)
	addu	$4,$14,$4
	sll	$2,$2,2
	addu	$2,$10,$2
	addu	$4,$13,$4
	lw	$7,9752($13)
	sh	$3,9176($4)
	lw	$6,4($2)
	sra	$2,$11,1
	lh	$3,2($5)
	mul	$5,$2,$7
	sll	$3,$3,1
	addu	$2,$5,$6
	sra	$5,$8,1
	addu	$2,$2,$5
	sh	$3,9178($4)
	lb	$3,0($2)
	b	$L1649
	sra	$5,$3,1

$L1694:
	bne	$2,$0,$L1647
	nop

	b	$L1649
	li	$5,-1			# 0xffffffffffffffff

$L1695:
	bne	$2,$0,$L1639
	nop

	b	$L1640
	li	$4,-1			# 0xffffffffffffffff

$L1699:
	bne	$2,$0,$L1652
	nop

	b	$L1649
	li	$5,-1			# 0xffffffffffffffff

$L1698:
	bne	$2,$0,$L1653
	nop

	b	$L1649
	li	$5,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	pred_8x16_motion
	.align	2
	.ent	pred_direct_motion
	.type	pred_direct_motion, @function
pred_direct_motion:
	.set	nomips16
	.frame	$sp,144,$31		# vars= 96, regs= 9/0, args= 0, gp= 8
	.mask	0x40ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-144
	sw	$fp,140($sp)
	sw	$23,136($sp)
	sw	$22,132($sp)
	sw	$21,128($sp)
	sw	$20,124($sp)
	sw	$19,120($sp)
	sw	$18,116($sp)
	sw	$17,112($sp)
	sw	$16,108($sp)
	.cprestore	0
	lw	$6,6172($4)
	lw	$3,152($4)
	li	$2,131072			# 0x20000
	addu	$2,$4,$2
	lw	$9,6168($4)
	move	$12,$4
	mul	$4,$6,$3
	lw	$7,9752($12)
	addu	$3,$4,$9
	lw	$4,-13528($2)
	sll	$3,$3,2
	addu	$4,$4,$3
	mul	$3,$6,$7
	lw	$8,9748($12)
	addu	$7,$3,$9
	mul	$3,$6,$8
	lw	$25,0($4)
	addu	$6,$3,$9
	lw	$8,-13536($2)
	lw	$9,-13440($2)
	lw	$3,-13532($2)
	lw	$4,-13444($2)
	sll	$6,$6,4
	sll	$7,$7,1
	move	$14,$5
	lw	$5,0($5)
	addu	$3,$3,$6
	addu	$9,$9,$7
	addu	$8,$8,$6
	addu	$4,$4,$7
	andi	$2,$25,0x40
	sw	$3,64($sp)
	sw	$9,56($sp)
	sw	$8,68($sp)
	sw	$4,60($sp)
	beq	$2,$0,$L1708
	andi	$19,$5,0x40

	lw	$2,9980($12)
	beq	$2,$0,$L1831
	li	$2,61504			# 0xf040

$L1708:
	beq	$19,$0,$L1832
	andi	$2,$25,0xf

	li	$2,61504			# 0xf040
$L1857:
	sw	$2,0($14)
	beq	$19,$0,$L1833
	li	$22,20744			# 0x5108

$L1712:
	li	$2,65536			# 0x10000
	addu	$2,$12,$2
	lw	$3,-6272($2)
	beq	$3,$0,$L1856
	li	$5,65536			# 0x10000

	lw	$2,0($14)
	ori	$2,$2,0x80
	sw	$2,0($14)
$L1856:
	addu	$3,$12,$5
	lw	$2,5356($3)
	beq	$2,$0,$L1714
	ori	$4,$5,0x14f0

	addiu	$24,$sp,8
	move	$20,$12
	move	$7,$12
	move	$6,$24
	addiu	$8,$sp,16
	li	$10,-2			# 0xfffffffffffffffe
	li	$11,-1			# 0xffffffffffffffff
$L1723:
	lb	$5,9464($7)
	lb	$4,9467($7)
	beq	$5,$10,$L1834
	lb	$3,9460($7)

	bltz	$4,$L1716
	sw	$4,0($6)

$L1845:
	slt	$2,$3,$4
	bne	$2,$0,$L1835
	nop

$L1717:
	move	$3,$4
$L1720:
	slt	$2,$5,$3
	beq	$2,$0,$L1721
	nop

	bltz	$5,$L1721
	nop

	sw	$5,0($6)
$L1721:
	addiu	$6,$6,4
	bne	$6,$8,$L1723
	addiu	$7,$7,40

	lw	$4,8($sp)
	bltz	$4,$L1836
	sw	$4,72($sp)

	lw	$fp,12($sp)
$L1725:
	li	$2,65536			# 0x10000
	addiu	$5,$12,9136
	addu	$2,$12,$2
	move	$7,$8
	move	$17,$8
	sw	$5,48($sp)
	sw	$2,80($sp)
	move	$8,$5
	move	$10,$12
	move	$13,$0
	move	$16,$0
	move	$18,$0
$L1752:
	lw	$11,0($24)
	bltz	$11,$L1727
	lw	$6,80($sp)

	nor	$2,$0,$16
	addiu	$2,$2,12
	lw	$4,48($sp)
	lw	$3,-6276($6)
	sll	$2,$2,2
	addu	$9,$4,$2
	lb	$21,9460($10)
	lb	$23,9467($10)
	beq	$3,$0,$L1728
	lb	$5,9464($10)

	lw	$6,1880($12)
	lw	$2,80($sp)
	sw	$0,40($8)
	lw	$4,104($6)
	lw	$3,-6272($2)
	sw	$6,76($sp)
	sw	$4,36($sp)
	bne	$3,$0,$L1729
	addiu	$15,$8,40

	lw	$6,6172($12)
	andi	$2,$6,0x1
	beq	$2,$0,$L1729
	li	$2,-2			# 0xfffffffffffffffe

	beq	$5,$2,$L1837
	addiu	$2,$6,-1

	lw	$3,6168($12)
	lw	$4,152($12)
	mtlo	$3
	madd	$2,$4
	sw	$4,32($sp)
	mflo	$2
	lw	$4,36($sp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,88($sp)
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L1732
	sll	$3,$6,2

	lw	$5,88($sp)
	sll	$2,$5,2
	addiu	$3,$3,-1
	addiu	$2,$2,4
	lw	$4,32($sp)
	sw	$2,92($sp)
	sra	$2,$3,2
	mul	$5,$2,$4
	lw	$6,92($sp)
	sw	$3,40($sp)
	sra	$3,$6,2
	addu	$2,$5,$3
	lw	$3,36($sp)
	sll	$2,$2,2
	addu	$2,$3,$2
	li	$6,12288			# 0x3000
	lw	$2,0($2)
	sll	$4,$6,$18
	and	$4,$4,$2
	beq	$4,$0,$L1838
	andi	$2,$2,0x40

	lw	$4,76($sp)
$L1865:
	addiu	$2,$13,24
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$4,92($sp)
	lw	$3,9748($12)
	mtlo	$4
	lw	$4,40($sp)
	lw	$5,76($sp)
	madd	$4,$3
	lw	$4,0($2)
	mflo	$3
	addiu	$2,$13,46
	sll	$3,$3,2
	addu	$4,$4,$3
	lhu	$3,0($4)
	sll	$2,$2,2
	addu	$2,$5,$2
	sh	$3,9176($20)
	lh	$3,2($4)
	lw	$6,4($2)
	lw	$5,9752($12)
	lw	$4,40($sp)
$L1815:
	sra	$2,$4,1
	mul	$4,$2,$5
	lw	$5,92($sp)
	addu	$2,$4,$6
	sll	$3,$3,1
	sra	$4,$5,1
	sh	$3,9178($20)
	addu	$2,$2,$4
	lb	$3,0($2)
	b	$L1735
	sra	$5,$3,1

$L1714:
	lw	$2,-6276($3)
	ori	$3,$5,0x15b0
	addu	$3,$12,$3
	addu	$20,$12,$4
	addiu	$4,$3,64
	bne	$2,$0,$L1839
	sw	$4,52($sp)

	lw	$7,0($14)
	move	$9,$3
	andi	$2,$7,0x8
$L1858:
	beq	$2,$0,$L1794
	li	$2,59272			# 0xe788

	addiu	$2,$12,9508
	andi	$3,$25,0x7
	sw	$0,9508($12)
	addiu	$8,$12,9456
	sw	$0,24($2)
	sw	$0,8($2)
	bne	$3,$0,$L1840
	sw	$0,16($2)

	lw	$3,60($sp)
	lb	$2,0($3)
	bltz	$2,$L1797
	lw	$4,56($sp)

	sll	$2,$2,2
	addu	$2,$9,$2
	lw	$9,0($2)
	lw	$3,68($sp)
	sll	$2,$9,2
	addu	$2,$20,$2
	lw	$2,0($2)
	lh	$5,0($3)
$L1798:
	lh	$6,2($3)
	mul	$3,$5,$2
	mul	$2,$6,$2
	addiu	$3,$3,128
	addiu	$2,$2,128
	sra	$3,$3,8
	sra	$2,$2,8
	sll	$4,$9,8
	addu	$4,$4,$9
	subu	$6,$2,$6
	subu	$5,$3,$5
	sll	$7,$4,16
	sll	$6,$6,16
	andi	$5,$5,0xffff
	sll	$2,$2,16
	andi	$3,$3,0xffff
	addu	$9,$4,$7
	addu	$6,$6,$5
	addu	$7,$2,$3
$L1796:
	addiu	$2,$12,9184
	addiu	$4,$12,9344
	addiu	$3,$8,12
	sw	$9,12($8)
	sw	$9,24($3)
	sw	$9,8($3)
	sw	$9,16($3)
	sw	$7,9184($12)
	sw	$7,108($2)
	sw	$7,4($2)
	sw	$7,8($2)
	sw	$7,12($2)
	sw	$7,32($2)
	sw	$7,36($2)
	sw	$7,40($2)
	sw	$7,44($2)
	sw	$7,64($2)
	sw	$7,68($2)
	sw	$7,72($2)
	sw	$7,76($2)
	sw	$7,96($2)
	sw	$7,100($2)
	sw	$7,104($2)
	sw	$6,9344($12)
	sw	$6,4($4)
	sw	$6,8($4)
	sw	$6,12($4)
	sw	$6,32($4)
	sw	$6,36($4)
	sw	$6,40($4)
	sw	$6,44($4)
	sw	$6,64($4)
	sw	$6,68($4)
	sw	$6,72($4)
	sw	$6,76($4)
	sw	$6,96($4)
	sw	$6,100($4)
	lw	$fp,140($sp)
	lw	$23,136($sp)
	lw	$22,132($sp)
	lw	$21,128($sp)
	lw	$20,124($sp)
	lw	$19,120($sp)
	lw	$18,116($sp)
	lw	$17,112($sp)
	lw	$16,108($sp)
	sw	$6,108($4)
	sw	$6,104($4)
	j	$31
	addiu	$sp,$sp,144

$L1832:
	beq	$2,$0,$L1857
	li	$2,61504			# 0xf040

	li	$2,20744			# 0x5108
	sw	$2,0($14)
	ori	$2,$2,0x100
	li	$22,20744			# 0x5108
	b	$L1712
	sw	$2,0($14)

$L1835:
	bltz	$3,$L1717
	nop

	b	$L1720
	sw	$3,0($6)

$L1831:
	sw	$2,0($14)
	bne	$19,$0,$L1712
	li	$22,20800			# 0x5140

$L1833:
	lw	$2,0($14)
	ori	$2,$2,0x100
	b	$L1712
	sw	$2,0($14)

$L1839:
	lw	$7,0($14)
	andi	$6,$7,0x80
	bne	$6,$0,$L1776
	ori	$2,$5,0x1630

	move	$9,$3
$L1777:
	xor	$2,$25,$7
	andi	$2,$2,0x80
	beq	$2,$0,$L1858
	andi	$2,$7,0x8

	li	$3,61504			# 0xf040
	li	$2,61760			# 0xf140
	movn	$2,$3,$19
	lw	$4,6172($12)
	or	$10,$2,$6
	lw	$6,152($12)
	li	$2,-2			# 0xfffffffffffffffe
	and	$4,$4,$2
	mul	$2,$4,$6
	lw	$5,6168($12)
	andi	$3,$10,0x80
	addu	$8,$2,$5
	beq	$3,$0,$L1781
	sw	$10,0($14)

	li	$2,131072			# 0x20000
	addu	$2,$12,$2
	lw	$4,-13528($2)
	sll	$3,$8,2
	lw	$2,152($12)
	addu	$3,$4,$3
	lw	$5,0($3)
	addu	$2,$8,$2
	sll	$2,$2,2
	sw	$5,8($sp)
	addu	$4,$4,$2
	lw	$2,6172($12)
	lw	$4,0($4)
	andi	$2,$2,0x1
	beq	$2,$0,$L1782
	sw	$4,12($sp)

	lw	$2,9752($12)
	lw	$6,56($sp)
	lw	$25,60($sp)
	lw	$3,9748($12)
	sll	$2,$2,1
	subu	$2,$0,$2
	addu	$6,$6,$2
	lw	$7,64($sp)
	addu	$25,$25,$2
	sll	$3,$3,4
	lw	$2,68($sp)
	subu	$3,$0,$3
	addu	$7,$7,$3
	addu	$2,$2,$3
	sw	$6,56($sp)
	sw	$7,64($sp)
	sw	$25,60($sp)
	sw	$2,68($sp)
$L1782:
	andi	$2,$5,0xf
	beq	$2,$0,$L1859
	ori	$2,$10,0x40

	andi	$2,$4,0xf
	beq	$2,$0,$L1859
	ori	$2,$10,0x40

	bne	$19,$0,$L1783
	move	$15,$0

	ori	$2,$10,0x10
	b	$L1784
	sw	$2,0($14)

$L1729:
	li	$6,-2			# 0xfffffffffffffffe
	beq	$5,$6,$L1841
	nop

$L1732:
	addiu	$15,$8,32
$L1735:
	xor	$4,$11,$23
	xor	$3,$11,$21
	sltu	$3,$3,1
	sltu	$4,$4,1
	xor	$2,$11,$5
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	bne	$3,$0,$L1860
	li	$2,1			# 0x1

$L1747:
	lh	$5,0($9)
	lh	$4,16($8)
	slt	$2,$4,$5
	beq	$2,$0,$L1748
	lh	$3,0($15)

	slt	$2,$4,$3
	bne	$2,$0,$L1842
	slt	$2,$5,$3

$L1749:
	lh	$5,2($9)
	lh	$3,18($8)
	sw	$4,0($7)
	slt	$2,$3,$5
	beq	$2,$0,$L1750
	lh	$4,2($15)

	slt	$2,$3,$4
	beq	$2,$0,$L1816
	slt	$2,$5,$4

	move	$3,$5
	movz	$3,$4,$2
$L1816:
	sw	$3,4($7)
$L1743:
	addiu	$13,$13,1
	li	$4,2			# 0x2
	addiu	$24,$24,4
	addiu	$7,$7,8
	addiu	$17,$17,8
	addiu	$8,$8,160
	addiu	$20,$20,160
	addiu	$10,$10,40
	addiu	$16,$16,-40
	bne	$13,$4,$L1752
	addiu	$18,$18,2

	bltz	$fp,$L1843
	lw	$5,72($sp)

	bltz	$5,$L1754
	li	$3,-4097			# 0xffffffffffffefff

	lw	$2,0($14)
$L1726:
	andi	$2,$2,0x8
	beq	$2,$0,$L1755
	andi	$5,$fp,0x00ff

	lw	$7,8($sp)
	andi	$4,$7,0x00ff
	sll	$2,$4,8
	sll	$3,$5,8
	addu	$2,$2,$4
	addu	$3,$3,$5
	sll	$4,$2,16
	sll	$5,$3,16
	addu	$2,$2,$4
	addu	$3,$3,$5
	addiu	$4,$12,9468
	addiu	$5,$12,9508
	andi	$6,$25,0x7
	sw	$2,9468($12)
	sw	$2,24($4)
	sw	$2,8($4)
	sw	$2,16($4)
	sw	$3,9508($12)
	sw	$3,24($5)
	sw	$3,8($5)
	beq	$6,$0,$L1844
	sw	$3,16($5)

$L1756:
	lw	$3,28($sp)
$L1861:
	lw	$2,20($sp)
$L1862:
	lhu	$4,24($sp)
	lhu	$5,16($sp)
	sll	$3,$3,16
	sll	$2,$2,16
	addu	$6,$3,$4
	addu	$4,$2,$5
$L1762:
	addiu	$2,$12,9184
	addiu	$3,$12,9344
	sw	$4,9184($12)
	lw	$fp,140($sp)
	sw	$4,108($2)
	sw	$4,4($2)
	sw	$4,8($2)
	sw	$4,12($2)
	sw	$4,32($2)
	sw	$4,36($2)
	sw	$4,40($2)
	sw	$4,44($2)
	sw	$4,64($2)
	sw	$4,68($2)
	sw	$4,72($2)
	sw	$4,76($2)
	sw	$4,96($2)
	sw	$4,100($2)
	sw	$4,104($2)
	lw	$23,136($sp)
	sw	$6,9344($12)
	lw	$22,132($sp)
	lw	$21,128($sp)
	lw	$20,124($sp)
	lw	$19,120($sp)
	lw	$18,116($sp)
	lw	$17,112($sp)
	lw	$16,108($sp)
	sw	$6,108($3)
	sw	$6,4($3)
	sw	$6,8($3)
	sw	$6,12($3)
	sw	$6,32($3)
	sw	$6,36($3)
	sw	$6,40($3)
	sw	$6,44($3)
	sw	$6,64($3)
	sw	$6,68($3)
	sw	$6,72($3)
	sw	$6,76($3)
	sw	$6,96($3)
	sw	$6,100($3)
	sw	$6,104($3)
	j	$31
	addiu	$sp,$sp,144

$L1727:
	sw	$0,4($7)
	b	$L1743
	sw	$0,0($17)

$L1834:
	lb	$5,9459($7)
	bgez	$4,$L1845
	sw	$4,0($6)

$L1716:
	bgez	$3,$L1720
	sw	$3,0($6)

	slt	$2,$5,0
	move	$3,$11
	movz	$3,$5,$2
	b	$L1721
	sw	$3,0($6)

$L1755:
	lw	$20,8($sp)
	andi	$4,$20,0x00ff
	sll	$2,$4,8
	addu	$2,$2,$4
	andi	$18,$2,0xffff
	li	$2,59272			# 0xe788
	sll	$3,$5,8
	lui	$6,%hi(scan8)
	addu	$13,$12,$2
	li	$2,131072			# 0x20000
	addu	$3,$3,$5
	addiu	$21,$6,%lo(scan8)
	addu	$2,$12,$2
	andi	$17,$3,0xffff
	andi	$23,$25,0x7
	sw	$2,96($sp)
	addiu	$15,$12,9136
	addiu	$16,$12,9456
	move	$14,$21
	move	$11,$0
	andi	$9,$22,0x8
	li	$24,4			# 0x4
$L1774:
	beq	$19,$0,$L1764
	nop

	lw	$2,0($13)
	andi	$2,$2,0x100
	beq	$2,$0,$L1765
	nop

$L1764:
	lbu	$10,0($14)
	lw	$2,20($sp)
	lw	$3,28($sp)
	lhu	$7,16($sp)
	lhu	$8,24($sp)
	addiu	$6,$10,40
	sll	$5,$6,2
	sll	$2,$2,16
	sll	$3,$3,16
	sll	$4,$10,2
	addu	$2,$2,$7
	addu	$4,$15,$4
	addu	$3,$3,$8
	addu	$5,$15,$5
	addu	$6,$16,$6
	addu	$7,$16,$10
	sw	$22,0($13)
	sh	$18,8($7)
	sw	$2,36($4)
	sw	$2,0($4)
	sw	$2,4($4)
	sw	$2,32($4)
	sh	$18,0($7)
	sw	$3,36($5)
	sh	$17,8($6)
	sw	$3,0($5)
	sw	$3,4($5)
	sw	$3,32($5)
	sh	$17,0($6)
	bne	$23,$0,$L1765
	sll	$4,$11,2

	lw	$3,9752($12)
	sra	$6,$11,1
	mul	$2,$6,$3
	andi	$5,$11,0x1
	lw	$7,60($sp)
	addu	$3,$2,$5
	addu	$2,$7,$3
	lb	$2,0($2)
	beq	$2,$0,$L1846
	nop

	bgez	$2,$L1765
	lw	$25,56($sp)

	addu	$2,$25,$3
	lb	$3,0($2)
	bne	$3,$0,$L1765
	lw	$2,96($sp)

	lw	$3,9372($2)
	slt	$2,$3,34
	beq	$2,$0,$L1768
	nop

	bne	$3,$0,$L1765
	nop

$L1768:
	beq	$9,$0,$L1769
	lw	$7,64($sp)

$L1848:
	lw	$4,9748($12)
	sll	$2,$5,1
	sll	$3,$4,1
	addu	$3,$3,$4
	mul	$4,$3,$6
	addu	$2,$2,$5
	addu	$3,$4,$2
	sll	$3,$3,2
	addu	$3,$7,$3
	lhu	$2,0($3)
	addiu	$2,$2,1
	andi	$2,$2,0xffff
	sltu	$2,$2,3
	beq	$2,$0,$L1765
	nop

	lhu	$2,2($3)
	addiu	$2,$2,1
	andi	$2,$2,0xffff
	sltu	$2,$2,3
	beq	$2,$0,$L1765
	nop

	bne	$20,$0,$L1770
	sll	$2,$10,2

	addu	$2,$15,$2
	sw	$0,36($2)
	sw	$0,0($2)
	sw	$0,4($2)
	sw	$0,32($2)
$L1770:
	bne	$fp,$0,$L1765
	addiu	$2,$10,40

	sll	$2,$2,2
	addu	$2,$15,$2
	sw	$0,36($2)
	sw	$0,0($2)
	sw	$0,4($2)
	sw	$0,32($2)
$L1765:
	addiu	$11,$11,1
	addiu	$13,$13,4
	bne	$11,$24,$L1774
	addiu	$14,$14,4

	lw	$fp,140($sp)
$L1854:
	lw	$23,136($sp)
	lw	$22,132($sp)
	lw	$21,128($sp)
	lw	$20,124($sp)
	lw	$19,120($sp)
	lw	$18,116($sp)
	lw	$17,112($sp)
	lw	$16,108($sp)
	j	$31
	addiu	$sp,$sp,144

$L1728:
	li	$6,-2			# 0xfffffffffffffffe
	bne	$5,$6,$L1735
	addiu	$15,$8,32

$L1736:
	lb	$5,9459($10)
	xor	$4,$11,$23
	xor	$3,$11,$21
	sltu	$3,$3,1
	sltu	$4,$4,1
	xor	$2,$11,$5
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	beq	$3,$0,$L1747
	addiu	$15,$8,12

	li	$2,1			# 0x1
$L1860:
	beq	$4,$2,$L1847
	li	$3,-2			# 0xfffffffffffffffe

	bne	$21,$3,$L1747
	nop

	bne	$5,$3,$L1747
	nop

	beq	$23,$3,$L1747
	nop

$L1817:
	lh	$2,2($9)
	lh	$3,0($9)
	sw	$2,4($7)
	b	$L1743
	sw	$3,0($7)

$L1750:
	slt	$2,$4,$3
	beq	$2,$0,$L1816
	slt	$2,$4,$5

	move	$3,$5
	b	$L1816
	movz	$3,$4,$2

$L1748:
	slt	$2,$3,$4
	beq	$2,$0,$L1749
	slt	$2,$3,$5

	move	$4,$5
	b	$L1749
	movz	$4,$3,$2

$L1846:
	bne	$9,$0,$L1848
	lw	$7,68($sp)

$L1769:
	sll	$10,$5,1
	sll	$8,$6,1
	move	$5,$0
	addu	$6,$21,$4
$L1773:
	sra	$3,$5,1
	lw	$4,9748($12)
	addu	$3,$3,$8
	mul	$25,$3,$4
	andi	$2,$5,0x1
	addu	$2,$2,$10
	addu	$3,$25,$2
	sll	$3,$3,2
	addu	$3,$7,$3
	lhu	$2,0($3)
	addiu	$2,$2,1
	andi	$2,$2,0xffff
	sltu	$2,$2,3
	beq	$2,$0,$L1771
	addiu	$5,$5,1

	lhu	$2,2($3)
	addiu	$2,$2,1
	andi	$2,$2,0xffff
	sltu	$2,$2,3
	beq	$2,$0,$L1771
	nop

	bne	$20,$0,$L1772
	nop

	lbu	$2,0($6)
	sll	$2,$2,2
	addu	$2,$15,$2
	sw	$0,0($2)
$L1772:
	bne	$fp,$0,$L1771
	nop

	lbu	$2,0($6)
	addiu	$2,$2,40
	sll	$2,$2,2
	addu	$2,$15,$2
	sw	$0,0($2)
$L1771:
	bne	$5,$24,$L1773
	addiu	$6,$6,1

	addiu	$11,$11,1
	addiu	$13,$13,4
	bne	$11,$24,$L1774
	addiu	$14,$14,4

	b	$L1854
	lw	$fp,140($sp)

$L1794:
	lui	$6,%hi(scan8)
	addiu	$21,$6,%lo(scan8)
	addu	$14,$12,$2
	andi	$2,$22,0x8
	andi	$fp,$25,0x7
	addiu	$16,$12,9456
	addiu	$24,$12,9136
	move	$15,$21
	move	$13,$0
	sw	$2,84($sp)
	li	$23,4			# 0x4
$L1806:
	beq	$19,$0,$L1799
	nop

	lw	$2,0($14)
	andi	$2,$2,0x100
	beq	$2,$0,$L1800
	nop

$L1799:
	lbu	$8,0($15)
	sw	$22,0($14)
	addiu	$3,$8,40
	addu	$2,$16,$3
	sh	$0,8($2)
	sh	$0,0($2)
	beq	$fp,$0,$L1801
	sll	$7,$13,2

	sll	$2,$8,2
	sll	$3,$3,2
	addu	$2,$24,$2
	addu	$3,$24,$3
	addu	$4,$16,$8
	sw	$0,36($2)
	sw	$0,0($2)
	sw	$0,4($2)
	sw	$0,32($2)
	sh	$0,8($4)
	sw	$0,36($3)
	sh	$0,0($4)
	sw	$0,0($3)
	sw	$0,4($3)
	sw	$0,32($3)
$L1800:
	addiu	$13,$13,1
$L1855:
	addiu	$14,$14,4
	bne	$13,$23,$L1806
	addiu	$15,$15,4

	lw	$fp,140($sp)
	lw	$23,136($sp)
	lw	$22,132($sp)
	lw	$21,128($sp)
	lw	$20,124($sp)
	lw	$19,120($sp)
	lw	$18,116($sp)
	lw	$17,112($sp)
	lw	$16,108($sp)
	j	$31
	addiu	$sp,$sp,144

$L1776:
	addu	$2,$12,$2
	ori	$3,$5,0x1530
	move	$9,$2
	addiu	$2,$2,128
	addu	$20,$12,$3
	b	$L1777
	sw	$2,52($sp)

$L1844:
	lw	$6,60($sp)
	lb	$2,0($6)
	bne	$2,$0,$L1757
	lw	$25,68($sp)

	lhu	$2,0($25)
	addiu	$2,$2,1
	andi	$2,$2,0xffff
	sltu	$2,$2,3
	beq	$2,$0,$L1861
	lw	$3,28($sp)

	lhu	$2,2($25)
	addiu	$2,$2,1
	andi	$2,$2,0xffff
	sltu	$2,$2,3
	beq	$2,$0,$L1862
	lw	$2,20($sp)

$L1758:
	blez	$7,$L1850
	lw	$2,20($sp)

	lhu	$3,16($sp)
	sll	$2,$2,16
	addu	$4,$2,$3
$L1760:
	blez	$fp,$L1851
	lw	$2,28($sp)

	lhu	$3,24($sp)
	sll	$2,$2,16
	b	$L1762
	addu	$6,$2,$3

$L1842:
	move	$4,$5
	b	$L1749
	movz	$4,$3,$2

$L1841:
	lw	$6,6172($12)
	andi	$4,$6,0x1
	beq	$4,$0,$L1736
	nop

$L1731:
	lb	$2,9467($10)
	li	$5,-2			# 0xfffffffffffffffe
	beq	$2,$5,$L1736
	nop

	bne	$3,$0,$L1736
	lw	$3,36($sp)

	lw	$2,8768($12)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L1736
	ori	$2,$6,0x1

	sll	$2,$2,1
	addu	$2,$2,$4
	sll	$2,$2,1
	addiu	$2,$2,-1
	lw	$5,152($12)
	lw	$3,6168($12)
	sw	$2,44($sp)
	sra	$2,$2,2
	mul	$4,$2,$5
	sll	$3,$3,2
	addiu	$3,$3,-1
	sw	$3,92($sp)
	sra	$3,$3,2
	addu	$2,$4,$3
	lw	$6,36($sp)
	sll	$2,$2,2
	addu	$2,$6,$2
	li	$5,12288			# 0x3000
	lw	$2,0($2)
	sll	$4,$5,$18
	and	$4,$2,$4
	beq	$4,$0,$L1852
	andi	$2,$2,0x40

	lw	$4,76($sp)
$L1866:
	addiu	$2,$13,24
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$4,92($sp)
	lw	$3,9748($12)
	mtlo	$4
	lw	$4,44($sp)
	lw	$5,76($sp)
	madd	$4,$3
	lw	$4,0($2)
	mflo	$3
	addiu	$2,$13,46
	sll	$3,$3,2
	addu	$4,$4,$3
	lhu	$3,0($4)
	sll	$2,$2,2
	addu	$2,$5,$2
	sh	$3,9176($20)
	lh	$3,2($4)
	lw	$6,4($2)
	lw	$5,9752($12)
	b	$L1815
	lw	$4,44($sp)

$L1783:
$L1859:
	sw	$2,0($14)
	move	$15,$0
$L1784:
	li	$2,59272			# 0xe788
	lui	$3,%hi(scan8)
	addu	$11,$12,$2
	addiu	$13,$3,%lo(scan8)
	addiu	$18,$12,9456
	addiu	$17,$12,9136
	move	$10,$0
	li	$22,20744			# 0x5108
	addiu	$23,$sp,8
	li	$21,4			# 0x4
$L1793:
	beq	$19,$0,$L1863
	sra	$5,$10,1

	lw	$2,0($11)
	andi	$2,$2,0x100
	beq	$2,$0,$L1789
	nop

$L1863:
	sll	$2,$5,2
	addu	$2,$23,$2
	lbu	$8,0($13)
	lw	$3,0($2)
	addiu	$4,$8,40
	addu	$2,$18,$4
	andi	$3,$3,0x7
	sh	$0,8($2)
	sw	$22,0($11)
	beq	$3,$0,$L1790
	sh	$0,0($2)

	sll	$3,$4,2
	sll	$2,$8,2
	addu	$2,$17,$2
	addu	$3,$17,$3
	addu	$4,$18,$8
	sw	$0,36($2)
	sw	$0,0($2)
	sw	$0,4($2)
	sw	$0,32($2)
	sh	$0,8($4)
	sw	$0,36($3)
	sh	$0,0($4)
	sw	$0,0($3)
	sw	$0,4($3)
	sw	$0,32($3)
$L1789:
	addiu	$10,$10,1
	addiu	$11,$11,4
	bne	$10,$21,$L1793
	addiu	$13,$13,4

	lw	$fp,140($sp)
	lw	$23,136($sp)
	lw	$22,132($sp)
	lw	$21,128($sp)
	lw	$20,124($sp)
	lw	$19,120($sp)
	lw	$18,116($sp)
	lw	$17,112($sp)
	lw	$16,108($sp)
	j	$31
	addiu	$sp,$sp,144

$L1801:
	lw	$3,9752($12)
	sra	$6,$13,1
	mul	$2,$6,$3
	andi	$5,$13,0x1
	lw	$4,60($sp)
	addu	$3,$2,$5
	addu	$2,$4,$3
	lb	$2,0($2)
	bltz	$2,$L1802
	sll	$2,$2,2

	addu	$2,$9,$2
	lw	$3,0($2)
	lw	$25,68($sp)
$L1803:
	sll	$2,$3,8
	addu	$2,$2,$3
	addu	$4,$16,$8
	andi	$2,$2,0xffff
	sll	$3,$3,2
	sh	$2,8($4)
	sh	$2,0($4)
	lw	$4,84($sp)
	addu	$3,$20,$3
	beq	$4,$0,$L1804
	lw	$11,0($3)

	lw	$4,9748($12)
	sll	$3,$5,1
	sll	$2,$4,1
	addu	$2,$2,$4
	mul	$4,$2,$6
	addu	$3,$3,$5
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$25,$2
	lh	$5,2($2)
	lh	$7,0($2)
	mul	$3,$11,$5
	mul	$2,$11,$7
	addiu	$3,$3,128
	addiu	$2,$2,128
	sra	$2,$2,8
	sra	$3,$3,8
	subu	$5,$3,$5
	subu	$7,$2,$7
	addiu	$6,$8,40
	sll	$5,$5,16
	andi	$7,$7,0xffff
	sll	$6,$6,2
	sll	$3,$3,16
	andi	$2,$2,0xffff
	sll	$4,$8,2
	addu	$3,$3,$2
	addu	$5,$5,$7
	addu	$4,$24,$4
	addu	$6,$24,$6
	sw	$3,36($4)
	sw	$3,0($4)
	sw	$3,4($4)
	sw	$3,32($4)
	sw	$5,36($6)
	sw	$5,0($6)
	sw	$5,4($6)
	b	$L1800
	sw	$5,32($6)

$L1790:
	lw	$2,9752($12)
	sll	$14,$5,1
	sra	$3,$14,$15
	mul	$4,$3,$2
	andi	$7,$10,0x1
	lw	$6,60($sp)
	addu	$3,$4,$7
	addu	$4,$6,$3
	lb	$2,0($4)
	bltz	$2,$L1791
	sll	$2,$2,1

	sra	$2,$2,$15
	sll	$2,$2,2
	addu	$2,$9,$2
	lw	$6,0($2)
	lw	$16,68($sp)
$L1792:
	sll	$5,$5,3
	lw	$4,9748($12)
	subu	$5,$5,$14
	sra	$5,$5,$15
	mul	$3,$5,$4
	sll	$2,$7,1
	addu	$2,$2,$7
	addu	$5,$3,$2
	sll	$3,$6,8
	addu	$3,$3,$6
	andi	$3,$3,0xffff
	addu	$2,$18,$8
	sll	$5,$5,2
	sh	$3,8($2)
	sh	$3,0($2)
	addu	$5,$16,$5
	lh	$4,2($5)
	sll	$6,$6,2
	sll	$4,$4,$15
	addu	$6,$20,$6
	srl	$2,$4,31
	lw	$3,0($6)
	lh	$7,0($5)
	addu	$2,$2,$4
	sra	$2,$2,1
	mul	$4,$3,$2
	mul	$3,$3,$7
	addiu	$4,$4,128
	addiu	$3,$3,128
	sra	$3,$3,8
	sra	$4,$4,8
	subu	$2,$4,$2
	subu	$7,$3,$7
	addiu	$6,$8,40
	sll	$2,$2,16
	andi	$7,$7,0xffff
	sll	$6,$6,2
	sll	$4,$4,16
	andi	$3,$3,0xffff
	sll	$5,$8,2
	addu	$4,$4,$3
	addu	$2,$2,$7
	addu	$5,$17,$5
	addu	$6,$17,$6
	sw	$4,36($5)
	sw	$4,0($5)
	sw	$4,4($5)
	sw	$4,32($5)
	sw	$2,36($6)
	sw	$2,0($6)
	sw	$2,4($6)
	b	$L1789
	sw	$2,32($6)

$L1836:
	lw	$fp,12($sp)
	bgez	$fp,$L1725
	nop

	sw	$0,8($sp)
	sw	$0,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$0,16($sp)
	lw	$2,0($14)
	b	$L1726
	move	$fp,$0

$L1843:
	lw	$2,0($14)
	li	$3,-16385			# 0xffffffffffffbfff
	and	$2,$2,$3
	sw	$2,0($14)
	b	$L1726
	and	$22,$22,$3

$L1804:
	sll	$18,$5,1
	sll	$17,$6,1
	addu	$10,$21,$7
	move	$8,$0
$L1805:
	lw	$3,9748($12)
	sra	$4,$8,1
	addu	$4,$4,$17
	mul	$5,$4,$3
	andi	$2,$8,0x1
	addu	$2,$2,$18
	addu	$4,$5,$2
	sll	$4,$4,2
	addu	$4,$25,$4
	lh	$2,0($4)
	lbu	$6,0($10)
	mul	$2,$2,$11
	sll	$5,$6,2
	addiu	$2,$2,128
	addu	$5,$24,$5
	sra	$2,$2,8
	sh	$2,0($5)
	lh	$3,2($4)
	sll	$7,$2,16
	mul	$3,$3,$11
	sra	$7,$7,16
	addiu	$3,$3,128
	sra	$3,$3,8
	sll	$3,$3,16
	sra	$3,$3,16
	sh	$3,2($5)
	lh	$2,0($4)
	lh	$5,2($4)
	addiu	$6,$6,40
	subu	$7,$7,$2
	subu	$3,$3,$5
	sll	$6,$6,2
	sll	$3,$3,16
	andi	$7,$7,0xffff
	addu	$3,$3,$7
	addu	$6,$24,$6
	addiu	$8,$8,1
	sw	$3,0($6)
	bne	$8,$23,$L1805
	addiu	$10,$10,1

	b	$L1855
	addiu	$13,$13,1

$L1754:
	lw	$2,0($14)
	and	$2,$2,$3
	sw	$2,0($14)
	b	$L1726
	and	$22,$22,$3

$L1840:
	move	$9,$0
	move	$7,$0
	b	$L1796
	move	$6,$0

$L1802:
	lw	$25,56($sp)
	addu	$3,$25,$3
	lb	$2,0($3)
	lw	$3,52($sp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$25,64($sp)
	b	$L1803
	lw	$3,0($2)

$L1781:
	lw	$6,6172($12)
	lw	$7,152($12)
	li	$3,131072			# 0x20000
	lw	$5,9748($12)
	andi	$6,$6,0x1
	addu	$3,$12,$3
	li	$2,1			# 0x1
	li	$4,2			# 0x2
	movn	$4,$2,$6
	addu	$7,$8,$7
	lw	$6,-13528($3)
	sll	$7,$7,2
	lw	$3,9752($12)
	sll	$5,$5,1
	addu	$6,$6,$7
	mul	$5,$5,$4
	lw	$2,0($6)
	mul	$4,$4,$3
	lw	$6,56($sp)
	lw	$7,64($sp)
	lw	$25,60($sp)
	andi	$3,$2,0x1f
	sw	$2,12($sp)
	sw	$2,8($sp)
	lw	$2,68($sp)
	sll	$5,$5,2
	addu	$6,$6,$4
	addu	$7,$7,$5
	addu	$25,$25,$4
	addu	$2,$2,$5
	sw	$6,56($sp)
	sw	$7,64($sp)
	sw	$25,60($sp)
	beq	$3,$0,$L1787
	sw	$2,68($sp)

	bne	$19,$0,$L1864
	ori	$2,$10,0x40

	ori	$2,$10,0x8
	sw	$2,0($14)
	b	$L1784
	li	$15,2			# 0x2

$L1757:
	bgez	$2,$L1756
	lw	$3,56($sp)

	lb	$2,0($3)
	bne	$2,$0,$L1756
	lw	$4,64($sp)

	lhu	$2,0($4)
	addiu	$2,$2,1
	andi	$2,$2,0xffff
	sltu	$2,$2,3
	beq	$2,$0,$L1861
	lw	$3,28($sp)

	lhu	$2,2($4)
	addiu	$2,$2,1
	andi	$2,$2,0xffff
	sltu	$2,$2,3
	beq	$2,$0,$L1862
	lw	$2,20($sp)

	li	$2,131072			# 0x20000
	addu	$2,$12,$2
	lw	$2,9372($2)
	slt	$3,$2,34
	beq	$3,$0,$L1758
	nop

	bne	$2,$0,$L1756
	nop

	b	$L1758
	nop

$L1791:
	lw	$25,56($sp)
	lw	$16,64($sp)
	addu	$3,$25,$3
	lb	$2,0($3)
	lw	$3,52($sp)
	sll	$2,$2,1
	sra	$2,$2,$15
	sll	$2,$2,2
	addu	$2,$3,$2
	b	$L1792
	lw	$6,0($2)

$L1787:
	ori	$2,$10,0x40
$L1864:
	sw	$2,0($14)
	b	$L1784
	li	$15,2			# 0x2

$L1837:
	b	$L1731
	li	$4,1			# 0x1

$L1847:
	beq	$11,$23,$L1817
	nop

	beq	$11,$21,$L1853
	nop

	lh	$2,2($15)
	lh	$3,0($15)
	sw	$2,4($7)
	b	$L1743
	sw	$3,0($7)

$L1797:
	lw	$5,52($sp)
	lb	$2,0($4)
	lw	$3,64($sp)
	sll	$2,$2,2
	addu	$2,$5,$2
	lw	$9,0($2)
	lh	$5,0($3)
	sll	$2,$9,2
	addu	$2,$20,$2
	b	$L1798
	lw	$2,0($2)

$L1853:
	lh	$2,16($8)
	lh	$3,18($8)
	b	$L1816
	sw	$2,0($7)

$L1850:
	b	$L1760
	move	$4,$0

$L1851:
	b	$L1762
	move	$6,$0

$L1838:
	bne	$2,$0,$L1865
	lw	$4,76($sp)

	b	$L1735
	li	$5,-1			# 0xffffffffffffffff

$L1852:
	bne	$2,$0,$L1866
	lw	$4,76($sp)

	b	$L1735
	li	$5,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	pred_direct_motion
	.align	2
	.ent	decode_hrd_parameters
	.type	decode_hrd_parameters, @function
decode_hrd_parameters:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lw	$7,8456($4)
	lw	$2,8448($4)
	sra	$3,$7,3
	addu	$2,$2,$3
	move	$10,$4
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$7,0x7
	sll	$4,$3,$4
	li	$2,134217728			# 0x8000000
	lui	$28,%hi(__gnu_local_gp)
	sltu	$2,$4,$2
	addiu	$28,$28,%lo(__gnu_local_gp)
	beq	$2,$0,$L1888
	addiu	$9,$10,8448

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$4,$2
	bne	$2,$0,$L1870
	srl	$3,$4,16

	move	$3,$4
	move	$5,$0
$L1871:
	andi	$2,$3,0xff00
	beq	$2,$0,$L1891
	lw	$2,%got(ff_log2_tab)($28)

	srl	$3,$3,8
	addiu	$5,$5,8
$L1891:
	addu	$2,$2,$3
	lbu	$3,0($2)
	addu	$3,$3,$5
	sll	$3,$3,1
	addiu	$3,$3,-31
	subu	$2,$7,$3
	srl	$3,$4,$3
	addiu	$2,$2,40
	addiu	$11,$3,-1
	bltz	$11,$L1889
	sw	$2,8456($10)

$L1869:
	lw	$12,8448($10)
	lw	$15,%got(ff_log2_tab)($28)
	lw	$24,%got(ff_golomb_vlc_len)($28)
	move	$8,$0
	li	$13,134217728			# 0x8000000
	b	$L1884
	li	$14,-65536			# 0xffffffffffff0000

$L1874:
	bne	$2,$0,$L1876
	nop

	move	$5,$0
$L1877:
	andi	$2,$3,0xff00
	beq	$2,$0,$L1892
	addu	$2,$15,$3

	srl	$3,$3,8
	addiu	$5,$5,8
	addu	$2,$15,$3
$L1892:
	lbu	$3,0($2)
	addiu	$4,$7,63
	addu	$3,$3,$5
	sll	$3,$3,1
	subu	$4,$4,$3
	sw	$4,8($9)
$L1875:
	lw	$7,8($9)
	sra	$3,$7,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$3,$2,$3
	sltu	$4,$3,$13
	beq	$4,$0,$L1890
	and	$2,$3,$14

	bne	$2,$0,$L1881
	nop

	move	$5,$0
$L1882:
	andi	$2,$3,0xff00
	beq	$2,$0,$L1893
	addu	$2,$15,$3

	srl	$3,$3,8
	addiu	$5,$5,8
	addu	$2,$15,$3
$L1893:
	lbu	$3,0($2)
	addiu	$4,$7,63
	addu	$3,$3,$5
	sll	$3,$3,1
	subu	$4,$4,$3
	sw	$4,8($9)
	lw	$3,8456($10)
	addiu	$8,$8,1
	addiu	$3,$3,1
	slt	$2,$11,$8
	bne	$2,$0,$L1873
	sw	$3,8456($10)

$L1884:
	lw	$7,8($9)
	sra	$3,$7,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$3,$2,$3
	sltu	$4,$3,$13
	bne	$4,$0,$L1874
	and	$2,$3,$14

	srl	$2,$3,23
	addu	$2,$24,$2
	lbu	$3,0($2)
	addu	$3,$3,$7
	b	$L1875
	sw	$3,8($9)

$L1870:
	b	$L1871
	li	$5,16			# 0x10

$L1890:
	srl	$2,$3,23
	addu	$2,$24,$2
	lbu	$3,0($2)
	addiu	$8,$8,1
	addu	$3,$3,$7
	sw	$3,8($9)
	lw	$3,8456($10)
	slt	$2,$11,$8
	addiu	$3,$3,1
	beq	$2,$0,$L1884
	sw	$3,8456($10)

$L1873:
	addiu	$2,$3,20
	j	$31
	sw	$2,8456($10)

$L1881:
	srl	$3,$3,16
	b	$L1882
	li	$5,16			# 0x10

$L1876:
	srl	$3,$3,16
	b	$L1877
	li	$5,16			# 0x10

$L1888:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$4,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$7
	addu	$2,$2,$4
	addiu	$3,$3,8
	sw	$3,8456($10)
	b	$L1869
	lbu	$11,0($2)

$L1889:
	b	$L1873
	move	$3,$2

	.set	macro
	.set	reorder
	.end	decode_hrd_parameters
	.section	.rodata.str1.4
	.align	2
$LC22:
	.ascii	"slice type too large (%d) at %d %d\012\000"
	.align	2
$LC23:
	.ascii	"pps_id out of range\012\000"
	.align	2
$LC24:
	.ascii	"non existing PPS referenced\012\000"
	.align	2
$LC25:
	.ascii	"non existing SPS referenced\012\000"
	.align	2
$LC26:
	.ascii	"PAFF interlacing is not implemented\012\000"
	.align	2
$LC27:
	.ascii	"first_mb_in_slice overflow\012\000"
	.align	2
$LC28:
	.ascii	"MBAFF + spatial direct mode is not implemented\012\000"
	.align	2
$LC29:
	.ascii	"reference overflow\012\000"
	.align	2
$LC30:
	.ascii	"reference count overflow\012\000"
	.align	2
$LC31:
	.ascii	"abs_diff_pic_num overflow\012\000"
	.align	2
$LC32:
	.ascii	"long_term_pic_idx overflow\012\000"
	.align	2
$LC33:
	.ascii	"illegal reordering_of_pic_nums_idc\012\000"
	.align	2
$LC34:
	.ascii	"illegal long ref in memory management control operation "
	.ascii	"%d\012\000"
	.align	2
$LC35:
	.ascii	"illegal memory management control operation %d\012\000"
	.align	2
$LC36:
	.ascii	"cabac_init_idc overflow\012\000"
	.align	2
$LC37:
	.ascii	"QP %u out of range\012\000"
	.align	2
$LC38:
	.ascii	"deblocking_filter_idc %u out of range\012\000"
	.align	2
$LC39:
	.ascii	"Cannot parallelize deblocking type 1, decoding such fram"
	.ascii	"es in sequential order\012\000"
	.align	2
$LC40:
	.ascii	"F\000"
	.align	2
$LC41:
	.ascii	"B\000"
	.align	2
$LC42:
	.ascii	"T\000"
	.align	2
$LC43:
	.ascii	"c\000"
	.align	2
$LC44:
	.ascii	"\000"
	.align	2
$LC45:
	.ascii	"slice:%d %s mb:%d %c pps:%u frame:%d poc:%d/%d ref:%d/%d"
	.ascii	" qp:%d loop:%d:%d:%d weight:%d%s\012\000"
	.align	2
$LC46:
	.ascii	"reference picture missing during reorder\012\000"
	.text
	.align	2
	.ent	decode_slice_header
	.type	decode_slice_header, @function
decode_slice_header:
	.set	nomips16
	.frame	$sp,200,$31		# vars= 72, regs= 10/0, args= 80, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-200
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,196($sp)
	sw	$fp,192($sp)
	sw	$23,188($sp)
	sw	$22,184($sp)
	sw	$21,180($sp)
	sw	$20,176($sp)
	sw	$19,172($sp)
	sw	$18,168($sp)
	sw	$17,164($sp)
	sw	$16,160($sp)
	.cprestore	80
	lw	$8,8456($4)
	lw	$2,8704($4)
	lw	$15,8448($4)
	move	$17,$4
	sltu	$2,$2,1
	sra	$4,$8,3
	addu	$4,$15,$4
	sw	$2,2096($17)
	lbu	$2,0($4)
	lbu	$3,3($4)
	lbu	$6,1($4)
	lbu	$7,2($4)
	sll	$2,$2,24
	or	$3,$3,$2
	sll	$6,$6,16
	or	$3,$3,$6
	sll	$7,$7,8
	or	$3,$3,$7
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L2299
	sw	$5,204($sp)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$6,$2
	bne	$2,$0,$L1897
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L1898:
	andi	$2,$5,0xff00
	beq	$2,$0,$L2394
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L2394:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	addiu	$2,$2,-1
	sw	$4,8456($17)
	sw	$2,128($sp)
$L1896:
	lw	$2,60($17)
	andi	$2,$2,0x8000
	beq	$2,$0,$L1900
	lw	$2,128($sp)

	bne	$2,$0,$L1900
	lw	$3,204($sp)

	li	$2,131072			# 0x20000
	addu	$2,$3,$2
	sw	$0,9408($2)
	sw	$0,1880($17)
$L1900:
	lw	$8,8456($17)
	sra	$2,$8,3
	addu	$2,$15,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L2300
	lw	$2,%got(ff_golomb_vlc_len)($28)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$6,$2
	bne	$2,$0,$L1903
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L1904:
	andi	$2,$5,0xff00
	beq	$2,$0,$L2395
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L2395:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	sw	$4,8456($17)
	addiu	$2,$2,-1
$L1902:
	move	$4,$2
	sltu	$2,$2,10
	beq	$2,$0,$L2301
	li	$2,65536			# 0x10000

	sltu	$2,$4,5
	bne	$2,$0,$L1908
	li	$2,65536			# 0x10000

	addu	$2,$17,$2
	li	$3,1			# 0x1
	sw	$3,-6280($2)
	lui	$2,%hi(slice_type_map.12934)
	addiu	$4,$4,-5
	addiu	$2,$2,%lo(slice_type_map.12934)
	addu	$2,$4,$2
	lbu	$2,0($2)
	li	$3,1			# 0x1
	beq	$2,$3,$L2302
	sw	$2,88($sp)

$L1910:
	lw	$4,204($sp)
	li	$2,131072			# 0x20000
	addu	$2,$4,$2
	lw	$3,9408($2)
	bne	$3,$0,$L1912
	lw	$5,88($sp)

	move	$22,$0
$L1911:
	lw	$8,8456($17)
	lw	$6,88($sp)
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	sra	$4,$8,3
	addu	$4,$15,$4
	sw	$6,-6284($2)
	sw	$6,2084($17)
	lbu	$2,0($4)
	lbu	$3,3($4)
	lbu	$5,1($4)
	sll	$2,$2,24
	lbu	$6,2($4)
	or	$3,$3,$2
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$5,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$5,$2
	beq	$2,$0,$L2303
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$5,$2
	bne	$2,$0,$L1915
	srl	$6,$5,16

	move	$6,$5
	move	$7,$0
$L1916:
	andi	$2,$6,0xff00
	beq	$2,$0,$L2396
	lw	$3,%got(ff_log2_tab)($28)

	srl	$6,$6,8
	addiu	$7,$7,8
$L2396:
	addiu	$4,$8,32
	addu	$3,$3,$6
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$5,$2
	addiu	$2,$2,-1
	sw	$4,8456($17)
	sw	$2,124($sp)
$L1914:
	lw	$7,124($sp)
	sltu	$2,$7,256
	beq	$2,$0,$L2304
	lw	$8,124($sp)

	lw	$9,204($sp)
	addiu	$2,$8,2694
	sll	$2,$2,2
	addu	$2,$9,$2
	lw	$2,4($2)
	beq	$2,$0,$L2305
	addiu	$10,$17,11804

	move	$6,$2
	sw	$10,136($sp)
	move	$7,$10
	addiu	$8,$2,800
$L1920:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L1920
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$3,0($6)
	sw	$2,4($7)
	sw	$3,0($7)
	lw	$2,11804($17)
	lw	$3,204($sp)
	addiu	$2,$2,2446
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$2,4($2)
	beq	$2,$0,$L2306
	addiu	$19,$17,9916

	move	$6,$2
	move	$7,$19
	addiu	$8,$2,864
$L1922:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L1922
	addiu	$7,$7,16

	lw	$4,204($sp)
	beq	$17,$4,$L2307
	li	$2,65536			# 0x10000

$L1923:
	lw	$8,9972($17)
	lw	$5,9964($17)
	lw	$4,9968($17)
	li	$2,2			# 0x2
	subu	$2,$2,$8
	lw	$6,9988($17)
	mul	$7,$2,$4
	sll	$3,$5,3
	lw	$2,9992($17)
	subu	$3,$3,$6
	subu	$3,$3,$2
	sll	$3,$3,1
	sll	$2,$5,2
	sll	$4,$5,1
	sw	$2,9748($17)
	sw	$4,9752($17)
	sw	$3,4($17)
	sw	$5,144($17)
	beq	$8,$0,$L1924
	sw	$7,148($17)

	lw	$2,10000($17)
	sll	$3,$7,3
	lw	$4,9996($17)
	subu	$3,$3,$2
	subu	$3,$3,$4
	sll	$3,$3,1
	sw	$3,8($17)
$L1925:
	lw	$2,112($17)
	beq	$2,$0,$L1926
	lw	$5,204($sp)

	lw	$4,0($17)
	lw	$3,4($17)
	lw	$2,40($4)
	bne	$3,$2,$L2397
	lw	$2,204($sp)

	lw	$3,44($4)
	lw	$2,8($17)
	beq	$2,$3,$L1928
	lw	$2,204($sp)

$L2397:
	beq	$17,$2,$L2308
	nop

$L1929:
	li	$2,-1			# 0xffffffffffffffff
$L1907:
	lw	$31,196($sp)
$L2421:
	lw	$fp,192($sp)
	lw	$23,188($sp)
	lw	$22,184($sp)
	lw	$21,180($sp)
	lw	$20,176($sp)
	lw	$19,172($sp)
	lw	$18,168($sp)
	lw	$17,164($sp)
	lw	$16,160($sp)
	j	$31
	addiu	$sp,$sp,200

$L1897:
	b	$L1898
	li	$7,16			# 0x10

$L1926:
	bne	$17,$5,$L1907
	li	$2,-1			# 0xffffffffffffffff

$L2217:
	lw	$25,%call16(MPV_common_init)($28)
	jalr	$25
	move	$4,$17

	bltz	$2,$L1929
	lw	$28,80($sp)

	.option	pic0
	jal	init_scan_tables
	.option	pic2
	move	$4,$17

	.option	pic0
	jal	alloc_tables
	.option	pic2
	move	$4,$17

	lw	$18,0($17)
	lw	$3,620($18)
	sltu	$2,$3,2
	bne	$2,$0,$L1930
	lw	$28,80($sp)

	li	$2,131072			# 0x20000
	li	$5,65536			# 0x10000
	ori	$2,$2,0x24a4
	addiu	$3,$17,8704
	addiu	$4,$17,10780
	addu	$5,$17,$5
	li	$6,131072			# 0x20000
	addu	$21,$17,$2
	li	$23,1			# 0x1
	sw	$3,140($sp)
	sw	$4,144($sp)
	addiu	$fp,$17,12604
	sw	$5,156($sp)
	addu	$20,$17,$6
$L1934:
	lw	$25,%call16(av_malloc)($28)
	li	$4,131072			# 0x20000
	jalr	$25
	ori	$4,$4,0x24d0

	lw	$28,80($sp)
	move	$16,$2
	sw	$2,0($21)
	move	$6,$17
	move	$7,$2
$L1931:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	lw	$8,140($sp)
	addiu	$6,$6,16
	bne	$6,$8,$L1931
	addiu	$7,$7,16

	lw	$25,%call16(memset)($28)
	li	$6,131072			# 0x20000
	ori	$6,$6,0x2d0
	addiu	$4,$16,8704
	jalr	$25
	move	$5,$0

	move	$6,$19
	addiu	$7,$16,9916
$L1932:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	lw	$9,144($sp)
	addiu	$6,$6,16
	bne	$6,$9,$L1932
	addiu	$7,$7,16

	lw	$6,136($sp)
	addiu	$7,$16,11804
$L1933:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$fp,$L1933
	addiu	$7,$7,16

	lw	$2,0($fp)
	lw	$3,4($fp)
	move	$4,$16
	sw	$2,0($7)
	.option	pic0
	jal	init_scan_tables
	.option	pic2
	sw	$3,4($7)

	lw	$2,8684($20)
	li	$10,131072			# 0x20000
	addu	$3,$16,$10
	sw	$2,8684($3)
	lw	$2,156($sp)
	lw	$28,80($sp)
	lw	$6,-6288($2)
	lw	$4,9016($20)
	lw	$7,8816($17)
	lw	$8,9128($17)
	lw	$9,8660($20)
	lw	$10,9740($17)
	lw	$11,9744($17)
	lw	$12,8676($20)
	lw	$13,8688($20)
	li	$5,65536			# 0x10000
	addu	$2,$16,$5
	lw	$25,%call16(ff_h264_pred_init)($28)
	lw	$5,44($17)
	sw	$4,9016($3)
	sw	$6,-6288($2)
	sw	$9,8660($3)
	sw	$12,8676($3)
	sw	$13,8688($3)
	sw	$7,8816($16)
	sw	$8,9128($16)
	sw	$10,9740($16)
	sw	$11,9744($16)
	sw	$0,2048($16)
	jalr	$25
	addiu	$4,$16,8820

	lw	$18,0($17)
	addiu	$23,$23,1
	lw	$3,620($18)
	lw	$28,80($sp)
	sltu	$2,$23,$3
	bne	$2,$0,$L1934
	addiu	$21,$21,4

$L1930:
	beq	$3,$0,$L1935
	li	$2,131072			# 0x20000

	ori	$2,$2,0x24a0
	addu	$20,$17,$2
	move	$19,$0
	li	$21,-5376			# 0xffffffffffffeb00
$L1942:
	lw	$16,0($20)
	lw	$25,%call16(av_mallocz)($28)
	lw	$4,144($16)
	jalr	$25
	sll	$4,$4,5

	lw	$28,80($sp)
	beq	$2,$0,$L2309
	sw	$2,8996($16)

	lw	$4,144($16)
$L1938:
	lw	$25,%call16(av_mallocz)($28)
	jalr	$25
	sll	$4,$4,5

	lw	$28,80($sp)
	addiu	$19,$19,1
	lw	$25,%call16(av_mallocz)($28)
	addiu	$20,$20,4
	beq	$2,$0,$L2310
	sw	$2,9000($16)

$L1939:
	lw	$2,4($16)
	sll	$3,$2,4
	sll	$2,$2,2
	subu	$3,$3,$2
	sll	$4,$3,3
	subu	$4,$4,$3
	jalr	$25
	addiu	$4,$4,5376

	lw	$28,80($sp)
	move	$6,$2
	beq	$2,$0,$L2311
	sw	$2,2036($16)

	lw	$5,4($16)
$L1941:
	sll	$4,$5,1
	sll	$3,$5,3
	subu	$3,$3,$4
	lw	$18,0($17)
	sll	$2,$3,3
	subu	$2,$2,$3
	lw	$4,620($18)
	addiu	$2,$2,2688
	addu	$2,$6,$2
	sltu	$4,$19,$4
	bne	$4,$0,$L1942
	sw	$2,2040($16)

$L1935:
	lw	$2,4($17)
	sw	$2,40($18)
	lw	$3,8($17)
	sw	$3,44($18)
	lw	$2,10008($17)
	lw	$3,10012($17)
	sw	$2,400($18)
	bne	$3,$0,$L1943
	sw	$3,404($18)

	li	$2,1			# 0x1
	sw	$2,404($18)
$L1943:
	lw	$2,10016($17)
	beq	$2,$0,$L2286
	nop

	lw	$2,10020($17)
	lw	$4,10024($17)
	sll	$2,$2,1
	sw	$2,32($18)
	li	$2,131072			# 0x20000
	sw	$4,36($18)
	addu	$2,$17,$2
	lw	$3,9372($2)
	addiu	$3,$3,-1
	sltu	$3,$3,43
	beq	$3,$0,$L1944
	sll	$2,$4,1

	sw	$2,36($18)
$L1944:
	lw	$5,36($18)
	lw	$6,32($18)
	sra	$4,$5,31
	lw	$25,%call16(av_reduce)($28)
	li	$2,1073741824			# 0x40000000
	move	$3,$0
	sw	$4,20($sp)
	sw	$5,16($sp)
	sw	$2,24($sp)
	sw	$3,28($sp)
	addiu	$5,$18,36
	addiu	$4,$18,32
	jalr	$25
	sra	$7,$6,31

	lw	$28,80($sp)
$L2286:
	lw	$8,9972($17)
$L1928:
	lw	$7,8456($17)
	lw	$15,8448($17)
	sra	$2,$7,3
	addu	$2,$15,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	lw	$5,9928($17)
	andi	$2,$7,0x7
	or	$3,$3,$6
	sll	$3,$3,$2
	subu	$4,$0,$5
	li	$2,65536			# 0x10000
	addu	$7,$7,$5
	srl	$3,$3,$4
	addu	$5,$17,$2
	sw	$3,-6228($5)
	sw	$7,8456($17)
	sw	$0,-6268($5)
	beq	$8,$0,$L1945
	sw	$0,-6276($5)

	li	$2,3			# 0x3
	sw	$2,8500($17)
$L1946:
	lw	$6,204($sp)
	li	$2,131072			# 0x20000
	addu	$2,$6,$2
	lw	$3,9408($2)
	beq	$3,$0,$L2312
	nop

$L1948:
	lw	$7,204($sp)
	beq	$17,$7,$L2398
	li	$2,65536			# 0x10000

	lw	$9,204($sp)
	addiu	$6,$7,9548
	addiu	$8,$9,9740
	addiu	$7,$17,9548
$L1950:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L1950
	addiu	$7,$7,16

	lw	$10,204($sp)
	addiu	$7,$17,1464
	lw	$2,1880($10)
	addiu	$6,$10,1464
	sw	$2,1880($17)
	addiu	$8,$10,1864
$L1951:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L1951
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$4,0($6)
	sw	$2,4($7)
	sw	$4,0($7)
	lw	$2,204($sp)
	li	$5,131072			# 0x20000
	addu	$6,$2,$5
	li	$3,65536			# 0x10000
	addu	$2,$2,$3
	lw	$7,6828($6)
	lw	$6,204($sp)
	lw	$4,-6208($2)
	lw	$9,-6224($2)
	lw	$10,-6220($2)
	lw	$11,-6212($2)
	lw	$2,204($sp)
	ori	$12,$3,0x173c
	lw	$8,176($6)
	lw	$6,180($6)
	addu	$3,$17,$3
	addu	$5,$17,$5
	addu	$13,$2,$12
	sw	$7,6828($5)
	sw	$6,180($17)
	sw	$4,-6208($3)
	sw	$8,176($17)
	sw	$9,-6224($3)
	sw	$10,-6220($3)
	sw	$11,-6212($3)
	addu	$6,$17,$12
	addiu	$7,$13,128
$L1952:
	lw	$2,0($13)
	lw	$3,4($13)
	lw	$4,8($13)
	lw	$5,12($13)
	addiu	$13,$13,16
	sw	$2,0($6)
	sw	$3,4($6)
	sw	$4,8($6)
	sw	$5,12($6)
	bne	$13,$7,$L1952
	addiu	$6,$6,16

	li	$2,65536			# 0x10000
	lw	$3,204($sp)
	ori	$2,$2,0x17bc
	addu	$6,$3,$2
	addu	$7,$17,$2
	addiu	$8,$6,128
$L1953:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L1953
	addiu	$7,$7,16

	li	$2,65536			# 0x10000
	lw	$4,204($sp)
	ori	$2,$2,0x1840
	addu	$6,$4,$2
	addu	$7,$17,$2
	addiu	$8,$6,26112
$L1954:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L1954
	addiu	$7,$7,16

	li	$2,65536			# 0x10000
	lw	$5,204($sp)
	ori	$2,$2,0x7e40
	addu	$6,$5,$2
	li	$3,39168			# 0x9900
	addu	$7,$17,$2
	addu	$8,$6,$3
$L1955:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L1955
	addiu	$7,$7,16

	lw	$6,204($sp)
	li	$3,59204			# 0xe744
	li	$4,59228			# 0xe75c
	addu	$2,$6,$3
	addu	$5,$6,$4
	lw	$8,0($2)
	lw	$6,20($2)
	lw	$9,4($2)
	lw	$10,8($2)
	lw	$11,12($2)
	lw	$12,16($2)
	lw	$7,4($5)
	lw	$13,0($5)
	addu	$3,$17,$3
	addu	$4,$17,$4
	sw	$6,20($3)
	sw	$7,4($4)
	sw	$8,0($3)
	sw	$9,4($3)
	sw	$10,8($3)
	sw	$11,12($3)
	sw	$12,16($3)
	sw	$13,0($4)
	li	$2,65536			# 0x10000
$L2398:
	addu	$2,$17,$2
	lw	$3,-6228($2)
	lw	$7,1880($17)
	sw	$3,232($7)
	lw	$4,-6276($2)
	lw	$7,128($sp)
	lw	$3,172($17)
	sltu	$4,$0,$4
	sll	$2,$7,$4
	sltu	$2,$2,$3
	beq	$2,$0,$L1956
	sltu	$2,$7,$3

	beq	$2,$0,$L1956
	lw	$5,128($sp)

	lw	$2,144($17)
	lw	$9,8500($17)
	divu	$0,$5,$2
	teq	$2,$0,7
	mflo	$2
	mfhi	$3
	sll	$4,$2,$4
	li	$2,2			# 0x2
	sw	$3,7960($17)
	sw	$3,6168($17)
	sw	$4,6172($17)
	beq	$9,$2,$L2313
	sw	$4,7964($17)

$L1958:
	li	$2,3			# 0x3
	beq	$9,$2,$L2314
	li	$2,1			# 0x1

	li	$5,65536			# 0x10000
	addu	$5,$17,$5
	lw	$4,-6228($5)
	lw	$3,9928($17)
	sll	$4,$4,1
	addiu	$3,$3,1
	sll	$2,$2,$3
	addiu	$4,$4,1
	sw	$2,-6200($5)
	sw	$4,-6204($5)
$L1960:
	lw	$3,8708($17)
	li	$2,5			# 0x5
	beq	$3,$2,$L2315
	addiu	$18,$17,8448

$L1961:
	lw	$16,9932($17)
	beq	$16,$0,$L2316
	nop

$L1962:
	li	$2,1			# 0x1
	beq	$16,$2,$L2277
	nop

$L2288:
	lw	$9,8500($17)
$L1965:
	lw	$5,8708($17)
	li	$2,5			# 0x5
	beq	$5,$2,$L2317
	lw	$6,9928($17)

	li	$2,65536			# 0x10000
	addu	$4,$17,$2
	lw	$3,-6228($4)
	lw	$2,-6208($4)
	slt	$3,$3,$2
	beq	$3,$0,$L1968
	li	$2,1			# 0x1

	lw	$3,-6212($4)
	sll	$2,$2,$6
	addu	$2,$2,$3
	sw	$2,-6216($4)
$L1967:
	bne	$16,$0,$L2399
	li	$2,1			# 0x1

$L2331:
	lw	$2,9936($17)
	li	$3,1			# 0x1
	li	$4,5			# 0x5
	beq	$5,$4,$L2318
	sll	$6,$3,$2

$L1970:
	li	$2,65536			# 0x10000
	addu	$5,$17,$2
	lw	$4,-6248($5)
	lw	$3,-6220($5)
	slt	$2,$4,$3
	beq	$2,$0,$L1971
	slt	$2,$3,$4

	srl	$2,$6,31
	addu	$2,$2,$6
	subu	$3,$3,$4
	sra	$2,$2,1
	slt	$3,$3,$2
	beq	$3,$0,$L2319
	nop

$L1972:
	li	$2,65536			# 0x10000
$L2408:
	addu	$2,$17,$2
	lw	$3,-6224($2)
	sw	$3,-6244($2)
$L1973:
	li	$2,65536			# 0x10000
	addu	$6,$17,$2
	lw	$4,-6248($6)
	lw	$2,-6244($6)
	li	$3,3			# 0x3
	beq	$9,$3,$L1974
	addu	$5,$4,$2

$L2289:
	move	$4,$5
	move	$6,$5
$L1975:
	li	$2,2			# 0x2
	beq	$9,$2,$L2320
	nop

$L2218:
	lw	$7,1880($17)
	li	$2,1			# 0x1
	sw	$5,220($7)
	sw	$5,228($7)
	lw	$3,8500($17)
	beq	$3,$2,$L1992
	slt	$2,$4,$5

	move	$6,$4
	movz	$6,$5,$2
$L1991:
	sw	$4,228($7)
	sw	$4,224($7)
$L1992:
	sw	$6,228($7)
	lw	$2,11864($17)
	bne	$2,$0,$L2321
	nop

$L1993:
	li	$2,65536			# 0x10000
	addu	$6,$17,$2
	lw	$3,11824($17)
	lw	$4,11828($17)
	lw	$5,-6284($6)
	li	$2,2			# 0x2
	sw	$3,5936($6)
	beq	$5,$2,$L2290
	sw	$4,5940($6)

	li	$2,6			# 0x6
	beq	$5,$2,$L2290
	li	$2,3			# 0x3

	beq	$5,$2,$L2322
	nop

	sw	$0,5944($6)
$L2000:
	beq	$22,$0,$L2323
	nop

$L2001:
	.option	pic0
	jal	print_short_term
	.option	pic2
	move	$4,$17

	.option	pic0
	jal	print_long_term
	.option	pic2
	move	$4,$17

	li	$4,65536			# 0x10000
	addu	$2,$17,$4
	lw	$3,-6284($2)
	sw	$2,132($sp)
	li	$2,1			# 0x1
	beq	$3,$2,$L2002
	lw	$28,80($sp)

	li	$2,5			# 0x5
	beq	$3,$2,$L2002
	nop

	lw	$5,132($sp)
	lw	$2,5944($5)
	beq	$2,$0,$L2003
	ori	$2,$4,0x1730

	addu	$2,$17,$2
	sw	$2,92($sp)
	ori	$2,$4,0x1840
	addu	$2,$17,$2
	ori	$3,$4,0x7e40
	sw	$2,116($sp)
	li	$2,131072			# 0x20000
	addu	$2,$17,$2
	addu	$3,$17,$3
	lw	$22,92($sp)
	sw	$2,152($sp)
	sw	$3,112($sp)
	sw	$0,120($sp)
	move	$6,$0
	sw	$5,148($sp)
	li	$fp,134217728			# 0x8000000
$L2042:
	sll	$5,$6,10
	sll	$4,$6,7
	lw	$3,0($22)
	addu	$4,$4,$5
	sll	$2,$6,8
	sll	$7,$4,4
	addu	$4,$4,$7
	subu	$5,$5,$2
	sll	$6,$3,5
	lw	$7,112($sp)
	sll	$3,$3,3
	subu	$6,$6,$3
	sll	$2,$5,4
	lw	$8,116($sp)
	lw	$25,%call16(memcpy)($28)
	addu	$5,$5,$2
	addu	$16,$7,$4
	sll	$2,$6,4
	addu	$5,$8,$5
	move	$4,$16
	jalr	$25
	addu	$6,$6,$2

	lw	$5,8456($17)
	lw	$3,8448($17)
	sra	$4,$5,3
	addu	$3,$3,$4
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,1
	srl	$2,$2,7
	lw	$28,80($sp)
	beq	$2,$0,$L2004
	sw	$5,8456($17)

	lw	$9,120($sp)
	li	$10,65536			# 0x10000
	sll	$3,$9,10
	sll	$2,$9,7
	addu	$2,$2,$3
	sll	$4,$2,4
	addu	$2,$2,$4
	lw	$4,148($sp)
	ori	$10,$10,0x7e40
	addu	$3,$2,$10
	lw	$19,-6204($4)
	move	$21,$16
	addu	$20,$17,$3
	move	$23,$2
	move	$16,$0
$L2041:
	lw	$7,8($18)
	lw	$12,0($18)
	sra	$3,$7,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$5,$2,$3
	sltu	$4,$5,$fp
	beq	$4,$0,$L2324
	lw	$6,%got(ff_ue_golomb_vlc_code)($28)

	li	$8,-65536			# 0xffffffffffff0000
	and	$2,$5,$8
	bne	$2,$0,$L2007
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L2008:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2400
	lw	$9,%got(ff_log2_tab)($28)

	srl	$3,$3,8
	addiu	$6,$6,8
$L2400:
	addiu	$4,$7,32
	addu	$2,$9,$3
	lbu	$3,0($2)
	addu	$3,$3,$6
	sll	$3,$3,1
	addiu	$3,$3,-31
	subu	$4,$4,$3
	srl	$3,$5,$3
	sw	$4,8($18)
	addiu	$7,$3,-1
$L2006:
	li	$10,3			# 0x3
	beq	$7,$10,$L2004
	nop

	lw	$2,0($22)
	sltu	$2,$16,$2
	beq	$2,$0,$L2325
	sltu	$2,$7,3

	beq	$2,$0,$L2011
	li	$2,2			# 0x2

	bne	$7,$2,$L2326
	nop

	lw	$7,8($18)
	sra	$3,$7,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$5,$2,$3
	sltu	$4,$5,$fp
	beq	$4,$0,$L2327
	lw	$6,%got(ff_ue_golomb_vlc_code)($28)

	li	$8,-65536			# 0xffffffffffff0000
	and	$2,$5,$8
	bne	$2,$0,$L2027
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L2028:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2401
	lw	$9,%got(ff_log2_tab)($28)

	srl	$3,$3,8
	addiu	$6,$6,8
$L2401:
	addiu	$4,$7,32
	addu	$2,$9,$3
	lbu	$3,0($2)
	addu	$3,$3,$6
	sll	$3,$3,1
	addiu	$3,$3,-31
	subu	$4,$4,$3
	srl	$3,$5,$3
	sw	$4,8($18)
	addiu	$3,$3,-1
$L2026:
	slt	$2,$3,32
	beq	$2,$0,$L2328
	lw	$4,8500($17)

	addiu	$2,$3,17902
	sll	$2,$2,2
	addu	$2,$17,$2
	lw	$11,4($2)
	beq	$11,$0,$L2021
	nop

	lw	$2,80($11)
	and	$2,$4,$2
	beq	$2,$0,$L2021
	nop

	sw	$3,236($11)
$L2219:
	sll	$2,$16,3
	sll	$3,$16,5
	subu	$3,$3,$2
	sll	$4,$3,4
	addu	$3,$3,$4
	li	$10,65536			# 0x10000
	lw	$7,0($22)
	move	$6,$16
	addu	$3,$3,$23
	ori	$10,$10,0x7f30
	addiu	$5,$6,1
	addu	$3,$3,$10
	sltu	$2,$5,$7
	beq	$2,$0,$L2036
	addu	$4,$17,$3

$L2035:
	lw	$3,0($4)
	lw	$2,240($11)
	beq	$2,$3,$L2329
	nop

	addiu	$4,$4,408
	move	$6,$5
$L2334:
	addiu	$5,$6,1
	sltu	$2,$5,$7
	bne	$2,$0,$L2035
	nop

$L2036:
	slt	$2,$16,$6
	beq	$2,$0,$L2034
	addiu	$10,$6,-1

	sll	$2,$10,3
	sll	$3,$10,5
	subu	$3,$3,$2
	sll	$4,$3,4
	addu	$3,$3,$4
	li	$2,65536			# 0x10000
	addu	$3,$3,$23
	ori	$2,$2,0x7e40
	addu	$3,$3,$2
	addu	$8,$17,$3
$L2038:
	move	$7,$8
	addiu	$6,$8,408
	addiu	$9,$8,400
$L2037:
	lwl	$2,3($7)
	lwl	$3,7($7)
	lwl	$4,11($7)
	lwl	$5,15($7)
	lwr	$2,0($7)
	lwr	$3,4($7)
	lwr	$4,8($7)
	lwr	$5,12($7)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	swr	$3,4($6)
	swl	$4,11($6)
	swr	$4,8($6)
	addiu	$7,$7,16
	swl	$5,15($6)
	swr	$5,12($6)
	bne	$7,$9,$L2037
	addiu	$6,$6,16

	lwl	$2,3($7)
	lwl	$3,7($7)
	lwr	$2,0($7)
	lwr	$3,4($7)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	slt	$2,$16,$10
	swr	$3,4($6)
	beq	$2,$0,$L2034
	addiu	$8,$8,-408

	b	$L2038
	addiu	$10,$10,-1

$L1908:
	addu	$2,$17,$2
	sw	$0,-6280($2)
	lui	$2,%hi(slice_type_map.12934)
	addiu	$2,$2,%lo(slice_type_map.12934)
	addu	$2,$4,$2
	lbu	$2,0($2)
	li	$3,1			# 0x1
	bne	$2,$3,$L1910
	sw	$2,88($sp)

$L2302:
	b	$L1911
	li	$22,1			# 0x1

$L1924:
	lw	$2,9996($17)
	sll	$3,$7,2
	lw	$4,10000($17)
	subu	$3,$3,$2
	subu	$3,$3,$4
	sll	$3,$3,2
	b	$L1925
	sw	$3,8($17)

$L2299:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lbu	$2,0($2)
	sw	$3,8456($17)
	b	$L1896
	sw	$2,128($sp)

$L2300:
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($17)
	b	$L1902
	lbu	$2,0($2)

$L2303:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$5,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lbu	$2,0($2)
	sw	$3,8456($17)
	b	$L1914
	sw	$2,124($sp)

$L1912:
	lw	$2,9420($2)
	xor	$2,$2,$5
	b	$L1911
	sltu	$22,$2,1

$L1945:
	sra	$2,$7,3
	addu	$2,$15,$2
	lbu	$3,0($2)
	andi	$4,$7,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$4,$7,1
	srl	$3,$3,7
	bne	$3,$0,$L2330
	sw	$4,8456($17)

	lw	$2,9976($17)
	li	$3,3			# 0x3
	sw	$2,-6276($5)
	b	$L1946
	sw	$3,8500($17)

$L1956:
	lui	$6,%hi($LC27)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	addiu	$6,$6,%lo($LC27)
$L2293:
	jalr	$25
	move	$5,$0

	lw	$31,196($sp)
	lw	$28,80($sp)
	li	$2,-1			# 0xffffffffffffffff
	lw	$fp,192($sp)
	lw	$23,188($sp)
	lw	$22,184($sp)
	lw	$21,180($sp)
	lw	$20,176($sp)
	lw	$19,172($sp)
	lw	$18,168($sp)
	lw	$17,164($sp)
	lw	$16,160($sp)
	j	$31
	addiu	$sp,$sp,200

$L1903:
	b	$L1904
	li	$7,16			# 0x10

$L1915:
	b	$L1916
	li	$7,16			# 0x10

$L1968:
	lw	$2,-6212($4)
	beq	$16,$0,$L2331
	sw	$2,-6216($4)

	li	$2,1			# 0x1
$L2399:
	beq	$16,$2,$L2332
	li	$2,5			# 0x5

	beq	$5,$2,$L2333
	move	$4,$0

	lw	$2,8704($17)
	beq	$2,$0,$L1990
	li	$2,65536			# 0x10000

	addu	$2,$17,$2
	lw	$4,-6216($2)
	lw	$3,-6228($2)
	addu	$3,$3,$4
	sll	$5,$3,1
	move	$4,$5
	b	$L1975
	move	$6,$5

$L2277:
	lw	$2,9940($17)
	bne	$2,$0,$L2288
	nop

	.option	pic0
	jal	get_se_golomb
	.option	pic2
	move	$4,$18

	li	$3,65536			# 0x10000
	lw	$4,11812($17)
	addu	$19,$17,$3
	lw	$28,80($sp)
	beq	$4,$16,$L2279
	sw	$2,-6236($19)

	lw	$9,8500($17)
	b	$L1965
	lw	$16,9932($17)

$L2329:
	lw	$3,-4($4)
	lw	$2,236($11)
	beq	$2,$3,$L2036
	addiu	$4,$4,408

	b	$L2334
	move	$6,$5

$L1974:
	lw	$2,-6240($6)
	addu	$4,$5,$2
$L1976:
	slt	$2,$5,$4
	move	$6,$5
	b	$L2218
	movz	$6,$4,$2

$L2034:
	move	$7,$11
	move	$6,$20
	addiu	$8,$11,400
$L2039:
	lw	$2,0($7)
	lw	$3,4($7)
	lw	$4,8($7)
	lw	$5,12($7)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	swr	$3,4($6)
	swl	$4,11($6)
	swr	$4,8($6)
	swl	$5,15($6)
	addiu	$7,$7,16
	swr	$5,12($6)
	bne	$7,$8,$L2039
	addiu	$6,$6,16

	lw	$2,0($7)
	lw	$3,4($7)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	swr	$3,4($6)
$L2040:
	addiu	$16,$16,1
	addiu	$21,$21,408
	b	$L2041
	addiu	$20,$20,408

$L2326:
	lw	$8,8($18)
	sra	$3,$8,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$8,0x7
	sll	$5,$2,$3
	sltu	$4,$5,$fp
	beq	$4,$0,$L2335
	li	$9,-65536			# 0xffffffffffff0000

	and	$2,$5,$9
	bne	$2,$0,$L2015
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L2016:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2402
	lw	$10,%got(ff_log2_tab)($28)

	srl	$3,$3,8
	addiu	$6,$6,8
$L2402:
	addiu	$4,$8,32
	addu	$2,$10,$3
	lbu	$3,0($2)
	addu	$3,$3,$6
	sll	$3,$3,1
	addiu	$3,$3,-31
	subu	$4,$4,$3
	srl	$3,$5,$3
	sw	$4,8($18)
	addiu	$2,$3,-1
$L2014:
	lw	$3,148($sp)
	lw	$5,-6200($3)
	addiu	$3,$2,1
	sltu	$2,$3,$5
	beq	$2,$0,$L2336
	lui	$6,%hi($LC31)

	bne	$7,$0,$L2019
	nop

	subu	$3,$19,$3
$L2020:
	lw	$4,152($sp)
	addiu	$2,$5,-1
	lw	$6,6828($4)
	and	$19,$3,$2
	addiu	$5,$6,-1
	bltz	$5,$L2021
	lw	$4,8500($17)

	addiu	$2,$6,17869
	sll	$2,$2,2
	addu	$2,$17,$2
	addiu	$3,$2,4
$L2024:
	lw	$11,0($3)
	addiu	$5,$5,-1
	lw	$2,0($11)
	beq	$2,$0,$L2022
	addiu	$3,$3,-4

	lw	$2,232($11)
	bne	$19,$2,$L2022
	nop

	lw	$2,80($11)
	and	$2,$4,$2
	beq	$2,$0,$L2022
	nop

	lw	$2,240($11)
	beq	$2,$0,$L2023
	nop

$L2022:
	bgez	$5,$L2024
	nop

$L2021:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC46)
	move	$5,$0
	jalr	$25
	addiu	$6,$6,%lo($LC46)

	lw	$28,80($sp)
	move	$4,$21
	lw	$25,%call16(memset)($28)
	move	$5,$0
	jalr	$25
	li	$6,408			# 0x198

	b	$L2040
	lw	$28,80($sp)

$L2324:
	srl	$4,$5,23
	lw	$5,%got(ff_golomb_vlc_len)($28)
	addu	$3,$5,$4
	lbu	$2,0($3)
	addu	$4,$6,$4
	addu	$2,$2,$7
	sw	$2,8($18)
	b	$L2006
	lbu	$7,0($4)

$L2327:
	srl	$4,$5,23
	lw	$5,%got(ff_golomb_vlc_len)($28)
	addu	$3,$5,$4
	lbu	$2,0($3)
	addu	$4,$6,$4
	addu	$2,$2,$7
	sw	$2,8($18)
	b	$L2026
	lbu	$3,0($4)

$L2023:
	b	$L2219
	sw	$19,236($11)

$L2007:
	b	$L2008
	li	$6,16			# 0x10

$L2027:
	b	$L2028
	li	$6,16			# 0x10

$L2019:
	b	$L2020
	addu	$3,$3,$19

$L2335:
	srl	$4,$5,23
	lw	$5,%got(ff_golomb_vlc_len)($28)
	lw	$6,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$5,$4
	lbu	$2,0($3)
	addu	$4,$6,$4
	addu	$2,$2,$8
	sw	$2,8($18)
	b	$L2014
	lbu	$2,0($4)

$L2004:
	lw	$4,148($sp)
	lw	$5,120($sp)
	lw	$3,5944($4)
	addiu	$5,$5,1
	sltu	$2,$5,$3
	sw	$5,120($sp)
	addiu	$22,$22,4
	bne	$2,$0,$L2042
	move	$6,$5

	beq	$3,$0,$L2337
	li	$2,65536			# 0x10000

	addu	$14,$17,$2
	move	$10,$0
	ori	$12,$2,0x7e40
	addiu	$13,$17,1464
	addiu	$11,$17,1864
$L2047:
	lw	$4,92($sp)
	lw	$5,0($4)
	beq	$5,$0,$L2048
	sll	$2,$10,7

	sll	$3,$10,10
	addu	$2,$2,$3
	sll	$4,$2,4
	addu	$2,$2,$4
	addu	$2,$2,$12
	addu	$7,$17,$2
	b	$L2046
	move	$8,$0

$L2044:
	addiu	$8,$8,1
	sltu	$2,$8,$5
	beq	$2,$0,$L2048
	addiu	$7,$7,408

$L2046:
	lw	$2,0($7)
	bne	$2,$0,$L2044
	move	$9,$13

	move	$6,$7
$L2045:
	lw	$2,0($9)
	lw	$3,4($9)
	lw	$4,8($9)
	lw	$5,12($9)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	swr	$3,4($6)
	swl	$4,11($6)
	swr	$4,8($6)
	swl	$5,15($6)
	addiu	$9,$9,16
	swr	$5,12($6)
	bne	$9,$11,$L2045
	addiu	$6,$6,16

	lw	$2,0($11)
	lw	$3,4($11)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	swr	$3,4($6)
	lw	$9,92($sp)
	b	$L2044
	lw	$5,0($9)

$L2015:
	b	$L2016
	li	$6,16			# 0x10

$L2322:
	lw	$5,8456($17)
	lw	$15,8448($17)
	sra	$2,$5,3
	addu	$2,$15,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	lw	$2,9976($17)
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$3,5356($6)
	beq	$2,$0,$L1994
	sw	$5,8456($17)

	beq	$3,$0,$L2403
	sra	$2,$5,3

	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC28)
	addiu	$6,$6,%lo($LC28)
	jalr	$25
	move	$5,$0

$L2290:
	lw	$5,8456($17)
	lw	$15,8448($17)
$L1994:
	sra	$2,$5,3
$L2403:
	addu	$2,$15,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$2,$5,1
	srl	$3,$3,7
	bne	$3,$0,$L2338
	sw	$2,8456($17)

$L1996:
	li	$2,65536			# 0x10000
	addu	$4,$17,$2
	lw	$3,-6284($4)
	li	$2,3			# 0x3
	beq	$3,$2,$L2339
	li	$2,1			# 0x1

	bne	$22,$0,$L2001
	sw	$2,5944($4)

$L2323:
	.option	pic0
	jal	fill_default_ref_list
	.option	pic2
	move	$4,$17

	b	$L2001
	nop

$L2307:
	addu	$2,$17,$2
	lw	$3,-6300($2)
	lw	$5,124($sp)
	beq	$3,$5,$L1923
	nop

	sw	$5,-6300($2)
	.option	pic0
	jal	init_dequant_tables
	.option	pic2
	move	$4,$17

	b	$L1923
	lw	$28,80($sp)

$L2321:
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	li	$3,65536			# 0x10000
	addu	$3,$17,$3
	lw	$28,80($sp)
	b	$L1993
	sw	$2,5352($3)

$L2320:
	b	$L1991
	lw	$7,1880($17)

$L2316:
	lw	$5,9936($17)
	.option	pic0
	jal	get_bits
	.option	pic2
	move	$4,$18

	li	$4,65536			# 0x10000
	addu	$19,$17,$4
	lw	$3,11812($17)
	sw	$2,-6248($19)
	li	$2,1			# 0x1
	beq	$3,$2,$L1963
	lw	$28,80($sp)

$L2287:
	b	$L1962
	lw	$16,9932($17)

$L2314:
	li	$3,65536			# 0x10000
	addu	$3,$17,$3
	lw	$4,9928($17)
	lw	$5,-6228($3)
	sll	$2,$2,$4
	sw	$2,-6200($3)
	b	$L1960
	sw	$5,-6204($3)

$L2313:
	addiu	$2,$4,1
	sw	$2,7964($17)
	b	$L1958
	sw	$2,6172($17)

$L2317:
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	b	$L1967
	sw	$0,-6216($2)

$L2330:
	sra	$2,$4,3
	addu	$2,$15,$2
	lbu	$3,0($2)
	andi	$4,$4,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	srl	$3,$3,7
	lw	$25,%call16(av_log)($28)
	addiu	$2,$7,2
	addiu	$3,$3,1
	lw	$4,0($17)
	lui	$6,%hi($LC26)
	sw	$2,8456($17)
	sw	$3,8500($17)
	addiu	$6,$6,%lo($LC26)
	jalr	$25
	move	$5,$0

	b	$L1946
	lw	$28,80($sp)

$L2385:
	move	$3,$0
$L2067:
	sw	$3,0($5)
$L2065:
	lw	$2,0($9)
$L2391:
	addiu	$10,$10,1
	slt	$2,$10,$2
	bne	$2,$0,$L2070
	addiu	$5,$5,4

$L2072:
	addiu	$8,$8,1
	addiu	$9,$9,4
	bne	$8,$21,$L2064
	addiu	$12,$12,19584

	li	$4,65536			# 0x10000
	addu	$2,$17,$4
	lw	$3,-6276($2)
	beq	$3,$0,$L2002
	nop

	ori	$9,$4,0x1630
	move	$7,$0
	ori	$8,$4,0x15b0
	li	$10,2			# 0x2
$L2073:
	lw	$2,0($11)
	blez	$2,$L2075
	sll	$2,$7,6

	sll	$3,$7,7
	addu	$2,$2,$8
	addu	$3,$3,$9
	addu	$6,$17,$2
	addu	$4,$17,$3
	move	$5,$0
$L2074:
	lw	$2,0($6)
	addiu	$5,$5,1
	sll	$2,$2,1
	addiu	$3,$2,1
	sw	$3,4($4)
	sw	$2,0($4)
	lw	$3,0($11)
	addiu	$6,$6,4
	slt	$3,$5,$3
	bne	$3,$0,$L2074
	addiu	$4,$4,8

$L2075:
	addiu	$7,$7,1
	bne	$7,$10,$L2073
	addiu	$11,$11,4

$L2002:
	lw	$2,11832($17)
	beq	$2,$0,$L2076
	li	$2,65536			# 0x10000

	addu	$2,$17,$2
	lw	$4,-6284($2)
	li	$3,2			# 0x2
	beq	$4,$3,$L2077
	li	$2,6			# 0x6

	beq	$4,$2,$L2077
	nop

$L2076:
	lw	$3,11836($17)
	li	$4,1			# 0x1
	beq	$3,$4,$L2340
	li	$2,2			# 0x2

	beq	$3,$2,$L2341
	li	$2,65536			# 0x10000

$L2411:
	addu	$2,$17,$2
	sw	$0,-6196($2)
$L2132:
	lw	$2,8704($17)
$L2388:
	bne	$2,$0,$L2342
	lw	$2,204($sp)

$L2145:
	li	$4,65536			# 0x10000
	addu	$2,$17,$4
	lw	$3,-6276($2)
	bne	$3,$0,$L2343
	ori	$3,$4,0x1730

$L2174:
	li	$2,65536			# 0x10000
$L2387:
	addu	$2,$17,$2
	lw	$4,-6284($2)
	li	$3,1			# 0x1
	beq	$4,$3,$L2185
	li	$2,5			# 0x5

	beq	$4,$2,$L2185
	nop

	lw	$2,11808($17)
	bne	$2,$0,$L2344
	nop

$L2185:
	lw	$9,8456($17)
	lw	$6,8448($17)
	li	$2,131072			# 0x20000
	addu	$2,$17,$2
	sra	$3,$9,3
	sw	$0,8680($2)
	addu	$6,$6,$3
	lbu	$2,0($6)
	lbu	$3,3($6)
	lbu	$4,1($6)
	sll	$2,$2,24
	lbu	$5,2($6)
	or	$3,$3,$2
	sll	$4,$4,16
	or	$3,$3,$4
	sll	$5,$5,8
	or	$3,$3,$5
	andi	$4,$9,0x7
	sll	$8,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$8,$2
	beq	$2,$0,$L2345
	lw	$7,11840($17)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$8,$2
	bne	$2,$0,$L2189
	srl	$5,$8,16

	move	$5,$8
	move	$6,$0
$L2190:
	andi	$2,$5,0xff00
	beq	$2,$0,$L2404
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L2404:
	addiu	$4,$9,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$8,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L2192
	sw	$4,8456($17)

	srl	$2,$5,1
	subu	$2,$0,$2
$L2188:
	addu	$7,$2,$7
	sltu	$2,$7,52
	beq	$2,$0,$L2346
	lui	$6,%hi($LC37)

	andi	$4,$7,0xff
	li	$2,65536			# 0x10000
	addu	$4,$17,$4
	addu	$2,$17,$2
	lbu	$5,12352($4)
	lw	$6,-6284($2)
	lbu	$3,12096($4)
	li	$2,6			# 0x6
	sw	$3,8740($17)
	sw	$5,8744($17)
	beq	$6,$2,$L2347
	sw	$7,2056($17)

$L2195:
	addiu	$2,$6,-5
	sltu	$2,$2,2
	bne	$2,$0,$L2348
	nop

$L2196:
	li	$3,65536			# 0x10000
	lw	$2,11856($17)
	addu	$16,$17,$3
	li	$4,1			# 0x1
	sw	$4,5340($16)
	sw	$0,5344($16)
	bne	$2,$0,$L2349
	sw	$0,5348($16)

$L2197:
	lw	$18,0($17)
	lw	$5,708($18)
	slt	$2,$5,48
	beq	$2,$0,$L2390
	li	$2,65536			# 0x10000

	slt	$2,$5,32
	bne	$2,$0,$L2405
	slt	$2,$5,16

	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	lw	$4,-6284($2)
	li	$3,1			# 0x1
	beq	$4,$3,$L2201
	li	$2,65536			# 0x10000

$L2390:
	addu	$2,$17,$2
$L2422:
	sw	$0,5340($2)
$L2204:
	lw	$2,204($sp)
$L2407:
	lw	$4,56($17)
	li	$3,131072			# 0x20000
	li	$5,65536			# 0x10000
	addu	$3,$2,$3
	addu	$5,$17,$5
	lw	$6,9408($3)
	andi	$4,$4,0x4000
	lw	$7,-6276($5)
	li	$2,16			# 0x10
	movn	$2,$0,$4
	lw	$4,88($sp)
	addiu	$6,$6,1
	sw	$2,9764($17)
	movn	$2,$0,$7
	sw	$4,9420($3)
	sw	$6,9408($3)
	sw	$2,9768($17)
	sw	$6,-6296($5)
	lw	$2,412($18)
	andi	$2,$2,0x1
	beq	$2,$0,$L2210
	move	$3,$18

	lw	$3,8500($17)
	li	$2,3			# 0x3
	beq	$3,$2,$L2350
	move	$20,$6

	li	$2,1			# 0x1
	beq	$3,$2,$L2213
	lui	$2,%hi($LC41)

	addiu	$19,$2,%lo($LC41)
$L2212:
	li	$2,65536			# 0x10000
	addu	$16,$17,$2
	lw	$25,%call16(av_get_pict_type_char)($28)
	jalr	$25
	lw	$4,-6284($16)

	lw	$3,1880($17)
	lw	$12,-6196($16)
	move	$15,$2
	li	$2,1			# 0x1
	lw	$28,80($sp)
	lw	$13,224($3)
	lw	$11,-6228($16)
	lw	$14,220($3)
	lw	$10,5936($16)
	lw	$9,5940($16)
	lw	$8,2056($17)
	lw	$7,5340($16)
	lw	$5,5344($16)
	beq	$12,$2,$L2351
	lw	$4,5348($16)

	lui	$2,%hi($LC44)
$L2416:
	addiu	$6,$2,%lo($LC44)
$L2215:
	srl	$2,$5,31
	srl	$3,$4,31
	addu	$2,$2,$5
	addu	$3,$3,$4
	lw	$5,128($sp)
	lw	$4,124($sp)
	sra	$3,$3,1
	lw	$25,%call16(av_log)($28)
	sra	$2,$2,1
	sw	$6,72($sp)
	lui	$6,%hi($LC45)
	sw	$5,20($sp)
	sw	$4,28($sp)
	sw	$7,56($sp)
	sw	$3,64($sp)
	sw	$19,16($sp)
	sw	$15,24($sp)
	sw	$11,32($sp)
	sw	$14,36($sp)
	sw	$13,40($sp)
	sw	$10,44($sp)
	sw	$9,48($sp)
	sw	$8,52($sp)
	sw	$2,60($sp)
	sw	$12,68($sp)
	move	$4,$18
	addiu	$6,$6,%lo($LC45)
	move	$7,$20
	jalr	$25
	li	$5,2			# 0x2

	lw	$28,80($sp)
	lw	$3,0($17)
$L2210:
	lw	$2,604($3)
	andi	$2,$2,0x1
	beq	$2,$0,$L2406
	lw	$31,196($sp)

	lw	$2,8704($17)
	beq	$2,$0,$L2352
	addiu	$2,$17,4296

$L2406:
	addiu	$2,$17,3784
	addiu	$3,$17,3528
	sw	$2,6144($17)
	sw	$3,6140($17)
	move	$2,$0
	lw	$fp,192($sp)
	lw	$23,188($sp)
	lw	$22,184($sp)
	lw	$21,180($sp)
	lw	$20,176($sp)
	lw	$19,172($sp)
	lw	$18,168($sp)
	lw	$17,164($sp)
	lw	$16,160($sp)
	j	$31
	addiu	$sp,$sp,200

$L2201:
	slt	$2,$5,16
$L2405:
	beq	$2,$0,$L2353
	li	$2,65536			# 0x10000

$L2202:
	slt	$2,$5,8
	beq	$2,$0,$L2354
	nop

$L2203:
	li	$2,65536			# 0x10000
	addu	$4,$17,$2
	lw	$19,5340($4)
	li	$2,1			# 0x1
	bne	$19,$2,$L2204
	lw	$9,204($sp)

	li	$3,131072			# 0x20000
	addu	$16,$9,$3
	lw	$2,9412($16)
	slt	$2,$2,2
	bne	$2,$0,$L2407
	lw	$2,204($sp)

	lw	$2,604($18)
	andi	$2,$2,0x1
	bne	$2,$0,$L2355
	li	$2,2			# 0x2

	lw	$2,9416($16)
	bne	$2,$0,$L2206
	sw	$19,9412($16)

	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC39)
	move	$4,$18
	addiu	$6,$6,%lo($LC39)
	jalr	$25
	li	$5,1			# 0x1

	lw	$28,80($sp)
	sw	$19,9416($16)
$L2206:
	lw	$10,204($sp)
	beq	$17,$10,$L2356
	li	$2,1			# 0x1

	b	$L2421
	lw	$31,196($sp)

$L2345:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$8,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_se_golomb_vlc_code)($28)
	addu	$3,$3,$9
	addu	$2,$2,$4
	sw	$3,8456($17)
	b	$L2188
	lb	$2,0($2)

$L1971:
	beq	$2,$0,$L1972
	srl	$2,$6,31

	addu	$2,$2,$6
	sra	$2,$2,1
	subu	$3,$3,$4
	subu	$2,$0,$2
	slt	$3,$3,$2
	beq	$3,$0,$L2408
	li	$2,65536			# 0x10000

	lw	$2,-6224($5)
	subu	$2,$2,$6
	b	$L1973
	sw	$2,-6244($5)

$L2349:
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	move	$7,$2
	sltu	$2,$2,3
	beq	$2,$0,$L2357
	lw	$28,80($sp)

	slt	$2,$7,2
	bne	$2,$0,$L2358
	sw	$7,5340($16)

$L2199:
	li	$2,65536			# 0x10000
	addu	$16,$17,$2
	lw	$3,5340($16)
	beq	$3,$0,$L2197
	nop

	.option	pic0
	jal	get_se_golomb
	.option	pic2
	move	$4,$18

	sll	$2,$2,1
	sw	$2,5344($16)
	.option	pic0
	jal	get_se_golomb
	.option	pic2
	move	$4,$18

	sll	$2,$2,1
	lw	$28,80($sp)
	b	$L2197
	sw	$2,5348($16)

$L2347:
	lw	$2,8456($17)
	addiu	$2,$2,1
	b	$L2195
	sw	$2,8456($17)

$L2343:
	ori	$2,$4,0x7e40
	addu	$19,$17,$2
	addu	$21,$17,$3
	move	$20,$0
	move	$14,$0
$L2178:
	lw	$2,0($21)
	beq	$2,$0,$L2180
	sll	$5,$20,6

	sll	$4,$20,7
	sll	$2,$20,8
	sll	$3,$20,9
	subu	$3,$3,$4
	subu	$2,$2,$5
	li	$6,59352			# 0xe7d8
	li	$5,59736			# 0xe958
	li	$8,60120			# 0xead8
	li	$9,60888			# 0xedd8
	addu	$7,$2,$5
	addu	$4,$3,$8
	addu	$2,$2,$6
	addu	$5,$3,$9
	li	$10,60892			# 0xeddc
	li	$8,60124			# 0xeadc
	addu	$6,$3,$10
	addu	$2,$17,$2
	addu	$7,$17,$7
	addu	$4,$17,$4
	addu	$5,$17,$5
	addu	$3,$3,$8
	addiu	$2,$2,4
	addu	$3,$17,$3
	addiu	$31,$7,4
	addiu	$25,$4,4
	addiu	$24,$5,4
	addu	$6,$17,$6
	addiu	$23,$3,4
	sw	$2,100($sp)
	addiu	$22,$6,4
	addu	$13,$19,$14
	sw	$2,96($sp)
	move	$fp,$31
	move	$16,$25
	move	$15,$24
	sw	$0,104($sp)
	move	$3,$0
$L2177:
	sll	$2,$3,5
	sll	$3,$3,3
	subu	$2,$2,$3
	sll	$4,$2,4
	addu	$2,$2,$4
	addu	$2,$2,$14
	addu	$9,$19,$2
	addiu	$10,$13,6528
	move	$6,$9
	move	$7,$10
	addiu	$8,$9,400
$L2175:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L2175
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$3,0($6)
	sw	$2,4($7)
	sw	$3,0($7)
	lw	$2,6544($13)
	lw	$3,6548($13)
	lw	$4,6552($13)
	sll	$2,$2,1
	sll	$3,$3,1
	sll	$4,$4,1
	sw	$2,6544($13)
	sw	$3,6548($13)
	sw	$4,6552($13)
	move	$6,$10
	addiu	$7,$13,6936
	addiu	$8,$13,6928
$L2176:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L2176
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$3,0($6)
	sw	$2,4($7)
	sw	$3,0($7)
	lw	$2,0($25)
	lw	$10,24($9)
	lw	$11,16($9)
	lw	$12,20($9)
	lw	$3,0($24)
	sw	$2,128($16)
	sw	$2,136($16)
	lw	$7,104($sp)
	lw	$2,6936($13)
	lw	$8,100($sp)
	sw	$3,128($15)
	sw	$3,136($15)
	lw	$4,6944($13)
	lw	$3,6940($13)
	addiu	$7,$7,1
	addu	$2,$2,$11
	lw	$9,0($22)
	sw	$7,104($sp)
	lw	$6,0($8)
	lw	$7,0($31)
	lw	$8,0($23)
	sw	$2,6936($13)
	lw	$2,96($sp)
	addu	$3,$3,$12
	addu	$4,$4,$10
	sw	$3,6940($13)
	lw	$10,104($sp)
	lw	$5,0($21)
	sw	$4,6944($13)
	sw	$6,64($2)
	sw	$7,64($fp)
	sw	$8,132($16)
	sw	$9,132($15)
	sw	$6,68($2)
	lw	$3,100($sp)
	addiu	$2,$2,8
	addiu	$3,$3,4
	sltu	$5,$10,$5
	sw	$7,68($fp)
	sw	$8,140($16)
	sw	$9,140($15)
	sw	$3,100($sp)
	addiu	$13,$13,816
	sw	$2,96($sp)
	addiu	$31,$31,4
	addiu	$fp,$fp,8
	addiu	$25,$25,8
	addiu	$16,$16,16
	addiu	$24,$24,8
	addiu	$15,$15,16
	addiu	$23,$23,8
	addiu	$22,$22,8
	bne	$5,$0,$L2177
	move	$3,$10

$L2180:
	addiu	$20,$20,1
	li	$4,2			# 0x2
	addiu	$21,$21,4
	bne	$20,$4,$L2178
	addiu	$14,$14,19584

	li	$2,65536			# 0x10000
	addu	$4,$17,$2
	lw	$3,5940($4)
	beq	$3,$0,$L2174
	li	$2,61660			# 0xf0dc

	addu	$13,$17,$2
	move	$8,$4
	addiu	$12,$13,3072
	move	$11,$0
	move	$7,$0
	li	$14,61656			# 0xf0d8
	li	$15,61724			# 0xf11c
$L2179:
	lw	$2,5936($8)
	beq	$2,$0,$L2184
	sll	$2,$11,6

	sll	$3,$11,8
	subu	$3,$3,$2
	addu	$4,$3,$15
	addu	$3,$3,$14
	addu	$3,$17,$3
	addu	$4,$17,$4
	addiu	$6,$3,4
	addiu	$4,$4,4
	move	$5,$0
$L2181:
	lw	$2,5936($8)
	lw	$3,0($6)
	addiu	$5,$5,1
	sltu	$2,$5,$2
	sw	$3,-4($4)
	sw	$3,0($4)
	addiu	$6,$6,4
	bne	$2,$0,$L2181
	addiu	$4,$4,8

$L2184:
	sll	$2,$7,8
	sll	$3,$7,6
	subu	$2,$2,$3
	addu	$9,$13,$2
	move	$7,$9
	move	$6,$12
	addiu	$10,$9,192
$L2182:
	lwl	$2,3($7)
	lwl	$3,7($7)
	lwl	$4,11($7)
	lwl	$5,15($7)
	lwr	$2,0($7)
	lwr	$3,4($7)
	lwr	$4,8($7)
	lwr	$5,12($7)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	swr	$3,4($6)
	swl	$4,11($6)
	swr	$4,8($6)
	addiu	$7,$7,16
	swl	$5,15($6)
	swr	$5,12($6)
	bne	$7,$10,$L2182
	addiu	$6,$6,16

	move	$7,$9
	addiu	$6,$12,192
$L2183:
	lwl	$2,3($7)
	lwl	$3,7($7)
	lwl	$4,11($7)
	lwl	$5,15($7)
	lwr	$2,0($7)
	lwr	$3,4($7)
	lwr	$4,8($7)
	lwr	$5,12($7)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	swr	$3,4($6)
	swl	$4,11($6)
	swr	$4,8($6)
	addiu	$7,$7,16
	swl	$5,15($6)
	swr	$5,12($6)
	bne	$7,$10,$L2183
	addiu	$6,$6,16

	lw	$2,5940($8)
	addiu	$11,$11,1
	sltu	$2,$11,$2
	addiu	$12,$12,384
	bne	$2,$0,$L2179
	move	$7,$11

	b	$L2387
	li	$2,65536			# 0x10000

$L2342:
	lw	$3,8708($2)
	li	$2,5			# 0x5
	beq	$3,$2,$L2359
	lw	$7,204($sp)

	lw	$5,8456($17)
	lw	$3,8448($17)
	sra	$4,$5,3
	addu	$3,$3,$4
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,1
	srl	$2,$2,7
	beq	$2,$0,$L2148
	sw	$5,8456($17)

	lw	$8,204($sp)
	li	$2,131072			# 0x20000
	ori	$2,$2,0x1790
	li	$3,65536			# 0x10000
	lw	$12,8448($17)
	lw	$15,%got(ff_log2_tab)($28)
	lw	$16,%got(ff_golomb_vlc_len)($28)
	lw	$19,%got(ff_ue_golomb_vlc_code)($28)
	addu	$9,$8,$2
	addu	$21,$8,$3
	move	$10,$0
	li	$13,134217728			# 0x8000000
	li	$14,-65536			# 0xffffffffffff0000
	li	$20,1			# 0x1
	li	$22,3			# 0x3
	li	$23,6			# 0x6
	li	$24,4			# 0x4
	b	$L2171
	li	$25,66			# 0x42

$L2149:
	bne	$2,$0,$L2151
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L2152:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2409
	addu	$2,$15,$3

	srl	$3,$3,8
	addiu	$6,$6,8
	addu	$2,$15,$3
$L2409:
	lbu	$3,0($2)
	addiu	$4,$8,32
	addu	$3,$3,$6
	sll	$3,$3,1
	addiu	$3,$3,-31
	subu	$4,$4,$3
	srl	$3,$5,$3
	sw	$4,8($18)
	addiu	$7,$3,-1
$L2150:
	beq	$7,$20,$L2154
	sw	$7,-4($9)

	beq	$7,$22,$L2154
	nop

$L2155:
	addiu	$2,$7,-2
	sltu	$2,$2,2
	bne	$2,$0,$L2161
	nop

	beq	$7,$23,$L2161
	nop

	beq	$7,$24,$L2161
	nop

$L2162:
	sltu	$2,$7,7
	beq	$2,$0,$L2360
	lui	$6,%hi($LC35)

	beq	$7,$0,$L2410
	lw	$3,204($sp)

	addiu	$10,$10,1
	beq	$10,$25,$L2410
	addiu	$9,$9,12

$L2171:
	lw	$8,8($18)
	sra	$3,$8,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$8,0x7
	sll	$5,$2,$3
	sltu	$4,$5,$13
	bne	$4,$0,$L2149
	and	$2,$5,$14

	srl	$4,$5,23
	addu	$3,$16,$4
	lbu	$2,0($3)
	addu	$4,$19,$4
	addu	$2,$2,$8
	sw	$2,8($18)
	b	$L2150
	lbu	$7,0($4)

$L2340:
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	lw	$4,-6284($2)
	li	$3,3			# 0x3
	bne	$4,$3,$L2411
	li	$2,65536			# 0x10000

$L2077:
	lw	$8,8456($17)
	lw	$15,8448($17)
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	sra	$4,$8,3
	addu	$4,$15,$4
	sw	$0,-6192($2)
	sw	$0,-6196($2)
	lbu	$2,0($4)
	lbu	$3,3($4)
	lbu	$5,1($4)
	sll	$2,$2,24
	lbu	$6,2($4)
	or	$3,$3,$2
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L2361
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$7,$2
	bne	$2,$0,$L2082
	srl	$5,$7,16

	move	$5,$7
	move	$6,$0
$L2083:
	andi	$2,$5,0xff00
	beq	$2,$0,$L2412
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L2412:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$7,$2
	sw	$4,8456($17)
	addiu	$3,$2,-1
$L2081:
	lw	$8,8456($17)
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	sra	$4,$8,3
	addu	$4,$15,$4
	sw	$3,-6188($2)
	lbu	$2,0($4)
	lbu	$3,3($4)
	lbu	$5,1($4)
	sll	$2,$2,24
	lbu	$6,2($4)
	or	$3,$3,$2
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L2362
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$7,$2
	bne	$2,$0,$L2087
	srl	$5,$7,16

	move	$5,$7
	move	$6,$0
$L2088:
	andi	$2,$5,0xff00
	beq	$2,$0,$L2413
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L2413:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$7,$2
	sw	$4,8456($17)
	addiu	$6,$2,-1
$L2086:
	li	$2,65536			# 0x10000
	addu	$3,$17,$2
	lw	$5,-6188($3)
	li	$4,1			# 0x1
	ori	$2,$2,0x1730
	lw	$31,%got(ff_log2_tab)($28)
	lw	$23,%got(ff_golomb_vlc_len)($28)
	lw	$fp,%got(ff_se_golomb_vlc_code)($28)
	sll	$16,$4,$6
	sw	$6,-6184($3)
	sll	$22,$4,$5
	addu	$20,$17,$2
	move	$24,$3
	sw	$0,108($sp)
	li	$19,134217728			# 0x8000000
$L2090:
	lw	$2,0($20)
	beq	$2,$0,$L2129
	lw	$7,108($sp)

	li	$5,59352			# 0xe7d8
	sll	$6,$7,6
	sll	$4,$7,7
	sll	$2,$7,9
	sll	$3,$7,8
	subu	$2,$2,$4
	subu	$3,$3,$6
	li	$4,60124			# 0xeadc
	addu	$2,$2,$4
	addu	$3,$3,$5
	addu	$2,$17,$2
	addu	$3,$17,$3
	sll	$4,$7,4
	subu	$25,$6,$4
	addiu	$14,$2,4
	addiu	$11,$3,4
	move	$13,$0
	li	$21,-65536			# 0xffffffffffff0000
$L2127:
	lw	$5,8456($17)
	sra	$2,$5,3
	addu	$2,$15,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	bne	$3,$0,$L2363
	sw	$5,8456($17)

	sw	$22,0($11)
	sw	$0,384($11)
$L2107:
	sra	$2,$5,3
	addu	$2,$15,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$2,$5,1
	srl	$3,$3,7
	beq	$3,$0,$L2108
	sw	$2,8456($17)

	addu	$2,$25,$13
	addiu	$3,$2,7515
	addiu	$2,$2,7611
	sll	$2,$2,3
	sll	$3,$3,3
	addu	$2,$17,$2
	addu	$3,$17,$3
	lw	$12,0($18)
	addiu	$9,$2,4
	addiu	$8,$3,4
	move	$10,$0
$L2125:
	lw	$7,8($18)
	sra	$3,$7,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$5,$2,$3
	sltu	$4,$5,$19
	beq	$4,$0,$L2364
	nop

	and	$2,$5,$21
	bne	$2,$0,$L2111
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L2112:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2113
	nop

	srl	$3,$3,8
	addiu	$6,$6,8
$L2113:
	addu	$3,$31,$3
	lbu	$2,0($3)
	addiu	$4,$7,32
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$5,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L2114
	sw	$4,8($18)

	srl	$2,$5,1
	subu	$2,$0,$2
$L2110:
	sw	$2,0($8)
	lw	$7,8($18)
	sra	$3,$7,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$5,$2,$3
	sltu	$4,$5,$19
	beq	$4,$0,$L2365
	and	$2,$5,$21

	bne	$2,$0,$L2118
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L2119:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2120
	nop

	srl	$3,$3,8
	addiu	$6,$6,8
$L2120:
	addu	$3,$31,$3
	lbu	$2,0($3)
	addiu	$4,$7,32
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$5,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L2121
	sw	$4,8($18)

	srl	$2,$5,1
	subu	$2,$0,$2
$L2122:
	move	$3,$2
$L2117:
	lw	$2,0($8)
	beq	$16,$2,$L2366
	sw	$3,0($9)

	li	$3,1			# 0x1
	sw	$3,-6192($24)
$L2124:
	addiu	$10,$10,1
	li	$4,2			# 0x2
	addiu	$9,$9,4
	bne	$10,$4,$L2125
	addiu	$8,$8,4

$L2126:
	lw	$2,0($20)
	addiu	$13,$13,1
	sltu	$2,$13,$2
	addiu	$14,$14,8
	bne	$2,$0,$L2127
	addiu	$11,$11,4

$L2129:
	lw	$3,-6284($24)
	li	$2,3			# 0x3
	bne	$3,$2,$L2128
	lw	$5,108($sp)

	li	$6,2			# 0x2
	addiu	$5,$5,1
	sw	$5,108($sp)
	bne	$5,$6,$L2090
	addiu	$20,$20,4

$L2128:
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	lw	$3,-6196($2)
	bne	$3,$0,$L2131
	li	$3,1			# 0x1

	lw	$2,-6192($2)
	sltu	$3,$0,$2
$L2131:
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	b	$L2132
	sw	$3,-6196($2)

$L2338:
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	li	$3,65536			# 0x10000
	addu	$16,$17,$3
	addiu	$2,$2,1
	lw	$4,-6284($16)
	sw	$2,5936($16)
	li	$2,3			# 0x3
	beq	$4,$2,$L2368
	lw	$28,80($sp)

$L1997:
	li	$3,65536			# 0x10000
	addu	$3,$17,$3
	lw	$2,5936($3)
	addiu	$2,$2,-1
	sltu	$2,$2,32
	beq	$2,$0,$L2414
	lw	$25,%call16(av_log)($28)

	lw	$2,5940($3)
	addiu	$2,$2,-1
	sltu	$2,$2,32
	bne	$2,$0,$L1996
	nop

$L2414:
	lw	$4,0($17)
	lui	$6,%hi($LC29)
	addiu	$6,$6,%lo($LC29)
	jalr	$25
	move	$5,$0

	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	li	$3,1			# 0x1
	sw	$3,5936($2)
	sw	$3,5940($2)
	lw	$28,80($sp)
	b	$L1907
	li	$2,-1			# 0xffffffffffffffff

$L2339:
	li	$2,2			# 0x2
	b	$L2000
	sw	$2,5944($4)

$L2315:
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	b	$L1961
	lw	$28,80($sp)

$L2192:
	b	$L2188
	srl	$2,$5,1

$L2189:
	b	$L2190
	li	$6,16			# 0x10

$L2332:
	lw	$8,9952($17)
	bne	$8,$0,$L1978
	li	$2,65536			# 0x10000

	move	$7,$0
$L1979:
	lw	$10,8704($17)
	bne	$10,$0,$L1980
	slt	$2,$0,$7

	subu	$7,$7,$2
$L1980:
	blez	$8,$L2369
	nop

	move	$5,$0
	move	$4,$0
	sll	$6,$8,1
$L1983:
	addu	$2,$17,$4
	lh	$3,10032($2)
	addiu	$4,$4,2
	bne	$4,$6,$L1983
	addu	$5,$5,$3

$L1982:
	blez	$7,$L2370
	addiu	$2,$7,-1

	div	$0,$2,$8
	teq	$8,$0,7
	mfhi	$3
	mflo	$2
	bltz	$3,$L1985
	mul	$5,$5,$2

	addiu	$2,$3,1
	sll	$6,$2,1
	move	$4,$0
$L1986:
	addu	$2,$17,$4
	lh	$3,10032($2)
	addiu	$4,$4,2
	bne	$4,$6,$L1986
	addu	$5,$5,$3

$L1985:
	bne	$10,$0,$L2415
	li	$2,65536			# 0x10000

	lw	$2,9944($17)
	addu	$5,$5,$2
	li	$2,65536			# 0x10000
$L2415:
	addu	$6,$17,$2
	lw	$3,-6236($6)
	lw	$4,9948($17)
	addu	$5,$5,$3
	li	$2,3			# 0x3
	beq	$9,$2,$L1988
	addu	$4,$5,$4

	slt	$2,$5,$4
	move	$6,$5
	b	$L1975
	movz	$6,$4,$2

$L2318:
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	sw	$0,-6224($2)
	b	$L1970
	sw	$0,-6220($2)

$L2325:
	lui	$6,%hi($LC30)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	b	$L2293
	addiu	$6,$6,%lo($LC30)

$L2011:
	lui	$6,%hi($LC33)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	b	$L2293
	addiu	$6,$6,%lo($LC33)

$L2352:
	addiu	$3,$17,4040
	sw	$2,6144($17)
	sw	$3,6140($17)
	b	$L1907
	move	$2,$0

$L2341:
	addu	$5,$17,$2
	lw	$3,-6284($5)
	li	$2,3			# 0x3
	bne	$3,$2,$L2411
	li	$2,65536			# 0x10000

	lw	$2,1880($17)
	lw	$3,5936($5)
	beq	$3,$4,$L2371
	lw	$16,228($2)

	li	$6,65536			# 0x10000
$L2420:
	addu	$5,$17,$6
	lw	$2,5936($5)
	li	$3,2			# 0x2
	li	$4,5			# 0x5
	sw	$3,-6192($5)
	sw	$4,-6184($5)
	sw	$3,-6196($5)
	beq	$2,$0,$L2132
	sw	$4,-6188($5)

	ori	$3,$6,0xcba4
	ori	$2,$6,0x7f24
	addu	$14,$17,$2
	move	$8,$5
	addu	$15,$17,$3
	move	$12,$0
	li	$19,61656			# 0xf0d8
	li	$20,127			# 0x7f
	li	$21,-128			# 0xffffffffffffff80
	li	$11,32			# 0x20
	li	$13,64			# 0x40
$L2144:
	lw	$2,5940($8)
	beq	$2,$0,$L2134
	lw	$9,0($14)

	subu	$4,$16,$9
	sll	$5,$12,6
	sll	$2,$12,8
	subu	$2,$2,$5
	slt	$3,$4,128
	movz	$4,$20,$3
	addu	$2,$2,$19
	addu	$2,$17,$2
	slt	$3,$4,-128
	move	$10,$21
	movz	$10,$4,$3
	addiu	$7,$2,4
	move	$6,$15
	b	$L2143
	move	$5,$0

$L2372:
$L2136:
	mul	$2,$2,$10
	addiu	$3,$2,32
	sra	$4,$3,6
	slt	$2,$4,-1024
	bne	$2,$0,$L2138
	slt	$2,$4,1024

	beq	$2,$0,$L2138
	sra	$3,$3,8

	addiu	$2,$3,64
	sltu	$2,$2,193
	beq	$2,$0,$L2138
	subu	$2,$13,$3

	sw	$2,0($7)
	lw	$2,5940($8)
	addiu	$5,$5,1
	sltu	$2,$5,$2
	addiu	$6,$6,408
	beq	$2,$0,$L2134
	addiu	$7,$7,4

$L2143:
	lw	$2,0($6)
	subu	$4,$2,$9
	slt	$3,$4,-128
	bne	$3,$0,$L2372
	li	$2,-128			# 0xffffffffffffff80

	slt	$2,$4,128
	beq	$2,$0,$L2137
	nop

	bne	$4,$0,$L2373
	nop

$L2138:
	lw	$2,5940($8)
	addiu	$5,$5,1
	sltu	$2,$5,$2
	sw	$11,0($7)
	addiu	$6,$6,408
	bne	$2,$0,$L2143
	addiu	$7,$7,4

$L2134:
	lw	$2,5936($8)
	addiu	$12,$12,1
	sltu	$2,$12,$2
	bne	$2,$0,$L2144
	addiu	$14,$14,408

	b	$L2388
	lw	$2,8704($17)

$L2366:
	beq	$3,$0,$L2124
	li	$3,1			# 0x1

	b	$L2124
	sw	$3,-6192($24)

$L2353:
	addu	$2,$17,$2
	lw	$4,-6284($2)
	li	$3,3			# 0x3
	bne	$4,$3,$L2202
	li	$2,65536			# 0x10000

	b	$L2422
	addu	$2,$17,$2

$L1990:
	addu	$2,$17,$2
	lw	$4,-6216($2)
	lw	$3,-6228($2)
	addu	$3,$3,$4
	sll	$3,$3,1
	b	$L2289
	addiu	$5,$3,-1

$L2319:
	lw	$2,-6224($5)
	addu	$2,$6,$2
	b	$L1973
	sw	$2,-6244($5)

$L2361:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($17)
	b	$L2081
	lbu	$3,0($2)

$L1963:
	lw	$9,8500($17)
	li	$2,3			# 0x3
	bne	$9,$2,$L2287
	nop

	.option	pic0
	jal	get_se_golomb
	.option	pic2
	move	$4,$18

	lw	$28,80($sp)
	lw	$16,9932($17)
	b	$L1962
	sw	$2,-6240($19)

$L2351:
	lw	$2,-6192($16)
	beq	$2,$0,$L2416
	lui	$2,%hi($LC44)

	lui	$2,%hi($LC43)
	b	$L2215
	addiu	$6,$2,%lo($LC43)

$L2308:
	.option	pic0
	jal	free_tables
	.option	pic2
	move	$4,$17

	lw	$28,80($sp)
	lw	$25,%call16(MPV_common_end)($28)
	jalr	$25
	move	$4,$17

	lw	$2,112($17)
	beq	$2,$0,$L2217
	lw	$28,80($sp)

	b	$L1928
	lw	$8,9972($17)

$L1978:
	addu	$2,$17,$2
	lw	$4,-6216($2)
	lw	$3,-6228($2)
	b	$L1979
	addu	$7,$3,$4

$L2354:
	lw	$2,8704($17)
	bne	$2,$0,$L2203
	li	$2,65536			# 0x10000

	b	$L2422
	addu	$2,$17,$2

$L2148:
	lw	$4,204($sp)
	li	$2,131072			# 0x20000
	addu	$5,$4,$2
	lw	$6,204($sp)
	lw	$4,6828($5)
	lw	$2,6824($5)
	lw	$3,9956($6)
	addu	$2,$4,$2
	beq	$2,$3,$L2374
	addiu	$2,$4,17869

	b	$L2145
	sw	$0,6820($5)

$L2355:
	b	$L2204
	sw	$2,5340($4)

$L2137:
	b	$L2136
	li	$2,129			# 0x81

$L2108:
	addu	$2,$25,$13
	addiu	$3,$2,7611
	addiu	$2,$2,7515
	sll	$2,$2,3
	sll	$3,$3,3
	addu	$2,$17,$2
	addu	$3,$17,$3
	sw	$16,4($2)
	sw	$0,4($3)
	sw	$16,0($14)
	b	$L2126
	sw	$0,768($14)

$L2364:
	srl	$4,$5,23
	addu	$3,$23,$4
	lbu	$2,0($3)
	addu	$4,$fp,$4
	addu	$2,$2,$7
	sw	$2,8($18)
	b	$L2110
	lb	$2,0($4)

$L2365:
	srl	$4,$5,23
	addu	$3,$23,$4
	lbu	$2,0($3)
	addu	$4,$fp,$4
	addu	$2,$2,$7
	sw	$2,8($18)
	b	$L2117
	lb	$3,0($4)

$L2363:
	lw	$7,8($18)
	lw	$12,0($18)
	sra	$3,$7,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$5,$2,$3
	sltu	$4,$5,$19
	beq	$4,$0,$L2375
	nop

	and	$2,$5,$21
	bne	$2,$0,$L2094
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L2095:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2096
	nop

	srl	$3,$3,8
	addiu	$6,$6,8
$L2096:
	addu	$3,$31,$3
	lbu	$2,0($3)
	addiu	$4,$7,32
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$5,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L2097
	sw	$4,8($18)

	srl	$2,$5,1
	subu	$2,$0,$2
$L2093:
	sw	$2,0($11)
	lw	$7,8($18)
	sra	$3,$7,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$5,$2,$3
	sltu	$4,$5,$19
	beq	$4,$0,$L2376
	and	$2,$5,$21

	bne	$2,$0,$L2101
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L2102:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2103
	nop

	srl	$3,$3,8
	addiu	$6,$6,8
$L2103:
	addu	$3,$31,$3
	lbu	$2,0($3)
	addiu	$4,$7,32
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$5,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L2104
	sw	$4,8($18)

	srl	$2,$5,1
	subu	$2,$0,$2
$L2105:
	move	$3,$2
$L2100:
	lw	$2,0($11)
	beq	$22,$2,$L2377
	sw	$3,384($11)

	li	$2,1			# 0x1
	sw	$2,-6196($24)
$L2292:
	b	$L2107
	lw	$5,8456($17)

$L2377:
	beq	$3,$0,$L2292
	li	$2,1			# 0x1

	b	$L2292
	sw	$2,-6196($24)

$L2118:
	b	$L2119
	li	$6,16			# 0x10

$L2114:
	b	$L2110
	srl	$2,$5,1

$L2111:
	b	$L2112
	li	$6,16			# 0x10

$L2121:
	b	$L2122
	srl	$2,$5,1

$L2376:
	srl	$4,$5,23
	addu	$3,$23,$4
	lbu	$2,0($3)
	addu	$4,$fp,$4
	addu	$2,$2,$7
	sw	$2,8($18)
	b	$L2100
	lb	$3,0($4)

$L2375:
	srl	$4,$5,23
	addu	$3,$23,$4
	lbu	$2,0($3)
	addu	$4,$fp,$4
	addu	$2,$2,$7
	sw	$2,8($18)
	b	$L2093
	lb	$2,0($4)

$L2097:
	b	$L2093
	srl	$2,$5,1

$L2094:
	b	$L2095
	li	$6,16			# 0x10

$L2104:
	b	$L2105
	srl	$2,$5,1

$L2101:
	b	$L2102
	li	$6,16			# 0x10

$L2161:
	lw	$8,8($18)
	sra	$3,$8,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$2,$2,$5
	or	$2,$2,$6
	andi	$3,$8,0x7
	sll	$6,$2,$3
	sltu	$4,$6,$13
	beq	$4,$0,$L2378
	and	$2,$6,$14

	beq	$2,$0,$L2379
	move	$3,$6

	srl	$3,$6,16
	li	$5,16			# 0x10
$L2166:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2417
	addu	$2,$15,$3

	srl	$3,$3,8
	addiu	$5,$5,8
	addu	$2,$15,$3
$L2417:
	lbu	$3,0($2)
	addiu	$4,$8,32
	addu	$3,$3,$5
	sll	$3,$3,1
	addiu	$3,$3,-31
	subu	$4,$4,$3
	srl	$3,$6,$3
	sw	$4,8($18)
	addiu	$3,$3,-1
$L2164:
	sltu	$2,$3,16
	beq	$2,$0,$L2380
	lui	$6,%hi($LC34)

	b	$L2162
	sw	$3,4($9)

$L2154:
	lw	$8,8($18)
	sra	$3,$8,3
	addu	$3,$12,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$2,$2,$5
	or	$2,$2,$6
	andi	$3,$8,0x7
	sll	$6,$2,$3
	sltu	$4,$6,$13
	beq	$4,$0,$L2381
	lw	$11,-6204($21)

	and	$2,$6,$14
	bne	$2,$0,$L2158
	srl	$3,$6,16

	move	$3,$6
	move	$5,$0
$L2159:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2418
	addu	$2,$15,$3

	srl	$3,$3,8
	addiu	$5,$5,8
	addu	$2,$15,$3
$L2418:
	lbu	$3,0($2)
	addiu	$4,$8,32
	addu	$3,$3,$5
	sll	$3,$3,1
	addiu	$3,$3,-31
	subu	$4,$4,$3
	srl	$3,$6,$3
	sw	$4,8($18)
	addiu	$4,$3,-1
$L2157:
	lw	$3,-6200($21)
	addiu	$2,$11,-1
	subu	$2,$2,$4
	addiu	$3,$3,-1
	and	$2,$2,$3
	b	$L2155
	sw	$2,0($9)

$L2378:
	srl	$4,$6,23
	addu	$3,$16,$4
	lbu	$2,0($3)
	addu	$4,$19,$4
	addu	$2,$2,$8
	sw	$2,8($18)
	b	$L2164
	lbu	$3,0($4)

$L2151:
	b	$L2152
	li	$6,16			# 0x10

$L2381:
	srl	$4,$6,23
	addu	$3,$16,$4
	lbu	$2,0($3)
	addu	$4,$19,$4
	addu	$2,$2,$8
	sw	$2,8($18)
	b	$L2157
	lbu	$4,0($4)

$L2379:
	b	$L2166
	move	$5,$0

$L2158:
	b	$L2159
	li	$5,16			# 0x10

$L2333:
	move	$5,$0
	b	$L1975
	move	$6,$0

$L2348:
	.option	pic0
	jal	get_se_golomb
	.option	pic2
	move	$4,$18

	b	$L2196
	lw	$28,80($sp)

$L2344:
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	move	$3,$2
	sltu	$2,$2,3
	beq	$2,$0,$L2382
	lw	$28,80($sp)

	li	$2,131072			# 0x20000
	addu	$2,$17,$2
	b	$L2185
	sw	$3,8656($2)

$L2350:
	lui	$2,%hi($LC40)
	b	$L2212
	addiu	$19,$2,%lo($LC40)

$L2328:
	lui	$6,%hi($LC32)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	b	$L2293
	addiu	$6,$6,%lo($LC32)

$L2362:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($17)
	b	$L2086
	lbu	$6,0($2)

$L2304:
	lui	$6,%hi($LC23)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	b	$L2293
	addiu	$6,$6,%lo($LC23)

$L2087:
	b	$L2088
	li	$6,16			# 0x10

$L2082:
	b	$L2083
	li	$6,16			# 0x10

$L2359:
	lw	$6,8456($17)
	lw	$5,8448($17)
	sra	$2,$6,3
	addu	$2,$5,$2
	lbu	$3,0($2)
	andi	$4,$6,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$4,$6,1
	srl	$3,$3,7
	sra	$2,$4,3
	addiu	$3,$3,-1
	sw	$4,8456($17)
	sw	$3,8472($7)
	addu	$5,$5,$2
	lbu	$2,0($5)
	andi	$4,$4,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	srl	$2,$2,7
	li	$3,131072			# 0x20000
	addiu	$6,$6,2
	addiu	$2,$2,-1
	addu	$4,$7,$3
	sw	$6,8456($17)
	bne	$2,$0,$L2383
	sw	$2,6036($4)

	li	$2,1			# 0x1
	li	$3,6			# 0x6
	sw	$2,6820($4)
	b	$L2145
	sw	$3,6028($4)

$L1988:
	lw	$2,-6232($6)
	b	$L1976
	addu	$4,$4,$2

$L2048:
	lw	$3,92($sp)
	lw	$2,5944($14)
	addiu	$10,$10,1
	addiu	$3,$3,4
	sltu	$2,$10,$2
	bne	$2,$0,$L2047
	sw	$3,92($sp)

	lw	$3,-6284($14)
$L2003:
	li	$2,3			# 0x3
	beq	$3,$2,$L2283
	li	$5,65536			# 0x10000

$L2291:
	lw	$7,1880($17)
$L2049:
	lw	$11,52($7)
$L2392:
	li	$2,1			# 0x1
	beq	$11,$2,$L2384
	nop

$L2059:
	li	$2,3			# 0x3
	beq	$11,$2,$L2419
	li	$3,65536			# 0x10000

	sw	$0,376($7)
$L2419:
	ori	$2,$3,0x1730
	addu	$8,$17,$2
	ori	$12,$3,0x7f20
	move	$10,$7
	move	$9,$0
	li	$13,2			# 0x2
$L2063:
	lw	$2,0($8)
	sw	$2,372($10)
	lw	$3,0($8)
	beq	$3,$0,$L2061
	sll	$3,$9,10

	sll	$2,$9,7
	addu	$2,$2,$3
	sll	$4,$2,4
	addu	$2,$2,$4
	addu	$2,$2,$12
	sll	$3,$9,6
	addu	$2,$17,$2
	addu	$3,$7,$3
	addiu	$6,$2,4
	addiu	$5,$3,244
	move	$4,$0
$L2062:
	lw	$3,0($6)
	addiu	$4,$4,1
	sw	$3,0($5)
	lw	$2,0($8)
	addiu	$6,$6,408
	sltu	$2,$4,$2
	bne	$2,$0,$L2062
	addiu	$5,$5,4

$L2061:
	addiu	$9,$9,1
	addiu	$8,$8,4
	bne	$9,$13,$L2063
	addiu	$10,$10,4

	li	$2,3			# 0x3
	bne	$11,$2,$L2002
	li	$4,65536			# 0x10000

	addu	$2,$17,$4
	lw	$3,5356($2)
	bne	$3,$0,$L2002
	ori	$2,$4,0xcc34

	addu	$11,$17,$2
	ori	$3,$4,0x7f24
	li	$2,-65536			# 0xffffffffffff0000
	addu	$12,$17,$3
	ori	$19,$2,0x4afc
	ori	$20,$4,0x80b8
	move	$9,$11
	move	$8,$0
	ori	$15,$4,0x15b0
	li	$16,46596			# 0xb604
	li	$21,2			# 0x2
$L2064:
	lw	$2,0($9)
	blez	$2,$L2072
	sll	$3,$8,10

	sll	$2,$8,7
	addu	$2,$2,$3
	sll	$4,$2,4
	addu	$2,$2,$4
	addu	$2,$2,$20
	sll	$3,$8,6
	addu	$3,$3,$15
	addu	$2,$17,$2
	addu	$5,$17,$3
	addiu	$14,$2,4
	move	$10,$0
	addu	$13,$9,$19
$L2070:
	lw	$7,0($13)
	addu	$2,$5,$16
	lw	$6,0($2)
	beq	$7,$0,$L2065
	sw	$0,0($5)

	lw	$2,0($12)
	beq	$6,$2,$L2385
	move	$4,$14

	b	$L2068
	move	$3,$0

$L2069:
	lw	$2,0($4)
	beq	$6,$2,$L2067
	addiu	$4,$4,408

$L2068:
	addiu	$3,$3,1
	sltu	$2,$3,$7
	bne	$2,$0,$L2069
	nop

	b	$L2391
	lw	$2,0($9)

$L2213:
	lui	$2,%hi($LC42)
	b	$L2212
	addiu	$19,$2,%lo($LC42)

$L2370:
	b	$L1985
	move	$5,$0

$L2358:
	xori	$2,$7,0x1
	b	$L2199
	sw	$2,5340($16)

$L2301:
	addu	$2,$17,$2
	lw	$7,-6284($2)
	lw	$3,6172($17)
	lw	$2,6168($17)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC22)
	sw	$2,16($sp)
	sw	$3,20($sp)
	addiu	$6,$6,%lo($LC22)
	jalr	$25
	move	$5,$0

	lw	$28,80($sp)
	b	$L1907
	li	$2,-1			# 0xffffffffffffffff

$L2312:
	.option	pic0
	jal	frame_start
	.option	pic2
	move	$4,$17

	bgez	$2,$L1948
	lw	$28,80($sp)

	b	$L1907
	li	$2,-1			# 0xffffffffffffffff

$L2336:
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	b	$L2293
	addiu	$6,$6,%lo($LC31)

$L2383:
	b	$L2145
	sw	$0,6820($4)

$L2279:
	lw	$9,8500($17)
	li	$2,3			# 0x3
	beq	$9,$2,$L2280
	nop

	b	$L1965
	lw	$16,9932($17)

$L2374:
	sll	$2,$2,2
	addu	$2,$6,$2
	lw	$3,4($2)
	li	$4,1			# 0x1
	lw	$2,232($3)
	sw	$4,6028($5)
	sw	$4,6820($5)
	b	$L2145
	sw	$2,6032($5)

$L2368:
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	addiu	$2,$2,1
	lw	$28,80($sp)
	b	$L1997
	sw	$2,5940($16)

$L2410:
	li	$2,131072			# 0x20000
	addu	$2,$3,$2
	b	$L2145
	sw	$10,6820($2)

$L2360:
	lw	$10,204($sp)
	lw	$25,%call16(av_log)($28)
	lw	$4,0($10)
	addiu	$6,$6,%lo($LC35)
	jalr	$25
	move	$5,$0

	b	$L2145
	lw	$28,80($sp)

$L2371:
	lw	$2,5940($5)
	bne	$2,$3,$L2420
	li	$6,65536			# 0x10000

	li	$2,131072			# 0x20000
	addu	$2,$17,$2
	lw	$3,-13404($2)
	lw	$4,32548($5)
	sll	$2,$16,1
	addu	$3,$3,$4
	bne	$3,$2,$L2420
	nop

	sw	$0,-6192($5)
	b	$L2132
	sw	$0,-6196($5)

$L2380:
	lw	$9,204($sp)
	lw	$25,%call16(av_log)($28)
	lw	$4,0($9)
	addiu	$6,$6,%lo($LC34)
	jalr	$25
	move	$5,$0

	b	$L2145
	lw	$28,80($sp)

$L2337:
	lw	$6,132($sp)
	b	$L2003
	lw	$3,-6284($6)

$L2305:
	lui	$6,%hi($LC24)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	b	$L2293
	addiu	$6,$6,%lo($LC24)

$L2356:
	b	$L2204
	lw	$18,0($17)

$L2384:
	b	$L2059
	sw	$0,372($7)

$L2382:
	lui	$6,%hi($LC36)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	b	$L2293
	addiu	$6,$6,%lo($LC36)

$L2306:
	lui	$6,%hi($LC25)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	b	$L2293
	addiu	$6,$6,%lo($LC25)

$L2280:
	.option	pic0
	jal	get_se_golomb
	.option	pic2
	move	$4,$18

	lw	$28,80($sp)
	lw	$9,8500($17)
	lw	$16,9932($17)
	b	$L1965
	sw	$2,-6232($19)

$L2357:
	lui	$6,%hi($LC38)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	addiu	$6,$6,%lo($LC38)
$L2296:
	jalr	$25
	move	$5,$0

	lw	$28,80($sp)
	b	$L1907
	li	$2,-1			# 0xffffffffffffffff

$L2283:
	addu	$4,$17,$5
	lw	$2,5356($4)
	bne	$2,$0,$L2291
	li	$2,131072			# 0x20000

	lw	$7,1880($17)
	lw	$3,5936($4)
	addu	$2,$17,$2
	lw	$10,-13404($2)
	beq	$3,$0,$L2050
	lw	$11,228($7)

	ori	$3,$5,0x14f0
	ori	$2,$5,0x7f24
	addu	$8,$17,$2
	addu	$6,$17,$3
	move	$19,$4
	move	$9,$0
	li	$12,127			# 0x7f
	li	$13,-128			# 0xffffffffffffff80
	li	$14,1023			# 0x3ff
	li	$15,-1024			# 0xfffffffffffffc00
	b	$L2057
	li	$16,256			# 0x100

$L2386:
$L2052:
	subu	$2,$11,$4
	slt	$3,$2,128
	movz	$2,$12,$3
	slt	$4,$2,-128
	movn	$2,$13,$4
	mul	$2,$5,$2
	addiu	$2,$2,32
	sra	$2,$2,6
	slt	$3,$2,1024
	movz	$2,$14,$3
	slt	$4,$2,-1024
	movn	$2,$15,$4
	sw	$2,0($6)
$L2055:
	lw	$2,5936($19)
	addiu	$9,$9,1
	sltu	$2,$9,$2
	addiu	$8,$8,408
	beq	$2,$0,$L2050
	addiu	$6,$6,4

$L2057:
	lw	$4,0($8)
	subu	$3,$10,$4
	slt	$2,$3,-128
	bne	$2,$0,$L2386
	li	$5,-128			# 0xffffffffffffff80

	slt	$2,$3,128
	beq	$2,$0,$L2052
	li	$5,129			# 0x81

	bne	$3,$0,$L2054
	nop

	b	$L2055
	sw	$16,0($6)

$L2054:
	bgez	$3,$L2056
	move	$2,$3

	subu	$2,$0,$3
$L2056:
	sra	$2,$2,1
	addiu	$2,$2,16384
	div	$0,$2,$3
	teq	$3,$0,7
	b	$L2052
	mflo	$5

$L2050:
	li	$5,65536			# 0x10000
	addu	$4,$17,$5
	lw	$2,-6276($4)
	beq	$2,$0,$L2049
	nop

	lw	$2,5936($4)
	beq	$2,$0,$L2049
	ori	$2,$5,0x14f0

	ori	$3,$5,0x1534
	move	$8,$4
	addu	$6,$17,$2
	addu	$5,$17,$3
	move	$4,$0
$L2058:
	lw	$2,5936($8)
	lw	$3,0($6)
	addiu	$4,$4,1
	sltu	$2,$4,$2
	sw	$3,-4($5)
	sw	$3,0($5)
	addiu	$6,$6,4
	bne	$2,$0,$L2058
	addiu	$5,$5,8

	b	$L2392
	lw	$11,52($7)

$L2373:
	bgez	$4,$L2139
	move	$2,$4

	subu	$2,$0,$4
$L2139:
	sra	$2,$2,1
	addiu	$2,$2,16384
	div	$0,$2,$4
	teq	$4,$0,7
	b	$L2136
	mflo	$2

$L2346:
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	b	$L2296
	addiu	$6,$6,%lo($LC37)

$L2369:
	b	$L1982
	move	$5,$0

$L2311:
	lw	$5,4($16)
	sll	$4,$5,2
	sll	$3,$5,4
	subu	$3,$3,$4
	sll	$2,$3,3
	subu	$2,$2,$3
	beq	$2,$21,$L1941
	lw	$25,%call16(perror)($28)

$L2393:
	lui	$4,%hi($LC10)
	jalr	$25
	addiu	$4,$4,%lo($LC10)

	lw	$28,80($sp)
	b	$L1907
	li	$2,-1			# 0xffffffffffffffff

$L2309:
	lw	$2,144($16)
	beq	$2,$0,$L1938
	move	$4,$0

	b	$L2393
	lw	$25,%call16(perror)($28)

$L2310:
	lw	$2,144($16)
	beq	$2,$0,$L1939
	nop

	b	$L2393
	lw	$25,%call16(perror)($28)

	.set	macro
	.set	reorder
	.end	decode_slice_header
	.align	2
	.ent	decode_mb_skip
	.type	decode_mb_skip, @function
decode_mb_skip:
	.set	nomips16
	.frame	$sp,80,$31		# vars= 16, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-80
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,76($sp)
	sw	$fp,72($sp)
	sw	$23,68($sp)
	sw	$22,64($sp)
	sw	$21,60($sp)
	sw	$20,56($sp)
	sw	$19,52($sp)
	sw	$18,48($sp)
	sw	$17,44($sp)
	sw	$16,40($sp)
	.cprestore	16
	move	$16,$4
	lw	$3,6172($16)
	lw	$4,152($4)
	lw	$2,6168($16)
	mul	$6,$4,$3
	lw	$5,9128($16)
	addu	$18,$6,$2
	lw	$25,%call16(memset)($28)
	sll	$4,$18,4
	addu	$4,$5,$4
	sw	$0,24($sp)
	move	$5,$0
	jalr	$25
	li	$6,16			# 0x10

	addiu	$3,$16,9088
	li	$2,65536			# 0x10000
	sw	$0,9088($16)
	addu	$2,$16,$2
	sw	$0,36($3)
	sw	$0,4($3)
	sw	$0,8($3)
	sw	$0,12($3)
	sw	$0,16($3)
	sw	$0,20($3)
	sw	$0,24($3)
	sw	$0,28($3)
	sw	$0,32($3)
	lw	$3,-6272($2)
	bne	$3,$0,$L2466
	lw	$10,24($sp)

	li	$2,65536			# 0x10000
	addu	$2,$16,$2
	lw	$4,-6284($2)
	li	$3,3			# 0x3
	beq	$4,$3,$L2481
	ori	$2,$10,0x3808

$L2494:
	move	$5,$2
	move	$4,$16
	move	$6,$0
	.option	pic0
	jal	fill_caches
	.option	pic2
	sw	$2,24($sp)

	lb	$7,9460($16)
	li	$2,-2			# 0xfffffffffffffffe
	lw	$28,16($sp)
	beq	$7,$2,$L2427
	lb	$8,9467($16)

	beq	$8,$2,$L2445
	move	$4,$0

	beq	$7,$0,$L2482
	nop

$L2428:
	bne	$8,$0,$L2492
	li	$2,65536			# 0x10000

	lw	$2,9180($16)
	beq	$2,$0,$L2445
	move	$4,$0

	li	$2,65536			# 0x10000
$L2492:
	addu	$2,$16,$2
	lw	$3,-6276($2)
	addiu	$5,$16,9136
	addiu	$14,$16,9180
	addiu	$13,$16,9152
	beq	$3,$0,$L2430
	lb	$4,9464($16)

	sw	$0,40($5)
	lw	$11,1880($16)
	lw	$10,-6272($2)
	addiu	$9,$16,9176
	bne	$10,$0,$L2431
	lw	$12,104($11)

	lw	$6,6172($16)
	andi	$2,$6,0x1
	beq	$2,$0,$L2493
	li	$2,-2			# 0xfffffffffffffffe

	beq	$4,$2,$L2483
	addiu	$2,$6,-1

	lw	$17,152($16)
	mul	$3,$2,$17
	lw	$10,6168($16)
	addu	$2,$3,$10
	sll	$2,$2,2
	addu	$2,$12,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L2434
	sll	$3,$6,2

	sll	$2,$10,2
	addiu	$15,$3,-1
	addiu	$10,$2,4
	sra	$2,$15,2
	mul	$4,$2,$17
	sra	$3,$10,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$12,$2
	lw	$2,0($2)
	andi	$3,$2,0x3000
	beq	$3,$0,$L2484
	andi	$2,$2,0x40

$L2435:
	lw	$2,9748($16)
	lw	$4,96($11)
	mul	$3,$15,$2
	lw	$5,9752($16)
	addu	$2,$3,$10
	sll	$2,$2,2
	addu	$4,$4,$2
	lhu	$3,0($4)
	lw	$6,188($11)
	sh	$3,9176($16)
	sra	$3,$15,1
	lh	$2,2($4)
	mul	$4,$3,$5
	sll	$2,$2,1
	addu	$3,$4,$6
	sra	$4,$10,1
$L2467:
	addu	$3,$3,$4
	sh	$2,9178($16)
	lb	$2,0($3)
	sra	$2,$2,1
	b	$L2437
	sltu	$4,$2,1

$L2482:
	lw	$2,9152($16)
	bne	$2,$0,$L2428
	nop

$L2427:
	move	$4,$0
$L2445:
	addiu	$2,$16,9184
	addiu	$3,$16,9468
	lw	$10,24($sp)
	sw	$0,9468($16)
	sw	$0,24($3)
	sw	$0,8($3)
	sw	$0,16($3)
	sw	$4,9184($16)
	sw	$4,108($2)
	sw	$4,4($2)
	sw	$4,8($2)
	sw	$4,12($2)
	sw	$4,32($2)
	sw	$4,36($2)
	sw	$4,40($2)
	sw	$4,44($2)
	sw	$4,64($2)
	sw	$4,68($2)
	sw	$4,72($2)
	sw	$4,76($2)
	sw	$4,96($2)
	sw	$4,100($2)
	sw	$4,104($2)
$L2426:
	lw	$3,6172($16)
	lw	$2,9748($16)
	lw	$5,9752($16)
	mul	$4,$3,$2
	mul	$6,$3,$5
	lw	$7,6168($16)
	addu	$2,$4,$7
	addu	$3,$6,$7
	sll	$2,$2,2
	andi	$4,$10,0x3000
	sw	$2,32($sp)
	bne	$4,$0,$L2453
	sll	$25,$3,1

	lw	$2,1652($16)
	li	$4,-1
	addu	$2,$2,$25
	addu	$3,$2,$5
	sh	$4,0($2)
	sh	$4,0($3)
$L2453:
	li	$2,65536			# 0x10000
	addu	$4,$16,$2
	lw	$3,5944($4)
	beq	$3,$0,$L2454
	li	$2,131072			# 0x20000

	lw	$14,32($sp)
	ori	$3,$2,0x21ec
	ori	$2,$2,0x21f8
	addu	$15,$16,$3
	addu	$22,$16,$2
	move	$17,$4
	addiu	$19,$16,9136
	sll	$23,$14,2
	move	$12,$16
	move	$13,$16
	move	$11,$0
	move	$3,$0
	li	$20,12288			# 0x3000
	addiu	$24,$14,2
	li	$31,4			# 0x4
	andi	$21,$10,0x800
$L2461:
	sll	$2,$11,1
	sll	$2,$20,$2
	and	$2,$2,$10
	beq	$2,$0,$L2455
	sll	$2,$3,2

	addu	$2,$2,$3
	lw	$9,9748($16)
	sll	$14,$2,5
	lw	$8,1560($13)
	move	$2,$9
	addu	$7,$19,$14
	move	$6,$0
$L2457:
	lw	$3,32($sp)
	lw	$4,48($7)
	mtlo	$3
	madd	$6,$2
	lw	$5,52($7)
	mflo	$2
	mul	$fp,$6,$9
	sll	$2,$2,2
	addu	$2,$8,$2
	sw	$4,0($2)
	sw	$5,4($2)
	addu	$3,$fp,$24
	lw	$4,56($7)
	lw	$5,60($7)
	sll	$3,$3,2
	addu	$3,$8,$3
	addiu	$6,$6,1
	move	$2,$9
	sw	$4,0($3)
	sw	$5,4($3)
	bne	$6,$31,$L2457
	addiu	$7,$7,32

	lw	$2,11808($16)
	beq	$2,$0,$L2458
	nop

	bne	$21,$0,$L2485
	sll	$3,$9,2

	lw	$8,0($15)
	addu	$7,$22,$14
	move	$2,$9
	move	$6,$0
$L2460:
	lw	$3,32($sp)
	lw	$4,48($7)
	mtlo	$3
	madd	$2,$6
	lw	$5,52($7)
	mflo	$2
	mul	$14,$6,$9
	sll	$2,$2,2
	addu	$2,$8,$2
	sw	$4,0($2)
	sw	$5,4($2)
	addu	$3,$14,$24
	lw	$4,56($7)
	lw	$5,60($7)
	sll	$3,$3,2
	addu	$3,$8,$3
	addiu	$6,$6,1
	move	$2,$9
	sw	$4,0($3)
	sw	$5,4($3)
	bne	$6,$31,$L2460
	addiu	$7,$7,32

$L2458:
	lw	$3,1652($13)
	lbu	$2,9468($12)
	addu	$3,$3,$25
	sb	$2,0($3)
	lbu	$4,9470($12)
	sb	$4,1($3)
	lw	$2,9752($16)
	lbu	$4,9484($12)
	addu	$2,$3,$2
	sb	$4,0($2)
	lw	$5,9752($16)
	lbu	$2,9486($12)
	addu	$3,$3,$5
	sb	$2,1($3)
$L2455:
	lw	$2,5944($17)
	addiu	$11,$11,1
	sltu	$2,$11,$2
	addiu	$13,$13,4
	addiu	$12,$12,40
	addiu	$15,$15,4
	bne	$2,$0,$L2461
	move	$3,$11

$L2454:
	li	$2,65536			# 0x10000
	addu	$6,$16,$2
	lw	$3,-6284($6)
	li	$2,3			# 0x3
	beq	$3,$2,$L2486
	nop

$L2462:
	lw	$2,1568($16)
	lw	$4,24($sp)
	sll	$3,$18,2
	addu	$2,$2,$3
	sw	$4,0($2)
	lw	$3,1548($16)
	lw	$4,2056($16)
	addu	$3,$3,$18
	li	$2,65536			# 0x10000
	sb	$4,0($3)
	addu	$2,$16,$2
	lw	$3,-6288($2)
	lw	$4,-6296($2)
	addu	$3,$3,$18
	sb	$4,0($3)
	lw	$31,76($sp)
	li	$2,1			# 0x1
	sw	$2,8748($16)
	lw	$fp,72($sp)
	lw	$23,68($sp)
	lw	$22,64($sp)
	lw	$21,60($sp)
	lw	$20,56($sp)
	lw	$19,52($sp)
	lw	$18,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	j	$31
	addiu	$sp,$sp,80

$L2466:
	li	$2,65536			# 0x10000
	ori	$10,$10,0x80
	sw	$10,24($sp)
	addu	$2,$16,$2
	lw	$4,-6284($2)
	li	$3,3			# 0x3
	bne	$4,$3,$L2494
	ori	$2,$10,0x3808

$L2481:
	ori	$2,$10,0x5908
	move	$5,$2
	move	$4,$16
	move	$6,$0
	.option	pic0
	jal	fill_caches
	.option	pic2
	sw	$2,24($sp)

	move	$4,$16
	.option	pic0
	jal	pred_direct_motion
	.option	pic2
	addiu	$5,$sp,24

	lw	$10,24($sp)
	lw	$28,16($sp)
	ori	$10,$10,0x800
	b	$L2426
	sw	$10,24($sp)

$L2485:
	lw	$2,0($15)
	addiu	$6,$3,4
	sll	$9,$9,3
	addiu	$4,$3,2
	addiu	$7,$3,6
	addu	$2,$2,$23
	addu	$5,$9,$3
	sll	$8,$6,1
	sll	$4,$4,1
	sll	$7,$7,1
	addu	$5,$2,$5
	addu	$3,$2,$3
	addu	$4,$2,$4
	addu	$8,$2,$8
	addu	$7,$2,$7
	addu	$6,$2,$6
	addu	$9,$2,$9
	sw	$0,0($2)
	sw	$0,4($2)
	sw	$0,8($2)
	sw	$0,12($2)
	sw	$0,0($3)
	sw	$0,0($6)
	sw	$0,12($3)
	sw	$0,8($3)
	sw	$0,0($9)
	lw	$3,1652($13)
	sw	$0,0($4)
	sw	$0,0($8)
	sw	$0,0($7)
	sw	$0,12($5)
	sw	$0,0($5)
	sw	$0,4($5)
	sw	$0,8($5)
	lbu	$2,9468($12)
	addu	$3,$3,$25
	sb	$2,0($3)
	lbu	$4,9470($12)
	sb	$4,1($3)
	lw	$2,9752($16)
	lbu	$4,9484($12)
	addu	$2,$3,$2
	sb	$4,0($2)
	lw	$5,9752($16)
	lbu	$2,9486($12)
	addu	$3,$3,$5
	b	$L2455
	sb	$2,1($3)

$L2486:
	lw	$2,11808($16)
	beq	$2,$0,$L2462
	andi	$2,$10,0x40

	beq	$2,$0,$L2462
	li	$2,131072			# 0x20000

	lw	$3,-6260($6)
	addu	$2,$16,$2
	lw	$5,9016($2)
	srl	$3,$3,8
	addu	$5,$5,$25
	andi	$3,$3,0x1
	sb	$3,1($5)
	lw	$2,-6256($6)
	lw	$4,9752($16)
	srl	$2,$2,8
	addu	$4,$5,$4
	andi	$2,$2,0x1
	sb	$2,0($4)
	lw	$3,-6252($6)
	lw	$2,9752($16)
	srl	$3,$3,8
	addu	$5,$5,$2
	andi	$3,$3,0x1
	b	$L2462
	sb	$3,1($5)

$L2431:
	li	$2,-2			# 0xfffffffffffffffe
$L2493:
	beq	$4,$2,$L2487
	nop

$L2434:
	addiu	$9,$5,32
	sltu	$4,$4,1
$L2437:
	sltu	$3,$7,1
	sltu	$2,$8,1
	addu	$2,$2,$3
	addu	$4,$2,$4
	slt	$3,$4,2
	bne	$3,$0,$L2440
	li	$2,1			# 0x1

$L2446:
	lh	$5,9180($16)
	lh	$3,9152($16)
	slt	$2,$3,$5
	beq	$2,$0,$L2449
	lh	$4,0($9)

	slt	$2,$3,$4
	bne	$2,$0,$L2488
	slt	$2,$5,$4

$L2450:
	lh	$6,2($14)
	lh	$4,2($13)
	slt	$2,$4,$6
	beq	$2,$0,$L2451
	lh	$5,2($9)

	slt	$2,$4,$5
	beq	$2,$0,$L2452
	slt	$2,$6,$5

	move	$4,$6
	movz	$4,$5,$2
$L2452:
	andi	$3,$3,0xffff
	sll	$2,$4,16
	b	$L2445
	addu	$4,$2,$3

$L2430:
	li	$2,-2			# 0xfffffffffffffffe
	bne	$4,$2,$L2434
	nop

$L2438:
	lb	$2,9459($16)
	addiu	$9,$5,12
	b	$L2437
	sltu	$4,$2,1

$L2451:
	slt	$2,$5,$4
	beq	$2,$0,$L2452
	slt	$2,$5,$6

	move	$4,$6
	b	$L2452
	movz	$4,$5,$2

$L2449:
	slt	$2,$4,$3
	beq	$2,$0,$L2450
	slt	$2,$4,$5

	move	$3,$5
	b	$L2450
	movz	$3,$4,$2

$L2440:
	bne	$4,$2,$L2446
	nop

	beq	$8,$0,$L2489
	nop

	beq	$7,$0,$L2490
	nop

	lh	$2,2($9)
	lhu	$3,0($9)
	sll	$2,$2,16
	b	$L2445
	addu	$4,$2,$3

$L2488:
	move	$3,$5
	b	$L2450
	movz	$3,$4,$2

$L2487:
	lw	$6,6172($16)
	andi	$4,$6,0x1
	beq	$4,$0,$L2438
	nop

$L2433:
	lb	$3,9467($16)
	li	$2,-2			# 0xfffffffffffffffe
	beq	$3,$2,$L2438
	nop

	bne	$10,$0,$L2438
	nop

	lw	$2,8768($16)
	sll	$2,$2,2
	addu	$2,$12,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L2438
	ori	$2,$6,0x1

	sll	$2,$2,1
	addu	$2,$2,$4
	sll	$2,$2,1
	addiu	$10,$2,-1
	lw	$4,152($16)
	sra	$2,$10,2
	lw	$3,6168($16)
	mul	$5,$2,$4
	sll	$3,$3,2
	addiu	$15,$3,-1
	sra	$3,$15,2
	addu	$2,$5,$3
	sll	$2,$2,2
	addu	$2,$12,$2
	lw	$2,0($2)
	andi	$3,$2,0x3000
	beq	$3,$0,$L2491
	nop

$L2439:
	lw	$2,9748($16)
	lw	$4,96($11)
	mul	$3,$10,$2
	lw	$5,9752($16)
	addu	$2,$3,$15
	sll	$2,$2,2
	addu	$4,$4,$2
	lhu	$3,0($4)
	lw	$6,188($11)
	sh	$3,9176($16)
	sra	$3,$10,1
	lh	$2,2($4)
	mul	$4,$3,$5
	sll	$2,$2,1
	addu	$3,$4,$6
	b	$L2467
	sra	$4,$15,1

$L2483:
	b	$L2433
	li	$4,1			# 0x1

$L2489:
	lh	$2,2($14)
	lhu	$3,9180($16)
	sll	$2,$2,16
	b	$L2445
	addu	$4,$2,$3

$L2490:
	lh	$2,2($13)
	lhu	$3,9152($16)
	sll	$2,$2,16
	b	$L2445
	addu	$4,$2,$3

$L2491:
	andi	$2,$2,0x40
	bne	$2,$0,$L2439
	nop

	b	$L2437
	move	$4,$0

$L2484:
	bne	$2,$0,$L2435
	nop

	b	$L2437
	move	$4,$0

	.set	macro
	.set	reorder
	.end	decode_mb_skip
	.section	.rodata.str1.4
	.align	2
$LC47:
	.ascii	"mb_type %d in %c slice too large at %d %d\012\000"
	.align	2
$LC48:
	.ascii	"top block unavailable for requested intra4x4 mode %d at "
	.ascii	"%d %d\012\000"
	.align	2
$LC49:
	.ascii	"left block unavailable for requested intra4x4 mode %d at"
	.ascii	" %d %d\012\000"
	.align	2
$LC50:
	.ascii	"B sub_mb_type %u out of range at %d %d\012\000"
	.align	2
$LC51:
	.ascii	"P sub_mb_type %u out of range at %d %d\012\000"
	.align	2
$LC52:
	.ascii	"ref %u overflow\012\000"
	.align	2
$LC53:
	.ascii	"cbp too large (%u) at %d %d\012\000"
	.align	2
$LC54:
	.ascii	"dquant out of range (%d) at %d %d\012\000"
	.text
	.align	2
	.ent	decode_mb_cavlc
	.type	decode_mb_cavlc, @function
decode_mb_cavlc:
	.set	nomips16
	.frame	$sp,328,$31		# vars= 248, regs= 10/0, args= 32, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-328
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,324($sp)
	sw	$fp,320($sp)
	sw	$23,316($sp)
	sw	$22,312($sp)
	sw	$21,308($sp)
	sw	$20,304($sp)
	sw	$19,300($sp)
	sw	$18,296($sp)
	sw	$17,292($sp)
	sw	$16,288($sp)
	.cprestore	32
	li	$2,131072			# 0x20000
	ori	$2,$2,0x1ad8
	move	$17,$4
	addu	$2,$4,$2
	sw	$2,204($sp)
	lw	$25,2180($4)
	move	$4,$2
	lw	$2,11868($17)
	lw	$20,6168($17)
	sw	$2,188($sp)
	lw	$19,6172($17)
	jalr	$25
	lw	$16,152($17)

	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	lw	$4,-6284($2)
	li	$3,1			# 0x1
	beq	$4,$3,$L2496
	lw	$28,32($sp)

	li	$2,5			# 0x5
	beq	$4,$2,$L2496
	li	$2,-1			# 0xffffffffffffffff

	lw	$3,6176($17)
	beq	$3,$2,$L2798
	nop

$L2497:
	addiu	$4,$3,-1
	beq	$3,$0,$L2496
	sw	$4,6176($17)

	li	$2,65536			# 0x10000
	addu	$6,$17,$2
	lw	$3,-6276($6)
	beq	$3,$0,$L2498
	nop

	lw	$2,6172($17)
	andi	$2,$2,0x1
	bne	$2,$0,$L2498
	nop

	bne	$4,$0,$L2499
	nop

	lw	$5,8456($17)
	lw	$3,8448($17)
	sra	$4,$5,3
	addu	$3,$3,$4
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	srl	$2,$2,7
	addiu	$5,$5,1
	sw	$2,-6268($6)
	sw	$5,8456($17)
	sw	$2,-6272($6)
$L2498:
	.option	pic0
	jal	decode_mb_skip
	.option	pic2
	move	$4,$17

	lw	$31,324($sp)
	lw	$28,32($sp)
	move	$2,$0
	lw	$fp,320($sp)
	lw	$23,316($sp)
	lw	$22,312($sp)
	lw	$21,308($sp)
	lw	$20,304($sp)
	lw	$19,300($sp)
	lw	$18,296($sp)
	lw	$17,292($sp)
	lw	$16,288($sp)
	j	$31
	addiu	$sp,$sp,328

$L2496:
	li	$2,65536			# 0x10000
	addu	$5,$17,$2
	lw	$3,-6276($5)
	bne	$3,$0,$L2799
	nop

	lw	$2,8500($17)
	lw	$7,8456($17)
	xori	$2,$2,0x3
	sltu	$2,$0,$2
	lw	$13,8448($17)
	sw	$2,-6272($5)
$L2502:
	sra	$2,$7,3
	addu	$2,$13,$2
	sw	$0,8748($17)
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$7,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L2800
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$6,$2
	bne	$2,$0,$L2505
	srl	$5,$6,16

	move	$5,$6
	move	$8,$0
$L2506:
	andi	$2,$5,0xff00
	beq	$2,$0,$L2865
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$8,$8,8
$L2865:
	addiu	$4,$7,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$8
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	addiu	$3,$2,-1
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	lw	$5,-6284($2)
	li	$2,3			# 0x3
	sw	$4,8456($17)
	beq	$5,$2,$L2801
	sw	$3,40($sp)

$L2508:
	li	$2,2			# 0x2
	beq	$5,$2,$L2802
	sltu	$2,$3,5

$L2511:
	lw	$18,40($sp)
	sltu	$2,$18,26
	beq	$2,$0,$L2803
	sll	$3,$18,2

	lui	$2,%hi(i_mb_type_info)
	addiu	$2,$2,%lo(i_mb_type_info)
	addu	$3,$3,$2
	lhu	$4,0($3)
	lbu	$2,2($3)
	lbu	$3,3($3)
	sw	$2,8760($17)
	sw	$3,192($sp)
	sw	$4,40($sp)
	move	$18,$0
$L2510:
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	lw	$3,-6272($2)
	beq	$3,$0,$L2866
	mtlo	$20

	lw	$2,40($sp)
	ori	$2,$2,0x80
	sw	$2,40($sp)
$L2866:
	madd	$16,$19
	li	$2,65536			# 0x10000
	addu	$4,$17,$2
	mflo	$2
	lw	$3,-6296($4)
	sw	$2,200($sp)
	lw	$5,200($sp)
	lw	$2,-6288($4)
	addu	$2,$2,$5
	sb	$3,0($2)
	lw	$11,40($sp)
	andi	$2,$11,0x4
	beq	$2,$0,$L2515
	addiu	$16,$17,8448

	lw	$3,8456($17)
	subu	$2,$0,$3
	andi	$2,$2,0x7
	bne	$2,$0,$L2804
	addu	$2,$2,$3

$L2516:
	li	$2,65536			# 0x10000
	lw	$9,8($16)
	lw	$14,8448($17)
	ori	$13,$2,0xd6c
	move	$11,$0
	li	$12,16			# 0x10
	srl	$2,$11,2
$L2867:
	srl	$3,$11,3
	sll	$3,$3,2
	andi	$2,$2,0x1
	addu	$2,$2,$3
	sll	$2,$2,3
	andi	$3,$11,0x3
	addu	$2,$2,$3
	sll	$10,$2,2
	move	$8,$0
$L2517:
	sra	$5,$9,3
	addu	$5,$14,$5
	srl	$3,$8,2
	srl	$2,$8,3
	lbu	$6,0($5)
	andi	$3,$3,0x1
	sll	$2,$2,2
	lbu	$4,3($5)
	addu	$2,$2,$3
	lbu	$3,1($5)
	lbu	$7,2($5)
	sll	$6,$6,24
	sll	$2,$2,4
	sll	$3,$3,16
	andi	$5,$8,0x3
	or	$4,$4,$6
	addu	$2,$2,$10
	or	$4,$4,$3
	addu	$2,$2,$5
	sll	$7,$7,8
	andi	$3,$9,0x7
	or	$4,$4,$7
	addu	$2,$2,$13
	sll	$4,$4,$3
	sll	$2,$2,1
	srl	$4,$4,24
	addiu	$9,$9,8
	addu	$2,$17,$2
	addiu	$8,$8,1
	sh	$4,0($2)
	bne	$8,$12,$L2517
	sw	$9,8($16)

	addiu	$11,$11,1
	bne	$11,$8,$L2867
	srl	$2,$11,2

	li	$2,65536			# 0x10000
	ori	$13,$2,0xd6c
	move	$11,$0
	li	$12,8			# 0x8
	andi	$3,$11,0x3
$L2868:
	srl	$2,$11,2
	addiu	$3,$3,64
	sll	$2,$2,3
	addu	$3,$3,$2
	sll	$10,$3,2
	move	$8,$0
$L2519:
	sra	$2,$9,3
	addu	$2,$14,$2
	lbu	$5,0($2)
	lbu	$4,3($2)
	lbu	$6,1($2)
	srl	$3,$8,2
	lbu	$7,2($2)
	sll	$5,$5,24
	sll	$3,$3,4
	andi	$2,$8,0x3
	or	$4,$4,$5
	sll	$6,$6,16
	addu	$3,$3,$10
	addu	$3,$3,$2
	or	$4,$4,$6
	sll	$7,$7,8
	andi	$2,$9,0x7
	or	$4,$4,$7
	addu	$3,$3,$13
	sll	$4,$4,$2
	sll	$3,$3,1
	srl	$4,$4,24
	addiu	$9,$9,8
	addu	$3,$17,$3
	addiu	$8,$8,1
	sh	$4,0($3)
	bne	$8,$12,$L2519
	sw	$9,8($16)

	addiu	$11,$11,1
	bne	$11,$8,$L2868
	andi	$3,$11,0x3

	li	$2,65536			# 0x10000
	ori	$13,$2,0xd6c
	move	$11,$0
	li	$12,8			# 0x8
	andi	$3,$11,0x3
$L2869:
	srl	$2,$11,2
	addiu	$3,$3,80
	sll	$2,$2,3
	addu	$3,$3,$2
	sll	$10,$3,2
	move	$8,$0
$L2521:
	sra	$2,$9,3
	addu	$2,$14,$2
	lbu	$5,0($2)
	lbu	$4,3($2)
	lbu	$6,1($2)
	srl	$3,$8,2
	lbu	$7,2($2)
	sll	$5,$5,24
	sll	$3,$3,4
	andi	$2,$8,0x3
	or	$4,$4,$5
	sll	$6,$6,16
	addu	$3,$3,$10
	addu	$3,$3,$2
	or	$4,$4,$6
	sll	$7,$7,8
	andi	$2,$9,0x7
	or	$4,$4,$7
	addu	$3,$3,$13
	sll	$4,$4,$2
	sll	$3,$3,1
	srl	$4,$4,24
	addiu	$9,$9,8
	addu	$3,$17,$3
	addiu	$8,$8,1
	sh	$4,0($3)
	bne	$8,$12,$L2521
	sw	$9,8($16)

	addiu	$11,$11,1
	bne	$11,$8,$L2869
	andi	$3,$11,0x3

	lw	$6,200($sp)
	lw	$2,1548($17)
	lw	$25,%call16(memset)($28)
	addu	$2,$2,$6
	sb	$0,0($2)
	lbu	$3,12096($17)
	lw	$5,9128($17)
	lbu	$2,12352($17)
	sll	$4,$6,4
	addu	$4,$5,$4
	sw	$3,8740($17)
	sw	$2,8744($17)
	li	$5,16			# 0x10
	jalr	$25
	li	$6,16			# 0x10

	lw	$8,200($sp)
	lw	$2,1568($17)
	sll	$3,$8,2
	lw	$4,40($sp)
	addu	$2,$2,$3
	lw	$28,32($sp)
	sw	$4,0($2)
	move	$2,$0
$L2500:
	lw	$31,324($sp)
	lw	$fp,320($sp)
	lw	$23,316($sp)
	lw	$22,312($sp)
	lw	$21,308($sp)
	lw	$20,304($sp)
	lw	$19,300($sp)
	lw	$18,296($sp)
	lw	$17,292($sp)
	lw	$16,288($sp)
	j	$31
	addiu	$sp,$sp,328

$L2799:
	lw	$2,6172($17)
	andi	$2,$2,0x1
	bne	$2,$0,$L2805
	nop

	lw	$7,8456($17)
	lw	$13,8448($17)
	sra	$2,$7,3
	addu	$2,$13,$2
	lbu	$3,0($2)
	andi	$4,$7,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	srl	$3,$3,7
	addiu	$7,$7,1
	sw	$3,-6268($5)
	sw	$7,8456($17)
	b	$L2502
	sw	$3,-6272($5)

$L2515:
	lw	$2,-6268($4)
	beq	$2,$0,$L2870
	move	$5,$11

	lw	$3,5936($4)
	lw	$2,5940($4)
	sll	$3,$3,1
	sll	$2,$2,1
	sw	$2,5940($4)
	sw	$3,5936($4)
$L2870:
	move	$4,$17
	.option	pic0
	jal	fill_caches
	.option	pic2
	move	$6,$0

	lw	$11,40($sp)
	andi	$2,$11,0x7
	bne	$2,$0,$L2806
	lw	$28,32($sp)

	li	$2,4			# 0x4
	beq	$18,$2,$L2807
	andi	$2,$11,0x100

	bne	$2,$0,$L2808
	andi	$2,$11,0x8

	beq	$2,$0,$L2636
	andi	$2,$11,0x10

	li	$4,65536			# 0x10000
	addu	$3,$17,$4
	lw	$2,5944($3)
	beq	$2,$0,$L2551
	ori	$2,$4,0x1730

	addu	$20,$17,$2
	move	$22,$3
	addiu	$21,$17,9456
	move	$18,$0
	move	$19,$0
	li	$23,4096			# 0x1000
	b	$L2643
	li	$fp,1			# 0x1

$L2637:
$L2642:
	sll	$2,$19,5
	sll	$3,$19,3
	addu	$3,$3,$2
	addiu	$3,$3,12
	addu	$3,$21,$3
	sw	$4,24($3)
	sw	$4,0($3)
	sw	$4,8($3)
	sw	$4,16($3)
	lw	$3,5944($22)
	addiu	$18,$18,1
	sltu	$2,$18,$3
	addiu	$20,$20,4
	beq	$2,$0,$L2809
	move	$19,$18

$L2643:
	sll	$2,$18,1
	sll	$2,$23,$2
	and	$2,$2,$11
	beq	$2,$0,$L2637
	li	$4,-1			# 0xffffffffffffffff

	lw	$3,0($20)
	beq	$3,$fp,$L2810
	li	$2,2			# 0x2

	beq	$3,$2,$L2811
	move	$4,$16

	.option	pic0
	jal	get_ue_golomb
	nop

	.option	pic2
	lw	$28,32($sp)
	lw	$3,0($20)
	move	$7,$2
$L2639:
	sll	$2,$7,8
	addu	$2,$2,$7
	sltu	$3,$7,$3
	beq	$3,$0,$L2670
	sll	$4,$2,16

	addu	$4,$2,$4
	b	$L2642
	lw	$11,40($sp)

$L2800:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$7
	addu	$2,$2,$4
	sw	$3,8456($17)
	lbu	$3,0($2)
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	lw	$5,-6284($2)
	li	$2,3			# 0x3
	bne	$5,$2,$L2508
	sw	$3,40($sp)

$L2801:
	sltu	$2,$3,23
	beq	$2,$0,$L2509
	addiu	$2,$3,-23

	sll	$2,$3,2
	lui	$3,%hi(b_mb_type_info)
	addiu	$3,$3,%lo(b_mb_type_info)
$L2779:
	addu	$2,$2,$3
	lhu	$4,0($2)
	lbu	$18,2($2)
	sw	$4,40($sp)
	b	$L2510
	sw	$0,192($sp)

$L2505:
	b	$L2506
	li	$8,16			# 0x10

$L2805:
	lw	$7,8456($17)
	b	$L2502
	lw	$13,8448($17)

$L2804:
	b	$L2516
	sw	$2,8456($17)

$L2806:
	andi	$2,$11,0x1
	beq	$2,$0,$L2525
	lw	$2,188($sp)

	bne	$2,$0,$L2769
	nop

	lw	$7,8456($17)
	lw	$13,8448($17)
$L2526:
	li	$10,1			# 0x1
$L2527:
	lui	$2,%hi(scan8)
	addiu	$12,$2,%lo(scan8)
	move	$11,$10
	li	$15,2			# 0x2
	li	$18,4			# 0x4
$L2532:
	lbu	$9,0($12)
	sra	$2,$7,3
	addu	$3,$17,$9
	addu	$2,$13,$2
	lbu	$4,0($2)
	lb	$5,8775($3)
	lb	$8,8768($3)
	andi	$2,$7,0x7
	sll	$4,$4,$2
	slt	$3,$5,$8
	movn	$8,$5,$3
	andi	$4,$4,0x00ff
	addiu	$3,$7,1
	slt	$2,$8,0
	srl	$4,$4,7
	addu	$14,$17,$9
	sw	$3,8456($17)
	beq	$4,$0,$L2812
	movn	$8,$15,$2

	beq	$10,$18,$L2871
	sll	$3,$8,8

$L2530:
	addu	$11,$11,$10
	subu	$2,$11,$10
	slt	$2,$2,16
	sb	$8,8776($14)
	beq	$2,$0,$L2770
	addu	$12,$12,$10

$L2814:
	b	$L2532
	lw	$7,8456($17)

$L2509:
	b	$L2511
	sw	$2,40($sp)

$L2812:
	lw	$7,8($16)
	lw	$3,0($16)
	sra	$2,$7,3
	addu	$3,$3,$2
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	lbu	$6,2($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	andi	$3,$7,0x7
	or	$2,$2,$6
	sll	$2,$2,$3
	srl	$2,$2,29
	slt	$3,$2,$8
	addiu	$7,$7,3
	xori	$3,$3,0x1
	sw	$7,8($16)
	bne	$10,$18,$L2530
	addu	$8,$3,$2

	sll	$3,$8,8
$L2871:
	addu	$3,$3,$8
	addiu	$2,$9,8776
	addu	$2,$17,$2
	andi	$3,$3,0xffff
	addu	$11,$11,$10
	sh	$3,8($2)
	sh	$3,0($2)
	subu	$2,$11,$10
	slt	$2,$2,16
	bne	$2,$0,$L2814
	addu	$12,$12,$10

$L2770:
	lw	$4,152($17)
	lw	$5,6172($17)
	lw	$2,6168($17)
	mul	$6,$4,$5
	lw	$3,8816($17)
	addu	$4,$6,$2
	sll	$4,$4,3
	lbu	$6,8791($17)
	addu	$3,$3,$4
	sb	$6,0($3)
	lw	$2,8816($17)
	lbu	$5,8799($17)
	addu	$2,$2,$4
	sb	$5,1($2)
	lw	$3,8816($17)
	lbu	$5,8807($17)
	addu	$3,$3,$4
	sb	$5,2($3)
	lw	$2,8816($17)
	lbu	$5,8815($17)
	addu	$2,$2,$4
	sb	$5,3($2)
	lw	$3,8816($17)
	lbu	$5,8812($17)
	addu	$3,$3,$4
	sb	$5,4($3)
	lw	$2,8816($17)
	lbu	$5,8813($17)
	addu	$2,$2,$4
	sb	$5,5($2)
	lw	$3,8816($17)
	lbu	$5,8814($17)
	addu	$3,$3,$4
	sb	$5,6($3)
	lw	$2,8984($17)
	andi	$2,$2,0x8000
	bne	$2,$0,$L2533
	lui	$2,%hi(top.8874)

	addiu	$6,$2,%lo(top.8874)
	move	$3,$17
	move	$4,$0
	li	$5,4			# 0x4
$L2536:
	lb	$2,8788($3)
	addu	$2,$6,$2
	lb	$7,0($2)
	bltz	$7,$L2815
	addiu	$4,$4,1

	beq	$7,$0,$L2535
	nop

	sb	$7,8788($3)
$L2535:
	bne	$4,$5,$L2536
	addiu	$3,$3,1

$L2533:
	lw	$2,8992($17)
	andi	$2,$2,0x8000
	bne	$2,$0,$L2537
	lui	$2,%hi(left.8875)

	addiu	$6,$2,%lo(left.8875)
	move	$4,$17
	move	$3,$0
	li	$5,4			# 0x4
$L2540:
	lb	$2,8788($4)
	addu	$2,$6,$2
	lb	$7,0($2)
	bltz	$7,$L2816
	addiu	$3,$3,1

	beq	$7,$0,$L2539
	nop

	sb	$7,8788($4)
$L2539:
	bne	$3,$5,$L2540
	addiu	$4,$4,8

$L2537:
	lw	$8,8456($17)
	lw	$13,8448($17)
	sra	$2,$8,3
	addu	$2,$13,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L2817
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$7,$2
	bne	$2,$0,$L2544
	srl	$5,$7,16

	move	$5,$7
	move	$6,$0
$L2545:
	andi	$2,$5,0xff00
	beq	$2,$0,$L2546
	nop

	srl	$5,$5,8
	addiu	$6,$6,8
$L2546:
	lw	$3,%got(ff_log2_tab)($28)
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$7,$2
	sw	$4,8456($17)
	b	$L2543
	addiu	$3,$2,-1

$L2807:
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	lw	$4,-6284($2)
	li	$3,3			# 0x3
	bne	$4,$3,$L2553
	addiu	$3,$sp,52

	addiu	$8,$sp,52
	li	$2,59272			# 0xe788
	lui	$3,%hi(b_sub_mb_type_info)
	sw	$8,224($sp)
	addu	$19,$17,$2
	addiu	$20,$3,%lo(b_sub_mb_type_info)
	move	$18,$8
	addiu	$21,$sp,68
$L2555:
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$16

	move	$7,$2
	sll	$2,$2,2
	addu	$3,$2,$20
	sltu	$2,$7,13
	lw	$28,32($sp)
	sw	$21,208($sp)
	beq	$2,$0,$L2818
	sw	$7,0($19)

	lbu	$2,2($3)
	lhu	$3,0($3)
	sw	$2,0($18)
	lw	$2,208($sp)
	addiu	$18,$18,4
	sw	$3,0($19)
	bne	$2,$18,$L2555
	addiu	$19,$19,4

	li	$3,65536			# 0x10000
	addu	$3,$17,$3
	lw	$2,-6264($3)
	andi	$2,$2,0x100
	bne	$2,$0,$L2556
	nop

	lw	$2,-6260($3)
	andi	$2,$2,0x100
	bne	$2,$0,$L2872
	move	$4,$17

	lw	$2,-6256($3)
	andi	$2,$2,0x100
	bne	$2,$0,$L2872
	nop

	lw	$2,-6252($3)
	andi	$2,$2,0x100
	beq	$2,$0,$L2860
	li	$3,65536			# 0x10000

$L2556:
	move	$4,$17
$L2872:
	.option	pic0
	jal	pred_direct_motion
	.option	pic2
	addiu	$5,$sp,40

	li	$2,-2
	lw	$28,32($sp)
	sb	$2,9470($17)
	sb	$2,9526($17)
	sb	$2,9486($17)
	sb	$2,9510($17)
	li	$3,65536			# 0x10000
$L2860:
	addu	$4,$17,$3
	lw	$2,5944($4)
	beq	$2,$0,$L2819
	ori	$2,$3,0x1730

	lw	$11,40($sp)
	addu	$13,$17,$2
	lw	$fp,%got(ff_log2_tab)($28)
	li	$2,59272			# 0xe788
	lw	$31,%got(ff_golomb_vlc_len)($28)
	andi	$18,$11,0x200
	addu	$19,$17,$2
	move	$20,$4
	move	$11,$0
	li	$22,1			# 0x1
	li	$23,-1			# 0xffffffffffffffff
	li	$24,2			# 0x2
	li	$25,134217728			# 0x8000000
$L2580:
	beq	$18,$0,$L2567
	nop

	li	$12,1			# 0x1
$L2568:
	lw	$5,208($sp)
	sll	$2,$11,1
	sll	$4,$11,4
	li	$3,4096			# 0x1000
	sll	$14,$3,$2
	addu	$10,$5,$4
	move	$8,$19
	move	$9,$0
	li	$21,-65536			# 0xffffffffffff0000
	li	$15,4			# 0x4
$L2579:
	lw	$3,0($8)
	andi	$2,$3,0x100
	bne	$2,$0,$L2569
	and	$2,$14,$3

	bne	$2,$0,$L2820
	nop

	sw	$23,0($10)
$L2569:
	addiu	$9,$9,1
	addiu	$8,$8,4
	bne	$9,$15,$L2579
	addiu	$10,$10,4

	lw	$4,5944($20)
	addiu	$11,$11,1
	sltu	$2,$11,$4
	bne	$2,$0,$L2580
	addiu	$13,$13,4

$L2559:
	lw	$8,188($sp)
	beq	$8,$0,$L2581
	li	$2,59272			# 0xe788

	li	$3,59288			# 0xe798
	addu	$5,$17,$2
	addu	$6,$17,$3
$L2584:
	lw	$2,0($5)
	andi	$3,$2,0x100
	andi	$2,$2,0x8
	beq	$2,$0,$L2582
	addiu	$5,$5,4

	lw	$2,9980($17)
	bne	$2,$0,$L2583
	nop

	bne	$3,$0,$L2582
	nop

$L2583:
	bne	$5,$6,$L2584
	li	$2,1			# 0x1

	sw	$2,188($sp)
$L2581:
	beq	$4,$0,$L2783
	lui	$2,%hi(scan8)

	addiu	$2,$2,%lo(scan8)
	sw	$2,220($sp)
	li	$3,65536			# 0x10000
	li	$2,59272			# 0xe788
	addu	$2,$17,$2
	addu	$3,$17,$3
	sw	$2,244($sp)
	sw	$3,248($sp)
	addiu	$22,$17,9136
	sw	$17,140($sp)
	sw	$17,104($sp)
	sw	$0,108($sp)
	move	$5,$0
$L2634:
	sll	$4,$5,2
	sll	$2,$5,4
	addu	$2,$4,$2
	lw	$3,108($sp)
	addu	$4,$4,$5
	subu	$2,$0,$2
	addiu	$2,$2,1
	subu	$4,$0,$4
	sll	$6,$5,3
	sll	$7,$3,3
	sll	$2,$2,1
	sll	$3,$3,5
	addiu	$4,$4,1
	sll	$5,$5,5
	addu	$5,$6,$5
	addu	$7,$7,$3
	lw	$6,108($sp)
	lw	$3,108($sp)
	subu	$2,$0,$2
	sll	$4,$4,3
	subu	$4,$0,$4
	addiu	$2,$2,12
	sw	$5,168($sp)
	addiu	$8,$3,24
	sll	$5,$6,1
	addiu	$9,$3,46
	sll	$2,$2,2
	li	$3,12288			# 0x3000
	sw	$4,164($sp)
	lw	$4,208($sp)
	sll	$3,$3,$5
	addu	$2,$22,$2
	sll	$8,$8,2
	sll	$6,$6,4
	addu	$6,$4,$6
	sw	$3,176($sp)
	sw	$2,172($sp)
	sw	$8,236($sp)
	lw	$2,244($sp)
	lw	$8,168($sp)
	lw	$3,220($sp)
	sll	$9,$9,2
	sw	$6,144($sp)
	li	$6,4096			# 0x1000
	sw	$9,240($sp)
	addu	$fp,$17,$7
	sll	$9,$6,$5
	addiu	$31,$8,-1
	sw	$2,156($sp)
	sw	$3,148($sp)
	sw	$0,152($sp)
$L2633:
	lw	$4,156($sp)
	lw	$5,0($4)
	andi	$2,$5,0x100
	beq	$2,$0,$L2585
	lw	$8,148($sp)

	lw	$5,148($sp)
	lbu	$2,0($5)
	addu	$2,$fp,$2
	lbu	$3,9457($2)
	sb	$3,9456($2)
$L2586:
	lw	$4,152($sp)
	lw	$5,156($sp)
	lw	$6,148($sp)
	lw	$8,144($sp)
	addiu	$4,$4,4
	addiu	$5,$5,4
	addiu	$6,$6,4
	addiu	$8,$8,4
	li	$2,16			# 0x10
	sw	$4,152($sp)
	sw	$5,156($sp)
	sw	$6,148($sp)
	bne	$4,$2,$L2633
	sw	$8,144($sp)

	lw	$3,248($sp)
	lw	$4,108($sp)
	lw	$5,104($sp)
	lw	$6,140($sp)
	lw	$2,5944($3)
	addiu	$4,$4,1
	addiu	$5,$5,160
	addiu	$6,$6,40
	sltu	$2,$4,$2
	sw	$5,104($sp)
	sw	$4,108($sp)
	sw	$6,140($sp)
	bne	$2,$0,$L2634
	move	$5,$4

$L2783:
	lw	$11,40($sp)
$L2551:
	andi	$2,$11,0x78
$L2861:
	bne	$2,$0,$L2821
	nop

$L2678:
	andi	$2,$11,0x2
	beq	$2,$0,$L2822
	nop

$L2679:
	li	$2,131072			# 0x20000
	lw	$3,192($sp)
	lw	$4,188($sp)
	addu	$2,$17,$2
	beq	$4,$0,$L2682
	sw	$3,8664($2)

	andi	$2,$3,0xf
	beq	$2,$0,$L2682
	andi	$2,$11,0x7

	bne	$2,$0,$L2823
	nop

	lw	$5,8456($17)
	lw	$13,8448($17)
	sra	$2,$5,3
	addu	$2,$13,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	beq	$3,$0,$L2683
	sw	$5,8456($17)

	li	$2,16777216			# 0x1000000
	or	$2,$11,$2
	sw	$2,40($sp)
	b	$L2683
	move	$11,$2

$L2682:
	lw	$5,200($sp)
	lw	$2,1568($17)
	sll	$3,$5,2
	lw	$6,192($sp)
	addu	$2,$2,$3
	bne	$6,$0,$L2824
	sw	$11,0($2)

	lw	$11,40($sp)
	andi	$2,$11,0x2
	beq	$2,$0,$L2685
	addiu	$2,$17,9092

	lw	$13,8448($17)
$L2684:
	andi	$2,$11,0x7
	beq	$2,$0,$L2686
	li	$2,131072			# 0x20000

	addu	$2,$17,$2
	lw	$fp,6864($2)
$L2687:
	andi	$2,$11,0x80
	beq	$2,$0,$L2688
	nop

	lw	$8,2056($17)
	beq	$8,$0,$L2689
	li	$2,131072			# 0x20000

	ori	$3,$2,0x23f4
	ori	$2,$2,0x2444
	addu	$23,$17,$2
	addu	$3,$17,$3
	lui	$2,%hi(luma_dc_field_scan)
	sw	$3,180($sp)
	addiu	$10,$2,%lo(luma_dc_field_scan)
$L2690:
	lw	$9,8456($17)
	sra	$2,$9,3
	addu	$2,$13,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$9,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L2825
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$7,$2
	beq	$2,$0,$L2826
	move	$5,$7

	srl	$5,$7,16
	li	$6,16			# 0x10
$L2695:
	andi	$2,$5,0xff00
	beq	$2,$0,$L2873
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L2873:
	addiu	$4,$9,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$7,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L2697
	sw	$4,8456($17)

	srl	$2,$5,1
	subu	$7,$0,$2
$L2693:
	addiu	$2,$7,26
	sltu	$2,$2,52
	beq	$2,$0,$L2827
	addu	$8,$7,$8

	sltu	$2,$8,52
	bne	$2,$0,$L2700
	sw	$8,2056($17)

	bltz	$8,$L2828
	addiu	$2,$8,-52

	sw	$2,2056($17)
	move	$8,$2
$L2700:
	andi	$2,$8,0xff
	addu	$2,$17,$2
	lbu	$5,12352($2)
	lbu	$3,12096($2)
	andi	$4,$11,0x2
	sw	$3,8740($17)
	bne	$4,$0,$L2829
	sw	$5,8744($17)

	lw	$21,204($sp)
	move	$20,$0
	move	$19,$0
$L2716:
	li	$4,1			# 0x1
	lw	$5,192($sp)
	sll	$2,$4,$20
	and	$2,$2,$5
	beq	$2,$0,$L2707
	lui	$4,%hi(scan8)

	lw	$11,40($sp)
	li	$6,16777216			# 0x1000000
	and	$2,$11,$6
	beq	$2,$0,$L2708
	move	$18,$21

	move	$18,$23
	move	$16,$19
	addiu	$22,$19,4
$L2711:
	andi	$3,$11,0x7
	li	$8,59224			# 0xe758
	li	$2,59228			# 0xe75c
	movn	$2,$8,$3
	addu	$2,$17,$2
	lw	$3,2056($17)
	lw	$8,4($2)
	sll	$3,$3,8
	move	$7,$16
	addu	$8,$8,$3
	li	$2,16			# 0x10
	move	$4,$17
	move	$5,$fp
	move	$6,$21
	sw	$8,20($sp)
	sw	$18,16($sp)
	.option	pic0
	jal	decode_residual
	.option	pic2
	sw	$2,24($sp)

	lw	$28,32($sp)
	addiu	$16,$16,1
	bltz	$2,$L2541
	move	$7,$22

	beq	$22,$16,$L2778
	addiu	$18,$18,16

	b	$L2711
	lw	$11,40($sp)

$L2707:
	addiu	$4,$4,%lo(scan8)
	addu	$2,$4,$19
	lbu	$3,0($2)
	addiu	$7,$19,4
	addiu	$2,$3,9080
	addu	$2,$17,$2
	addu	$3,$17,$3
	sb	$0,1($2)
	sb	$0,9($2)
	sb	$0,8($2)
	sb	$0,9080($3)
$L2712:
	addiu	$20,$20,1
	li	$5,4			# 0x4
	move	$19,$7
	bne	$20,$5,$L2716
	addiu	$21,$21,128

$L2706:
	lw	$6,192($sp)
	andi	$2,$6,0x30
	beq	$2,$0,$L2874
	lw	$8,192($sp)

	li	$16,131072			# 0x20000
	lui	$2,%hi(chroma_dc_scan)
	ori	$6,$16,0x1cd8
	addiu	$18,$2,%lo(chroma_dc_scan)
	addu	$6,$17,$6
	li	$19,4			# 0x4
	move	$4,$17
	move	$5,$fp
	li	$7,26			# 0x1a
	sw	$18,16($sp)
	sw	$0,20($sp)
	.option	pic0
	jal	decode_residual
	.option	pic2
	sw	$19,24($sp)

	bltz	$2,$L2541
	lw	$28,32($sp)

	ori	$6,$16,0x1d58
	addu	$6,$17,$6
	move	$4,$17
	move	$5,$fp
	li	$7,26			# 0x1a
	sw	$18,16($sp)
	sw	$19,24($sp)
	.option	pic0
	jal	decode_residual
	.option	pic2
	sw	$0,20($sp)

	bltz	$2,$L2541
	lw	$28,32($sp)

	lw	$8,192($sp)
$L2874:
	andi	$2,$8,0x20
	beq	$2,$0,$L2784
	lw	$2,180($sp)

	move	$22,$0
	addiu	$23,$2,1
	li	$2,131072			# 0x20000
	ori	$2,$2,0x1cd8
	addu	$21,$17,$2
	li	$19,16			# 0x10
$L2722:
	lw	$3,40($sp)
	li	$2,3			# 0x3
	andi	$3,$3,0x7
	movn	$2,$0,$3
	addiu	$22,$22,1
	addu	$2,$22,$2
	addiu	$2,$2,14800
	sll	$2,$2,2
	addu	$4,$17,$19
	addu	$2,$17,$2
	lw	$3,8724($4)
	lw	$5,4($2)
	sll	$3,$3,6
	addu	$20,$5,$3
	move	$18,$21
	move	$16,$0
	move	$6,$18
$L2875:
	addu	$7,$19,$16
	li	$3,15			# 0xf
	move	$4,$17
	move	$5,$fp
	sw	$23,16($sp)
	sw	$20,20($sp)
	.option	pic0
	jal	decode_residual
	.option	pic2
	sw	$3,24($sp)

	addiu	$16,$16,1
	lw	$28,32($sp)
	bltz	$2,$L2541
	addiu	$18,$18,32

	li	$4,4			# 0x4
	bne	$16,$4,$L2875
	move	$6,$18

	li	$5,2			# 0x2
	addiu	$21,$21,128
	bne	$22,$5,$L2722
	addiu	$19,$19,4

$L2723:
	lw	$6,200($sp)
	lw	$2,1548($17)
	lw	$3,2056($17)
	addu	$2,$2,$6
	sb	$3,0($2)
	lw	$4,152($17)
	lw	$5,6172($17)
	lw	$2,6168($17)
	mul	$6,$4,$5
	lw	$3,9128($17)
	addu	$4,$6,$2
	sll	$7,$4,4
	lbu	$6,9095($17)
	addu	$3,$3,$7
	sb	$6,0($3)
	lw	$2,9128($17)
	lbu	$4,9103($17)
	addu	$2,$2,$7
	sb	$4,1($2)
	lw	$3,9128($17)
	lbu	$4,9111($17)
	addu	$3,$3,$7
	sb	$4,2($3)
	lw	$2,9128($17)
	lbu	$4,9119($17)
	addu	$2,$2,$7
	sb	$4,3($2)
	lw	$3,9128($17)
	lbu	$4,9116($17)
	addu	$3,$3,$7
	sb	$4,4($3)
	lw	$2,9128($17)
	lbu	$4,9117($17)
	addu	$2,$2,$7
	sb	$4,5($2)
	lw	$3,9128($17)
	lbu	$4,9118($17)
	addu	$3,$3,$7
	sb	$4,6($3)
	lw	$2,9128($17)
	lbu	$4,9097($17)
	addu	$2,$2,$7
	sb	$4,9($2)
	lw	$3,9128($17)
	lbu	$4,9098($17)
	addu	$3,$3,$7
	sb	$4,8($3)
	lw	$2,9128($17)
	lbu	$4,9090($17)
	addu	$2,$2,$7
	sb	$4,7($2)
	lw	$3,9128($17)
	lbu	$4,9121($17)
	addu	$3,$3,$7
	sb	$4,12($3)
	lw	$2,9128($17)
	lbu	$4,9122($17)
	addu	$2,$2,$7
	sb	$4,11($2)
	lw	$3,9128($17)
	lbu	$4,9114($17)
	addu	$3,$3,$7
	li	$2,65536			# 0x10000
	sb	$4,10($3)
	addu	$2,$17,$2
	lw	$3,-6276($2)
	beq	$3,$0,$L2724
	lui	$2,%hi(scan8)

	addiu	$2,$2,%lo(scan8)
	sw	$2,220($sp)
	move	$4,$0
	move	$5,$0
	li	$6,16			# 0x10
	lw	$8,220($sp)
$L2888:
	addu	$2,$8,$4
	lbu	$3,0($2)
	addu	$3,$17,$3
	lbu	$2,9080($3)
	sltu	$2,$0,$2
	sll	$2,$2,$4
	addiu	$4,$4,1
	bne	$4,$6,$L2888
	addu	$5,$5,$2

	lw	$2,9128($17)
	addu	$2,$2,$7
	sh	$5,14($2)
$L2724:
	li	$2,65536			# 0x10000
	addu	$4,$17,$2
	lw	$3,-6268($4)
	beq	$3,$0,$L2876
	lw	$31,324($sp)

	lw	$3,5936($4)
	lw	$2,5940($4)
	srl	$3,$3,1
	srl	$2,$2,1
	sw	$2,5940($4)
	sw	$3,5936($4)
	lw	$31,324($sp)
$L2876:
	move	$2,$0
	lw	$fp,320($sp)
	lw	$23,316($sp)
	lw	$22,312($sp)
	lw	$21,308($sp)
	lw	$20,304($sp)
	lw	$19,300($sp)
	lw	$18,296($sp)
	lw	$17,292($sp)
	lw	$16,288($sp)
	j	$31
	addiu	$sp,$sp,328

$L2802:
	beq	$2,$0,$L2512
	sll	$2,$3,2

	lui	$3,%hi(p_mb_type_info)
	b	$L2779
	addiu	$3,$3,%lo(p_mb_type_info)

$L2549:
	bgez	$3,$L2550
	nop

$L2541:
	li	$2,-1			# 0xffffffffffffffff
$L2835:
	lw	$31,324($sp)
	lw	$fp,320($sp)
	lw	$23,316($sp)
	lw	$22,312($sp)
	lw	$21,308($sp)
	lw	$20,304($sp)
	lw	$19,300($sp)
	lw	$18,296($sp)
	lw	$17,292($sp)
	lw	$16,288($sp)
	j	$31
	addiu	$sp,$sp,328

$L2708:
	move	$16,$0
$L2715:
	andi	$3,$11,0x7
	li	$2,3			# 0x3
	movn	$2,$0,$3
	addiu	$2,$2,14800
	sll	$2,$2,2
	lw	$3,2056($17)
	addu	$2,$17,$2
	lw	$8,4($2)
	sll	$3,$3,6
	addu	$8,$8,$3
	sw	$8,20($sp)
	lw	$8,180($sp)
	addu	$7,$16,$19
	li	$2,16			# 0x10
	move	$6,$18
	move	$4,$17
	move	$5,$fp
	sw	$8,16($sp)
	.option	pic0
	jal	decode_residual
	.option	pic2
	sw	$2,24($sp)

	lw	$28,32($sp)
	bltz	$2,$L2541
	addiu	$16,$16,1

	li	$3,4			# 0x4
	beq	$16,$3,$L2830
	addiu	$18,$18,32

	b	$L2715
	lw	$11,40($sp)

$L2685:
	sw	$0,9092($17)
	sw	$0,24($2)
	sw	$0,8($2)
	sw	$0,16($2)
$L2784:
	sb	$0,9122($17)
	sb	$0,9121($17)
	sb	$0,9114($17)
	sb	$0,9113($17)
	sb	$0,9098($17)
	sb	$0,9097($17)
	sb	$0,9090($17)
	b	$L2723
	sb	$0,9089($17)

$L2778:
	lui	$3,%hi(scan8)
	addiu	$3,$3,%lo(scan8)
	addu	$2,$3,$19
	lbu	$4,0($2)
	addiu	$3,$4,9080
	addu	$3,$17,$3
	lbu	$2,8($3)
	lbu	$5,1($3)
	lbu	$6,9($3)
	addu	$4,$17,$4
	lbu	$3,9080($4)
	addu	$2,$2,$5
	addu	$2,$2,$6
	addu	$2,$2,$3
	b	$L2712
	sb	$2,9080($4)

$L2830:
	b	$L2712
	addiu	$7,$19,4

$L2688:
	lw	$8,2056($17)
	beq	$8,$0,$L2691
	li	$2,131072			# 0x20000

	ori	$3,$2,0x2364
	ori	$2,$2,0x23b4
	addu	$23,$17,$2
	addu	$3,$17,$3
	lui	$2,%hi(luma_dc_zigzag_scan)
	sw	$3,180($sp)
	b	$L2690
	addiu	$10,$2,%lo(luma_dc_zigzag_scan)

$L2686:
	addu	$2,$17,$2
	b	$L2687
	lw	$fp,6868($2)

$L2512:
	addiu	$2,$3,-5
	b	$L2511
	sw	$2,40($sp)

$L2825:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_se_golomb_vlc_code)($28)
	addu	$3,$3,$9
	addu	$2,$2,$4
	sw	$3,8456($17)
	b	$L2693
	lb	$7,0($2)

$L2811:
	lw	$5,8($16)
	lw	$3,0($16)
	sra	$4,$5,3
	addu	$3,$3,$4
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,1
	sw	$5,8($16)
	srl	$2,$2,7
	xori	$7,$2,0x1
	b	$L2639
	lw	$3,0($20)

$L2798:
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	addiu	$4,$17,8448

	lw	$28,32($sp)
	move	$3,$2
	b	$L2497
	sw	$2,6176($17)

$L2821:
	move	$5,$11
	.option	pic0
	jal	write_back_motion
	.option	pic2
	move	$4,$17

	lw	$28,32($sp)
	b	$L2678
	lw	$11,40($sp)

$L2822:
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$16

	move	$7,$2
	sltu	$2,$2,48
	beq	$2,$0,$L2831
	lw	$28,32($sp)

	lw	$11,40($sp)
	andi	$2,$11,0x1
	beq	$2,$0,$L2681
	lui	$2,%hi(golomb_to_inter_cbp)

	lui	$2,%hi(golomb_to_intra4x4_cbp)
	addiu	$2,$2,%lo(golomb_to_intra4x4_cbp)
	addu	$2,$7,$2
	lbu	$2,0($2)
	b	$L2679
	sw	$2,192($sp)

$L2810:
	b	$L2639
	move	$7,$0

$L2817:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($17)
	lbu	$3,0($2)
$L2543:
	sltu	$2,$3,7
	beq	$2,$0,$L2832
	lui	$6,%hi($LC0)

	lw	$2,8984($17)
	andi	$2,$2,0x8000
	bne	$2,$0,$L2548
	lui	$2,%hi(top.8911)

	addiu	$2,$2,%lo(top.8911)
	addu	$2,$3,$2
	lb	$3,0($2)
	bltz	$3,$L2833
	lui	$6,%hi($LC1)

$L2548:
	lw	$2,8992($17)
	andi	$2,$2,0x8000
	bne	$2,$0,$L2549
	lui	$2,%hi(left.8912)

	addiu	$2,$2,%lo(left.8912)
	addu	$2,$3,$2
	lb	$3,0($2)
	bltz	$3,$L2834
	lui	$6,%hi($LC2)

$L2550:
	sw	$3,8756($17)
	b	$L2551
	lw	$11,40($sp)

$L2769:
	lw	$7,8456($17)
	lw	$13,8448($17)
	sra	$2,$7,3
	addu	$2,$13,$2
	lbu	$3,0($2)
	andi	$4,$7,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$7,$7,1
	srl	$3,$3,7
	beq	$3,$0,$L2526
	sw	$7,8456($17)

	li	$2,16777216			# 0x1000000
	or	$2,$11,$2
	sw	$2,40($sp)
	b	$L2527
	li	$10,4			# 0x4

$L2525:
	lw	$5,8760($17)
	.option	pic0
	jal	check_intra_pred_mode
	.option	pic2
	move	$4,$17

	lw	$28,32($sp)
	bgez	$2,$L2537
	sw	$2,8760($17)

	b	$L2835
	li	$2,-1			# 0xffffffffffffffff

$L2824:
	lw	$13,8448($17)
	b	$L2684
	lw	$11,40($sp)

$L2826:
	b	$L2695
	move	$6,$0

$L2636:
	beq	$2,$0,$L2836
	li	$3,65536			# 0x10000

	li	$4,65536			# 0x10000
	addu	$3,$17,$4
	lw	$2,5944($3)
	beq	$2,$0,$L2551
	ori	$2,$4,0x1730

	move	$6,$3
	addu	$21,$17,$2
	addiu	$23,$17,9456
	move	$20,$0
	move	$3,$0
	li	$fp,4096			# 0x1000
$L2656:
	sll	$2,$3,5
	sll	$19,$20,1
	sll	$3,$3,3
	addu	$3,$3,$2
	sll	$2,$fp,$19
	addiu	$4,$3,32
	and	$2,$2,$11
	addu	$22,$23,$4
	bne	$2,$0,$L2837
	addu	$18,$23,$3

	li	$2,-1			# 0xffffffffffffffff
$L2877:
	sw	$2,20($18)
	sw	$2,12($18)
	addiu	$18,$18,16
	beq	$18,$22,$L2772
	addiu	$19,$19,1

$L2840:
	lw	$11,40($sp)
	sll	$2,$fp,$19
	and	$2,$2,$11
	beq	$2,$0,$L2877
	li	$2,-1			# 0xffffffffffffffff

$L2837:
	lw	$3,0($21)
	li	$4,1			# 0x1
	beq	$3,$4,$L2838
	li	$5,2			# 0x2

	beq	$3,$5,$L2839
	move	$4,$16

	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	sw	$6,284($sp)

	lw	$28,32($sp)
	lw	$3,0($21)
	lw	$6,284($sp)
	move	$7,$2
$L2651:
	sltu	$2,$7,$3
	beq	$2,$0,$L2878
	lw	$25,%call16(av_log)($28)

	sll	$2,$7,8
	addu	$2,$2,$7
	sll	$3,$2,16
	addu	$2,$2,$3
	sw	$2,20($18)
	sw	$2,12($18)
	addiu	$18,$18,16
	bne	$18,$22,$L2840
	addiu	$19,$19,1

$L2772:
	lw	$4,5944($6)
	addiu	$20,$20,1
	sltu	$2,$20,$4
	addiu	$21,$21,4
	beq	$2,$0,$L2773
	move	$3,$20

	b	$L2656
	lw	$11,40($sp)

$L2691:
	addu	$2,$17,$2
	lw	$4,9348($2)
	lui	$3,%hi(luma_dc_zigzag_scan)
	sw	$4,180($sp)
	lw	$23,9356($2)
	b	$L2690
	addiu	$10,$3,%lo(luma_dc_zigzag_scan)

$L2697:
	b	$L2693
	srl	$7,$5,1

$L2820:
	beq	$12,$22,$L2571
	move	$7,$0

	beq	$12,$24,$L2841
	nop

	lw	$7,8($16)
	lw	$3,0($16)
	sra	$2,$7,3
	addu	$3,$3,$2
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$2,$2,$5
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$6,$2,$3
	sltu	$4,$6,$25
	beq	$4,$0,$L2842
	and	$2,$6,$21

	bne	$2,$0,$L2575
	srl	$3,$6,16

	move	$3,$6
	move	$5,$0
$L2576:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2879
	addu	$2,$fp,$3

	srl	$3,$3,8
	addiu	$5,$5,8
	addu	$2,$fp,$3
$L2879:
	lbu	$3,0($2)
	addiu	$4,$7,32
	addu	$3,$3,$5
	sll	$3,$3,1
	addiu	$3,$3,-31
	subu	$4,$4,$3
	srl	$3,$6,$3
	sw	$4,8($16)
	addiu	$7,$3,-1
$L2573:
	sltu	$2,$7,$12
	bne	$2,$0,$L2578
	nop

$L2670:
	lw	$25,%call16(av_log)($28)
$L2878:
	lw	$4,0($17)
	lui	$6,%hi($LC52)
	addiu	$6,$6,%lo($LC52)
	jalr	$25
	move	$5,$0

	lw	$28,32($sp)
	b	$L2500
	li	$2,-1			# 0xffffffffffffffff

$L2689:
	addu	$2,$17,$2
	lw	$3,9360($2)
	lw	$23,9368($2)
	sw	$3,180($sp)
	lui	$3,%hi(luma_dc_field_scan)
	b	$L2690
	addiu	$10,$3,%lo(luma_dc_field_scan)

$L2553:
	sw	$3,224($sp)
	li	$2,59272			# 0xe788
	lui	$3,%hi(p_sub_mb_type_info)
	lw	$14,8448($17)
	lw	$13,%got(ff_log2_tab)($28)
	lw	$15,%got(ff_golomb_vlc_len)($28)
	lw	$18,%got(ff_ue_golomb_vlc_code)($28)
	lw	$10,224($sp)
	addu	$9,$17,$2
	addiu	$19,$3,%lo(p_sub_mb_type_info)
	li	$11,134217728			# 0x8000000
	li	$12,-65536			# 0xffffffffffff0000
	addiu	$20,$sp,68
$L2566:
	lw	$8,8($16)
	sra	$2,$8,3
	addu	$2,$14,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$2,$8,0x7
	sll	$5,$3,$2
	srl	$4,$5,23
	sltu	$2,$5,$11
	addu	$6,$15,$4
	addu	$3,$18,$4
	beq	$2,$0,$L2843
	and	$4,$5,$12

	bne	$4,$0,$L2562
	srl	$3,$5,16

	move	$3,$5
$L2563:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2564
	addiu	$6,$8,32

	srl	$3,$3,8
	addiu	$4,$4,8
$L2564:
	addu	$2,$13,$3
	lbu	$3,0($2)
	addu	$3,$3,$4
	sll	$3,$3,1
	addiu	$3,$3,-31
	subu	$2,$6,$3
	srl	$3,$5,$3
	sw	$2,8($16)
	addiu	$7,$3,-1
$L2561:
	sll	$2,$7,2
	sltu	$3,$7,4
	addu	$4,$2,$19
	sw	$20,208($sp)
	beq	$3,$0,$L2844
	sw	$7,0($9)

	lbu	$2,2($4)
	lhu	$3,0($4)
	sw	$2,0($10)
	addiu	$10,$10,4
	sw	$3,0($9)
	bne	$20,$10,$L2566
	addiu	$9,$9,4

	b	$L2860
	li	$3,65536			# 0x10000

$L2681:
	addiu	$2,$2,%lo(golomb_to_inter_cbp)
	addu	$2,$7,$2
	lbu	$2,0($2)
	b	$L2679
	sw	$2,192($sp)

$L2544:
	b	$L2545
	li	$6,16			# 0x10

$L2823:
	lw	$13,8448($17)
$L2683:
	lw	$4,200($sp)
	lw	$2,1568($17)
	sll	$3,$4,2
	addu	$2,$2,$3
	sw	$11,0($2)
	b	$L2684
	lw	$11,40($sp)

$L2836:
	addu	$4,$17,$3
	lw	$2,5944($4)
	beq	$2,$0,$L2551
	ori	$2,$3,0x1730

	sw	$4,280($sp)
	lw	$25,%got(ff_log2_tab)($28)
	lw	$fp,%got(ff_golomb_vlc_len)($28)
	lw	$31,%got(ff_ue_golomb_vlc_code)($28)
	addu	$18,$17,$2
	addiu	$15,$17,9456
	move	$14,$0
	move	$4,$0
	li	$20,4096			# 0x1000
	li	$21,1			# 0x1
	li	$22,2			# 0x2
	li	$23,134217728			# 0x8000000
	b	$L2673
	li	$24,-65536			# 0xffffffffffff0000

$L2661:
	li	$2,65535			# 0xffff
$L2671:
	addiu	$8,$8,1
	sh	$2,0($13)
	sh	$2,0($12)
	addiu	$13,$13,2
	sh	$2,0($10)
	addiu	$12,$12,2
	sh	$2,0($9)
	addiu	$10,$10,2
	bne	$8,$22,$L2672
	addiu	$9,$9,2

	lw	$5,280($sp)
	addiu	$14,$14,1
	lw	$3,5944($5)
	addiu	$18,$18,4
	sltu	$2,$14,$3
	beq	$2,$0,$L2845
	move	$4,$14

$L2673:
	sll	$3,$4,4
	sll	$2,$4,2
	addu	$2,$2,$3
	addiu	$5,$2,18
	addiu	$3,$2,6
	addiu	$4,$2,10
	addiu	$2,$2,14
	sll	$3,$3,1
	sll	$4,$4,1
	sll	$2,$2,1
	sll	$5,$5,1
	addu	$13,$15,$3
	addu	$12,$15,$4
	addu	$10,$15,$2
	addu	$9,$15,$5
	move	$8,$0
	sll	$19,$14,1
$L2672:
	addu	$2,$19,$8
	sll	$2,$20,$2
	and	$2,$2,$11
	beq	$2,$0,$L2661
	nop

	lw	$5,0($18)
	beq	$5,$21,$L2663
	move	$7,$0

	beq	$5,$22,$L2847
	nop

	lw	$7,8($16)
	lw	$3,0($16)
	sra	$2,$7,3
	addu	$3,$3,$2
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$2,$2,$5
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$6,$2,$3
	sltu	$4,$6,$23
	beq	$4,$0,$L2848
	and	$2,$6,$24

	bne	$2,$0,$L2667
	srl	$3,$6,16

	move	$3,$6
	move	$5,$0
$L2668:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2880
	addu	$2,$25,$3

	srl	$3,$3,8
	addiu	$5,$5,8
	addu	$2,$25,$3
$L2880:
	lbu	$3,0($2)
	addiu	$4,$7,32
	addu	$3,$3,$5
	sll	$3,$3,1
	addiu	$3,$3,-31
	subu	$4,$4,$3
	srl	$3,$6,$3
	sw	$4,8($16)
	addiu	$7,$3,-1
$L2666:
	lw	$5,0($18)
$L2663:
	sltu	$2,$7,$5
	beq	$2,$0,$L2670
	nop

	sll	$2,$7,8
	addu	$2,$2,$7
	b	$L2671
	andi	$2,$2,0xffff

$L2571:
$L2578:
	b	$L2569
	sw	$7,0($10)

$L2567:
	b	$L2568
	lw	$12,0($13)

$L2841:
	lw	$5,8($16)
	lw	$3,0($16)
	sra	$4,$5,3
	addu	$3,$3,$4
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,1
	srl	$2,$2,7
	sw	$5,8($16)
	b	$L2573
	xori	$7,$2,0x1

$L2585:
	lw	$3,144($sp)
	lbu	$6,0($8)
	lb	$2,0($3)
	and	$4,$9,$5
	addu	$3,$fp,$6
	sb	$2,9456($3)
	sb	$2,9465($3)
	sb	$2,9464($3)
	beq	$4,$0,$L2587
	sb	$2,9457($3)

	lw	$4,224($sp)
	lw	$6,152($sp)
	andi	$3,$5,0x18
	addu	$2,$4,$6
	lw	$2,0($2)
	li	$8,1			# 0x1
	sw	$2,196($sp)
	li	$2,2			# 0x2
	movn	$8,$2,$3
	lw	$3,196($sp)
	blez	$3,$L2586
	sw	$8,184($sp)

	lw	$8,220($sp)
	lw	$2,152($sp)
	andi	$4,$5,0x20
	andi	$6,$5,0x8
	andi	$5,$5,0x10
	lw	$14,0($16)
	sw	$4,232($sp)
	sw	$6,160($sp)
	addu	$23,$8,$2
	move	$25,$0
	b	$L2632
	sw	$5,228($sp)

$L2853:
	lw	$8,172($sp)
	lw	$2,248($sp)
	sw	$0,0($8)
	lw	$3,-6272($2)
	lw	$8,1880($17)
	bne	$3,$0,$L2591
	lw	$19,104($8)

	lw	$4,6172($17)
	andi	$2,$4,0x1
	beq	$2,$0,$L2881
	li	$2,-2			# 0xfffffffffffffffe

	slt	$2,$10,20
	beq	$2,$0,$L2881
	li	$2,-2			# 0xfffffffffffffffe

	li	$5,-2			# 0xfffffffffffffffe
	beq	$6,$5,$L2849
	addiu	$2,$4,-1

	lw	$18,152($17)
	mul	$3,$2,$18
	lw	$5,6168($17)
	addu	$2,$3,$5
	xori	$3,$10,0xf
	sltu	$3,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L2882
	lw	$3,168($sp)

	sll	$2,$5,2
	andi	$3,$10,0x7
	sll	$4,$4,2
	lw	$5,184($sp)
	addiu	$2,$2,-4
	addu	$2,$2,$3
	addiu	$7,$4,-1
	addu	$6,$2,$5
	sra	$2,$7,2
	mul	$4,$2,$18
	sra	$3,$6,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$2,0($2)
	lw	$5,176($sp)
	and	$3,$2,$5
	beq	$3,$0,$L2850
	andi	$2,$2,0x40

	lw	$2,9748($17)
$L2863:
	lw	$3,236($sp)
	addu	$4,$8,$3
	mul	$3,$7,$2
	addu	$2,$3,$6
	lw	$3,0($4)
	sll	$2,$2,2
	lw	$4,240($sp)
	addu	$3,$3,$2
	lhu	$5,0($3)
	addu	$2,$8,$4
	lw	$8,104($sp)
	lw	$4,4($2)
	sh	$5,9176($8)
	lh	$5,2($3)
	lw	$3,9752($17)
	sra	$6,$6,1
	sra	$2,$7,1
	addu	$4,$4,$6
	mul	$6,$2,$3
	sll	$5,$5,1
	addu	$2,$6,$4
	sh	$5,9178($8)
	lb	$3,0($2)
	lw	$5,172($sp)
	sra	$6,$3,1
$L2597:
	xor	$4,$15,$24
	xor	$3,$15,$21
	sltu	$3,$3,1
	sltu	$4,$4,1
	xor	$2,$15,$6
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	bne	$3,$0,$L2883
	li	$8,1			# 0x1

$L2610:
	lh	$4,0($13)
	lh	$8,0($20)
	slt	$2,$8,$4
	beq	$2,$0,$L2611
	lh	$3,0($5)

	slt	$2,$8,$3
	beq	$2,$0,$L2612
	slt	$2,$4,$3

	move	$8,$4
	movz	$8,$3,$2
$L2612:
	lh	$3,2($13)
	lh	$10,2($20)
	slt	$2,$10,$3
	beq	$2,$0,$L2613
	lh	$5,2($5)

	slt	$2,$10,$5
	beq	$2,$0,$L2606
	slt	$2,$3,$5

	move	$10,$3
	movz	$10,$5,$2
$L2606:
	lw	$7,8($16)
	sra	$3,$7,3
	addu	$3,$14,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	andi	$3,$7,0x7
	or	$2,$2,$6
	sll	$5,$2,$3
	li	$3,134217728			# 0x8000000
	sltu	$4,$5,$3
	beq	$4,$0,$L2851
	li	$3,-65536			# 0xffffffffffff0000

	and	$2,$5,$3
	bne	$2,$0,$L2616
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L2617:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2884
	lw	$4,%got(ff_log2_tab)($28)

	srl	$3,$3,8
	addiu	$6,$6,8
$L2884:
	addu	$3,$4,$3
	lbu	$2,0($3)
	addiu	$4,$7,32
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$5,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L2619
	sw	$4,8($16)

	srl	$2,$5,1
	subu	$2,$0,$2
$L2615:
	lw	$7,8($16)
	addu	$8,$2,$8
	sra	$3,$7,3
	addu	$3,$14,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$5,$2,$3
	li	$6,134217728			# 0x8000000
	sltu	$4,$5,$6
	beq	$4,$0,$L2852
	li	$4,-65536			# 0xffffffffffff0000

	and	$2,$5,$4
	bne	$2,$0,$L2623
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L2624:
	andi	$2,$3,0xff00
	beq	$2,$0,$L2885
	lw	$2,%got(ff_log2_tab)($28)

	srl	$3,$3,8
	addiu	$6,$6,8
$L2885:
	addiu	$4,$7,32
	addu	$3,$2,$3
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$5,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L2626
	sw	$4,8($16)

	srl	$2,$5,1
	subu	$2,$0,$2
$L2622:
	lw	$3,160($sp)
	beq	$3,$0,$L2628
	addu	$2,$2,$10

	sll	$4,$8,16
	sll	$3,$2,16
	sra	$4,$4,16
	sra	$3,$3,16
	sh	$4,36($12)
	sh	$4,32($12)
	sh	$4,4($12)
	sh	$3,38($12)
	sh	$3,34($12)
	sh	$3,6($12)
$L2629:
	lw	$6,196($sp)
	addiu	$25,$25,1
	lw	$8,184($sp)
	slt	$2,$25,$6
	sh	$3,2($12)
	sh	$4,0($12)
	beq	$2,$0,$L2586
	addu	$23,$23,$8

$L2632:
	lbu	$10,0($23)
	lw	$3,248($sp)
	lw	$4,184($sp)
	lw	$5,168($sp)
	lw	$6,164($sp)
	addiu	$2,$10,-8
	addu	$11,$4,$2
	lw	$8,-6276($3)
	addu	$4,$6,$10
	addu	$18,$5,$10
	addu	$3,$31,$10
	addu	$7,$fp,$10
	sll	$3,$3,2
	sll	$4,$4,2
	sll	$5,$18,2
	addu	$2,$fp,$2
	addu	$6,$fp,$11
	addu	$12,$22,$5
	lb	$21,9456($2)
	lb	$24,9455($7)
	addu	$13,$22,$3
	addu	$20,$22,$4
	lb	$6,9456($6)
	bne	$8,$0,$L2853
	lb	$15,9456($7)

	li	$8,-2			# 0xfffffffffffffffe
	beq	$6,$8,$L2886
	addiu	$2,$18,-9

$L2594:
	lw	$3,168($sp)
$L2882:
	xor	$4,$15,$24
	addu	$2,$11,$3
	sll	$2,$2,2
	xor	$3,$15,$21
	sltu	$3,$3,1
	addu	$5,$22,$2
	sltu	$4,$4,1
	xor	$2,$15,$6
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	beq	$3,$0,$L2610
	li	$8,1			# 0x1

$L2883:
	beq	$4,$8,$L2854
	li	$2,-2			# 0xfffffffffffffffe

	bne	$21,$2,$L2610
	nop

	bne	$6,$2,$L2610
	nop

	beq	$24,$2,$L2610
	nop

$L2782:
	lh	$10,2($13)
	b	$L2606
	lh	$8,0($13)

$L2628:
	lw	$4,228($sp)
	beq	$4,$0,$L2630
	lw	$5,232($sp)

	sll	$4,$8,16
	sll	$3,$2,16
	sra	$4,$4,16
	sra	$3,$3,16
	sh	$4,4($12)
	b	$L2629
	sh	$3,6($12)

$L2852:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$5,23
	addu	$3,$2,$4
	lbu	$2,0($3)
	lw	$3,%got(ff_se_golomb_vlc_code)($28)
	addu	$2,$2,$7
	addu	$4,$3,$4
	sw	$2,8($16)
	b	$L2622
	lb	$2,0($4)

$L2851:
	srl	$4,$5,23
	lw	$5,%got(ff_golomb_vlc_len)($28)
	lw	$6,%got(ff_se_golomb_vlc_code)($28)
	addu	$3,$5,$4
	lbu	$2,0($3)
	addu	$4,$6,$4
	addu	$2,$2,$7
	sw	$2,8($16)
	b	$L2615
	lb	$2,0($4)

$L2613:
	slt	$2,$5,$10
	beq	$2,$0,$L2606
	slt	$2,$5,$3

	move	$10,$3
	b	$L2606
	movz	$10,$5,$2

$L2611:
	slt	$2,$3,$8
	beq	$2,$0,$L2612
	slt	$2,$3,$4

	move	$8,$4
	b	$L2612
	movz	$8,$3,$2

$L2591:
	li	$2,-2			# 0xfffffffffffffffe
$L2881:
	bne	$6,$2,$L2594
	nop

	lw	$4,6172($17)
	andi	$5,$4,0x1
	bne	$5,$0,$L2593
	slt	$2,$10,20

	bne	$2,$0,$L2886
	addiu	$2,$18,-9

$L2593:
	andi	$2,$10,0x7
	li	$6,4			# 0x4
	beq	$2,$6,$L2855
	addiu	$2,$18,-9

$L2886:
	sll	$2,$2,2
	addu	$3,$fp,$10
	addu	$5,$22,$2
	b	$L2597
	lb	$6,9447($3)

$L2619:
	b	$L2615
	srl	$2,$5,1

$L2616:
	b	$L2617
	li	$6,16			# 0x10

$L2623:
	b	$L2624
	li	$6,16			# 0x10

$L2626:
	b	$L2622
	srl	$2,$5,1

$L2630:
	bne	$5,$0,$L2631
	nop

	sll	$4,$8,16
	sll	$3,$2,16
	sra	$4,$4,16
	b	$L2629
	sra	$3,$3,16

$L2631:
	sll	$4,$8,16
	sll	$3,$2,16
	sra	$4,$4,16
	sra	$3,$3,16
	sh	$4,32($12)
	b	$L2629
	sh	$3,34($12)

$L2842:
	srl	$4,$6,23
	addu	$3,$31,$4
	lbu	$2,0($3)
	lw	$6,%got(ff_ue_golomb_vlc_code)($28)
	addu	$2,$2,$7
	addu	$4,$6,$4
	sw	$2,8($16)
	b	$L2573
	lbu	$7,0($4)

$L2843:
	lbu	$2,0($6)
	lbu	$7,0($3)
	addu	$2,$2,$8
	b	$L2561
	sw	$2,8($16)

$L2587:
	lw	$3,168($sp)
	addu	$2,$6,$3
	sll	$2,$2,2
	addu	$2,$22,$2
	sw	$0,0($2)
	sw	$0,36($2)
	sw	$0,32($2)
	b	$L2586
	sw	$0,4($2)

$L2847:
	lw	$5,8($16)
	lw	$3,0($16)
	sra	$4,$5,3
	addu	$3,$3,$4
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	addiu	$5,$5,1
	andi	$2,$2,0x00ff
	sw	$5,8($16)
	srl	$2,$2,7
	xori	$7,$2,0x1
	b	$L2663
	lw	$5,0($18)

$L2854:
	beq	$15,$24,$L2782
	nop

	beq	$15,$21,$L2856
	nop

	lh	$10,2($5)
	b	$L2606
	lh	$8,0($5)

$L2839:
	lw	$5,8($16)
	lw	$3,0($16)
	sra	$4,$5,3
	addu	$3,$3,$4
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,1
	sw	$5,8($16)
	srl	$2,$2,7
	xori	$7,$2,0x1
	b	$L2651
	lw	$3,0($21)

$L2838:
	b	$L2651
	move	$7,$0

$L2575:
	b	$L2576
	li	$5,16			# 0x10

$L2808:
	move	$4,$17
	.option	pic0
	jal	pred_direct_motion
	.option	pic2
	addiu	$5,$sp,40

	lw	$8,188($sp)
	lw	$2,9980($17)
	lw	$28,32($sp)
	and	$8,$8,$2
	lw	$11,40($sp)
	b	$L2551
	sw	$8,188($sp)

$L2562:
	b	$L2563
	li	$4,16			# 0x10

$L2848:
	srl	$4,$6,23
	addu	$3,$fp,$4
	lbu	$2,0($3)
	addu	$4,$31,$4
	addu	$2,$2,$7
	sw	$2,8($16)
	b	$L2666
	lbu	$7,0($4)

$L2809:
	beq	$3,$0,$L2551
	li	$2,65536			# 0x10000

	addu	$2,$17,$2
	sw	$2,252($sp)
	addiu	$21,$17,9136
	move	$20,$17
	move	$18,$0
	move	$19,$0
	li	$22,4096			# 0x1000
	addiu	$23,$sp,44
	addiu	$fp,$sp,48
$L2646:
	sll	$2,$18,1
	sll	$2,$22,$2
	and	$2,$2,$11
	bne	$2,$0,$L2644
	move	$7,$18

	move	$4,$0
$L2645:
	sll	$2,$19,5
	sll	$3,$19,3
	addu	$3,$3,$2
	addiu	$3,$3,12
	sll	$3,$3,2
	addu	$3,$21,$3
	sw	$4,108($3)
	sw	$4,0($3)
	sw	$4,4($3)
	sw	$4,8($3)
	sw	$4,12($3)
	sw	$4,32($3)
	sw	$4,36($3)
	sw	$4,40($3)
	sw	$4,44($3)
	sw	$4,64($3)
	sw	$4,68($3)
	sw	$4,72($3)
	sw	$4,76($3)
	sw	$4,96($3)
	sw	$4,100($3)
	sw	$4,104($3)
	lw	$3,252($sp)
	addiu	$18,$18,1
	lw	$2,5944($3)
	addiu	$20,$20,40
	sltu	$2,$18,$2
	bne	$2,$0,$L2646
	move	$19,$18

	b	$L2861
	andi	$2,$11,0x78

$L2828:
	addiu	$2,$8,52
	sw	$2,2056($17)
	b	$L2700
	move	$8,$2

$L2667:
	b	$L2668
	li	$5,16			# 0x10

$L2499:
	.option	pic0
	jal	predict_field_decoding_flag
	.option	pic2
	move	$4,$17

	b	$L2498
	nop

$L2845:
	beq	$3,$0,$L2551
	li	$2,65536			# 0x10000

	addu	$2,$17,$2
	addiu	$6,$sp,44
	addiu	$8,$sp,48
	sw	$2,276($sp)
	addiu	$21,$17,9136
	move	$18,$0
	move	$3,$0
	sw	$6,268($sp)
	sw	$8,272($sp)
$L2677:
	sll	$2,$3,4
	sll	$3,$3,2
	addu	$3,$3,$2
	sll	$5,$18,3
	sll	$2,$18,5
	addiu	$4,$3,6
	addu	$5,$5,$2
	addiu	$2,$3,10
	sll	$6,$4,3
	sll	$2,$2,3
	addiu	$7,$3,18
	addu	$2,$21,$2
	addiu	$3,$3,14
	addiu	$6,$6,4
	sll	$3,$3,3
	sll	$7,$7,3
	addiu	$5,$5,9468
	sll	$4,$4,3
	addu	$6,$21,$6
	sw	$2,112($sp)
	sll	$2,$18,1
	addu	$20,$21,$4
	sw	$6,116($sp)
	addu	$fp,$21,$3
	addu	$23,$21,$7
	addu	$22,$17,$5
	move	$19,$0
	sw	$2,212($sp)
$L2676:
	lw	$3,212($sp)
	li	$4,4096			# 0x1000
	addu	$2,$3,$19
	sll	$2,$4,$2
	and	$2,$2,$11
	bne	$2,$0,$L2674
	lw	$8,268($sp)

	move	$4,$0
$L2675:
	lw	$3,116($sp)
	lw	$5,112($sp)
	sw	$4,0($20)
	addiu	$19,$19,1
	sw	$4,0($3)
	li	$6,2			# 0x2
	sw	$4,0($5)
	addiu	$3,$3,8
	addiu	$5,$5,8
	sw	$4,36($20)
	addiu	$22,$22,2
	sw	$4,0($fp)
	sw	$3,116($sp)
	sw	$4,68($20)
	sw	$5,112($sp)
	sw	$4,0($23)
	addiu	$fp,$fp,8
	sw	$4,100($20)
	addiu	$23,$23,8
	bne	$19,$6,$L2857
	addiu	$20,$20,8

	lw	$8,276($sp)
	addiu	$18,$18,1
	lw	$2,5944($8)
	sltu	$2,$18,$2
	beq	$2,$0,$L2783
	move	$3,$18

	b	$L2677
	lw	$11,40($sp)

$L2857:
	b	$L2676
	lw	$11,40($sp)

$L2674:
	lb	$7,0($22)
	lw	$2,272($sp)
	sll	$5,$19,2
	move	$6,$18
	move	$4,$17
	sw	$8,16($sp)
	.option	pic0
	jal	pred_8x16_motion
	.option	pic2
	sw	$2,20($sp)

	.option	pic0
	jal	get_se_golomb
	.option	pic2
	move	$4,$16

	lw	$3,44($sp)
	move	$4,$16
	addu	$3,$3,$2
	.option	pic0
	jal	get_se_golomb
	.option	pic2
	sw	$3,44($sp)

	lw	$3,48($sp)
	lhu	$5,44($sp)
	addu	$2,$2,$3
	sll	$4,$2,16
	lw	$28,32($sp)
	addu	$4,$4,$5
	b	$L2675
	sw	$2,48($sp)

$L2773:
	beq	$4,$0,$L2783
	li	$2,65536			# 0x10000

	addu	$2,$17,$2
	addiu	$6,$sp,44
	addiu	$8,$sp,48
	lw	$11,40($sp)
	sw	$2,264($sp)
	addiu	$19,$17,9136
	move	$18,$0
	move	$3,$0
	sw	$6,256($sp)
	sw	$8,260($sp)
$L2660:
	sll	$2,$3,5
	sll	$3,$3,3
	addu	$3,$3,$2
	sll	$4,$18,3
	sll	$2,$18,5
	addu	$4,$4,$2
	addiu	$2,$3,12
	addiu	$5,$3,13
	addiu	$6,$3,14
	addiu	$7,$3,15
	addiu	$8,$3,20
	sll	$2,$2,2
	addiu	$10,$3,23
	addiu	$9,$3,21
	addu	$2,$19,$2
	addiu	$3,$3,22
	sll	$5,$5,2
	sll	$6,$6,2
	sll	$7,$7,2
	sll	$8,$8,2
	sll	$9,$9,2
	sll	$3,$3,2
	sll	$10,$10,2
	addiu	$4,$4,9468
	sw	$2,136($sp)
	addu	$5,$19,$5
	addu	$6,$19,$6
	addu	$7,$19,$7
	addu	$8,$19,$8
	sll	$2,$18,1
	sw	$5,132($sp)
	sw	$6,128($sp)
	sw	$7,124($sp)
	sw	$8,120($sp)
	addu	$fp,$19,$9
	addu	$23,$19,$3
	addu	$22,$19,$10
	addu	$21,$17,$4
	move	$20,$0
	sw	$2,216($sp)
$L2659:
	lw	$3,216($sp)
	li	$4,4096			# 0x1000
	addu	$2,$3,$20
	sll	$2,$4,$2
	and	$2,$2,$11
	bne	$2,$0,$L2657
	lw	$8,256($sp)

	move	$3,$0
$L2658:
	lw	$4,136($sp)
	lw	$5,132($sp)
	lw	$6,128($sp)
	lw	$8,124($sp)
	lw	$2,120($sp)
	sw	$3,0($4)
	addiu	$20,$20,1
	sw	$3,0($5)
	addiu	$4,$4,64
	sw	$3,0($6)
	addiu	$5,$5,64
	sw	$3,0($8)
	addiu	$6,$6,64
	sw	$3,0($2)
	addiu	$8,$8,64
	sw	$3,0($fp)
	addiu	$2,$2,64
	sw	$3,0($23)
	sw	$3,0($22)
	li	$3,2			# 0x2
	addiu	$21,$21,16
	sw	$4,136($sp)
	sw	$5,132($sp)
	sw	$6,128($sp)
	sw	$8,124($sp)
	sw	$2,120($sp)
	addiu	$fp,$fp,64
	addiu	$23,$23,64
	bne	$20,$3,$L2659
	addiu	$22,$22,64

	lw	$4,264($sp)
	addiu	$18,$18,1
	lw	$2,5944($4)
	sltu	$2,$18,$2
	bne	$2,$0,$L2660
	move	$3,$18

	b	$L2861
	andi	$2,$11,0x78

$L2855:
	lw	$6,140($sp)
	lb	$2,9467($6)
	li	$6,-2			# 0xfffffffffffffffe
	beq	$2,$6,$L2886
	addiu	$2,$18,-9

	bne	$3,$0,$L2599
	nop

	lw	$2,8768($17)
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L2886
	addiu	$2,$18,-9

	ori	$2,$4,0x1
	sll	$2,$2,1
	addu	$2,$2,$5
	sra	$3,$10,4
	addiu	$3,$3,-1
	sll	$2,$2,1
	lw	$4,6168($17)
	addu	$7,$3,$2
	lw	$5,152($17)
	sll	$4,$4,2
	sra	$2,$7,2
	addiu	$10,$4,-1
	mul	$4,$2,$5
	sra	$3,$10,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$2,0($2)
	lw	$5,176($sp)
	and	$3,$5,$2
	beq	$3,$0,$L2858
	andi	$2,$2,0x40

$L2600:
	lw	$2,9748($17)
	lw	$6,236($sp)
	mul	$4,$7,$2
	addu	$3,$8,$6
	addu	$2,$4,$10
	lw	$4,0($3)
	sll	$2,$2,2
	addu	$4,$4,$2
	lw	$5,240($sp)
	lhu	$3,0($4)
	lw	$6,104($sp)
	addu	$2,$8,$5
	lw	$5,9752($17)
	sh	$3,9176($6)
	lw	$6,4($2)
	sra	$2,$7,1
	lh	$3,2($4)
	mul	$4,$2,$5
	lw	$5,104($sp)
	addu	$2,$4,$6
	sll	$3,$3,1
	sra	$4,$10,1
	sh	$3,9178($5)
	addu	$2,$2,$4
	lb	$3,0($2)
	lw	$5,172($sp)
	b	$L2597
	sra	$6,$3,1

$L2644:
	lb	$2,9468($20)
	move	$5,$0
	li	$6,4			# 0x4
	move	$4,$17
	sw	$2,16($sp)
	sw	$23,20($sp)
	.option	pic0
	jal	pred_motion
	.option	pic2
	sw	$fp,24($sp)

	.option	pic0
	jal	get_se_golomb
	.option	pic2
	move	$4,$16

	lw	$3,44($sp)
	move	$4,$16
	addu	$3,$3,$2
	.option	pic0
	jal	get_se_golomb
	.option	pic2
	sw	$3,44($sp)

	lw	$3,48($sp)
	lhu	$4,44($sp)
	addu	$2,$2,$3
	sll	$3,$2,16
	lw	$28,32($sp)
	lw	$11,40($sp)
	addu	$4,$3,$4
	b	$L2645
	sw	$2,48($sp)

$L2657:
	lb	$7,0($21)
	lw	$2,260($sp)
	sll	$5,$20,3
	move	$6,$18
	move	$4,$17
	sw	$8,16($sp)
	.option	pic0
	jal	pred_16x8_motion
	.option	pic2
	sw	$2,20($sp)

	.option	pic0
	jal	get_se_golomb
	.option	pic2
	move	$4,$16

	lw	$3,44($sp)
	move	$4,$16
	addu	$3,$3,$2
	.option	pic0
	jal	get_se_golomb
	.option	pic2
	sw	$3,44($sp)

	lw	$3,48($sp)
	lhu	$4,44($sp)
	addu	$2,$2,$3
	sll	$3,$2,16
	lw	$28,32($sp)
	lw	$11,40($sp)
	addu	$3,$3,$4
	b	$L2658
	sw	$2,48($sp)

$L2849:
	b	$L2593
	li	$5,1			# 0x1

$L2803:
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	lw	$25,%call16(av_get_pict_type_char)($28)
	lw	$4,-6284($2)
	jalr	$25
	lw	$16,0($17)

	lw	$28,32($sp)
	lw	$4,6172($17)
	lw	$3,6168($17)
	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC47)
	sw	$2,16($sp)
	sw	$4,24($sp)
	sw	$3,20($sp)
	move	$4,$16
	addiu	$6,$6,%lo($LC47)
	move	$7,$18
	jalr	$25
	move	$5,$0

	lw	$28,32($sp)
	b	$L2500
	li	$2,-1			# 0xffffffffffffffff

$L2815:
	lw	$3,6172($17)
	lw	$2,6168($17)
	lui	$6,%hi($LC48)
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	addiu	$6,$6,%lo($LC48)
	sw	$2,16($sp)
	sw	$3,20($sp)
$L2785:
	jalr	$25
	move	$5,$0

	lw	$28,32($sp)
	b	$L2500
	li	$2,-1			# 0xffffffffffffffff

$L2856:
	lh	$10,2($20)
	b	$L2606
	lh	$8,0($20)

$L2816:
	lw	$3,6172($17)
	lw	$2,6168($17)
	lui	$6,%hi($LC49)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	sw	$3,20($sp)
	b	$L2785
	addiu	$6,$6,%lo($LC49)

$L2844:
	lw	$3,6172($17)
	lw	$2,6168($17)
	lui	$6,%hi($LC51)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	sw	$3,20($sp)
	b	$L2785
	addiu	$6,$6,%lo($LC51)

$L2599:
	lw	$2,8768($17)
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	bne	$3,$0,$L2886
	addiu	$2,$18,-9

	slt	$2,$10,20
	bne	$2,$0,$L2886
	addiu	$2,$18,-9

	li	$6,-2			# 0xfffffffffffffffe
	and	$2,$4,$6
	addiu	$3,$10,-12
	sra	$3,$3,3
	sll	$2,$2,1
	lw	$4,6168($17)
	addu	$2,$2,$3
	sll	$4,$4,2
	sll	$2,$2,1
	addiu	$10,$4,-1
	addiu	$7,$2,-1
	lw	$4,152($17)
	sra	$2,$7,2
	mul	$5,$2,$4
	sra	$3,$10,2
	addu	$2,$5,$3
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$2,0($2)
	lw	$6,176($sp)
	and	$3,$6,$2
	beq	$3,$0,$L2859
	andi	$2,$2,0x40

	lw	$2,9748($17)
$L2862:
	lw	$4,236($sp)
	lw	$5,240($sp)
	addu	$3,$8,$4
	mul	$4,$7,$2
	lw	$6,104($sp)
	addu	$2,$4,$10
	lw	$4,0($3)
	sll	$2,$2,2
	addu	$4,$4,$2
	lhu	$3,0($4)
	addu	$2,$8,$5
	lw	$5,9752($17)
	sh	$3,9176($6)
	lw	$6,4($2)
	sra	$2,$7,1
	lh	$3,2($4)
	mul	$4,$2,$5
	lw	$5,104($sp)
	addu	$2,$4,$6
	sra	$3,$3,1
	sra	$4,$10,1
	sh	$3,9178($5)
	addu	$2,$2,$4
	lb	$3,0($2)
	lw	$5,172($sp)
	b	$L2597
	sll	$6,$3,1

$L2858:
	bne	$2,$0,$L2600
	nop

$L2596:
	lw	$5,172($sp)
$L2887:
	b	$L2597
	li	$6,-1			# 0xffffffffffffffff

$L2859:
	beq	$2,$0,$L2596
	nop

	b	$L2862
	lw	$2,9748($17)

$L2833:
	lw	$2,6172($17)
	lw	$4,0($17)
	lw	$7,6168($17)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	b	$L2785
	addiu	$6,$6,%lo($LC1)

$L2832:
	lw	$2,6172($17)
	lw	$4,0($17)
	lw	$7,6168($17)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	b	$L2785
	addiu	$6,$6,%lo($LC0)

$L2819:
	b	$L2559
	move	$4,$0

$L2831:
	lw	$3,6172($17)
	lw	$2,6168($17)
	lui	$6,%hi($LC53)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	sw	$3,20($sp)
	b	$L2785
	addiu	$6,$6,%lo($LC53)

$L2827:
	lw	$3,6172($17)
	lw	$2,6168($17)
	lui	$6,%hi($LC54)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	sw	$3,20($sp)
	b	$L2785
	addiu	$6,$6,%lo($LC54)

$L2850:
	beq	$2,$0,$L2887
	lw	$5,172($sp)

	b	$L2863
	lw	$2,9748($17)

$L2829:
	li	$3,65536			# 0x10000
	li	$2,131072			# 0x20000
	addu	$18,$17,$3
	lw	$3,-6332($18)
	addu	$16,$17,$2
	lw	$5,6864($16)
	sll	$2,$8,6
	lw	$6,204($sp)
	addu	$3,$3,$2
	move	$4,$17
	li	$2,16			# 0x10
	li	$7,25			# 0x19
	sw	$10,16($sp)
	sw	$3,20($sp)
	.option	pic0
	jal	decode_residual
	.option	pic2
	sw	$2,24($sp)

	bltz	$2,$L2541
	lw	$28,32($sp)

	lw	$5,192($sp)
	andi	$2,$5,0xf
	beq	$2,$0,$L2703
	addiu	$2,$17,9092

	lw	$6,180($sp)
	lw	$20,204($sp)
	move	$22,$16
	move	$23,$18
	addiu	$21,$6,1
	move	$19,$0
	move	$18,$20
$L2864:
	move	$16,$0
$L2705:
	lw	$2,2056($17)
	lw	$3,-6332($23)
	lw	$5,6864($22)
	sll	$2,$2,6
	addu	$3,$3,$2
	move	$6,$18
	addu	$7,$16,$19
	li	$8,15			# 0xf
	move	$4,$17
	sw	$3,20($sp)
	sw	$21,16($sp)
	.option	pic0
	jal	decode_residual
	.option	pic2
	sw	$8,24($sp)

	addiu	$16,$16,1
	lw	$28,32($sp)
	bltz	$2,$L2541
	addiu	$18,$18,32

	li	$2,4			# 0x4
	bne	$16,$2,$L2705
	li	$3,16			# 0x10

	addiu	$19,$19,4
	beq	$19,$3,$L2706
	addiu	$20,$20,128

	b	$L2864
	move	$18,$20

$L2703:
	sw	$0,9092($17)
	sw	$0,24($2)
	sw	$0,8($2)
	b	$L2706
	sw	$0,16($2)

$L2818:
	lw	$3,6172($17)
	lw	$2,6168($17)
	lui	$6,%hi($LC50)
	lw	$4,0($17)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	sw	$3,20($sp)
	b	$L2785
	addiu	$6,$6,%lo($LC50)

$L2582:
	b	$L2581
	sw	$0,188($sp)

$L2834:
	lw	$2,6172($17)
	lw	$4,0($17)
	lw	$7,6168($17)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	b	$L2785
	addiu	$6,$6,%lo($LC2)

	.set	macro
	.set	reorder
	.end	decode_mb_cavlc
	.section	.rodata.str1.4
	.align	2
$LC55:
	.ascii	"decode_cabac_mb_type failed\012\000"
	.align	2
$LC56:
	.ascii	"cabac decode of qscale diff failed at %d %d\012\000"
	.text
	.align	2
	.ent	decode_mb_cabac
	.type	decode_mb_cabac, @function
decode_mb_cabac:
	.set	nomips16
	.frame	$sp,496,$31		# vars= 416, regs= 10/0, args= 32, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-496
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,492($sp)
	sw	$fp,488($sp)
	sw	$23,484($sp)
	sw	$22,480($sp)
	sw	$21,476($sp)
	sw	$20,472($sp)
	sw	$19,468($sp)
	sw	$18,464($sp)
	sw	$17,460($sp)
	sw	$16,456($sp)
	.cprestore	32
	li	$2,131072			# 0x20000
	ori	$2,$2,0x1ad8
	addu	$2,$4,$2
	sw	$2,332($sp)
	lw	$2,6168($4)
	lw	$3,6172($4)
	lw	$5,152($4)
	mtlo	$2
	madd	$5,$3
	move	$21,$4
	mflo	$6
	lw	$7,11868($21)
	lw	$25,2180($4)
	lw	$4,332($sp)
	sw	$6,316($sp)
	jalr	$25
	sw	$7,308($sp)

	li	$2,65536			# 0x10000
	addu	$16,$21,$2
	lw	$3,-6284($16)
	li	$2,1			# 0x1
	beq	$3,$2,$L2890
	lw	$28,32($sp)

	li	$2,5			# 0x5
	beq	$3,$2,$L3252
	li	$2,65536			# 0x10000

	lw	$2,-6276($16)
	beq	$2,$0,$L2891
	nop

	lw	$2,6168($21)
	beq	$2,$0,$L2892
	nop

$L2895:
	lw	$6,6172($21)
	andi	$2,$6,0x1
	beq	$2,$0,$L2896
	nop

$L2894:
	lw	$2,8748($21)
	beq	$2,$0,$L2896
	nop

	lw	$2,8752($21)
$L2897:
	beq	$2,$0,$L3252
	li	$2,65536			# 0x10000

	addu	$16,$21,$2
	lw	$3,-6276($16)
	beq	$3,$0,$L2899
	nop

	lw	$2,6172($21)
	andi	$2,$2,0x1
	bne	$2,$0,$L2899
	lw	$8,316($sp)

	lw	$2,1568($21)
	sll	$3,$8,2
	addu	$2,$2,$3
	li	$4,2048			# 0x800
	sw	$4,0($2)
	lw	$6,6172($21)
	lw	$5,6168($21)
	addiu	$6,$6,1
	.option	pic0
	jal	decode_cabac_mb_skip
	.option	pic2
	move	$4,$21

	beq	$2,$0,$L2901
	sw	$2,8752($21)

	.option	pic0
	jal	predict_field_decoding_flag
	.option	pic2
	move	$4,$21

$L2899:
	.option	pic0
	jal	decode_mb_skip
	.option	pic2
	move	$4,$21

	li	$5,131072			# 0x20000
	addu	$5,$21,$5
	lw	$11,316($sp)
	lw	$3,8660($5)
	lw	$4,8676($5)
	sll	$2,$11,1
	addu	$3,$3,$2
	addu	$4,$4,$11
	lw	$28,32($sp)
	sh	$0,0($3)
	sb	$0,0($4)
	lw	$31,492($sp)
	move	$2,$0
	lw	$fp,488($sp)
	lw	$23,484($sp)
	lw	$22,480($sp)
	lw	$21,476($sp)
	lw	$20,472($sp)
	lw	$19,468($sp)
	lw	$18,464($sp)
	lw	$17,460($sp)
	lw	$16,456($sp)
	sw	$0,8680($5)
	j	$31
	addiu	$sp,$sp,496

$L2890:
	li	$2,65536			# 0x10000
$L3252:
	addu	$16,$21,$2
	lw	$3,-6276($16)
	bne	$3,$0,$L3202
	nop

	lw	$2,8500($21)
	lw	$5,6172($21)
	xori	$2,$2,0x3
	sltu	$2,$0,$2
	sw	$2,-6272($16)
$L2904:
	lw	$7,152($21)
	li	$3,65536			# 0x10000
	addu	$6,$21,$3
	mul	$3,$7,$5
	lw	$8,6168($21)
	lw	$4,-6276($6)
	addu	$2,$3,$8
	addiu	$3,$2,-1
	subu	$2,$2,$7
	sw	$2,8764($21)
	sw	$3,8768($21)
	beq	$4,$0,$L2905
	sw	$0,8748($21)

	li	$2,-2			# 0xfffffffffffffffe
	and	$2,$5,$2
	mul	$3,$2,$7
	lw	$4,1568($21)
	addu	$8,$3,$8
	subu	$3,$8,$7
	addiu	$2,$8,-1
	sll	$3,$3,2
	sll	$2,$2,2
	lw	$6,-6272($6)
	addu	$2,$4,$2
	andi	$5,$5,0x1
	addu	$4,$4,$3
	lw	$4,0($4)
	lw	$3,0($2)
	beq	$5,$0,$L2906
	sltu	$6,$6,1

	xori	$2,$6,0x1
$L2907:
	beq	$2,$0,$L3253
	srl	$2,$3,7

	lw	$2,8764($21)
	subu	$2,$2,$7
	sw	$2,8764($21)
$L2909:
	srl	$2,$3,7
$L3253:
	xori	$2,$2,0x1
	andi	$2,$2,0x1
	beq	$2,$6,$L2905
	addiu	$2,$8,-1

	sw	$2,8768($21)
$L2905:
	li	$2,65536			# 0x10000
	addu	$3,$21,$2
	lw	$17,-6284($3)
	li	$2,1			# 0x1
	beq	$17,$2,$L3203
	li	$2,2			# 0x2

	bne	$17,$2,$L2912
	li	$18,131072			# 0x20000

	ori	$2,$18,0x1fd8
	addu	$16,$21,$2
	ori	$5,$18,0x2012
	addu	$5,$21,$5
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$16

	bne	$2,$0,$L2913
	ori	$5,$18,0x2013

	addu	$5,$21,$5
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$16

	bne	$2,$0,$L2914
	move	$4,$16

	ori	$5,$18,0x2014
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	addu	$5,$21,$5

	sll	$3,$2,1
	lw	$28,32($sp)
	b	$L2911
	addu	$16,$3,$2

$L3202:
	lw	$5,6172($21)
	andi	$2,$5,0x1
	bne	$2,$0,$L2904
	nop

	.option	pic0
	jal	decode_cabac_field_decoding_flag
	.option	pic2
	move	$4,$21

	lw	$28,32($sp)
	sw	$2,-6268($16)
	sw	$2,-6272($16)
	b	$L2904
	lw	$5,6172($21)

$L2913:
	move	$4,$21
	li	$5,17			# 0x11
	.option	pic0
	jal	decode_cabac_intra_mb_type
	.option	pic2
	move	$6,$0

	lw	$28,32($sp)
	addiu	$16,$2,5
$L2911:
	bltz	$16,$L3130
	sw	$16,40($sp)

$L2926:
	li	$2,65536			# 0x10000
	addu	$2,$21,$2
	lw	$4,-6284($2)
	li	$3,3			# 0x3
	beq	$4,$3,$L3204
	li	$2,2			# 0x2

	beq	$4,$2,$L3205
	slt	$2,$16,5

$L2930:
	lw	$3,40($sp)
	lui	$2,%hi(i_mb_type_info)
	addiu	$2,$2,%lo(i_mb_type_info)
	sll	$3,$3,2
	addu	$3,$3,$2
	lhu	$4,0($3)
	lbu	$2,2($3)
	lbu	$3,3($3)
	sw	$2,8760($21)
	sw	$3,312($sp)
	sw	$4,40($sp)
	move	$16,$0
$L2929:
	li	$2,65536			# 0x10000
	addu	$2,$21,$2
	lw	$3,-6272($2)
	beq	$3,$0,$L3254
	li	$5,65536			# 0x10000

	lw	$2,40($sp)
	ori	$2,$2,0x80
	sw	$2,40($sp)
$L3254:
	addu	$4,$21,$5
	lw	$2,-6288($4)
	lw	$6,316($sp)
	lw	$3,-6296($4)
	addu	$2,$2,$6
	sb	$3,0($2)
	lw	$12,40($sp)
	andi	$2,$12,0x4
	beq	$2,$0,$L2933
	li	$2,131072			# 0x20000

	addu	$2,$21,$2
	lw	$3,8152($2)
	lw	$11,8168($2)
	andi	$4,$3,0x1
	addiu	$2,$11,-1
	movn	$11,$2,$4
	andi	$3,$3,0x1ff
	addiu	$2,$11,-1
	movn	$11,$2,$3
	ori	$9,$5,0xd6c
	move	$10,$11
	move	$7,$0
	li	$8,16			# 0x10
$L2937:
	srl	$2,$7,2
	srl	$3,$7,3
	sll	$3,$3,2
	andi	$2,$2,0x1
	addu	$2,$2,$3
	sll	$2,$2,3
	andi	$3,$7,0x3
	addu	$2,$2,$3
	sll	$6,$2,2
	move	$5,$10
	move	$4,$0
$L2936:
	srl	$3,$4,2
	srl	$2,$4,3
	andi	$3,$3,0x1
	sll	$2,$2,2
	addu	$2,$2,$3
	sll	$2,$2,4
	andi	$3,$4,0x3
	addu	$2,$2,$6
	addu	$2,$2,$3
	addu	$2,$2,$9
	lbu	$3,0($5)
	sll	$2,$2,1
	addu	$2,$21,$2
	addiu	$4,$4,1
	sh	$3,0($2)
	bne	$4,$8,$L2936
	addiu	$5,$5,1

	addiu	$7,$7,1
	bne	$7,$4,$L2937
	addiu	$10,$10,16

	addiu	$5,$11,256
	li	$2,65536			# 0x10000
	ori	$11,$2,0xd6c
	move	$9,$5
	move	$8,$0
	li	$10,8			# 0x8
$L2939:
	andi	$3,$8,0x3
	srl	$2,$8,2
	addiu	$3,$3,64
	sll	$2,$2,3
	addu	$3,$3,$2
	sll	$7,$3,2
	move	$6,$9
	move	$4,$0
$L2938:
	srl	$2,$4,2
	sll	$2,$2,4
	andi	$3,$4,0x3
	addu	$2,$2,$7
	addu	$2,$2,$3
	addu	$2,$2,$11
	lbu	$3,0($6)
	sll	$2,$2,1
	addu	$2,$21,$2
	addiu	$4,$4,1
	sh	$3,0($2)
	bne	$4,$10,$L2938
	addiu	$6,$6,1

	addiu	$8,$8,1
	bne	$8,$4,$L2939
	addiu	$9,$9,8

	addiu	$5,$5,64
	li	$2,65536			# 0x10000
	ori	$11,$2,0xd6c
	move	$9,$5
	move	$8,$0
	li	$10,8			# 0x8
$L2941:
	andi	$3,$8,0x3
	srl	$2,$8,2
	addiu	$3,$3,80
	sll	$2,$2,3
	addu	$3,$3,$2
	sll	$7,$3,2
	move	$6,$9
	move	$4,$0
$L2940:
	srl	$2,$4,2
	sll	$2,$2,4
	andi	$3,$4,0x3
	addu	$2,$2,$7
	addu	$2,$2,$3
	addu	$2,$2,$11
	lbu	$3,0($6)
	sll	$2,$2,1
	addu	$2,$21,$2
	addiu	$4,$4,1
	sh	$3,0($2)
	bne	$4,$10,$L2940
	addiu	$6,$6,1

	addiu	$8,$8,1
	bne	$8,$4,$L2941
	addiu	$9,$9,8

	li	$4,131072			# 0x20000
	addu	$16,$21,$4
	lw	$6,8172($16)
	lw	$25,%call16(ff_init_cabac_decoder)($28)
	addiu	$5,$5,64
	ori	$4,$4,0x1fd8
	subu	$6,$6,$5
	jalr	$25
	addu	$4,$21,$4

	lw	$7,316($sp)
	lw	$4,8676($16)
	lw	$3,8660($16)
	sll	$2,$7,1
	addu	$3,$3,$2
	addu	$4,$4,$7
	li	$2,495
	sh	$2,0($3)
	lw	$28,32($sp)
	sb	$0,0($4)
	lw	$2,1548($21)
	lw	$25,%call16(memset)($28)
	addu	$2,$2,$7
	sb	$0,0($2)
	lbu	$3,12096($21)
	lw	$5,9128($21)
	lbu	$2,12352($21)
	sll	$4,$7,4
	addu	$4,$5,$4
	sw	$3,8740($21)
	sw	$2,8744($21)
	li	$5,16			# 0x10
	jalr	$25
	li	$6,16			# 0x10

	lw	$8,316($sp)
	lw	$2,1568($21)
	sll	$3,$8,2
	lw	$4,40($sp)
	addu	$2,$2,$3
	lw	$28,32($sp)
	sw	$4,0($2)
	move	$2,$0
$L2902:
	lw	$31,492($sp)
	lw	$fp,488($sp)
	lw	$23,484($sp)
	lw	$22,480($sp)
	lw	$21,476($sp)
	lw	$20,472($sp)
	lw	$19,468($sp)
	lw	$18,464($sp)
	lw	$17,460($sp)
	lw	$16,456($sp)
	j	$31
	addiu	$sp,$sp,496

$L2933:
	lw	$2,-6268($4)
	beq	$2,$0,$L3255
	move	$5,$12

	lw	$3,5936($4)
	lw	$2,5940($4)
	sll	$3,$3,1
	sll	$2,$2,1
	sw	$2,5940($4)
	sw	$3,5936($4)
$L3255:
	move	$4,$21
	.option	pic0
	jal	fill_caches
	.option	pic2
	move	$6,$0

	lw	$12,40($sp)
	andi	$2,$12,0x7
	beq	$2,$0,$L2943
	lw	$28,32($sp)

	andi	$2,$12,0x1
	beq	$2,$0,$L2944
	lw	$11,308($sp)

	bne	$11,$0,$L2945
	lui	$3,%hi(scan8)

$L3264:
	lui	$4,%hi(scan8+16)
	addiu	$17,$3,%lo(scan8)
	addiu	$18,$4,%lo(scan8+16)
	li	$19,2			# 0x2
$L2946:
	lbu	$16,0($17)
	move	$4,$21
	addu	$16,$21,$16
	lb	$5,8768($16)
	lb	$6,8775($16)
	addiu	$17,$17,1
	slt	$2,$6,$5
	movn	$5,$6,$2
	slt	$3,$5,0
	.option	pic0
	jal	decode_cabac_mb_intra4x4_pred_mode
	.option	pic2
	movn	$5,$19,$3

	lw	$28,32($sp)
	bne	$18,$17,$L2946
	sb	$2,8776($16)

	lw	$4,152($21)
$L3249:
	lw	$5,6172($21)
	lw	$2,6168($21)
	mul	$6,$4,$5
	lw	$3,8816($21)
	addu	$4,$6,$2
	sll	$4,$4,3
	lbu	$6,8791($21)
	addu	$3,$3,$4
	sb	$6,0($3)
	lw	$2,8816($21)
	lbu	$5,8799($21)
	addu	$2,$2,$4
	sb	$5,1($2)
	lw	$3,8816($21)
	lbu	$5,8807($21)
	addu	$3,$3,$4
	sb	$5,2($3)
	lw	$2,8816($21)
	lbu	$5,8815($21)
	addu	$2,$2,$4
	sb	$5,3($2)
	lw	$3,8816($21)
	lbu	$5,8812($21)
	addu	$3,$3,$4
	sb	$5,4($3)
	lw	$2,8816($21)
	lbu	$5,8813($21)
	addu	$2,$2,$4
	sb	$5,5($2)
	lw	$3,8816($21)
	lbu	$5,8814($21)
	addu	$3,$3,$4
	sb	$5,6($3)
	lw	$2,8984($21)
	andi	$2,$2,0x8000
	bne	$2,$0,$L2952
	lui	$2,%hi(top.8874)

	addiu	$5,$2,%lo(top.8874)
	move	$3,$21
	move	$4,$0
	li	$6,4			# 0x4
$L2955:
	lb	$2,8788($3)
	addu	$2,$5,$2
	lb	$7,0($2)
	bltz	$7,$L3206
	addiu	$4,$4,1

	beq	$7,$0,$L2954
	nop

	sb	$7,8788($3)
$L2954:
	bne	$4,$6,$L2955
	addiu	$3,$3,1

$L2952:
	lw	$2,8992($21)
	andi	$2,$2,0x8000
	bne	$2,$0,$L2956
	lui	$2,%hi(left.8875)

	addiu	$5,$2,%lo(left.8875)
	move	$3,$21
	move	$4,$0
	li	$6,4			# 0x4
$L2959:
	lb	$2,8788($3)
	addu	$2,$5,$2
	lb	$7,0($2)
	bltz	$7,$L3207
	addiu	$4,$4,1

	beq	$7,$0,$L2958
	nop

	sb	$7,8788($3)
$L2958:
	bne	$4,$6,$L2959
	addiu	$3,$3,8

	b	$L3245
	li	$2,65536			# 0x10000

$L3204:
	slt	$2,$16,23
	beq	$2,$0,$L2928
	addiu	$2,$16,-23

	lui	$3,%hi(b_mb_type_info)
	sll	$2,$16,2
	addiu	$3,$3,%lo(b_mb_type_info)
$L3179:
	addu	$2,$2,$3
	lhu	$4,0($2)
	lbu	$16,2($2)
	sw	$4,40($sp)
	b	$L2929
	sw	$0,312($sp)

$L2892:
	lw	$6,6172($21)
	andi	$2,$6,0x1
	bne	$2,$0,$L2894
	nop

	.option	pic0
	jal	predict_field_decoding_flag
	.option	pic2
	move	$4,$21

	lw	$2,-6276($16)
	bne	$2,$0,$L2895
	lw	$28,32($sp)

$L2891:
	lw	$6,6172($21)
$L2896:
	lw	$5,6168($21)
	.option	pic0
	jal	decode_cabac_mb_skip
	.option	pic2
	move	$4,$21

	b	$L2897
	lw	$28,32($sp)

$L2906:
	bne	$6,$0,$L2909
	srl	$2,$4,7

	b	$L2907
	andi	$2,$2,0x1

$L2914:
	ori	$5,$18,0x2015
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	addu	$5,$21,$5

	lw	$28,32($sp)
	b	$L2911
	subu	$16,$17,$2

$L2928:
	b	$L2930
	sw	$2,40($sp)

$L2944:
	lw	$5,8760($21)
	.option	pic0
	jal	check_intra_pred_mode
	.option	pic2
	move	$4,$21

	lw	$28,32($sp)
	bltz	$2,$L3189
	sw	$2,8760($21)

$L2956:
	li	$2,65536			# 0x10000
$L3245:
	addu	$2,$21,$2
	lw	$8,-6288($2)
	lw	$5,8768($21)
	lw	$9,-6296($2)
	addu	$3,$8,$5
	li	$2,131072			# 0x20000
	lbu	$4,0($3)
	addu	$2,$21,$2
	lw	$18,8676($2)
	beq	$4,$9,$L2960
	lw	$7,8764($21)

	move	$6,$0
$L2961:
	addu	$2,$8,$7
	lbu	$3,0($2)
	beq	$9,$3,$L3208
	addu	$2,$18,$7

$L2962:
	li	$17,131072			# 0x20000
	ori	$5,$17,0x2040
	addu	$5,$6,$5
	ori	$2,$17,0x1fd8
	addu	$16,$21,$2
	addu	$5,$21,$5
	addiu	$5,$5,4
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$16

	bne	$2,$0,$L2963
	lw	$28,32($sp)

	move	$4,$0
	move	$5,$0
$L2964:
	lw	$7,316($sp)
	addu	$3,$18,$7
	sb	$5,0($3)
	lw	$2,8984($21)
	andi	$2,$2,0x8000
	bne	$2,$0,$L2967
	lui	$2,%hi(top.8911)

	addiu	$2,$2,%lo(top.8911)
	addu	$2,$4,$2
	lb	$4,0($2)
	bltz	$4,$L3209
	lui	$6,%hi($LC1)

$L2967:
	lw	$2,8992($21)
	andi	$2,$2,0x8000
	bne	$2,$0,$L2968
	lui	$2,%hi(left.8912)

	addiu	$2,$2,%lo(left.8912)
	addu	$2,$4,$2
	lb	$4,0($2)
	bltz	$4,$L3210
	lui	$6,%hi($LC2)

$L2968:
	sw	$4,8756($21)
$L3183:
	lw	$12,40($sp)
$L3000:
	andi	$2,$12,0x78
$L3246:
	bne	$2,$0,$L3211
	li	$2,131072			# 0x20000

$L3069:
	andi	$2,$12,0x2
	beq	$2,$0,$L3212
	li	$2,65536			# 0x10000

$L3070:
	li	$2,131072			# 0x20000
	addu	$2,$21,$2
	lw	$6,316($sp)
	lw	$3,8660($2)
	lw	$7,312($sp)
	sll	$4,$6,1
	lw	$8,308($sp)
	addu	$3,$3,$4
	sw	$7,8664($2)
	beq	$8,$0,$L3089
	sh	$7,0($3)

	andi	$2,$7,0xf
	beq	$2,$0,$L3256
	lw	$11,316($sp)

	andi	$2,$12,0x7
	beq	$2,$0,$L3213
	nop

$L3090:
	lw	$11,316($sp)
	lw	$2,1568($21)
	sll	$3,$11,2
	addu	$2,$2,$3
	sw	$12,0($2)
$L3184:
	lw	$12,40($sp)
	andi	$2,$12,0x80
$L3258:
	beq	$2,$0,$L3093
	nop

	lw	$2,2056($21)
	beq	$2,$0,$L3094
	li	$2,131072			# 0x20000

	ori	$3,$2,0x23f4
	ori	$2,$2,0x2404
	addu	$2,$21,$2
	sw	$2,292($sp)
	addu	$3,$21,$3
	lui	$2,%hi(luma_dc_field_scan)
	sw	$3,296($sp)
	addiu	$fp,$2,%lo(luma_dc_field_scan)
$L3095:
	li	$3,131072			# 0x20000
	addu	$2,$21,$3
	lw	$4,8680($2)
	ori	$5,$3,0x1fd8
	sltu	$16,$0,$4
	addu	$18,$21,$5
	ori	$23,$3,0x203c
	move	$17,$0
	li	$20,2			# 0x2
	li	$22,3			# 0x3
	li	$19,103			# 0x67
	addu	$5,$16,$23
$L3257:
	addu	$5,$21,$5
	addiu	$5,$5,4
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$18

	slt	$3,$16,2
	move	$16,$22
	lw	$28,32($sp)
	beq	$2,$0,$L3214
	movn	$16,$20,$3

	addiu	$17,$17,1
	bne	$17,$19,$L3257
	addu	$5,$16,$23

	li	$2,131072			# 0x20000
	addu	$2,$21,$2
	li	$3,-2147483648			# 0xffffffff80000000
	sw	$3,8680($2)
	lw	$2,6172($21)
	lui	$6,%hi($LC56)
	lw	$25,%call16(av_log)($28)
	lw	$4,0($21)
	lw	$7,6168($21)
	addiu	$6,$6,%lo($LC56)
	sw	$2,16($sp)
$L3188:
	jalr	$25
	move	$5,$0

	lw	$28,32($sp)
$L3189:
	lw	$31,492($sp)
	li	$2,-1			# 0xffffffffffffffff
	lw	$fp,488($sp)
	lw	$23,484($sp)
	lw	$22,480($sp)
	lw	$21,476($sp)
	lw	$20,472($sp)
	lw	$19,468($sp)
	lw	$18,464($sp)
	lw	$17,460($sp)
	lw	$16,456($sp)
	j	$31
	addiu	$sp,$sp,496

$L3089:
	lw	$11,316($sp)
$L3256:
	lw	$2,1568($21)
	sll	$3,$11,2
	lw	$13,312($sp)
	addu	$2,$2,$3
	bne	$13,$0,$L3184
	sw	$12,0($2)

	lw	$12,40($sp)
	andi	$2,$12,0x2
	bne	$2,$0,$L3258
	andi	$2,$12,0x80

	li	$3,131072			# 0x20000
	addiu	$2,$21,9092
	addu	$3,$21,$3
	sw	$0,9092($21)
	sw	$0,24($2)
	sw	$0,8($2)
	sw	$0,16($2)
	sw	$0,8680($3)
$L3185:
	sb	$0,9122($21)
	sb	$0,9121($21)
	sb	$0,9114($21)
	sb	$0,9113($21)
	sb	$0,9098($21)
	sb	$0,9097($21)
	sb	$0,9090($21)
	sb	$0,9089($21)
	lw	$5,316($sp)
$L3248:
	lw	$2,1548($21)
	lw	$3,2056($21)
	addu	$2,$2,$5
	sb	$3,0($2)
	lw	$4,152($21)
	lw	$5,6172($21)
	lw	$2,6168($21)
	mul	$6,$4,$5
	lw	$3,9128($21)
	addu	$4,$6,$2
	sll	$7,$4,4
	lbu	$6,9095($21)
	addu	$3,$3,$7
	sb	$6,0($3)
	lw	$2,9128($21)
	lbu	$4,9103($21)
	addu	$2,$2,$7
	sb	$4,1($2)
	lw	$3,9128($21)
	lbu	$4,9111($21)
	addu	$3,$3,$7
	sb	$4,2($3)
	lw	$2,9128($21)
	lbu	$4,9119($21)
	addu	$2,$2,$7
	sb	$4,3($2)
	lw	$3,9128($21)
	lbu	$4,9116($21)
	addu	$3,$3,$7
	sb	$4,4($3)
	lw	$2,9128($21)
	lbu	$4,9117($21)
	addu	$2,$2,$7
	sb	$4,5($2)
	lw	$3,9128($21)
	lbu	$4,9118($21)
	addu	$3,$3,$7
	sb	$4,6($3)
	lw	$2,9128($21)
	lbu	$4,9097($21)
	addu	$2,$2,$7
	sb	$4,9($2)
	lw	$3,9128($21)
	lbu	$4,9098($21)
	addu	$3,$3,$7
	sb	$4,8($3)
	lw	$2,9128($21)
	lbu	$4,9090($21)
	addu	$2,$2,$7
	sb	$4,7($2)
	lw	$3,9128($21)
	lbu	$4,9121($21)
	addu	$3,$3,$7
	sb	$4,12($3)
	lw	$2,9128($21)
	lbu	$4,9122($21)
	addu	$2,$2,$7
	sb	$4,11($2)
	lw	$3,9128($21)
	lbu	$4,9114($21)
	addu	$3,$3,$7
	li	$2,65536			# 0x10000
	sb	$4,10($3)
	addu	$2,$21,$2
	lw	$3,-6276($2)
	beq	$3,$0,$L3127
	lui	$3,%hi(scan8)

	addiu	$3,$3,%lo(scan8)
	sw	$3,344($sp)
	move	$4,$0
	move	$5,$0
	li	$6,16			# 0x10
	lw	$8,344($sp)
$L3267:
	addu	$2,$8,$4
	lbu	$3,0($2)
	addu	$3,$21,$3
	lbu	$2,9080($3)
	sltu	$2,$0,$2
	sll	$2,$2,$4
	addiu	$4,$4,1
	bne	$4,$6,$L3267
	addu	$5,$5,$2

	lw	$2,9128($21)
	addu	$2,$2,$7
	sh	$5,14($2)
$L3127:
	li	$2,65536			# 0x10000
	addu	$4,$21,$2
	lw	$3,-6268($4)
	beq	$3,$0,$L3259
	lw	$31,492($sp)

	lw	$3,5936($4)
	lw	$2,5940($4)
	srl	$3,$3,1
	srl	$2,$2,1
	sw	$2,5940($4)
	sw	$3,5936($4)
	lw	$31,492($sp)
$L3259:
	move	$2,$0
	lw	$fp,488($sp)
	lw	$23,484($sp)
	lw	$22,480($sp)
	lw	$21,476($sp)
	lw	$20,472($sp)
	lw	$19,468($sp)
	lw	$18,464($sp)
	lw	$17,460($sp)
	lw	$16,456($sp)
	j	$31
	addiu	$sp,$sp,496

$L2943:
	li	$2,4			# 0x4
	beq	$16,$2,$L3215
	andi	$2,$12,0x100

	bne	$2,$0,$L3216
	andi	$2,$12,0x8

	beq	$2,$0,$L3038
	andi	$2,$12,0x10

	li	$4,65536			# 0x10000
	addu	$3,$21,$4
	lw	$2,5944($3)
	beq	$2,$0,$L3000
	ori	$2,$4,0x1730

	addu	$18,$21,$2
	move	$23,$3
	addiu	$20,$21,9456
	move	$17,$0
	move	$16,$0
	li	$22,4096			# 0x1000
	li	$19,-1			# 0xffffffffffffffff
$L3043:
	sll	$4,$16,5
	sll	$3,$16,3
	sll	$2,$17,1
	addu	$3,$3,$4
	sll	$2,$22,$2
	addiu	$3,$3,12
	and	$2,$2,$12
	beq	$2,$0,$L3039
	addu	$3,$20,$3

	lw	$2,0($18)
	move	$4,$21
	sltu	$2,$2,2
	move	$5,$17
	move	$6,$0
	bne	$2,$0,$L3041
	move	$7,$0

	.option	pic0
	jal	decode_cabac_mb_ref
	nop

	.option	pic2
	sll	$3,$2,8
	addu	$3,$3,$2
	sll	$2,$3,16
	lw	$28,32($sp)
	lw	$12,40($sp)
	addu	$7,$3,$2
$L3041:
	sll	$3,$16,5
	sll	$2,$16,3
	addu	$2,$2,$3
	addiu	$2,$2,12
	addu	$2,$20,$2
	sw	$7,24($2)
	sw	$7,0($2)
	sw	$7,8($2)
	sw	$7,16($2)
$L3042:
	lw	$3,5944($23)
	addiu	$17,$17,1
	sltu	$2,$17,$3
	addiu	$18,$18,4
	bne	$2,$0,$L3043
	move	$16,$17

	beq	$3,$0,$L3000
	li	$2,131072			# 0x20000

	li	$3,65536			# 0x10000
	ori	$2,$2,0x21f8
	addu	$3,$21,$3
	addiu	$6,$sp,48
	addu	$19,$21,$2
	sw	$3,400($sp)
	addiu	$22,$21,9136
	move	$20,$21
	move	$18,$0
	move	$17,$0
	li	$23,4096			# 0x1000
	addiu	$fp,$sp,44
	sw	$6,396($sp)
$L3046:
	sll	$2,$18,1
	sll	$2,$23,$2
	and	$2,$2,$12
	bne	$2,$0,$L3217
	sll	$3,$17,5

	sll	$2,$17,3
	addu	$2,$2,$3
	addiu	$2,$2,12
	sll	$2,$2,2
	addu	$2,$22,$2
	sw	$0,108($2)
	sw	$0,0($2)
	sw	$0,4($2)
	sw	$0,8($2)
	sw	$0,12($2)
	sw	$0,32($2)
	sw	$0,36($2)
	sw	$0,40($2)
	sw	$0,44($2)
	sw	$0,64($2)
	sw	$0,68($2)
	sw	$0,72($2)
	sw	$0,76($2)
	sw	$0,96($2)
	sw	$0,100($2)
	sw	$0,104($2)
$L3045:
	lw	$11,400($sp)
	addiu	$18,$18,1
	lw	$2,5944($11)
	addiu	$20,$20,40
	sltu	$2,$18,$2
	bne	$2,$0,$L3046
	move	$17,$18

	b	$L3246
	andi	$2,$12,0x78

$L3205:
	beq	$2,$0,$L2931
	lui	$3,%hi(p_mb_type_info)

	sll	$2,$16,2
	b	$L3179
	addiu	$3,$3,%lo(p_mb_type_info)

$L2912:
	li	$2,3			# 0x3
	beq	$17,$2,$L3218
	li	$2,-1			# 0xffffffffffffffff

	sw	$2,40($sp)
$L3130:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($21)
	lui	$6,%hi($LC55)
	addiu	$6,$6,%lo($LC55)
	jalr	$25
	move	$5,$0

	lw	$28,32($sp)
	b	$L2902
	li	$2,-1			# 0xffffffffffffffff

$L3203:
	move	$4,$21
	li	$5,3			# 0x3
	.option	pic0
	jal	decode_cabac_intra_mb_type
	.option	pic2
	li	$6,1			# 0x1

	lw	$28,32($sp)
	b	$L2911
	move	$16,$2

$L3093:
	lw	$2,2056($21)
	beq	$2,$0,$L3096
	li	$2,131072			# 0x20000

	ori	$3,$2,0x2364
	ori	$2,$2,0x2374
	addu	$2,$21,$2
	sw	$2,292($sp)
	addu	$3,$21,$3
	lui	$2,%hi(luma_dc_zigzag_scan)
	sw	$3,296($sp)
	b	$L3095
	addiu	$fp,$2,%lo(luma_dc_zigzag_scan)

$L3212:
	addu	$2,$21,$2
	lw	$5,-6288($2)
	lw	$3,8768($21)
	lw	$7,-6296($2)
	addu	$3,$5,$3
	lbu	$2,0($3)
	beq	$2,$7,$L3071
	li	$2,131072			# 0x20000

	move	$6,$0
	move	$23,$0
$L3072:
	lw	$2,8764($21)
	addu	$2,$5,$2
	lbu	$3,0($2)
	beq	$7,$3,$L3073
	li	$17,8			# 0x8

$L3074:
	move	$5,$0
$L3076:
	li	$20,131072			# 0x20000
	addu	$5,$5,$6
	ori	$18,$20,0x2049
	ori	$2,$20,0x1fd8
	addu	$5,$5,$18
	addu	$22,$21,$2
	addu	$5,$21,$5
	addiu	$5,$5,4
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$22

	move	$19,$2
	li	$16,2			# 0x2
	xori	$2,$2,0x1
	move	$5,$0
	movz	$5,$16,$17
	andi	$2,$2,0x1
	addu	$5,$5,$2
	addu	$5,$5,$18
	addu	$5,$21,$5
	addiu	$5,$5,4
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$22

	sll	$17,$2,1
	or	$17,$17,$19
	andi	$2,$17,0x1
	move	$5,$16
	movn	$5,$0,$2
	addu	$5,$5,$23
	addu	$5,$5,$18
	addu	$5,$21,$5
	addiu	$5,$5,4
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$22

	sll	$2,$2,2
	or	$17,$2,$17
	srl	$2,$17,2
	andi	$3,$17,0x2
	xori	$2,$2,0x1
	movn	$16,$0,$3
	andi	$2,$2,0x1
	addu	$16,$16,$2
	addu	$16,$16,$18
	addu	$16,$21,$16
	addiu	$5,$16,4
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$22

	addu	$5,$21,$20
	lw	$3,8672($5)
	lw	$4,8668($5)
	sra	$3,$3,4
	andi	$16,$3,0x3
	sra	$4,$4,4
	sltu	$5,$0,$16
	andi	$18,$4,0x3
	addiu	$3,$5,2
	movn	$5,$3,$18
	ori	$20,$20,0x204d
	addu	$5,$5,$20
	addu	$5,$21,$5
	addiu	$5,$5,4
	move	$4,$22
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$19,$2

	beq	$2,$0,$L3219
	lw	$28,32($sp)

	xori	$4,$16,0x2
	li	$2,4			# 0x4
	li	$5,5			# 0x5
	movn	$5,$2,$4
	xori	$3,$18,0x2
	addiu	$2,$5,2
	movz	$5,$2,$3
	addu	$5,$5,$20
	addu	$5,$21,$5
	move	$4,$22
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	addiu	$5,$5,4

	addiu	$2,$2,1
	lw	$28,32($sp)
	sll	$3,$2,4
$L3085:
	sll	$2,$19,3
	or	$2,$2,$17
	or	$3,$2,$3
	lw	$12,40($sp)
	b	$L3070
	sw	$3,312($sp)

$L3211:
	addu	$2,$21,$2
	lw	$5,316($sp)
	lw	$3,8676($2)
	move	$4,$21
	addu	$3,$3,$5
	sb	$0,0($3)
	.option	pic0
	jal	write_back_motion
	.option	pic2
	lw	$5,40($sp)

	lw	$28,32($sp)
	b	$L3069
	lw	$12,40($sp)

$L2931:
	addiu	$2,$16,-5
	b	$L2930
	sw	$2,40($sp)

$L3215:
	li	$2,65536			# 0x10000
	addu	$2,$21,$2
	lw	$4,-6284($2)
	li	$3,3			# 0x3
	beq	$4,$3,$L3220
	li	$2,131072			# 0x20000

	ori	$3,$2,0x1fd8
	ori	$5,$2,0x201b
	ori	$4,$2,0x2019
	ori	$2,$2,0x201a
	addiu	$6,$sp,52
	addu	$18,$21,$3
	addu	$20,$21,$2
	lui	$3,%hi(p_sub_mb_type_info)
	li	$2,59272			# 0xe788
	addiu	$7,$sp,68
	sw	$6,336($sp)
	addu	$19,$21,$4
	addu	$22,$21,$5
	addu	$17,$21,$2
	addiu	$23,$3,%lo(p_sub_mb_type_info)
	move	$16,$6
	sw	$7,340($sp)
	li	$fp,2			# 0x2
$L2987:
	move	$4,$18
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$5,$19

	beq	$2,$0,$L2983
	lw	$28,32($sp)

	move	$2,$0
$L2984:
	sll	$2,$2,2
	addu	$2,$23,$2
	lbu	$3,2($2)
	lhu	$4,0($2)
	lw	$11,340($sp)
	sw	$3,0($16)
	addiu	$16,$16,4
	sw	$4,0($17)
	bne	$11,$16,$L2987
	addiu	$17,$17,4

	li	$3,65536			# 0x10000
$L3251:
	addu	$4,$21,$3
	lw	$2,5944($4)
	beq	$2,$0,$L3221
	ori	$2,$3,0x1730

	li	$3,59272			# 0xe788
	addu	$3,$21,$3
	addu	$20,$21,$2
	sw	$3,388($sp)
	sw	$4,392($sp)
	move	$19,$0
	li	$fp,4096			# 0x1000
	li	$7,16			# 0x10
$L2995:
	sll	$2,$19,5
	sll	$3,$19,3
	lw	$13,340($sp)
	addu	$3,$3,$2
	sll	$4,$19,1
	sll	$2,$19,4
	lw	$18,388($sp)
	sll	$22,$fp,$4
	addu	$17,$13,$2
	addu	$23,$21,$3
	move	$16,$0
$L2994:
	lw	$2,0($18)
	and	$3,$22,$2
	andi	$2,$2,0x100
	bne	$2,$0,$L2990
	nop

	beq	$3,$0,$L2991
	li	$2,-1			# 0xffffffffffffffff

	lw	$2,0($20)
	move	$4,$21
	sltu	$2,$2,2
	move	$5,$19
	bne	$2,$0,$L2992
	move	$6,$16

	.option	pic0
	jal	decode_cabac_mb_ref
	.option	pic2
	sw	$7,448($sp)

	lw	$28,32($sp)
	lw	$7,448($sp)
	sw	$2,0($17)
$L2993:
	lui	$3,%hi(scan8)
	addiu	$3,$3,%lo(scan8)
	addu	$2,$3,$16
	lbu	$3,0($2)
	lb	$4,0($17)
	addu	$3,$23,$3
	sb	$4,9457($3)
	sb	$4,9465($3)
	sb	$4,9464($3)
$L2990:
	addiu	$16,$16,4
	addiu	$18,$18,4
	bne	$16,$7,$L2994
	addiu	$17,$17,4

	lw	$4,392($sp)
	addiu	$19,$19,1
	lw	$5,5944($4)
	sltu	$2,$19,$5
	bne	$2,$0,$L2995
	addiu	$20,$20,4

$L2989:
	lw	$6,308($sp)
	bne	$6,$0,$L3222
	li	$2,59272			# 0xe788

$L2996:
	beq	$5,$0,$L3183
	li	$2,131072			# 0x20000

	lui	$3,%hi(scan8)
	ori	$2,$2,0x21f8
	addiu	$3,$3,%lo(scan8)
	addu	$2,$21,$2
	sw	$3,344($sp)
	sw	$2,328($sp)
	li	$3,59272			# 0xe788
	li	$2,65536			# 0x10000
	addu	$3,$21,$3
	addu	$2,$21,$2
	sw	$3,380($sp)
	sw	$2,384($sp)
	addiu	$fp,$21,9136
	sw	$21,256($sp)
	sw	$21,120($sp)
	move	$23,$0
	move	$5,$0
$L3036:
	sll	$3,$5,2
	sll	$2,$5,4
	addu	$2,$3,$2
	subu	$2,$0,$2
	addiu	$2,$2,1
	addu	$3,$3,$5
	sll	$2,$2,1
	sll	$7,$5,3
	subu	$3,$0,$3
	subu	$2,$0,$2
	sll	$5,$5,5
	addu	$5,$7,$5
	addiu	$3,$3,1
	addiu	$2,$2,12
	sw	$5,324($sp)
	sll	$3,$3,3
	sll	$2,$2,2
	sll	$4,$23,5
	subu	$3,$0,$3
	addu	$2,$fp,$2
	sll	$6,$23,3
	lw	$13,324($sp)
	addu	$6,$6,$4
	addiu	$5,$23,24
	sll	$4,$23,1
	addiu	$7,$23,46
	sw	$3,132($sp)
	sw	$2,276($sp)
	li	$8,12288			# 0x3000
	li	$11,4096			# 0x1000
	lui	$2,%hi(scan8)
	lw	$3,380($sp)
	sll	$8,$8,$4
	addu	$6,$21,$6
	sll	$5,$5,2
	sll	$7,$7,2
	sll	$4,$11,$4
	addiu	$13,$13,-1
	addiu	$2,$2,%lo(scan8)
	sw	$8,280($sp)
	sw	$6,368($sp)
	sw	$5,372($sp)
	sw	$7,376($sp)
	sw	$4,148($sp)
	sw	$13,124($sp)
	sw	$2,264($sp)
	sw	$3,260($sp)
	sw	$0,268($sp)
$L3035:
	lw	$4,264($sp)
	lw	$7,260($sp)
	lbu	$5,0($4)
	lw	$8,368($sp)
	lw	$6,0($7)
	addu	$2,$8,$5
	lbu	$3,9457($2)
	andi	$4,$6,0x100
	beq	$4,$0,$L3001
	sb	$3,9456($2)

	lw	$11,324($sp)
	lw	$13,328($sp)
	addu	$2,$11,$5
	sll	$2,$2,2
	addu	$2,$13,$2
	sw	$0,36($2)
	sw	$0,0($2)
	sw	$0,4($2)
	sw	$0,32($2)
$L3002:
	lw	$6,268($sp)
$L3247:
	lw	$7,264($sp)
	lw	$8,260($sp)
	addiu	$6,$6,4
	addiu	$7,$7,4
	addiu	$8,$8,4
	li	$11,16			# 0x10
	sw	$6,268($sp)
	sw	$7,264($sp)
	bne	$6,$11,$L3035
	sw	$8,260($sp)

	lw	$13,384($sp)
	lw	$3,120($sp)
	lw	$4,256($sp)
	lw	$2,5944($13)
	addiu	$23,$23,1
	addiu	$3,$3,160
	addiu	$4,$4,40
	sltu	$2,$23,$2
	sw	$3,120($sp)
	sw	$4,256($sp)
	bne	$2,$0,$L3036
	move	$5,$23

	b	$L3000
	lw	$12,40($sp)

$L3001:
	lw	$3,148($sp)
	and	$2,$3,$6
	beq	$2,$0,$L3003
	lw	$4,324($sp)

	lw	$4,336($sp)
	lw	$5,268($sp)
	andi	$3,$6,0x18
	addu	$2,$4,$5
	lw	$2,0($2)
	li	$7,1			# 0x1
	li	$8,2			# 0x2
	movn	$7,$8,$3
	sw	$2,320($sp)
	blez	$2,$L3002
	sw	$7,300($sp)

	lw	$2,344($sp)
	andi	$11,$6,0x20
	andi	$13,$6,0x8
	addu	$2,$2,$5
	andi	$6,$6,0x10
	sw	$11,364($sp)
	sw	$13,272($sp)
	sw	$2,136($sp)
	move	$22,$5
	sw	$0,304($sp)
	sw	$6,360($sp)
$L3034:
	lw	$3,136($sp)
	lw	$4,384($sp)
	lbu	$9,0($3)
	lw	$5,300($sp)
	lw	$6,324($sp)
	lw	$7,124($sp)
	lw	$11,132($sp)
	lw	$13,368($sp)
	addiu	$2,$9,-8
	addu	$10,$5,$2
	addu	$3,$7,$9
	lw	$8,-6276($4)
	addu	$18,$6,$9
	addu	$4,$11,$9
	lw	$11,328($sp)
	sll	$6,$18,2
	addu	$7,$13,$9
	sll	$3,$3,2
	sll	$4,$4,2
	addu	$2,$13,$2
	addu	$5,$13,$10
	addu	$19,$11,$6
	lb	$17,9456($2)
	lb	$16,9455($7)
	addu	$11,$fp,$3
	addu	$15,$fp,$4
	lb	$5,9456($5)
	addu	$20,$fp,$6
	beq	$8,$0,$L3006
	lb	$12,9456($7)

	lw	$13,276($sp)
	lw	$2,384($sp)
	sw	$0,0($13)
	lw	$3,-6272($2)
	lw	$13,1880($21)
	bne	$3,$0,$L3007
	lw	$14,104($13)

	lw	$4,6172($21)
	andi	$2,$4,0x1
	beq	$2,$0,$L3007
	slt	$2,$9,20

	beq	$2,$0,$L3007
	li	$6,-2			# 0xfffffffffffffffe

	beq	$5,$6,$L3223
	addiu	$2,$4,-1

	lw	$8,152($21)
	mul	$3,$2,$8
	lw	$6,6168($21)
	addu	$2,$3,$6
	xori	$3,$9,0xf
	sltu	$3,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$2,$14,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L3260
	lw	$7,324($sp)

	sll	$2,$6,2
	andi	$3,$9,0x7
	sll	$4,$4,2
	lw	$5,300($sp)
	addiu	$2,$2,-4
	addu	$2,$2,$3
	addiu	$7,$4,-1
	addu	$6,$2,$5
	sra	$2,$7,2
	mul	$4,$2,$8
	sra	$3,$6,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$14,$2
	lw	$2,0($2)
	lw	$5,280($sp)
	and	$3,$2,$5
	beq	$3,$0,$L3224
	andi	$2,$2,0x40

$L3011:
	lw	$2,9748($21)
	lw	$8,372($sp)
	mul	$3,$7,$2
	addu	$4,$13,$8
	addu	$2,$3,$6
	lw	$3,0($4)
	sll	$2,$2,2
	addu	$3,$3,$2
	lhu	$5,0($3)
	lw	$4,376($sp)
	lw	$8,120($sp)
	addu	$2,$13,$4
	sh	$5,9176($8)
	lh	$5,2($3)
	lw	$4,4($2)
	lw	$3,9752($21)
	sra	$6,$6,1
	sra	$2,$7,1
	addu	$4,$4,$6
	mul	$6,$2,$3
	sll	$5,$5,1
	addu	$2,$6,$4
	sh	$5,9178($8)
	lb	$3,0($2)
	lw	$6,276($sp)
	b	$L3013
	sra	$5,$3,1

$L3006:
	li	$6,-2			# 0xfffffffffffffffe
	beq	$5,$6,$L3261
	lw	$8,368($sp)

$L3010:
	lw	$7,324($sp)
$L3260:
	addu	$2,$7,$10
	sll	$2,$2,2
	addu	$6,$fp,$2
$L3013:
	xor	$4,$12,$16
	xor	$3,$12,$17
	sltu	$3,$3,1
	sltu	$4,$4,1
	xor	$2,$12,$5
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	bne	$3,$0,$L3262
	li	$13,1			# 0x1

$L3026:
	lh	$4,0($11)
	lh	$17,0($15)
	slt	$2,$17,$4
	beq	$2,$0,$L3027
	lh	$3,0($6)

	slt	$2,$17,$3
	beq	$2,$0,$L3028
	slt	$2,$4,$3

	move	$17,$4
	movz	$17,$3,$2
$L3028:
	lh	$3,2($11)
	lh	$16,2($15)
	slt	$2,$16,$3
	beq	$2,$0,$L3029
	lh	$6,2($6)

	slt	$2,$16,$6
	beq	$2,$0,$L3022
	slt	$2,$3,$6

	move	$16,$3
	movz	$16,$6,$2
$L3022:
	move	$4,$21
	move	$5,$23
	move	$6,$22
	.option	pic0
	jal	decode_cabac_mb_mvd
	.option	pic2
	move	$7,$0

	move	$4,$21
	move	$5,$23
	move	$6,$22
	li	$7,1			# 0x1
	.option	pic0
	jal	decode_cabac_mb_mvd
	.option	pic2
	addu	$18,$17,$2

	lw	$3,272($sp)
	lw	$28,32($sp)
	beq	$3,$0,$L3030
	addu	$4,$16,$2

	subu	$3,$4,$16
	subu	$2,$18,$17
	sll	$6,$3,16
	sll	$7,$2,16
	sll	$5,$18,16
	sll	$3,$4,16
	sra	$7,$7,16
	sra	$6,$6,16
	sra	$5,$5,16
	sra	$3,$3,16
	sh	$5,36($20)
	sh	$5,32($20)
	sh	$5,4($20)
	sh	$3,38($20)
	sh	$3,34($20)
	sh	$3,6($20)
	sh	$7,36($19)
	sh	$7,32($19)
	sh	$7,4($19)
	sh	$6,38($19)
	sh	$6,34($19)
	sh	$6,6($19)
$L3031:
	lw	$8,304($sp)
	sh	$3,2($20)
	lw	$13,136($sp)
	lw	$3,300($sp)
	lw	$11,320($sp)
	addiu	$8,$8,1
	addu	$13,$13,$3
	slt	$2,$8,$11
	sh	$5,0($20)
	sw	$8,304($sp)
	sh	$6,2($19)
	sh	$7,0($19)
	sw	$13,136($sp)
	bne	$2,$0,$L3034
	addu	$22,$22,$3

	b	$L3247
	lw	$6,268($sp)

$L3030:
	lw	$5,360($sp)
	beq	$5,$0,$L3032
	subu	$3,$4,$16

	subu	$2,$18,$17
	sll	$6,$3,16
	sll	$7,$2,16
	sll	$5,$18,16
	sll	$3,$4,16
	sra	$7,$7,16
	sra	$6,$6,16
	sra	$5,$5,16
	sra	$3,$3,16
	sh	$5,4($20)
	sh	$3,6($20)
	sh	$7,4($19)
	b	$L3031
	sh	$6,6($19)

$L3029:
	slt	$2,$6,$16
	beq	$2,$0,$L3022
	slt	$2,$6,$3

	move	$16,$3
	b	$L3022
	movz	$16,$6,$2

$L3027:
	slt	$2,$3,$17
	beq	$2,$0,$L3028
	slt	$2,$3,$4

	move	$17,$4
	b	$L3028
	movz	$17,$3,$2

$L3007:
	li	$7,-2			# 0xfffffffffffffffe
	bne	$5,$7,$L3010
	nop

	lw	$4,6172($21)
	andi	$5,$4,0x1
	bne	$5,$0,$L3009
	slt	$2,$9,20

	bne	$2,$0,$L3261
	lw	$8,368($sp)

$L3009:
	andi	$2,$9,0x7
	li	$8,4			# 0x4
	beq	$2,$8,$L3225
	lw	$6,256($sp)

	lw	$8,368($sp)
$L3261:
	addiu	$2,$18,-9
$L3265:
	addu	$3,$8,$9
	lb	$5,9447($3)
	sll	$2,$2,2
	xor	$4,$12,$16
	xor	$3,$12,$17
	sltu	$3,$3,1
	addu	$6,$fp,$2
	sltu	$4,$4,1
	xor	$2,$12,$5
	addu	$4,$4,$3
	sltu	$2,$2,1
	addu	$4,$4,$2
	slt	$3,$4,2
	beq	$3,$0,$L3026
	li	$13,1			# 0x1

$L3262:
	beq	$4,$13,$L3226
	li	$2,-2			# 0xfffffffffffffffe

	bne	$17,$2,$L3026
	nop

	bne	$5,$2,$L3026
	nop

	beq	$16,$2,$L3026
	nop

$L3182:
	lh	$16,2($11)
	b	$L3022
	lh	$17,0($11)

$L3003:
	addu	$2,$4,$5
	lw	$5,328($sp)
	sll	$2,$2,2
	addu	$3,$5,$2
	addu	$2,$fp,$2
	sw	$0,0($2)
	sw	$0,36($2)
	sw	$0,32($2)
	sw	$0,4($2)
	sw	$0,0($3)
	sw	$0,36($3)
	sw	$0,32($3)
	b	$L3002
	sw	$0,4($3)

$L3032:
	lw	$6,364($sp)
	bne	$6,$0,$L3033
	subu	$2,$18,$17

	subu	$3,$4,$16
	sll	$6,$3,16
	sll	$7,$2,16
	sll	$5,$18,16
	sll	$3,$4,16
	sra	$7,$7,16
	sra	$6,$6,16
	sra	$5,$5,16
	b	$L3031
	sra	$3,$3,16

$L2991:
	b	$L2993
	sw	$2,0($17)

$L3033:
	subu	$3,$4,$16
	sll	$6,$3,16
	sll	$7,$2,16
	sll	$5,$18,16
	sll	$3,$4,16
	sra	$7,$7,16
	sra	$6,$6,16
	sra	$5,$5,16
	sra	$3,$3,16
	sh	$5,32($20)
	sh	$3,34($20)
	sh	$7,32($19)
	b	$L3031
	sh	$6,34($19)

$L2992:
	b	$L2993
	sw	$0,0($17)

$L3226:
	beq	$12,$16,$L3182
	nop

	beq	$12,$17,$L3227
	nop

	lh	$16,2($6)
	b	$L3022
	lh	$17,0($6)

$L2983:
	move	$4,$18
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$5,$20

	lw	$28,32($sp)
	move	$4,$18
	bne	$2,$0,$L2985
	move	$5,$22

	b	$L2984
	li	$2,1			# 0x1

$L3094:
	addu	$2,$21,$2
	lw	$3,9360($2)
	lw	$2,9364($2)
	sw	$3,296($sp)
	lui	$3,%hi(luma_dc_field_scan)
	addiu	$fp,$3,%lo(luma_dc_field_scan)
	b	$L3095
	sw	$2,292($sp)

$L3214:
	andi	$2,$17,0x1
	bne	$2,$0,$L3228
	addiu	$2,$17,1

	nor	$3,$0,$17
	srl	$2,$3,31
	addu	$2,$2,$3
	sra	$3,$2,1
$L3103:
	lw	$4,2056($21)
	li	$2,131072			# 0x20000
	addu	$2,$21,$2
	addu	$4,$3,$4
	sw	$3,8680($2)
	sltu	$2,$4,52
	bne	$2,$0,$L3105
	sw	$4,2056($21)

	bltz	$4,$L3229
	addiu	$2,$4,-52

	sw	$2,2056($21)
	move	$4,$2
$L3105:
	andi	$2,$4,0xff
	lw	$3,40($sp)
	addu	$2,$21,$2
	lbu	$5,12352($2)
	lbu	$4,12096($2)
	andi	$3,$3,0x2
	sw	$4,8740($21)
	bne	$3,$0,$L3230
	sw	$5,8744($21)

	lui	$2,%hi(scan8)
	lw	$22,332($sp)
	addiu	$fp,$2,%lo(scan8)
	move	$20,$0
	move	$19,$0
	li	$23,4			# 0x4
$L3119:
	lw	$7,312($sp)
	sra	$2,$7,$20
	andi	$2,$2,0x1
	beq	$2,$0,$L3111
	addu	$2,$fp,$19

	lw	$3,40($sp)
	li	$8,16777216			# 0x1000000
	and	$2,$3,$8
	bne	$2,$0,$L3231
	li	$2,3			# 0x3

	andi	$3,$3,0x7
	movn	$2,$0,$3
	addiu	$2,$2,14800
	sll	$2,$2,2
	addu	$2,$21,$2
	lw	$3,2056($21)
	lw	$4,4($2)
	sll	$3,$3,6
	addu	$18,$4,$3
	move	$17,$22
	move	$16,$0
$L3118:
	lw	$3,296($sp)
	move	$5,$17
	addu	$7,$16,$19
	li	$8,16			# 0x10
	move	$4,$21
	li	$6,2			# 0x2
	addiu	$16,$16,1
	sw	$3,16($sp)
	sw	$18,20($sp)
	sw	$8,24($sp)
	.option	pic0
	jal	decode_cabac_residual
	.option	pic2
	addiu	$17,$17,32

	bne	$16,$23,$L3118
	lw	$28,32($sp)

$L3115:
	addiu	$20,$20,1
	addiu	$19,$19,4
	bne	$20,$23,$L3119
	addiu	$22,$22,128

$L3110:
	lw	$11,312($sp)
$L3250:
	andi	$2,$11,0x30
	beq	$2,$0,$L3263
	lw	$13,312($sp)

	li	$16,131072			# 0x20000
	ori	$5,$16,0x1cd8
	lui	$17,%hi(chroma_dc_scan)
	addiu	$17,$17,%lo(chroma_dc_scan)
	addu	$5,$21,$5
	li	$18,4			# 0x4
	move	$4,$21
	li	$6,3			# 0x3
	move	$7,$0
	ori	$16,$16,0x1d58
	sw	$17,16($sp)
	sw	$0,20($sp)
	.option	pic0
	jal	decode_cabac_residual
	.option	pic2
	sw	$18,24($sp)

	addu	$5,$21,$16
	move	$4,$21
	li	$6,3			# 0x3
	li	$7,1			# 0x1
	sw	$17,16($sp)
	sw	$18,24($sp)
	.option	pic0
	jal	decode_cabac_residual
	.option	pic2
	sw	$0,20($sp)

	lw	$28,32($sp)
	lw	$13,312($sp)
$L3263:
	andi	$2,$13,0x20
	beq	$2,$0,$L3185
	lw	$2,296($sp)

	move	$22,$0
	addiu	$fp,$2,1
	li	$2,131072			# 0x20000
	ori	$2,$2,0x1cd8
	addu	$23,$21,$2
	move	$20,$0
$L3125:
	lw	$3,40($sp)
	li	$2,3			# 0x3
	andi	$3,$3,0x7
	movn	$2,$0,$3
	addiu	$22,$22,1
	addu	$2,$22,$2
	addiu	$2,$2,14800
	sll	$2,$2,2
	addu	$4,$21,$20
	addu	$2,$21,$2
	lw	$3,8740($4)
	lw	$5,4($2)
	sll	$3,$3,6
	addu	$19,$5,$3
	move	$18,$23
	move	$17,$20
	move	$16,$0
$L3124:
	move	$5,$18
	move	$7,$17
	li	$3,15			# 0xf
	move	$4,$21
	li	$6,4			# 0x4
	sw	$fp,16($sp)
	sw	$19,20($sp)
	sw	$3,24($sp)
	.option	pic0
	jal	decode_cabac_residual
	.option	pic2
	addiu	$16,$16,1

	li	$2,4			# 0x4
	lw	$28,32($sp)
	addiu	$18,$18,32
	bne	$16,$2,$L3124
	addiu	$17,$17,1

	li	$4,2			# 0x2
	addiu	$20,$20,4
	bne	$22,$4,$L3125
	addiu	$23,$23,128

	b	$L3248
	lw	$5,316($sp)

$L3096:
	addu	$2,$21,$2
	lw	$4,9348($2)
	lw	$2,9352($2)
	lui	$3,%hi(luma_dc_zigzag_scan)
	sw	$4,296($sp)
	sw	$2,292($sp)
	b	$L3095
	addiu	$fp,$3,%lo(luma_dc_zigzag_scan)

$L2963:
	ori	$2,$17,0x2047
	addu	$17,$21,$2
	move	$4,$16
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$5,$17

	bne	$2,$0,$L2965
	lw	$28,32($sp)

	li	$4,1			# 0x1
	b	$L2964
	li	$5,1			# 0x1

$L3219:
	b	$L3085
	move	$3,$0

$L3208:
	lbu	$4,0($2)
	addiu	$3,$6,1
	b	$L2962
	movn	$6,$3,$4

$L2960:
	addu	$2,$18,$5
	lbu	$3,0($2)
	b	$L2961
	sltu	$6,$0,$3

$L3218:
	lw	$5,-6288($3)
	lw	$4,8768($21)
	lw	$7,-6296($3)
	addu	$2,$5,$4
	lbu	$3,0($2)
	beq	$3,$7,$L2916
	lw	$8,8764($21)

	move	$6,$0
$L2917:
	addu	$2,$5,$8
	lbu	$3,0($2)
	beq	$7,$3,$L3232
	sll	$4,$8,2

$L2918:
	li	$16,131072			# 0x20000
	ori	$5,$16,0x201b
	addu	$5,$6,$5
	ori	$2,$16,0x1fd8
	addu	$19,$21,$2
	addu	$5,$21,$5
	addiu	$5,$5,4
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$19

	bne	$2,$0,$L2919
	lw	$28,32($sp)

	move	$16,$0
	b	$L2926
	sw	$16,40($sp)

$L2945:
	.option	pic0
	jal	decode_cabac_mb_transform_size
	.option	pic2
	move	$4,$21

	beq	$2,$0,$L3264
	lui	$3,%hi(scan8)

	lw	$2,40($sp)
	li	$3,16777216			# 0x1000000
	or	$2,$2,$3
	lui	$4,%hi(scan8+16)
	lui	$3,%hi(scan8)
	sw	$2,40($sp)
	addiu	$17,$3,%lo(scan8)
	addiu	$18,$4,%lo(scan8+16)
	li	$19,2			# 0x2
$L2949:
	lbu	$16,0($17)
	move	$4,$21
	addu	$2,$21,$16
	lb	$6,8775($2)
	lb	$5,8768($2)
	addiu	$16,$16,8776
	slt	$2,$6,$5
	movn	$5,$6,$2
	slt	$3,$5,0
	.option	pic0
	jal	decode_cabac_mb_intra4x4_pred_mode
	.option	pic2
	movn	$5,$19,$3

	sll	$3,$2,8
	addu	$3,$3,$2
	andi	$3,$3,0xffff
	addu	$16,$21,$16
	addiu	$17,$17,4
	lw	$28,32($sp)
	sh	$3,8($16)
	bne	$18,$17,$L2949
	sh	$3,0($16)

	b	$L3249
	lw	$4,152($21)

$L3038:
	bne	$2,$0,$L3047
	li	$4,65536			# 0x10000

	addu	$3,$21,$4
	lw	$2,5944($3)
	beq	$2,$0,$L3000
	ori	$2,$4,0x1730

	addu	$2,$21,$2
	sw	$2,152($sp)
	sw	$3,444($sp)
	addiu	$7,$21,9456
	move	$17,$0
	move	$4,$0
	li	$8,-1
$L3064:
	sll	$3,$4,4
	sll	$2,$4,2
	addu	$2,$2,$3
	addiu	$5,$2,18
	addiu	$3,$2,6
	addiu	$4,$2,10
	addiu	$2,$2,14
	sll	$4,$4,1
	sll	$3,$3,1
	sll	$2,$2,1
	sll	$5,$5,1
	addu	$20,$7,$4
	addu	$22,$7,$3
	addu	$19,$7,$2
	addu	$18,$7,$5
	sll	$4,$17,1
	move	$23,$22
	move	$fp,$20
	sw	$19,112($sp)
	sw	$18,116($sp)
	move	$16,$0
	sw	$4,352($sp)
$L3063:
	lw	$5,352($sp)
	li	$6,4096			# 0x1000
	addu	$2,$16,$5
	sll	$2,$6,$2
	and	$2,$2,$12
	beq	$2,$0,$L3059
	lw	$13,112($sp)

	lw	$11,152($sp)
	move	$4,$21
	lw	$2,0($11)
	move	$5,$17
	sltu	$2,$2,2
	sll	$6,$16,2
	bne	$2,$0,$L3061
	move	$3,$0

	sw	$7,448($sp)
	.option	pic0
	jal	decode_cabac_mb_ref
	.option	pic2
	sw	$8,452($sp)

	sll	$3,$2,8
	addu	$3,$3,$2
	lw	$28,32($sp)
	lw	$12,40($sp)
	lw	$8,452($sp)
	lw	$7,448($sp)
	andi	$3,$3,0xffff
$L3061:
	sh	$3,0($22)
	sh	$3,0($20)
	sh	$3,0($19)
	sh	$3,0($18)
$L3062:
	lw	$3,112($sp)
	lw	$4,116($sp)
	addiu	$3,$3,2
	addiu	$4,$4,2
	addiu	$16,$16,1
	li	$5,2			# 0x2
	addiu	$23,$23,2
	addiu	$fp,$fp,2
	sw	$3,112($sp)
	sw	$4,116($sp)
	addiu	$22,$22,2
	addiu	$20,$20,2
	addiu	$19,$19,2
	bne	$16,$5,$L3063
	addiu	$18,$18,2

	lw	$6,444($sp)
	lw	$11,152($sp)
	lw	$3,5944($6)
	addiu	$17,$17,1
	addiu	$11,$11,4
	sltu	$2,$17,$3
	sw	$11,152($sp)
	bne	$2,$0,$L3064
	move	$4,$17

	beq	$3,$0,$L3000
	li	$2,131072			# 0x20000

	ori	$2,$2,0x21f8
	addu	$2,$21,$2
	li	$3,65536			# 0x10000
	addu	$3,$21,$3
	sw	$2,144($sp)
	addiu	$13,$21,9136
	addiu	$2,$sp,44
	addiu	$4,$sp,48
	sw	$3,440($sp)
	sw	$13,140($sp)
	move	$17,$0
	move	$3,$0
	sw	$2,432($sp)
	sw	$4,436($sp)
$L3068:
	sll	$2,$3,4
	sll	$3,$3,2
	addu	$3,$3,$2
	addiu	$4,$3,6
	lw	$11,144($sp)
	sll	$5,$4,3
	sll	$6,$17,5
	addiu	$5,$5,4
	sll	$2,$17,3
	addu	$13,$11,$5
	addu	$2,$2,$6
	sw	$13,128($sp)
	addiu	$2,$2,9468
	lw	$13,140($sp)
	addiu	$7,$3,10
	addiu	$8,$3,14
	addiu	$9,$3,18
	lw	$6,140($sp)
	addu	$2,$21,$2
	sll	$3,$3,3
	sll	$4,$4,3
	sll	$7,$7,3
	sll	$8,$8,3
	sll	$9,$9,3
	addu	$3,$13,$3
	sw	$2,192($sp)
	lw	$2,128($sp)
	addu	$18,$6,$4
	addu	$19,$11,$4
	addu	$6,$11,$8
	addu	$4,$11,$7
	addu	$5,$13,$5
	addu	$11,$11,$9
	addu	$7,$13,$7
	addu	$8,$13,$8
	addu	$9,$13,$9
	sw	$3,428($sp)
	sll	$3,$17,1
	sw	$4,164($sp)
	sw	$6,160($sp)
	sw	$11,156($sp)
	sw	$5,184($sp)
	sw	$7,180($sp)
	sw	$8,176($sp)
	sw	$9,172($sp)
	move	$22,$19
	sw	$2,168($sp)
	move	$fp,$4
	sw	$6,104($sp)
	sw	$11,108($sp)
	move	$20,$18
	move	$23,$0
	sw	$0,188($sp)
	sw	$3,348($sp)
$L3067:
	lw	$4,348($sp)
	li	$5,4096			# 0x1000
	addu	$2,$4,$23
	sll	$2,$5,$2
	lw	$6,428($sp)
	lw	$7,188($sp)
	and	$2,$2,$12
	bne	$2,$0,$L3233
	addu	$3,$6,$7

	lw	$4,168($sp)
	lw	$5,104($sp)
	lw	$6,108($sp)
	sw	$0,0($22)
	sw	$0,0($4)
	sw	$0,0($fp)
	sw	$0,36($22)
	sw	$0,0($5)
	sw	$0,68($22)
	sw	$0,0($6)
	sw	$0,100($22)
	sw	$0,0($20)
	sw	$0,52($3)
	sw	$0,80($3)
	sw	$0,36($20)
	sw	$0,112($3)
	sw	$0,68($20)
	sw	$0,144($3)
	sw	$0,100($20)
$L3066:
	lw	$7,192($sp)
	lw	$8,188($sp)
	lw	$11,128($sp)
	lw	$13,164($sp)
	addiu	$7,$7,2
	addiu	$8,$8,8
	addiu	$11,$11,8
	addiu	$13,$13,8
	lw	$2,160($sp)
	lw	$3,156($sp)
	lw	$4,184($sp)
	lw	$5,180($sp)
	lw	$6,176($sp)
	sw	$7,192($sp)
	sw	$8,188($sp)
	lw	$7,172($sp)
	lw	$8,168($sp)
	sw	$11,128($sp)
	sw	$13,164($sp)
	lw	$11,104($sp)
	lw	$13,108($sp)
	addiu	$2,$2,8
	sw	$2,160($sp)
	addiu	$3,$3,8
	addiu	$4,$4,8
	addiu	$5,$5,8
	addiu	$6,$6,8
	addiu	$7,$7,8
	addiu	$8,$8,8
	addiu	$11,$11,8
	addiu	$13,$13,8
	addiu	$23,$23,1
	li	$2,2			# 0x2
	addiu	$19,$19,8
	sw	$3,156($sp)
	addiu	$18,$18,8
	sw	$4,184($sp)
	sw	$5,180($sp)
	sw	$6,176($sp)
	sw	$7,172($sp)
	addiu	$22,$22,8
	sw	$8,168($sp)
	addiu	$fp,$fp,8
	sw	$11,104($sp)
	sw	$13,108($sp)
	bne	$23,$2,$L3234
	addiu	$20,$20,8

	lw	$3,440($sp)
	addiu	$17,$17,1
	lw	$2,5944($3)
	sltu	$2,$17,$2
	beq	$2,$0,$L3183
	move	$3,$17

	b	$L3068
	lw	$12,40($sp)

$L3216:
	move	$4,$21
	.option	pic0
	jal	pred_direct_motion
	.option	pic2
	addiu	$5,$sp,40

	li	$4,131072			# 0x20000
	ori	$4,$4,0x21f8
	addu	$4,$21,$4
	addiu	$2,$4,48
	addiu	$3,$4,208
	sw	$0,48($4)
	sw	$0,108($2)
	sw	$0,4($2)
	sw	$0,8($2)
	sw	$0,12($2)
	sw	$0,32($2)
	sw	$0,36($2)
	sw	$0,40($2)
	sw	$0,44($2)
	sw	$0,64($2)
	sw	$0,68($2)
	sw	$0,72($2)
	sw	$0,76($2)
	sw	$0,96($2)
	sw	$0,100($2)
	sw	$0,104($2)
	sw	$0,208($4)
	sw	$0,108($3)
	sw	$0,4($3)
	sw	$0,8($3)
	sw	$0,12($3)
	sw	$0,32($3)
	sw	$0,36($3)
	sw	$0,40($3)
	sw	$0,44($3)
	sw	$0,64($3)
	sw	$0,68($3)
	sw	$0,72($3)
	sw	$0,76($3)
	sw	$0,96($3)
	sw	$0,100($3)
	sw	$0,104($3)
	lw	$2,9980($21)
	lw	$5,308($sp)
	lw	$28,32($sp)
	and	$5,$5,$2
	lw	$12,40($sp)
	b	$L3000
	sw	$5,308($sp)

$L3222:
	li	$3,59288			# 0xe798
	addu	$4,$21,$2
	addu	$6,$21,$3
$L2999:
	lw	$2,0($4)
	andi	$3,$2,0x100
	andi	$2,$2,0x8
	beq	$2,$0,$L2997
	addiu	$4,$4,4

	lw	$2,9980($21)
	bne	$2,$0,$L2998
	nop

	bne	$3,$0,$L2997
	nop

$L2998:
	bne	$4,$6,$L2999
	li	$7,1			# 0x1

	b	$L2996
	sw	$7,308($sp)

$L2985:
	.option	pic0
	jal	get_cabac
	nop

	.option	pic2
	li	$8,3			# 0x3
	movn	$8,$fp,$2
	lw	$28,32($sp)
	b	$L2984
	move	$2,$8

$L3047:
	addu	$3,$21,$4
	lw	$2,5944($3)
	beq	$2,$0,$L3000
	ori	$2,$4,0x1730

	addu	$20,$21,$2
	sw	$3,424($sp)
	addiu	$22,$21,9456
	move	$19,$0
	move	$4,$0
	li	$fp,4096			# 0x1000
$L3054:
	sll	$3,$4,5
	sll	$2,$4,3
	addu	$2,$2,$3
	addu	$17,$22,$2
	move	$16,$17
	move	$18,$0
	sll	$23,$19,1
$L3053:
	addu	$2,$23,$18
	sll	$2,$fp,$2
	and	$2,$2,$12
	beq	$2,$0,$L3049
	li	$13,-1			# 0xffffffffffffffff

	lw	$2,0($20)
	move	$4,$21
	sltu	$2,$2,2
	move	$5,$19
	sll	$6,$18,3
	bne	$2,$0,$L3051
	move	$3,$0

	.option	pic0
	jal	decode_cabac_mb_ref
	nop

	.option	pic2
	sll	$3,$2,8
	addu	$3,$3,$2
	sll	$2,$3,16
	lw	$28,32($sp)
	addu	$3,$3,$2
$L3051:
	sw	$3,20($17)
	sw	$3,12($17)
$L3052:
	addiu	$18,$18,1
	li	$2,2			# 0x2
	addiu	$17,$17,16
	bne	$18,$2,$L3235
	addiu	$16,$16,16

	lw	$4,424($sp)
	addiu	$19,$19,1
	lw	$3,5944($4)
	addiu	$20,$20,4
	sltu	$2,$19,$3
	beq	$2,$0,$L3174
	move	$4,$19

	b	$L3054
	lw	$12,40($sp)

$L3225:
	li	$7,-2			# 0xfffffffffffffffe
	lb	$2,9467($6)
	beq	$2,$7,$L3261
	lw	$8,368($sp)

	bne	$3,$0,$L3015
	nop

	lw	$2,8768($21)
	sll	$2,$2,2
	addu	$2,$14,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	beq	$3,$0,$L3265
	addiu	$2,$18,-9

	ori	$2,$4,0x1
	sll	$2,$2,1
	addu	$2,$2,$5
	sra	$3,$9,4
	addiu	$3,$3,-1
	sll	$2,$2,1
	lw	$4,6168($21)
	addu	$7,$3,$2
	lw	$5,152($21)
	sll	$4,$4,2
	sra	$2,$7,2
	addiu	$8,$4,-1
	mul	$4,$2,$5
	sra	$3,$8,2
	addu	$2,$4,$3
	sll	$2,$2,2
	addu	$2,$14,$2
	lw	$2,0($2)
	lw	$5,280($sp)
	and	$3,$5,$2
	beq	$3,$0,$L3236
	andi	$2,$2,0x40

$L3016:
	lw	$2,9748($21)
	lw	$6,372($sp)
	mul	$4,$7,$2
	addu	$3,$13,$6
	addu	$2,$4,$8
	lw	$4,0($3)
	sll	$2,$2,2
	addu	$4,$4,$2
	lw	$5,376($sp)
	lhu	$3,0($4)
	lw	$6,120($sp)
	addu	$2,$13,$5
	lw	$5,9752($21)
	sh	$3,9176($6)
	lw	$6,4($2)
	sra	$2,$7,1
	lh	$3,2($4)
	mul	$4,$2,$5
	lw	$5,120($sp)
	addu	$2,$4,$6
	sll	$3,$3,1
	sra	$4,$8,1
	sh	$3,9178($5)
	addu	$2,$2,$4
	lb	$3,0($2)
	lw	$6,276($sp)
	b	$L3013
	sra	$5,$3,1

$L2965:
	move	$4,$16
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$5,$17

	li	$4,3			# 0x3
	li	$3,2			# 0x2
	movz	$4,$3,$2
	lw	$28,32($sp)
	b	$L2964
	move	$5,$4

$L2901:
	.option	pic0
	jal	decode_cabac_field_decoding_flag
	.option	pic2
	move	$4,$21

	sw	$2,-6268($16)
	b	$L2899
	sw	$2,-6272($16)

$L3228:
	b	$L3103
	sra	$3,$2,1

$L3223:
	b	$L3009
	li	$5,1			# 0x1

$L3227:
	lh	$16,2($15)
	b	$L3022
	lh	$17,0($15)

$L2916:
	lw	$2,1568($21)
	sll	$4,$4,2
	addu	$2,$2,$4
	lw	$3,0($2)
	srl	$3,$3,8
	xori	$3,$3,0x1
	b	$L2917
	andi	$6,$3,0x1

$L3111:
	lbu	$4,0($2)
	addiu	$3,$4,9080
	addu	$3,$21,$3
	addu	$4,$21,$4
	sb	$0,1($3)
	sb	$0,9($3)
	sb	$0,8($3)
	b	$L3115
	sb	$0,9080($4)

$L3231:
	andi	$3,$3,0x7
	li	$11,59224			# 0xe758
	li	$2,59228			# 0xe75c
	movn	$2,$11,$3
	addu	$2,$21,$2
	lw	$3,2056($21)
	lw	$8,4($2)
	sll	$3,$3,8
	lw	$13,292($sp)
	addu	$8,$8,$3
	li	$2,64			# 0x40
	move	$4,$21
	move	$5,$22
	li	$6,5			# 0x5
	move	$7,$19
	sw	$8,20($sp)
	sw	$13,16($sp)
	.option	pic0
	jal	decode_cabac_residual
	.option	pic2
	sw	$2,24($sp)

	b	$L3115
	lw	$28,32($sp)

$L3230:
	lw	$5,332($sp)
	li	$2,16			# 0x10
	move	$4,$21
	move	$6,$0
	move	$7,$0
	sw	$2,24($sp)
	sw	$fp,16($sp)
	.option	pic0
	jal	decode_cabac_residual
	.option	pic2
	sw	$0,20($sp)

	lw	$5,312($sp)
	andi	$2,$5,0xf
	beq	$2,$0,$L3108
	lw	$28,32($sp)

	li	$2,65536			# 0x10000
	addu	$2,$21,$2
	lw	$3,2056($21)
	lw	$4,-6332($2)
	lw	$6,296($sp)
	sll	$3,$3,6
	lw	$17,332($sp)
	addu	$19,$4,$3
	addiu	$18,$6,1
	move	$16,$0
	li	$20,15			# 0xf
	li	$22,16			# 0x10
$L3109:
	move	$5,$17
	move	$7,$16
	move	$4,$21
	li	$6,1			# 0x1
	addiu	$16,$16,1
	sw	$18,16($sp)
	sw	$19,20($sp)
	sw	$20,24($sp)
	.option	pic0
	jal	decode_cabac_residual
	.option	pic2
	addiu	$17,$17,32

	bne	$16,$22,$L3109
	lw	$28,32($sp)

	b	$L3250
	lw	$11,312($sp)

$L3234:
	b	$L3067
	lw	$12,40($sp)

$L3235:
	b	$L3053
	lw	$12,40($sp)

$L3049:
	sw	$13,12($16)
	b	$L3052
	sw	$13,20($16)

$L3059:
	lw	$2,116($sp)
	sh	$8,0($23)
	sh	$8,0($fp)
	sh	$8,0($13)
	b	$L3062
	sh	$8,0($2)

$L3039:
	sw	$19,24($3)
	sw	$19,0($3)
	sw	$19,8($3)
	b	$L3042
	sw	$19,16($3)

$L3217:
	lb	$2,9468($20)
	lw	$8,396($sp)
	move	$4,$21
	move	$5,$0
	li	$6,4			# 0x4
	move	$7,$18
	sw	$8,24($sp)
	sw	$2,16($sp)
	.option	pic0
	jal	pred_motion
	.option	pic2
	sw	$fp,20($sp)

	move	$4,$21
	move	$5,$18
	move	$6,$0
	.option	pic0
	jal	decode_cabac_mb_mvd
	.option	pic2
	move	$7,$0

	lw	$3,44($sp)
	move	$4,$21
	move	$5,$18
	move	$6,$0
	li	$7,1			# 0x1
	.option	pic0
	jal	decode_cabac_mb_mvd
	.option	pic2
	addu	$16,$2,$3

	lw	$4,48($sp)
	sll	$5,$17,5
	sll	$3,$17,3
	addu	$3,$3,$5
	lw	$5,44($sp)
	addu	$2,$2,$4
	subu	$4,$2,$4
	subu	$5,$16,$5
	addiu	$3,$3,12
	sll	$3,$3,2
	andi	$5,$5,0xffff
	sll	$4,$4,16
	sll	$2,$2,16
	andi	$16,$16,0xffff
	addu	$4,$4,$5
	addu	$2,$2,$16
	addu	$5,$22,$3
	addu	$3,$19,$3
	sw	$4,108($3)
	sw	$4,0($3)
	sw	$4,4($3)
	sw	$4,8($3)
	sw	$4,12($3)
	sw	$4,32($3)
	sw	$4,36($3)
	sw	$4,40($3)
	sw	$4,44($3)
	sw	$4,64($3)
	sw	$4,68($3)
	sw	$4,72($3)
	sw	$4,76($3)
	sw	$4,96($3)
	sw	$4,100($3)
	sw	$4,104($3)
	lw	$28,32($sp)
	sw	$2,0($5)
	sw	$2,4($5)
	sw	$2,8($5)
	sw	$2,12($5)
	sw	$2,32($5)
	sw	$2,36($5)
	sw	$2,40($5)
	sw	$2,44($5)
	sw	$2,64($5)
	sw	$2,68($5)
	sw	$2,72($5)
	sw	$2,76($5)
	sw	$2,96($5)
	sw	$2,100($5)
	sw	$2,104($5)
	sw	$2,108($5)
	b	$L3045
	lw	$12,40($sp)

$L3229:
	addiu	$2,$4,52
	sw	$2,2056($21)
	b	$L3105
	move	$4,$2

$L3071:
	addu	$2,$21,$2
	lw	$3,8672($2)
	srl	$4,$3,3
	srl	$3,$3,1
	xori	$3,$3,0x1
	xori	$4,$4,0x1
	andi	$6,$3,0x1
	b	$L3072
	andi	$23,$4,0x1

$L3073:
	li	$2,131072			# 0x20000
	addu	$2,$21,$2
	lw	$2,8668($2)
	andi	$3,$2,0x4
	bne	$3,$0,$L3075
	li	$5,2			# 0x2

	b	$L3076
	andi	$17,$2,0x8

$L3233:
	lw	$8,192($sp)
	lw	$11,432($sp)
	lb	$7,0($8)
	lw	$13,436($sp)
	sll	$16,$23,2
	move	$5,$16
	move	$4,$21
	move	$6,$17
	sw	$11,16($sp)
	.option	pic0
	jal	pred_8x16_motion
	.option	pic2
	sw	$13,20($sp)

	move	$6,$16
	move	$4,$21
	move	$5,$17
	.option	pic0
	jal	decode_cabac_mb_mvd
	.option	pic2
	move	$7,$0

	lw	$3,44($sp)
	move	$6,$16
	move	$4,$21
	move	$5,$17
	li	$7,1			# 0x1
	.option	pic0
	jal	decode_cabac_mb_mvd
	.option	pic2
	addu	$16,$2,$3

	lw	$3,48($sp)
	lw	$4,44($sp)
	addu	$2,$2,$3
	subu	$3,$2,$3
	subu	$4,$16,$4
	andi	$4,$4,0xffff
	sll	$3,$3,16
	addu	$3,$3,$4
	lw	$5,164($sp)
	lw	$4,128($sp)
	lw	$6,160($sp)
	lw	$7,156($sp)
	sw	$3,0($19)
	sll	$2,$2,16
	sw	$3,0($4)
	andi	$16,$16,0xffff
	sw	$3,0($5)
	lw	$8,184($sp)
	sw	$3,36($19)
	lw	$11,180($sp)
	sw	$3,0($6)
	lw	$13,176($sp)
	sw	$3,68($19)
	sw	$3,0($7)
	sw	$3,100($19)
	lw	$3,172($sp)
	addu	$2,$2,$16
	sw	$2,0($18)
	lw	$28,32($sp)
	sw	$2,0($8)
	sw	$2,0($11)
	sw	$2,36($18)
	sw	$2,0($13)
	sw	$2,68($18)
	sw	$2,0($3)
	b	$L3066
	sw	$2,100($18)

$L3108:
	addiu	$2,$21,9092
	sw	$0,9092($21)
	sw	$0,24($2)
	sw	$0,8($2)
	b	$L3110
	sw	$0,16($2)

$L3174:
	beq	$3,$0,$L3183
	li	$2,131072			# 0x20000

	li	$3,65536			# 0x10000
	addu	$3,$21,$3
	ori	$2,$2,0x21f8
	addiu	$5,$sp,44
	addiu	$6,$sp,48
	lw	$12,40($sp)
	sw	$3,420($sp)
	addu	$20,$21,$2
	addiu	$19,$21,9136
	move	$17,$0
	move	$3,$0
	sw	$5,412($sp)
	sw	$6,416($sp)
$L3058:
	sll	$2,$3,5
	sll	$3,$3,3
	addu	$3,$3,$2
	addiu	$5,$3,12
	sll	$2,$17,5
	sll	$4,$17,3
	addu	$4,$4,$2
	sll	$5,$5,2
	addiu	$2,$3,13
	addu	$13,$19,$5
	addiu	$6,$3,14
	sll	$2,$2,2
	addiu	$7,$3,15
	sll	$6,$6,2
	sw	$13,220($sp)
	addu	$13,$19,$2
	addiu	$8,$3,20
	sll	$7,$7,2
	sw	$13,216($sp)
	addu	$13,$19,$6
	addiu	$9,$3,21
	sll	$8,$8,2
	sw	$13,212($sp)
	addu	$13,$19,$7
	addiu	$10,$3,22
	addiu	$11,$3,23
	sll	$9,$9,2
	sw	$13,208($sp)
	addu	$13,$19,$8
	sll	$10,$10,2
	sll	$11,$11,2
	sll	$3,$3,2
	addiu	$4,$4,9468
	addu	$5,$20,$5
	sw	$13,204($sp)
	addu	$13,$19,$9
	sw	$13,200($sp)
	addu	$fp,$19,$11
	addu	$13,$19,$10
	addu	$23,$21,$4
	sw	$5,252($sp)
	addu	$4,$19,$3
	addu	$2,$20,$2
	addu	$6,$20,$6
	addu	$7,$20,$7
	addu	$8,$20,$8
	addu	$9,$20,$9
	addu	$10,$20,$10
	addu	$11,$20,$11
	sll	$5,$17,1
	addu	$3,$20,$3
	sw	$13,196($sp)
	sw	$4,408($sp)
	sw	$2,248($sp)
	sw	$6,244($sp)
	sw	$7,240($sp)
	sw	$8,236($sp)
	sw	$9,232($sp)
	sw	$10,228($sp)
	sw	$11,224($sp)
	move	$18,$0
	move	$22,$0
	sw	$5,356($sp)
	sw	$3,404($sp)
$L3057:
	lw	$6,356($sp)
	li	$7,4096			# 0x1000
	addu	$2,$18,$6
	sll	$2,$7,$2
	and	$2,$2,$12
	bne	$2,$0,$L3237
	lw	$8,248($sp)

	lw	$7,252($sp)
	lw	$11,244($sp)
	lw	$13,240($sp)
	lw	$2,236($sp)
	lw	$3,232($sp)
	sw	$0,0($7)
	lw	$4,228($sp)
	sw	$0,0($8)
	lw	$5,224($sp)
	sw	$0,0($11)
	lw	$6,220($sp)
	sw	$0,0($13)
	lw	$7,216($sp)
	sw	$0,0($2)
	lw	$8,212($sp)
	sw	$0,0($3)
	lw	$11,208($sp)
	lw	$13,204($sp)
	lw	$2,200($sp)
	lw	$3,196($sp)
	sw	$0,0($4)
	sw	$0,0($5)
	sw	$0,0($6)
	sw	$0,0($7)
	sw	$0,0($8)
	sw	$0,0($11)
	sw	$0,0($13)
	sw	$0,0($2)
	sw	$0,0($3)
	sw	$0,0($fp)
$L3056:
	lw	$4,252($sp)
	lw	$5,248($sp)
	lw	$6,244($sp)
	lw	$7,240($sp)
	lw	$8,236($sp)
	lw	$11,232($sp)
	addiu	$4,$4,64
	addiu	$5,$5,64
	addiu	$6,$6,64
	addiu	$7,$7,64
	addiu	$8,$8,64
	addiu	$11,$11,64
	lw	$13,228($sp)
	lw	$2,224($sp)
	lw	$3,220($sp)
	sw	$4,252($sp)
	sw	$5,248($sp)
	lw	$4,216($sp)
	lw	$5,212($sp)
	sw	$6,244($sp)
	sw	$7,240($sp)
	lw	$6,208($sp)
	lw	$7,204($sp)
	sw	$8,236($sp)
	sw	$11,232($sp)
	lw	$8,200($sp)
	lw	$11,196($sp)
	addiu	$13,$13,64
	sw	$13,228($sp)
	addiu	$2,$2,64
	addiu	$3,$3,64
	addiu	$4,$4,64
	addiu	$5,$5,64
	addiu	$6,$6,64
	addiu	$7,$7,64
	addiu	$8,$8,64
	addiu	$11,$11,64
	addiu	$18,$18,1
	li	$13,2			# 0x2
	addiu	$22,$22,64
	sw	$2,224($sp)
	sw	$3,220($sp)
	sw	$4,216($sp)
	sw	$5,212($sp)
	sw	$6,208($sp)
	sw	$7,204($sp)
	sw	$8,200($sp)
	sw	$11,196($sp)
	addiu	$fp,$fp,64
	bne	$18,$13,$L3057
	addiu	$23,$23,16

	lw	$3,420($sp)
	addiu	$17,$17,1
	lw	$2,5944($3)
	sltu	$2,$17,$2
	bne	$2,$0,$L3058
	move	$3,$17

	b	$L3246
	andi	$2,$12,0x78

$L3237:
	lb	$7,0($23)
	sll	$16,$18,3
	lw	$8,412($sp)
	lw	$11,416($sp)
	move	$5,$16
	move	$4,$21
	move	$6,$17
	sw	$8,16($sp)
	.option	pic0
	jal	pred_16x8_motion
	.option	pic2
	sw	$11,20($sp)

	move	$6,$16
	move	$4,$21
	move	$5,$17
	.option	pic0
	jal	decode_cabac_mb_mvd
	.option	pic2
	move	$7,$0

	lw	$3,44($sp)
	move	$6,$16
	move	$4,$21
	move	$5,$17
	li	$7,1			# 0x1
	.option	pic0
	jal	decode_cabac_mb_mvd
	.option	pic2
	addu	$16,$2,$3

	lw	$3,48($sp)
	lw	$4,44($sp)
	addu	$2,$2,$3
	subu	$3,$2,$3
	subu	$4,$16,$4
	lw	$13,404($sp)
	lw	$6,408($sp)
	andi	$4,$4,0xffff
	sll	$3,$3,16
	sll	$2,$2,16
	andi	$16,$16,0xffff
	addu	$3,$3,$4
	addu	$2,$2,$16
	addu	$4,$13,$22
	addu	$5,$6,$22
	sw	$3,92($4)
	sw	$3,48($4)
	sw	$3,52($4)
	sw	$3,56($4)
	sw	$3,60($4)
	sw	$3,80($4)
	sw	$3,84($4)
	sw	$3,88($4)
	sw	$2,92($5)
	sw	$2,48($5)
	sw	$2,52($5)
	sw	$2,56($5)
	sw	$2,60($5)
	sw	$2,80($5)
	sw	$2,84($5)
	sw	$2,88($5)
	lw	$28,32($sp)
	b	$L3056
	lw	$12,40($sp)

$L3220:
	ori	$6,$2,0x202a
	li	$3,59272			# 0xe788
	ori	$5,$2,0x2029
	addu	$23,$21,$3
	ori	$4,$2,0x1fd8
	ori	$3,$2,0x2028
	addiu	$8,$sp,52
	ori	$2,$2,0x202b
	addu	$5,$21,$5
	addu	$6,$21,$6
	addiu	$11,$sp,68
	sw	$8,336($sp)
	addu	$17,$21,$4
	addu	$fp,$21,$3
	sw	$5,284($sp)
	addu	$22,$21,$2
	sw	$6,288($sp)
	move	$20,$8
	move	$19,$23
	sw	$11,340($sp)
$L2977:
	move	$4,$17
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$5,$fp

	bne	$2,$0,$L3238
	lw	$28,32($sp)

$L2972:
	lui	$13,%hi(b_sub_mb_type_info)
	sll	$2,$2,2
	addiu	$13,$13,%lo(b_sub_mb_type_info)
	addu	$2,$13,$2
	lbu	$3,2($2)
	lhu	$4,0($2)
	lw	$2,340($sp)
	sw	$3,0($20)
	addiu	$20,$20,4
	sw	$4,0($19)
	bne	$2,$20,$L2977
	addiu	$19,$19,4

	li	$3,65536			# 0x10000
	addu	$16,$21,$3
	lw	$2,-6260($16)
	lw	$3,-6264($16)
	lw	$5,-6256($16)
	or	$2,$2,$3
	lw	$4,-6252($16)
	or	$2,$2,$5
	or	$2,$2,$4
	andi	$2,$2,0x100
	beq	$2,$0,$L3251
	li	$3,65536			# 0x10000

	move	$4,$21
	.option	pic0
	jal	pred_direct_motion
	.option	pic2
	addiu	$5,$sp,40

	lw	$3,5936($16)
	li	$2,-2
	sltu	$3,$3,2
	lw	$28,32($sp)
	sb	$2,9470($21)
	sb	$2,9526($21)
	sb	$2,9486($21)
	bne	$3,$0,$L2979
	sb	$2,9510($21)

	lui	$4,%hi(scan8+16)
$L3266:
	lui	$3,%hi(scan8)
	li	$2,131072			# 0x20000
	addiu	$18,$4,%lo(scan8+16)
	addiu	$3,$3,%lo(scan8)
	ori	$5,$2,0x2338
	li	$4,257
$L2980:
	lw	$2,0($23)
	andi	$2,$2,0x100
	beq	$2,$0,$L2982
	addiu	$23,$23,4

	lbu	$2,0($3)
	addu	$2,$2,$5
	addu	$2,$21,$2
	sh	$4,12($2)
	sh	$4,4($2)
$L2982:
	addiu	$3,$3,4
	bne	$18,$3,$L2980
	nop

	b	$L3251
	li	$3,65536			# 0x10000

$L3238:
	lw	$5,284($sp)
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$4,$17

	beq	$2,$0,$L3239
	lw	$5,288($sp)

	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$4,$17

	beq	$2,$0,$L2976
	li	$18,3			# 0x3

	move	$4,$17
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$5,$22

	bne	$2,$0,$L2975
	li	$18,7			# 0x7

$L2976:
	move	$4,$17
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$5,$22

	move	$4,$17
	move	$5,$22
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$16,$2

	addu	$2,$2,$18
	sll	$16,$16,1
	lw	$28,32($sp)
	b	$L2972
	addu	$2,$2,$16

$L3221:
	b	$L2989
	move	$5,$0

$L3213:
	.option	pic0
	jal	decode_cabac_mb_transform_size
	.option	pic2
	move	$4,$21

	bne	$2,$0,$L3177
	li	$2,16777216			# 0x1000000

	b	$L3090
	lw	$12,40($sp)

$L3207:
	lw	$3,6172($21)
	lw	$2,6168($21)
	lui	$6,%hi($LC49)
	lw	$4,0($21)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	sw	$3,20($sp)
	b	$L3188
	addiu	$6,$6,%lo($LC49)

$L3177:
	lw	$12,40($sp)
	or	$12,$12,$2
	b	$L3090
	sw	$12,40($sp)

$L2997:
	b	$L2996
	sw	$0,308($sp)

$L3239:
	move	$4,$17
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$5,$22

	lw	$28,32($sp)
	b	$L2972
	addiu	$2,$2,1

$L2919:
	ori	$5,$16,0x2022
	addu	$5,$21,$5
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$19

	beq	$2,$0,$L3240
	ori	$5,$16,0x2024

	ori	$5,$16,0x2023
	addu	$5,$21,$5
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	move	$4,$19

	ori	$3,$16,0x2024
	addu	$20,$21,$3
	move	$4,$19
	move	$5,$20
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	sll	$18,$2,3

	move	$4,$19
	move	$5,$20
	move	$17,$2
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	sll	$17,$17,2

	move	$4,$19
	move	$5,$20
	move	$16,$2
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	or	$18,$18,$17

	or	$18,$18,$2
	sll	$16,$16,1
	or	$3,$18,$16
	slt	$2,$3,8
	bne	$2,$0,$L3241
	lw	$28,32($sp)

	li	$2,13			# 0xd
	beq	$3,$2,$L3242
	li	$2,14			# 0xe

	beq	$3,$2,$L3243
	li	$2,15			# 0xf

	beq	$3,$2,$L2925
	move	$4,$19

	move	$5,$20
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	sll	$16,$3,1

	or	$2,$2,$16
	lw	$28,32($sp)
	b	$L2911
	addiu	$16,$2,-4

$L3232:
	lw	$2,1568($21)
	addu	$2,$2,$4
	lw	$3,0($2)
	addiu	$4,$6,1
	andi	$3,$3,0x100
	b	$L2918
	movz	$6,$4,$3

$L3206:
	lw	$3,6172($21)
	lw	$2,6168($21)
	lui	$6,%hi($LC48)
	lw	$4,0($21)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	sw	$3,20($sp)
	b	$L3188
	addiu	$6,$6,%lo($LC48)

$L3015:
	lw	$2,8768($21)
	sll	$2,$2,2
	addu	$2,$14,$2
	lw	$3,0($2)
	andi	$3,$3,0x80
	bne	$3,$0,$L3261
	lw	$8,368($sp)

	slt	$2,$9,20
	bne	$2,$0,$L3265
	addiu	$2,$18,-9

	li	$6,-2			# 0xfffffffffffffffe
	and	$2,$4,$6
	addiu	$3,$9,-12
	sra	$3,$3,3
	sll	$2,$2,1
	lw	$4,6168($21)
	addu	$2,$2,$3
	sll	$4,$4,2
	sll	$2,$2,1
	addiu	$8,$4,-1
	addiu	$7,$2,-1
	lw	$4,152($21)
	sra	$2,$7,2
	mul	$5,$2,$4
	sra	$3,$8,2
	addu	$2,$5,$3
	sll	$2,$2,2
	addu	$2,$14,$2
	lw	$2,0($2)
	lw	$6,280($sp)
	and	$3,$6,$2
	beq	$3,$0,$L3244
	andi	$2,$2,0x40

$L3017:
	lw	$2,9748($21)
	lw	$4,372($sp)
	lw	$5,376($sp)
	addu	$3,$13,$4
	mul	$4,$7,$2
	lw	$6,120($sp)
	addu	$2,$4,$8
	lw	$4,0($3)
	sll	$2,$2,2
	addu	$4,$4,$2
	lhu	$3,0($4)
	addu	$2,$13,$5
	lw	$5,9752($21)
	sh	$3,9176($6)
	lw	$6,4($2)
	sra	$2,$7,1
	lh	$3,2($4)
	mul	$4,$2,$5
	lw	$5,120($sp)
	addu	$2,$4,$6
	sra	$3,$3,1
	sra	$4,$8,1
	sh	$3,9178($5)
	addu	$2,$2,$4
	lb	$3,0($2)
	lw	$6,276($sp)
	b	$L3013
	sll	$5,$3,1

$L3240:
	move	$4,$19
	.option	pic0
	jal	get_cabac_noinline
	.option	pic2
	addu	$5,$21,$5

	lw	$28,32($sp)
	b	$L2911
	addiu	$16,$2,1

$L3210:
	lw	$2,6172($21)
	lw	$25,%call16(av_log)($28)
	lw	$4,0($21)
	lw	$7,6168($21)
	addiu	$6,$6,%lo($LC2)
	sw	$2,16($sp)
$L3186:
	jalr	$25
	move	$5,$0

	lw	$28,32($sp)
	b	$L2902
	li	$2,-1			# 0xffffffffffffffff

$L3209:
	lw	$2,6172($21)
	lw	$4,0($21)
	lw	$7,6168($21)
	lw	$25,%call16(av_log)($28)
	sw	$2,16($sp)
	b	$L3186
	addiu	$6,$6,%lo($LC1)

$L2979:
	lw	$2,5940($16)
	sltu	$2,$2,2
	beq	$2,$0,$L3266
	lui	$4,%hi(scan8+16)

	b	$L3251
	li	$3,65536			# 0x10000

$L3075:
	b	$L3074
	andi	$17,$2,0x8

$L3224:
	bne	$2,$0,$L3011
	nop

	lw	$6,276($sp)
	b	$L3013
	li	$5,-1			# 0xffffffffffffffff

$L3236:
	bne	$2,$0,$L3016
	nop

	lw	$6,276($sp)
	b	$L3013
	li	$5,-1			# 0xffffffffffffffff

$L2975:
	move	$4,$17
	.option	pic0
	jal	get_cabac
	.option	pic2
	move	$5,$22

	lw	$28,32($sp)
	b	$L2972
	addiu	$2,$2,11

$L2925:
	li	$16,22			# 0x16
	b	$L2926
	sw	$16,40($sp)

$L3243:
	li	$16,11			# 0xb
	b	$L2926
	sw	$16,40($sp)

$L3242:
	move	$4,$21
	li	$5,32			# 0x20
	.option	pic0
	jal	decode_cabac_intra_mb_type
	.option	pic2
	move	$6,$0

	lw	$28,32($sp)
	b	$L2911
	addiu	$16,$2,23

$L3241:
	b	$L2911
	addiu	$16,$3,3

$L3244:
	bne	$2,$0,$L3017
	nop

	lw	$6,276($sp)
	b	$L3013
	li	$5,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	decode_mb_cabac
	.section	.rodata.str1.4
	.align	2
$LC57:
	.ascii	"sps\000"
	.align	2
$LC58:
	.ascii	"poc_cycle_length overflow %u\012\000"
	.align	2
$LC59:
	.ascii	"illegal POC type %d\012\000"
	.align	2
$LC60:
	.ascii	"too many reference frames\012\000"
	.align	2
$LC61:
	.ascii	"mb_width/height overflow\012\000"
	.align	2
$LC62:
	.ascii	"MBAFF + !direct_8x8_inference is not implemented\012\000"
	.align	2
$LC63:
	.ascii	"insane cropping not completely supported, this could loo"
	.ascii	"k slightly wrong ...\012\000"
	.align	2
$LC64:
	.ascii	"illegal aspect ratio\012\000"
	.align	2
$LC65:
	.ascii	"illegal num_reorder_frames %d\012\000"
	.align	2
$LC66:
	.ascii	"FRM\000"
	.align	2
$LC67:
	.ascii	"PIC-AFF\000"
	.align	2
$LC68:
	.ascii	"MB-AFF\000"
	.align	2
$LC69:
	.ascii	"8B8\000"
	.align	2
$LC70:
	.ascii	"VUI\000"
	.align	2
$LC71:
	.ascii	"sps:%u profile:%d/%d poc:%d ref:%d %dx%d %s %s crop:%d/%"
	.ascii	"d/%d/%d %s\012\000"
	.text
	.align	2
	.ent	decode_seq_parameter_set
	.type	decode_seq_parameter_set, @function
decode_seq_parameter_set:
	.set	nomips16
	.frame	$sp,136,$31		# vars= 16, regs= 10/0, args= 72, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-136
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,132($sp)
	sw	$fp,128($sp)
	sw	$23,124($sp)
	sw	$22,120($sp)
	sw	$21,116($sp)
	sw	$20,112($sp)
	sw	$19,108($sp)
	sw	$18,104($sp)
	sw	$17,100($sp)
	sw	$16,96($sp)
	.cprestore	72
	lw	$16,8456($4)
	lw	$6,8448($4)
	sra	$2,$16,3
	addu	$2,$6,$2
	move	$20,$4
	lbu	$4,0($2)
	lbu	$fp,3($2)
	sw	$4,92($sp)
	lbu	$5,1($2)
	addiu	$18,$16,16
	sw	$5,88($sp)
	lbu	$2,2($2)
	addiu	$8,$16,24
	sra	$3,$18,3
	sw	$2,84($sp)
	sw	$18,8456($20)
	addu	$3,$6,$3
	sra	$2,$8,3
	addu	$6,$6,$2
	lbu	$21,3($3)
	lbu	$19,0($3)
	lbu	$22,1($3)
	lbu	$23,2($3)
	sw	$8,8456($20)
	lbu	$2,0($6)
	lbu	$3,3($6)
	lbu	$4,1($6)
	sll	$2,$2,24
	lbu	$5,2($6)
	or	$3,$3,$2
	sll	$4,$4,16
	or	$3,$3,$4
	sll	$5,$5,8
	or	$3,$3,$5
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L3395
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$6,$2
	bne	$2,$0,$L3271
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L3272:
	andi	$2,$5,0xff00
	beq	$2,$0,$L3431
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L3431:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	addiu	$2,$2,-1
	sw	$4,8456($20)
	sw	$2,80($sp)
$L3270:
	lw	$6,80($sp)
	lui	$2,%hi($LC57)
	li	$3,864			# 0x360
	addiu	$2,$2,%lo($LC57)
	move	$4,$20
	addiu	$5,$20,9788
	li	$7,32			# 0x20
	sw	$3,16($sp)
	.option	pic0
	jal	alloc_parameter_set
	.option	pic2
	sw	$2,20($sp)

	lw	$28,72($sp)
	beq	$2,$0,$L3394
	move	$17,$2

	lw	$2,92($sp)
	lw	$5,88($sp)
	sll	$4,$2,24
	sll	$3,$5,16
	lw	$5,84($sp)
	or	$4,$fp,$4
	sll	$2,$19,24
	or	$4,$4,$3
	or	$2,$21,$2
	sll	$3,$5,8
	sll	$5,$22,16
	or	$4,$4,$3
	or	$2,$2,$5
	andi	$3,$16,0x7
	sll	$5,$23,8
	sll	$4,$4,$3
	or	$2,$2,$5
	andi	$3,$18,0x7
	sll	$2,$2,$3
	srl	$4,$4,24
	srl	$2,$2,24
	slt	$3,$4,100
	sw	$2,4($17)
	beq	$3,$0,$L3396
	sw	$4,0($17)

	sw	$0,636($17)
$L3293:
	lw	$8,8456($20)
	lw	$12,8448($20)
	sra	$2,$8,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L3397
	lw	$2,%got(ff_golomb_vlc_len)($28)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$6,$2
	bne	$2,$0,$L3296
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L3297:
	andi	$2,$5,0xff00
	beq	$2,$0,$L3432
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L3432:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	sw	$4,8456($20)
	addiu	$2,$2,-1
$L3295:
	addiu	$2,$2,4
	sw	$2,12($17)
	lw	$8,8456($20)
	sra	$2,$8,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L3398
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$6,$2
	bne	$2,$0,$L3301
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L3302:
	andi	$2,$5,0xff00
	beq	$2,$0,$L3433
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L3433:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addiu	$18,$20,8448
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	addiu	$7,$2,-1
	sw	$4,8456($20)
	beq	$7,$0,$L3399
	sw	$7,16($17)

$L3304:
	li	$2,1			# 0x1
	beq	$7,$2,$L3400
	li	$2,2			# 0x2

	bne	$7,$2,$L3401
	lui	$6,%hi($LC59)

$L3310:
	lw	$8,8456($20)
$L3429:
	sra	$2,$8,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L3402
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$6,$2
	bne	$2,$0,$L3342
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L3343:
	andi	$2,$5,0xff00
	beq	$2,$0,$L3434
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L3434:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	addiu	$16,$2,-1
	sltu	$2,$16,31
	beq	$2,$0,$L3403
	sw	$4,8456($20)

$L3345:
	sw	$16,40($17)
	lw	$5,8456($20)
	sra	$2,$5,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($20)
	sw	$3,44($17)
	lw	$8,8456($20)
	sra	$2,$8,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L3404
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$6,$2
	bne	$2,$0,$L3348
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L3349:
	andi	$2,$5,0xff00
	beq	$2,$0,$L3435
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L3435:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	sw	$4,8456($20)
	addiu	$7,$2,-1
$L3347:
	lw	$8,8456($20)
	sra	$2,$8,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L3405
	addiu	$19,$7,1

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$6,$2
	bne	$2,$0,$L3353
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L3354:
	andi	$2,$5,0xff00
	beq	$2,$0,$L3436
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L3436:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	sw	$4,8456($20)
	addiu	$4,$2,-1
$L3352:
	li	$2,134152192			# 0x7ff0000
	ori	$2,$2,0xffff
	sltu	$3,$19,$2
	beq	$3,$0,$L3356
	addiu	$16,$4,1

	sltu	$2,$16,$2
	bne	$2,$0,$L3406
	lw	$25,%call16(avcodec_check_dimensions)($28)

$L3356:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($20)
	lui	$6,%hi($LC61)
	addiu	$6,$6,%lo($LC61)
	jalr	$25
	move	$5,$0

	lw	$28,72($sp)
$L3394:
	li	$2,-1			# 0xffffffffffffffff
$L3275:
	lw	$31,132($sp)
$L3438:
	lw	$fp,128($sp)
	lw	$23,124($sp)
	lw	$22,120($sp)
	lw	$21,116($sp)
	lw	$20,112($sp)
	lw	$19,108($sp)
	lw	$18,104($sp)
	lw	$17,100($sp)
	lw	$16,96($sp)
	j	$31
	addiu	$sp,$sp,136

$L3271:
	b	$L3272
	li	$7,16			# 0x10

$L3395:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lbu	$2,0($2)
	sw	$3,8456($20)
	b	$L3270
	sw	$2,80($sp)

$L3398:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lbu	$7,0($2)
	sw	$3,8456($20)
	addiu	$18,$20,8448
	bne	$7,$0,$L3304
	sw	$7,16($17)

$L3399:
	lw	$8,8456($20)
	sra	$2,$8,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L3407
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$6,$2
	bne	$2,$0,$L3307
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L3308:
	andi	$2,$5,0xff00
	beq	$2,$0,$L3437
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L3437:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	addiu	$2,$2,-1
	addiu	$2,$2,4
	sw	$4,8456($20)
	b	$L3310
	sw	$2,20($17)

$L3397:
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($20)
	b	$L3295
	lbu	$2,0($2)

$L3405:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($20)
	b	$L3352
	lbu	$4,0($2)

$L3404:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($20)
	b	$L3347
	lbu	$7,0($2)

$L3402:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lbu	$16,0($2)
	sltu	$2,$16,31
	bne	$2,$0,$L3345
	sw	$3,8456($20)

$L3403:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($20)
	lui	$6,%hi($LC60)
	addiu	$6,$6,%lo($LC60)
	jalr	$25
	move	$5,$0

	lw	$28,72($sp)
	b	$L3345
	lw	$12,8448($20)

$L3406:
	move	$4,$0
	sll	$5,$19,4
	jalr	$25
	sll	$6,$16,4

	bne	$2,$0,$L3356
	lw	$28,72($sp)

	sw	$19,48($17)
	sw	$16,52($17)
	lw	$5,8456($20)
	lw	$12,8448($20)
	sra	$2,$5,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($20)
	bne	$3,$0,$L3358
	sw	$3,56($17)

	lw	$5,8456($20)
	sra	$2,$5,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($20)
	sw	$3,60($17)
$L3359:
	lw	$5,8456($20)
	sra	$2,$5,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($20)
	bne	$3,$0,$L3360
	sw	$3,64($17)

	lw	$2,60($17)
	bne	$2,$0,$L3408
	lw	$25,%call16(av_log)($28)

$L3360:
	lw	$5,8456($20)
	sra	$2,$5,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($20)
	bne	$3,$0,$L3409
	sw	$3,68($17)

	sw	$0,84($17)
	sw	$0,80($17)
	sw	$0,76($17)
	sw	$0,72($17)
$L3363:
	lw	$5,8456($20)
	sra	$2,$5,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($20)
	beq	$3,$0,$L3364
	sw	$3,88($17)

	lw	$5,8456($20)
	sra	$2,$5,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	bne	$3,$0,$L3410
	sw	$5,8456($20)

	sw	$0,96($17)
	sw	$0,92($17)
$L3367:
	lw	$7,8456($20)
	sra	$2,$7,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$7,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	move	$2,$7
	srl	$3,$3,7
	addiu	$7,$7,1
	bne	$3,$0,$L3411
	sw	$7,8456($20)

$L3369:
	sra	$2,$7,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$7,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$7,$7,1
	srl	$3,$3,7
	bne	$3,$0,$L3412
	sw	$7,8456($20)

$L3370:
	sra	$2,$7,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$7,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$7,$7,1
	srl	$3,$3,7
	bne	$3,$0,$L3413
	sw	$7,8456($20)

$L3371:
	sra	$2,$7,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$7,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$2,$7,1
	srl	$3,$3,7
	sw	$2,8456($20)
	bne	$3,$0,$L3414
	sw	$3,100($17)

$L3372:
	lw	$7,8456($20)
	sra	$2,$7,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$7,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$7,$7,1
	srl	$19,$3,7
	bne	$19,$0,$L3415
	sw	$7,8456($20)

$L3373:
	sra	$2,$7,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$7,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$7,$7,1
	srl	$16,$3,7
	bne	$16,$0,$L3416
	sw	$7,8456($20)

	beq	$19,$0,$L3417
	nop

$L3375:
	addiu	$7,$7,1
$L3430:
	sw	$7,8456($20)
	addiu	$4,$7,1
$L3445:
	sra	$3,$4,3
	sw	$4,8456($20)
	addu	$3,$12,$3
	lbu	$2,0($3)
	andi	$4,$4,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$3,$7,2
	srl	$2,$2,7
	sw	$3,8456($20)
	bne	$2,$0,$L3418
	sw	$2,628($17)

$L3364:
	lw	$4,0($20)
	lw	$2,412($4)
	andi	$2,$2,0x1
	beq	$2,$0,$L3438
	lw	$31,132($sp)

	lw	$2,56($17)
	lw	$10,0($17)
	lw	$14,4($17)
	lw	$15,16($17)
	lw	$13,40($17)
	lw	$12,48($17)
	beq	$2,$0,$L3379
	lw	$11,52($17)

	lui	$2,%hi($LC66)
	addiu	$3,$2,%lo($LC66)
$L3380:
	lw	$2,64($17)
	bne	$2,$0,$L3382
	lui	$2,%hi($LC69)

	lui	$2,%hi($LC44)
	addiu	$8,$2,%lo($LC44)
$L3383:
	lw	$2,88($17)
	lw	$7,72($17)
	lw	$9,76($17)
	lw	$6,80($17)
	bne	$2,$0,$L3384
	lw	$5,84($17)

	lui	$2,%hi($LC44)
	addiu	$2,$2,%lo($LC44)
$L3385:
	lw	$25,%call16(av_log)($28)
	sw	$7,48($sp)
	sw	$6,56($sp)
	lw	$7,80($sp)
	lui	$6,%hi($LC71)
	sw	$5,60($sp)
	sw	$2,64($sp)
	sw	$10,16($sp)
	sw	$14,20($sp)
	sw	$15,24($sp)
	sw	$13,28($sp)
	sw	$12,32($sp)
	sw	$11,36($sp)
	sw	$3,40($sp)
	sw	$8,44($sp)
	sw	$9,52($sp)
	addiu	$6,$6,%lo($LC71)
	jalr	$25
	li	$5,2			# 0x2

	lw	$28,72($sp)
	b	$L3275
	move	$2,$0

$L3396:
	lw	$8,8456($20)
	lw	$12,8448($20)
	sra	$2,$8,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L3419
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$6,$2
	bne	$2,$0,$L3279
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L3280:
	andi	$2,$5,0xff00
	beq	$2,$0,$L3439
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L3439:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	sw	$4,8456($20)
	addiu	$3,$2,-1
$L3278:
	li	$2,3			# 0x3
	beq	$3,$2,$L3390
	nop

	lw	$7,8456($20)
$L3282:
	sra	$2,$7,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$7,0x7
	sll	$4,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$4,$2
	beq	$2,$0,$L3420
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$4,$2
	bne	$2,$0,$L3285
	nop

	move	$5,$0
$L3286:
	andi	$2,$4,0xff00
	beq	$2,$0,$L3440
	lw	$3,%got(ff_log2_tab)($28)

	srl	$4,$4,8
	addiu	$5,$5,8
$L3440:
	addiu	$2,$7,63
	addu	$3,$3,$4
	lbu	$4,0($3)
	addu	$4,$4,$5
	sll	$4,$4,1
	subu	$2,$2,$4
	sw	$2,8456($20)
$L3284:
	lw	$7,8456($20)
	sra	$2,$7,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$7,0x7
	sll	$4,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$4,$2
	beq	$2,$0,$L3421
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$4,$2
	bne	$2,$0,$L3290
	nop

	move	$5,$0
$L3291:
	andi	$2,$4,0xff00
	beq	$2,$0,$L3441
	lw	$3,%got(ff_log2_tab)($28)

	srl	$4,$4,8
	addiu	$5,$5,8
$L3441:
	addiu	$2,$7,63
	addu	$3,$3,$4
	lbu	$4,0($3)
	addu	$4,$4,$5
	sll	$4,$4,1
	subu	$2,$2,$4
	sw	$2,8456($20)
$L3289:
	lw	$5,8456($20)
	addiu	$8,$17,640
	sra	$2,$5,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($20)
	addiu	$2,$17,736
	sw	$3,8($17)
	move	$4,$20
	move	$5,$17
	move	$6,$0
	li	$7,1			# 0x1
	sw	$8,16($sp)
	.option	pic0
	jal	decode_scaling_matrices
	.option	pic2
	sw	$2,20($sp)

	b	$L3293
	lw	$28,72($sp)

$L3301:
	b	$L3302
	li	$7,16			# 0x10

$L3296:
	b	$L3297
	li	$7,16			# 0x10

$L3342:
	b	$L3343
	li	$7,16			# 0x10

$L3353:
	b	$L3354
	li	$7,16			# 0x10

$L3348:
	b	$L3349
	li	$7,16			# 0x10

$L3407:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lbu	$2,0($2)
	sw	$3,8456($20)
	addiu	$2,$2,4
	b	$L3310
	sw	$2,20($17)

$L3419:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($20)
	b	$L3278
	lbu	$3,0($2)

$L3421:
	lw	$3,%got(ff_golomb_vlc_len)($28)
	srl	$2,$4,23
	addu	$3,$3,$2
	lbu	$4,0($3)
	addu	$4,$4,$7
	b	$L3289
	sw	$4,8456($20)

$L3420:
	lw	$3,%got(ff_golomb_vlc_len)($28)
	srl	$2,$4,23
	addu	$3,$3,$2
	lbu	$4,0($3)
	addu	$4,$4,$7
	b	$L3284
	sw	$4,8456($20)

$L3400:
	lw	$5,8456($20)
	sra	$2,$5,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($20)
	sw	$3,24($17)
	lw	$7,8456($20)
	sra	$2,$7,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$7,0x7
	sll	$5,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$5,$2
	beq	$2,$0,$L3422
	lw	$2,%got(ff_golomb_vlc_len)($28)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$5,$2
	bne	$2,$0,$L3314
	srl	$6,$5,16

	move	$6,$5
	move	$8,$0
$L3315:
	andi	$2,$6,0xff00
	beq	$2,$0,$L3442
	lw	$3,%got(ff_log2_tab)($28)

	srl	$6,$6,8
	addiu	$8,$8,8
$L3442:
	addiu	$4,$7,32
	addu	$3,$3,$6
	lbu	$2,0($3)
	addu	$2,$2,$8
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$5,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L3317
	sw	$4,8456($20)

	srl	$2,$5,1
	subu	$2,$0,$2
$L3313:
	sw	$2,28($17)
	lw	$8,8456($20)
	sra	$2,$8,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$5,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$5,$2
	beq	$2,$0,$L3423
	lw	$2,%got(ff_golomb_vlc_len)($28)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$5,$2
	bne	$2,$0,$L3321
	srl	$6,$5,16

	move	$6,$5
	move	$7,$0
$L3322:
	andi	$2,$6,0xff00
	beq	$2,$0,$L3443
	lw	$3,%got(ff_log2_tab)($28)

	srl	$6,$6,8
	addiu	$7,$7,8
$L3443:
	addiu	$4,$8,32
	addu	$3,$3,$6
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$5,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L3324
	sw	$4,8456($20)

	srl	$2,$5,1
	subu	$2,$0,$2
$L3320:
	sw	$2,32($17)
	lw	$8,8456($20)
	sra	$2,$8,3
	addu	$2,$12,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$5,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$5,$2
	beq	$2,$0,$L3424
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$5,$2
	bne	$2,$0,$L3328
	srl	$6,$5,16

	move	$6,$5
	move	$7,$0
$L3329:
	andi	$2,$6,0xff00
	beq	$2,$0,$L3444
	lw	$3,%got(ff_log2_tab)($28)

	srl	$6,$6,8
	addiu	$7,$7,8
$L3444:
	addiu	$4,$8,32
	addu	$3,$3,$6
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$5,$2
	sw	$4,8456($20)
	addiu	$7,$2,-1
$L3327:
	sltu	$2,$7,256
	beq	$2,$0,$L3425
	lui	$6,%hi($LC58)

	blez	$7,$L3310
	sw	$7,36($17)

	lw	$10,8448($20)
	lw	$14,%got(ff_log2_tab)($28)
	lw	$15,%got(ff_golomb_vlc_len)($28)
	lw	$16,%got(ff_se_golomb_vlc_code)($28)
	move	$9,$17
	move	$8,$0
	li	$11,134217728			# 0x8000000
	li	$13,-65536			# 0xffffffffffff0000
$L3339:
	lw	$7,8($18)
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$5,$2,$3
	sltu	$4,$5,$11
	beq	$4,$0,$L3426
	and	$2,$5,$13

	bne	$2,$0,$L3334
	srl	$3,$5,16

	move	$3,$5
	move	$6,$0
$L3335:
	andi	$2,$3,0xff00
	beq	$2,$0,$L3336
	nop

	srl	$3,$3,8
	addiu	$6,$6,8
$L3336:
	addu	$3,$14,$3
	lbu	$2,0($3)
	addiu	$4,$7,32
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$5,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L3337
	sw	$4,8($18)

	srl	$2,$5,1
	subu	$2,$0,$2
$L3338:
	move	$3,$2
$L3333:
	lw	$2,36($17)
	addiu	$8,$8,1
	slt	$2,$8,$2
	sh	$3,116($9)
	bne	$2,$0,$L3339
	addiu	$9,$9,2

	b	$L3429
	lw	$8,8456($20)

$L3390:
	lw	$7,8456($20)
	addiu	$7,$7,1
	b	$L3282
	sw	$7,8456($20)

$L3358:
	b	$L3359
	sw	$0,60($17)

$L3307:
	b	$L3308
	li	$7,16			# 0x10

$L3279:
	b	$L3280
	li	$7,16			# 0x10

$L3290:
	srl	$4,$4,16
	b	$L3291
	li	$5,16			# 0x10

$L3285:
	srl	$4,$4,16
	b	$L3286
	li	$5,16			# 0x10

$L3379:
	lw	$2,60($17)
	bne	$2,$0,$L3381
	lui	$2,%hi($LC68)

	lui	$2,%hi($LC67)
	b	$L3380
	addiu	$3,$2,%lo($LC67)

$L3411:
	addiu	$2,$2,2
	sw	$2,8456($20)
	b	$L3369
	move	$7,$2

$L3417:
	beq	$16,$0,$L3445
	addiu	$4,$7,1

	b	$L3430
	addiu	$7,$7,1

$L3314:
	b	$L3315
	li	$8,16			# 0x10

$L3416:
	move	$4,$20
	.option	pic0
	jal	decode_hrd_parameters
	.option	pic2
	move	$5,$17

	lw	$28,72($sp)
	lw	$7,8456($20)
	bne	$19,$0,$L3375
	lw	$12,8448($20)

	b	$L3417
	nop

$L3426:
	srl	$4,$5,23
	addu	$3,$15,$4
	lbu	$2,0($3)
	addu	$4,$16,$4
	addu	$2,$2,$7
	sw	$2,8($18)
	b	$L3333
	lb	$3,0($4)

$L3334:
	b	$L3335
	li	$6,16			# 0x10

$L3337:
	b	$L3338
	srl	$2,$5,1

$L3409:
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	move	$4,$18
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	sw	$2,72($17)

	move	$4,$18
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	sw	$2,76($17)

	sw	$2,80($17)
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	lw	$3,72($17)
	lw	$28,72($sp)
	bne	$3,$0,$L3362
	sw	$2,84($17)

	lw	$2,80($17)
	beq	$2,$0,$L3391
	nop

$L3362:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($20)
	lui	$6,%hi($LC63)
	addiu	$6,$6,%lo($LC63)
	jalr	$25
	move	$5,$0

	lw	$28,72($sp)
$L3391:
	b	$L3363
	lw	$12,8448($20)

$L3422:
	srl	$4,$5,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_se_golomb_vlc_code)($28)
	addu	$3,$3,$7
	addu	$2,$2,$4
	sw	$3,8456($20)
	b	$L3313
	lb	$2,0($2)

$L3424:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$5,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($20)
	b	$L3327
	lbu	$7,0($2)

$L3423:
	srl	$4,$5,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_se_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($20)
	b	$L3320
	lb	$2,0($2)

$L3384:
	lui	$2,%hi($LC70)
	b	$L3385
	addiu	$2,$2,%lo($LC70)

$L3382:
	b	$L3383
	addiu	$8,$2,%lo($LC69)

$L3328:
	b	$L3329
	li	$7,16			# 0x10

$L3324:
	b	$L3320
	srl	$2,$5,1

$L3321:
	b	$L3322
	li	$7,16			# 0x10

$L3317:
	b	$L3313
	srl	$2,$5,1

$L3410:
	move	$4,$18
	.option	pic0
	jal	get_bits
	.option	pic2
	li	$5,8			# 0x8

	move	$3,$2
	li	$2,255			# 0xff
	beq	$3,$2,$L3427
	lw	$28,72($sp)

	sltu	$2,$3,14
	beq	$2,$0,$L3368
	lui	$2,%hi(pixel_aspect)

	addiu	$2,$2,%lo(pixel_aspect)
	sll	$3,$3,3
	addu	$3,$3,$2
	lw	$4,4($3)
	lw	$2,0($3)
	sw	$4,96($17)
	sw	$2,92($17)
	b	$L3367
	lw	$12,8448($20)

$L3408:
	lw	$4,0($20)
	lui	$6,%hi($LC62)
	addiu	$6,$6,%lo($LC62)
	jalr	$25
	move	$5,$0

	lw	$28,72($sp)
	b	$L3360
	lw	$12,8448($20)

$L3418:
	lw	$2,8456($20)
	move	$4,$18
	addiu	$2,$2,1
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	sw	$2,8456($20)

	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	move	$16,$2
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	sltu	$2,$16,17
	beq	$2,$0,$L3428
	lw	$28,72($sp)

	b	$L3364
	sw	$16,632($17)

$L3415:
	move	$4,$20
	.option	pic0
	jal	decode_hrd_parameters
	.option	pic2
	move	$5,$17

	lw	$28,72($sp)
	lw	$7,8456($20)
	b	$L3373
	lw	$12,8448($20)

$L3413:
	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	.option	pic0
	jal	get_ue_golomb
	.option	pic2
	move	$4,$18

	lw	$28,72($sp)
	lw	$7,8456($20)
	b	$L3371
	lw	$12,8448($20)

$L3412:
	move	$4,$18
	.option	pic0
	jal	get_bits
	.option	pic2
	li	$5,3			# 0x3

	lw	$7,8456($20)
	lw	$12,8448($20)
	addiu	$4,$7,1
	sra	$3,$4,3
	sw	$4,8456($20)
	addu	$3,$12,$3
	lbu	$2,0($3)
	andi	$4,$4,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$7,$7,2
	srl	$2,$2,7
	lw	$28,72($sp)
	beq	$2,$0,$L3370
	sw	$7,8456($20)

	move	$4,$18
	.option	pic0
	jal	get_bits
	.option	pic2
	li	$5,8			# 0x8

	move	$4,$18
	.option	pic0
	jal	get_bits
	.option	pic2
	li	$5,8			# 0x8

	move	$4,$18
	.option	pic0
	jal	get_bits
	.option	pic2
	li	$5,8			# 0x8

	lw	$28,72($sp)
	lw	$7,8456($20)
	b	$L3370
	lw	$12,8448($20)

$L3414:
	move	$4,$18
	.option	pic0
	jal	get_bits_long
	.option	pic2
	li	$5,32			# 0x20

	move	$4,$18
	li	$5,32			# 0x20
	.option	pic0
	jal	get_bits_long
	.option	pic2
	sw	$2,104($17)

	sw	$2,108($17)
	lw	$5,8456($20)
	lw	$12,8448($20)
	sra	$2,$5,3
	addu	$2,$12,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($20)
	lw	$28,72($sp)
	b	$L3372
	sw	$3,112($17)

$L3381:
	b	$L3380
	addiu	$3,$2,%lo($LC68)

$L3401:
	lw	$4,0($20)
	lw	$25,%call16(av_log)($28)
	addiu	$6,$6,%lo($LC59)
$L3393:
	jalr	$25
	move	$5,$0

	b	$L3394
	lw	$28,72($sp)

$L3428:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($20)
	lui	$6,%hi($LC65)
	addiu	$6,$6,%lo($LC65)
	move	$7,$16
	jalr	$25
	move	$5,$0

	b	$L3364
	lw	$28,72($sp)

$L3368:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($20)
	lui	$6,%hi($LC64)
	addiu	$6,$6,%lo($LC64)
	jalr	$25
	move	$5,$0

	b	$L3364
	lw	$28,72($sp)

$L3427:
	move	$4,$18
	.option	pic0
	jal	get_bits
	.option	pic2
	li	$5,16			# 0x10

	sw	$2,92($17)
	move	$4,$18
	.option	pic0
	jal	get_bits
	.option	pic2
	li	$5,16			# 0x10

	lw	$28,72($sp)
	sw	$2,96($17)
	b	$L3367
	lw	$12,8448($20)

$L3425:
	lw	$4,0($20)
	lw	$25,%call16(av_log)($28)
	b	$L3393
	addiu	$6,$6,%lo($LC58)

	.set	macro
	.set	reorder
	.end	decode_seq_parameter_set
	.align	2
	.ent	mc_part
	.type	mc_part, @function
mc_part:
	.set	nomips16
	.frame	$sp,272,$31		# vars= 168, regs= 10/0, args= 56, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-272
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,268($sp)
	sw	$fp,264($sp)
	sw	$23,260($sp)
	sw	$22,256($sp)
	sw	$21,252($sp)
	sw	$20,248($sp)
	sw	$19,244($sp)
	sw	$18,240($sp)
	sw	$17,236($sp)
	sw	$16,232($sp)
	.cprestore	56
	li	$2,65536			# 0x10000
	addu	$2,$4,$2
	lw	$3,-6196($2)
	lw	$2,288($sp)
	move	$19,$4
	sw	$5,180($sp)
	sw	$6,184($sp)
	lw	$4,316($sp)
	lw	$6,324($sp)
	lw	$5,320($sp)
	sw	$2,192($sp)
	li	$2,2			# 0x2
	sw	$7,188($sp)
	sw	$6,204($sp)
	lw	$12,292($sp)
	lw	$14,296($sp)
	lw	$13,300($sp)
	lw	$7,304($sp)
	lw	$8,308($sp)
	lw	$fp,312($sp)
	sw	$4,196($sp)
	sw	$5,200($sp)
	lw	$6,328($sp)
	lw	$9,332($sp)
	lw	$10,336($sp)
	beq	$3,$2,$L3493
	lw	$21,340($sp)

	li	$2,1			# 0x1
	beq	$3,$2,$L3494
	lui	$2,%hi(scan8)

	li	$11,65536			# 0x10000
$L3512:
	lw	$9,9756($19)
$L3516:
	addu	$2,$19,$11
	lw	$3,-6268($2)
	sll	$2,$9,1
	mul	$15,$2,$8
	lw	$6,9760($19)
	sltu	$18,$0,$3
	sll	$3,$7,1
	addu	$2,$15,$3
	mul	$3,$8,$6
	lw	$5,6172($19)
	lw	$4,6168($19)
	sra	$5,$5,$18
	addu	$6,$3,$7
	sll	$4,$4,3
	sll	$5,$5,3
	addu	$2,$12,$2
	addu	$13,$13,$6
	addu	$4,$7,$4
	addu	$5,$8,$5
	addu	$14,$14,$6
	sw	$2,116($sp)
	sw	$13,124($sp)
	sw	$4,128($sp)
	sw	$5,132($sp)
	bne	$10,$0,$L3495
	sw	$14,120($sp)

	bne	$21,$0,$L3496
	lw	$4,180($sp)

$L3490:
	lw	$31,268($sp)
	lw	$fp,264($sp)
	lw	$23,260($sp)
	lw	$22,256($sp)
	lw	$21,252($sp)
	lw	$20,248($sp)
	lw	$19,244($sp)
	lw	$18,240($sp)
	lw	$17,236($sp)
	lw	$16,232($sp)
	j	$31
	addiu	$sp,$sp,272

$L3494:
	lw	$17,180($sp)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$17,$2
	lbu	$2,0($2)
	sw	$2,76($sp)
$L3449:
	lw	$11,9756($19)
	li	$25,65536			# 0x10000
	sll	$2,$11,1
	addu	$23,$19,$25
	mul	$17,$2,$8
	lw	$3,-6268($23)
	lw	$15,9760($19)
	sltu	$16,$0,$3
	sll	$3,$7,1
	addu	$2,$17,$3
	mul	$17,$8,$15
	lw	$5,6172($19)
	addu	$2,$12,$2
	lw	$4,6168($19)
	addu	$3,$17,$7
	lw	$25,12($6)
	sra	$5,$5,$16
	sw	$2,152($sp)
	lw	$6,0($6)
	lw	$2,12($9)
	lw	$9,0($9)
	sll	$4,$4,3
	sll	$5,$5,3
	addu	$13,$13,$3
	addu	$14,$14,$3
	sw	$13,160($sp)
	addu	$17,$7,$4
	addu	$22,$8,$5
	sw	$25,172($sp)
	sw	$2,164($sp)
	sw	$14,156($sp)
	sw	$6,176($sp)
	beq	$10,$0,$L3450
	sw	$9,168($sp)

	bne	$21,$0,$L3497
	li	$5,65536			# 0x10000

$L3450:
	sltu	$21,$0,$21
	sll	$2,$21,3
	sll	$3,$21,5
	addu	$5,$2,$3
	lw	$4,76($sp)
	sw	$2,216($sp)
	addu	$2,$19,$5
	sw	$3,220($sp)
	addu	$2,$2,$4
	lb	$2,9456($2)
	sll	$4,$21,7
	sll	$6,$2,3
	sll	$3,$2,5
	sw	$2,144($sp)
	sll	$2,$21,10
	subu	$3,$3,$6
	addu	$4,$4,$2
	sll	$6,$3,4
	sll	$2,$4,4
	addu	$4,$4,$2
	addu	$3,$3,$6
	li	$2,65536			# 0x10000
	lw	$6,76($sp)
	ori	$2,$2,0x7e40
	addu	$3,$3,$4
	addu	$5,$5,$6
	addu	$2,$19,$2
	addu	$3,$2,$3
	addiu	$4,$5,2284
	sll	$4,$4,2
	sll	$5,$5,2
	lw	$10,0($3)
	addu	$4,$19,$4
	addu	$5,$19,$5
	sw	$3,148($sp)
	lh	$5,9138($5)
	lh	$3,0($4)
	lw	$7,9764($19)
	lw	$9,9768($19)
	lw	$12,144($19)
	beq	$10,$0,$L3452
	lw	$4,148($19)

	sll	$2,$17,3
	addu	$20,$2,$3
	sll	$3,$22,3
	addu	$18,$3,$5
	andi	$13,$20,0x7
	addiu	$2,$7,-3
	sra	$6,$18,2
	movn	$7,$2,$13
	mul	$2,$6,$11
	sra	$8,$20,2
	subu	$3,$0,$7
	sll	$4,$4,4
	addu	$5,$2,$8
	sw	$13,108($sp)
	addiu	$2,$9,-3
	andi	$13,$18,0x7
	sra	$4,$4,$16
	sll	$12,$12,4
	slt	$3,$8,$3
	sw	$13,72($sp)
	movn	$9,$2,$13
	addu	$17,$10,$5
	sw	$4,100($sp)
	bne	$3,$0,$L3455
	sw	$12,104($sp)

	subu	$2,$0,$9
	slt	$2,$6,$2
	bne	$2,$0,$L3455
	addu	$3,$7,$12

	addiu	$2,$8,15
	slt	$2,$2,$3
	bne	$2,$0,$L3498
	addu	$3,$9,$4

$L3455:
	addiu	$5,$11,1
$L3513:
	sll	$5,$5,1
	subu	$5,$17,$5
	lw	$15,104($sp)
	lw	$17,100($sp)
	lw	$4,2040($19)
	addiu	$3,$8,-2
	li	$2,21			# 0x15
	addiu	$6,$6,-2
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sw	$2,16($sp)
	sw	$3,20($sp)
	sw	$6,24($sp)
	sw	$17,32($sp)
	move	$6,$11
	sw	$15,28($sp)
	jalr	$25
	li	$7,21			# 0x15

	lw	$11,9756($19)
	lw	$3,2040($19)
	addiu	$2,$11,1
	sll	$2,$2,1
	addu	$17,$3,$2
	li	$23,1			# 0x1
$L3456:
	andi	$2,$18,0x3
	andi	$3,$20,0x3
	sll	$2,$2,2
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$16,$fp,$2
	lw	$25,0($16)
	lw	$4,152($sp)
	move	$6,$11
	jalr	$25
	move	$5,$17

	lw	$25,184($sp)
	beq	$25,$0,$L3499
	lw	$28,56($sp)

$L3457:
	lw	$2,56($19)
	andi	$2,$2,0x2000
	bne	$2,$0,$L3491
	li	$2,65536			# 0x10000

	addu	$2,$19,$2
	lw	$3,-6268($2)
	bne	$3,$0,$L3459
	lw	$4,216($sp)

	sra	$22,$18,3
$L3460:
	lw	$6,9760($19)
	lw	$13,148($sp)
	mul	$4,$22,$6
	sra	$20,$20,3
	addu	$3,$4,$20
	lw	$2,8($13)
	lw	$4,4($13)
	addu	$fp,$2,$3
	bne	$23,$0,$L3500
	addu	$5,$4,$3

	lw	$2,108($sp)
	lw	$3,72($sp)
	lw	$4,156($sp)
	lw	$7,188($sp)
	lw	$25,196($sp)
	sw	$2,16($sp)
	jalr	$25
	sw	$3,20($sp)

$L3487:
	lw	$2,108($sp)
	lw	$3,72($sp)
	lw	$6,9760($19)
	lw	$7,188($sp)
	lw	$4,160($sp)
	lw	$25,196($sp)
	sw	$2,16($sp)
	sw	$3,20($sp)
	jalr	$25
	move	$5,$fp

$L3491:
	lw	$11,9756($19)
$L3452:
	sll	$3,$21,4
	sll	$2,$21,6
	subu	$2,$2,$3
	lw	$3,144($sp)
	li	$18,65536			# 0x10000
	addu	$17,$2,$3
	addiu	$2,$17,14934
	sll	$2,$2,2
	addu	$2,$19,$2
	addiu	$3,$17,14838
	lw	$4,4($2)
	sll	$3,$3,2
	addu	$3,$19,$3
	addu	$16,$19,$18
	lw	$7,4($3)
	lw	$6,-6188($16)
	lw	$25,176($sp)
	sw	$4,16($sp)
	lw	$4,152($sp)
	jalr	$25
	move	$5,$11

	lw	$2,-6192($16)
	beq	$2,$0,$L3490
	lw	$28,56($sp)

	addiu	$3,$17,7611
	sll	$3,$3,3
	addu	$3,$19,$3
	addiu	$2,$17,7515
	lw	$4,4($3)
	sll	$2,$2,3
	addu	$2,$19,$2
	lw	$7,4($2)
	lw	$5,9760($19)
	lw	$6,-6184($16)
	lw	$25,172($sp)
	sw	$4,16($sp)
	jalr	$25
	lw	$4,156($sp)

	sll	$2,$17,3
	addu	$2,$19,$2
	addu	$2,$18,$2
	lw	$3,-4640($2)
	lw	$6,-6184($16)
	lw	$5,9760($19)
	lw	$28,56($sp)
	lw	$7,-5408($2)
	lw	$4,160($sp)
	lw	$25,172($sp)
	sw	$3,288($sp)
	lw	$31,268($sp)
	lw	$fp,264($sp)
	lw	$23,260($sp)
	lw	$22,256($sp)
	lw	$21,252($sp)
	lw	$20,248($sp)
	lw	$19,244($sp)
	lw	$18,240($sp)
	lw	$17,236($sp)
	lw	$16,232($sp)
	jr	$25
	addiu	$sp,$sp,272

$L3496:
$L3511:
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$4,$2
	lbu	$5,0($2)
	li	$7,65536			# 0x10000
	addu	$23,$19,$5
	lb	$3,9496($23)
	ori	$6,$7,0x7e40
	sll	$2,$3,5
	sll	$3,$3,3
	subu	$2,$2,$3
	sll	$4,$2,4
	addu	$2,$2,$4
	addu	$6,$19,$6
	addiu	$2,$2,19584
	addiu	$3,$5,2324
	addu	$18,$6,$2
	sll	$3,$3,2
	sll	$5,$5,2
	lw	$13,0($18)
	addu	$7,$19,$7
	addu	$3,$19,$3
	addu	$5,$19,$5
	lw	$4,-6268($7)
	lh	$3,0($3)
	lh	$5,9298($5)
	lw	$11,9756($19)
	lw	$7,9764($19)
	lw	$8,9768($19)
	lw	$14,144($19)
	beq	$13,$0,$L3490
	lw	$12,148($19)

	lw	$6,128($sp)
	lw	$15,132($sp)
	sll	$2,$6,3
	addu	$21,$2,$3
	sll	$3,$15,3
	addu	$20,$3,$5
	andi	$17,$21,0x7
	addiu	$2,$7,-3
	sra	$10,$20,2
	movn	$7,$2,$17
	mul	$2,$10,$11
	sra	$9,$21,2
	sll	$5,$12,4
	subu	$3,$0,$7
	sltu	$4,$0,$4
	addu	$6,$2,$9
	andi	$12,$20,0x7
	addiu	$2,$8,-3
	sra	$4,$5,$4
	sll	$14,$14,4
	slt	$3,$9,$3
	sw	$17,88($sp)
	sw	$12,68($sp)
	movn	$8,$2,$12
	addu	$17,$13,$6
	sw	$4,80($sp)
	bne	$3,$0,$L3479
	sw	$14,84($sp)

	subu	$2,$0,$8
	slt	$2,$10,$2
	bne	$2,$0,$L3479
	addu	$3,$7,$14

	addiu	$2,$9,15
	slt	$2,$2,$3
	bne	$2,$0,$L3501
	addu	$3,$8,$4

$L3479:
	addiu	$5,$11,1
$L3514:
	lw	$13,84($sp)
	lw	$15,80($sp)
	lw	$4,2040($19)
	addiu	$3,$9,-2
	addiu	$6,$10,-2
	li	$2,21			# 0x15
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sll	$5,$5,1
	subu	$5,$17,$5
	sw	$2,16($sp)
	sw	$3,20($sp)
	sw	$6,24($sp)
	sw	$13,28($sp)
	move	$6,$11
	sw	$15,32($sp)
	jalr	$25
	li	$7,21			# 0x15

	lw	$11,9756($19)
	lw	$3,2040($19)
	addiu	$2,$11,1
	sll	$2,$2,1
	addu	$17,$3,$2
	li	$22,1			# 0x1
$L3480:
	andi	$2,$20,0x3
	andi	$3,$21,0x3
	sll	$2,$2,2
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$16,$fp,$2
	lw	$25,0($16)
	lw	$4,116($sp)
	move	$6,$11
	jalr	$25
	move	$5,$17

	lw	$25,184($sp)
	beq	$25,$0,$L3502
	lw	$28,56($sp)

$L3481:
	lw	$2,56($19)
	andi	$2,$2,0x2000
	bne	$2,$0,$L3490
	li	$2,65536			# 0x10000

	addu	$2,$19,$2
	lw	$3,-6268($2)
	bne	$3,$0,$L3482
	nop

	sra	$23,$20,3
$L3483:
	lw	$6,9760($19)
	sra	$20,$21,3
	mul	$4,$23,$6
	lw	$2,8($18)
	addu	$3,$4,$20
	lw	$4,4($18)
	addu	$21,$2,$3
	bne	$22,$0,$L3503
	addu	$5,$4,$3

	lw	$2,88($sp)
	lw	$3,68($sp)
	lw	$4,120($sp)
	lw	$7,188($sp)
	lw	$25,196($sp)
	sw	$2,16($sp)
	jalr	$25
	sw	$3,20($sp)

	lw	$28,56($sp)
$L3489:
	lw	$2,88($sp)
	lw	$3,68($sp)
	lw	$6,9760($19)
	lw	$4,124($sp)
	lw	$7,188($sp)
	lw	$25,196($sp)
	sw	$2,288($sp)
	sw	$3,292($sp)
	move	$5,$21
	lw	$31,268($sp)
	lw	$fp,264($sp)
	lw	$23,260($sp)
	lw	$22,256($sp)
	lw	$21,252($sp)
	lw	$20,248($sp)
	lw	$19,244($sp)
	lw	$18,240($sp)
	lw	$17,236($sp)
	lw	$16,232($sp)
	jr	$25
	addiu	$sp,$sp,272

$L3495:
	lw	$4,180($sp)
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$4,$2
	lbu	$5,0($2)
	ori	$6,$11,0x7e40
	addu	$12,$19,$5
	sw	$12,224($sp)
	lb	$3,9456($12)
	addu	$6,$19,$6
	sll	$2,$3,5
	sll	$3,$3,3
	subu	$2,$2,$3
	sll	$4,$2,4
	addu	$2,$2,$4
	addu	$2,$6,$2
	addiu	$3,$5,2284
	sll	$3,$3,2
	sll	$5,$5,2
	lw	$11,0($2)
	addu	$3,$19,$3
	addu	$5,$19,$5
	sw	$2,112($sp)
	lh	$3,0($3)
	lh	$5,9138($5)
	lw	$7,9764($19)
	lw	$10,9768($19)
	lw	$12,144($19)
	beq	$11,$0,$L3466
	lw	$4,148($19)

	lw	$13,128($sp)
	lw	$15,132($sp)
	sll	$2,$13,3
	addu	$22,$2,$3
	sll	$3,$15,3
	addu	$20,$3,$5
	andi	$17,$22,0x7
	addiu	$2,$7,-3
	sra	$6,$20,2
	movn	$7,$2,$17
	mul	$2,$6,$9
	sra	$8,$22,2
	subu	$3,$0,$7
	sll	$4,$4,4
	addu	$5,$2,$8
	andi	$13,$20,0x7
	sra	$4,$4,$18
	addiu	$2,$10,-3
	slt	$3,$8,$3
	sw	$17,96($sp)
	sw	$13,64($sp)
	movn	$10,$2,$13
	addu	$17,$11,$5
	sw	$4,92($sp)
	bne	$3,$0,$L3469
	sll	$18,$12,4

	subu	$2,$0,$10
	slt	$2,$6,$2
	bne	$2,$0,$L3469
	addu	$3,$7,$18

	addiu	$2,$8,15
	slt	$2,$2,$3
	bne	$2,$0,$L3504
	addu	$3,$10,$4

$L3469:
	addiu	$5,$9,1
$L3515:
	lw	$15,92($sp)
	lw	$4,2040($19)
	addiu	$3,$8,-2
	li	$2,21			# 0x15
	addiu	$6,$6,-2
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sll	$5,$5,1
	subu	$5,$17,$5
	sw	$2,16($sp)
	sw	$3,20($sp)
	sw	$6,24($sp)
	sw	$18,28($sp)
	move	$6,$9
	sw	$15,32($sp)
	jalr	$25
	li	$7,21			# 0x15

	lw	$9,9756($19)
	lw	$3,2040($19)
	addiu	$2,$9,1
	sll	$2,$2,1
	addu	$17,$3,$2
	li	$23,1			# 0x1
$L3470:
	andi	$2,$20,0x3
	andi	$3,$22,0x3
	sll	$2,$2,2
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$16,$fp,$2
	lw	$25,0($16)
	lw	$4,116($sp)
	move	$6,$9
	jalr	$25
	move	$5,$17

	lw	$25,184($sp)
	beq	$25,$0,$L3505
	lw	$28,56($sp)

$L3471:
	lw	$2,56($19)
	andi	$2,$2,0x2000
	bne	$2,$0,$L3466
	li	$2,65536			# 0x10000

	addu	$2,$19,$2
	lw	$3,-6268($2)
	bne	$3,$0,$L3472
	lw	$4,224($sp)

	sra	$fp,$20,3
$L3473:
	lw	$6,9760($19)
	lw	$12,112($sp)
	mul	$4,$fp,$6
	sra	$20,$22,3
	addu	$3,$4,$20
	lw	$2,8($12)
	lw	$4,4($12)
	addu	$22,$2,$3
	bne	$23,$0,$L3506
	addu	$5,$4,$3

	lw	$2,96($sp)
	lw	$3,64($sp)
	lw	$4,120($sp)
	lw	$7,188($sp)
	lw	$25,196($sp)
	sw	$2,16($sp)
	jalr	$25
	sw	$3,20($sp)

$L3488:
	lw	$2,96($sp)
	lw	$3,64($sp)
	lw	$6,9760($19)
	lw	$4,124($sp)
	lw	$7,188($sp)
	lw	$25,196($sp)
	sw	$2,16($sp)
	sw	$3,20($sp)
	jalr	$25
	move	$5,$22

	lw	$2,204($sp)
	lw	$28,56($sp)
	sw	$2,196($sp)
	beq	$21,$0,$L3490
	lw	$fp,200($sp)

	b	$L3511
	lw	$4,180($sp)

$L3493:
	beq	$10,$0,$L3512
	li	$11,65536			# 0x10000

	beq	$21,$0,$L3512
	lui	$2,%hi(scan8)

	lw	$15,180($sp)
	addiu	$2,$2,%lo(scan8)
	addu	$2,$15,$2
	lbu	$2,0($2)
	addu	$4,$19,$2
	sw	$2,76($sp)
	lb	$3,9456($4)
	lb	$5,9496($4)
	sll	$2,$3,6
	sll	$3,$3,4
	subu	$2,$2,$3
	addu	$2,$2,$5
	addiu	$2,$2,15414
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$4,4($2)
	li	$3,32			# 0x20
	bne	$4,$3,$L3449
	nop

	b	$L3516
	lw	$9,9756($19)

$L3497:
	lw	$4,76($sp)
	addu	$3,$19,$4
	lb	$18,9456($3)
	ori	$16,$5,0x7e40
	sll	$6,$18,3
	sll	$5,$18,5
	subu	$5,$5,$6
	lw	$21,2048($19)
	sll	$2,$5,4
	addu	$5,$5,$2
	sll	$2,$15,3
	sw	$6,208($sp)
	addu	$2,$21,$2
	lb	$20,9496($3)
	lw	$12,188($sp)
	lw	$3,196($sp)
	lw	$13,192($sp)
	lw	$15,152($sp)
	addu	$16,$19,$16
	lw	$6,180($sp)
	lw	$7,184($sp)
	sw	$2,140($sp)
	lw	$2,160($sp)
	addu	$5,$16,$5
	move	$4,$19
	sw	$3,52($sp)
	sw	$12,16($sp)
	sw	$13,20($sp)
	sw	$15,28($sp)
	sw	$14,32($sp)
	sw	$2,36($sp)
	sw	$17,40($sp)
	sw	$0,24($sp)
	sw	$22,44($sp)
	.option	pic0
	jal	mc_dir_part
	.option	pic2
	sw	$fp,48($sp)

	sll	$4,$20,3
	sll	$5,$20,5
	subu	$5,$5,$4
	sll	$2,$5,4
	addu	$5,$5,$2
	lw	$13,188($sp)
	lw	$15,192($sp)
	sw	$17,40($sp)
	lw	$25,140($sp)
	lw	$17,196($sp)
	addiu	$5,$5,19584
	lw	$6,180($sp)
	lw	$7,184($sp)
	addiu	$12,$21,8
	li	$2,1			# 0x1
	sw	$4,212($sp)
	addu	$5,$16,$5
	move	$4,$19
	sw	$2,24($sp)
	sw	$12,136($sp)
	sw	$13,16($sp)
	sw	$15,20($sp)
	sw	$22,44($sp)
	sw	$fp,48($sp)
	sw	$17,52($sp)
	sw	$25,28($sp)
	sw	$21,32($sp)
	.option	pic0
	jal	mc_dir_part
	.option	pic2
	sw	$12,36($sp)

	lw	$3,-6196($23)
	li	$2,2			# 0x2
	beq	$3,$2,$L3507
	addiu	$2,$18,14838

	addiu	$4,$20,14982
	addiu	$5,$18,14934
	addiu	$3,$20,14886
	sll	$4,$4,2
	sll	$5,$5,2
	sll	$2,$2,2
	sll	$3,$3,2
	addu	$2,$19,$2
	addu	$3,$19,$3
	addu	$4,$19,$4
	addu	$5,$19,$5
	lw	$9,4($5)
	lw	$8,4($4)
	lw	$5,4($3)
	lw	$4,4($2)
	lw	$6,9756($19)
	lw	$7,-6188($23)
	addu	$8,$8,$9
	sw	$4,16($sp)
	sw	$5,20($sp)
	lw	$4,152($sp)
	lw	$5,140($sp)
	lw	$25,168($sp)
	jalr	$25
	sw	$8,24($sp)

	addiu	$4,$20,7659
	addiu	$5,$18,7611
	addiu	$2,$18,7515
	sll	$4,$4,3
	sll	$5,$5,3
	addiu	$3,$20,7563
	sll	$2,$2,3
	addu	$2,$19,$2
	addu	$4,$19,$4
	addu	$5,$19,$5
	sll	$3,$3,3
	lw	$8,4($4)
	lw	$9,4($5)
	lw	$4,4($2)
	addu	$3,$19,$3
	lw	$5,4($3)
	lw	$6,9760($19)
	lw	$7,-6184($23)
	addu	$8,$8,$9
	sw	$4,16($sp)
	lw	$25,164($sp)
	lw	$4,156($sp)
	sw	$5,20($sp)
	sw	$8,24($sp)
	jalr	$25
	move	$5,$21

	lw	$2,208($sp)
	li	$3,65536			# 0x10000
	addu	$4,$19,$2
	addu	$4,$3,$4
	lw	$5,212($sp)
	lw	$2,-5408($4)
	addu	$3,$19,$5
	li	$6,65536			# 0x10000
	sw	$2,288($sp)
	addu	$3,$6,$3
	lw	$5,-5024($3)
	lw	$7,-6184($23)
	sw	$5,292($sp)
	lw	$5,-4640($4)
	lw	$2,-4256($3)
	lw	$28,56($sp)
	addu	$2,$2,$5
	lw	$4,160($sp)
	lw	$5,136($sp)
	lw	$6,9760($19)
	sw	$2,296($sp)
$L3492:
	lw	$25,164($sp)
	lw	$31,268($sp)
	lw	$fp,264($sp)
	lw	$23,260($sp)
	lw	$22,256($sp)
	lw	$21,252($sp)
	lw	$20,248($sp)
	lw	$19,244($sp)
	lw	$18,240($sp)
	lw	$17,236($sp)
	lw	$16,232($sp)
	jr	$25
	addiu	$sp,$sp,272

$L3499:
	lw	$2,192($sp)
	lw	$3,152($sp)
	lw	$25,0($16)
	lw	$6,9756($19)
	addu	$5,$17,$2
	jalr	$25
	addu	$4,$3,$2

	b	$L3457
	lw	$28,56($sp)

$L3466:
	lw	$3,204($sp)
	lw	$fp,200($sp)
	beq	$21,$0,$L3490
	sw	$3,196($sp)

	b	$L3511
	lw	$4,180($sp)

$L3459:
	lw	$5,220($sp)
	lw	$6,76($sp)
	addu	$2,$4,$5
	addu	$2,$19,$2
	addu	$2,$2,$6
	lbu	$4,9456($2)
	lw	$3,6172($19)
	andi	$4,$4,0x1
	andi	$3,$3,0x1
	subu	$3,$3,$4
	sll	$3,$3,1
	addu	$5,$3,$18
	sra	$22,$5,3
	bltz	$22,$L3508
	lw	$12,100($sp)

	addiu	$2,$22,8
	sra	$3,$12,1
	slt	$2,$2,$3
	xori	$2,$2,0x1
$L3462:
	andi	$5,$5,0x7
	or	$23,$23,$2
	b	$L3460
	sw	$5,72($sp)

$L3502:
	lw	$2,192($sp)
	lw	$3,116($sp)
	lw	$25,0($16)
	lw	$6,9756($19)
	addu	$5,$17,$2
	jalr	$25
	addu	$4,$3,$2

	b	$L3481
	lw	$28,56($sp)

$L3505:
	lw	$2,192($sp)
	lw	$3,116($sp)
	lw	$25,0($16)
	lw	$6,9756($19)
	addu	$5,$17,$2
	jalr	$25
	addu	$4,$3,$2

	b	$L3471
	lw	$28,56($sp)

$L3482:
	lbu	$3,9496($23)
	lw	$2,6172($19)
	andi	$3,$3,0x1
	andi	$2,$2,0x1
	subu	$2,$2,$3
	sll	$2,$2,1
	addu	$5,$20,$2
	sra	$23,$5,3
	bltz	$23,$L3509
	lw	$4,80($sp)

	addiu	$2,$23,8
	sra	$3,$4,1
	slt	$2,$2,$3
	xori	$2,$2,0x1
$L3485:
	andi	$5,$5,0x7
	or	$22,$22,$2
	b	$L3483
	sw	$5,68($sp)

$L3472:
	lw	$2,6172($19)
	lbu	$3,9456($4)
	andi	$2,$2,0x1
	andi	$3,$3,0x1
	subu	$2,$2,$3
	sll	$2,$2,1
	addu	$4,$20,$2
	sra	$fp,$4,3
	bltz	$fp,$L3475
	li	$2,1			# 0x1

	lw	$5,92($sp)
	addiu	$2,$fp,8
	sra	$3,$5,1
	slt	$2,$2,$3
	xori	$2,$2,0x1
$L3475:
	andi	$4,$4,0x7
	or	$23,$23,$2
	b	$L3473
	sw	$4,64($sp)

$L3498:
	addiu	$2,$6,15
	slt	$2,$2,$3
	beq	$2,$0,$L3513
	addiu	$5,$11,1

	b	$L3456
	move	$23,$0

$L3501:
	addiu	$2,$10,15
	slt	$2,$2,$3
	beq	$2,$0,$L3514
	addiu	$5,$11,1

	b	$L3480
	move	$22,$0

$L3504:
	addiu	$2,$6,15
	slt	$2,$2,$3
	beq	$2,$0,$L3515
	addiu	$5,$9,1

	b	$L3470
	move	$23,$0

$L3508:
	b	$L3462
	li	$2,1			# 0x1

$L3509:
	b	$L3485
	li	$2,1			# 0x1

$L3500:
	lw	$12,104($sp)
	lw	$13,100($sp)
	lw	$4,2040($19)
	sra	$17,$12,1
	sra	$18,$13,1
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	li	$16,9			# 0x9
	li	$7,9			# 0x9
	sw	$16,16($sp)
	sw	$20,20($sp)
	sw	$22,24($sp)
	sw	$17,28($sp)
	jalr	$25
	sw	$18,32($sp)

	lw	$25,72($sp)
	lw	$15,108($sp)
	lw	$5,2040($19)
	lw	$6,9760($19)
	lw	$4,156($sp)
	sw	$25,20($sp)
	lw	$7,188($sp)
	lw	$25,196($sp)
	jalr	$25
	sw	$15,16($sp)

	lw	$28,56($sp)
	lw	$4,2040($19)
	lw	$6,9760($19)
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	move	$5,$fp
	sw	$16,16($sp)
	sw	$20,20($sp)
	sw	$22,24($sp)
	sw	$17,28($sp)
	sw	$18,32($sp)
	jalr	$25
	li	$7,9			# 0x9

	b	$L3487
	lw	$fp,2040($19)

$L3503:
	lw	$12,84($sp)
	lw	$13,80($sp)
	lw	$4,2040($19)
	sra	$17,$12,1
	sra	$18,$13,1
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	li	$16,9			# 0x9
	li	$7,9			# 0x9
	sw	$16,16($sp)
	sw	$20,20($sp)
	sw	$23,24($sp)
	sw	$17,28($sp)
	jalr	$25
	sw	$18,32($sp)

	lw	$25,68($sp)
	lw	$15,88($sp)
	lw	$5,2040($19)
	lw	$6,9760($19)
	lw	$4,120($sp)
	sw	$25,20($sp)
	lw	$7,188($sp)
	lw	$25,196($sp)
	jalr	$25
	sw	$15,16($sp)

	lw	$28,56($sp)
	lw	$4,2040($19)
	lw	$6,9760($19)
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	move	$5,$21
	sw	$16,16($sp)
	sw	$20,20($sp)
	sw	$23,24($sp)
	sw	$17,28($sp)
	sw	$18,32($sp)
	jalr	$25
	li	$7,9			# 0x9

	lw	$28,56($sp)
	b	$L3489
	lw	$21,2040($19)

$L3506:
	lw	$12,92($sp)
	lw	$4,2040($19)
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sra	$17,$18,1
	li	$16,9			# 0x9
	sra	$18,$12,1
	li	$7,9			# 0x9
	sw	$16,16($sp)
	sw	$20,20($sp)
	sw	$fp,24($sp)
	sw	$17,28($sp)
	jalr	$25
	sw	$18,32($sp)

	lw	$13,96($sp)
	lw	$15,64($sp)
	lw	$5,2040($19)
	lw	$6,9760($19)
	lw	$4,120($sp)
	lw	$7,188($sp)
	lw	$25,196($sp)
	sw	$13,16($sp)
	jalr	$25
	sw	$15,20($sp)

	lw	$28,56($sp)
	lw	$4,2040($19)
	lw	$6,9760($19)
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	move	$5,$22
	sw	$16,16($sp)
	sw	$20,20($sp)
	sw	$fp,24($sp)
	sw	$17,28($sp)
	sw	$18,32($sp)
	jalr	$25
	li	$7,9			# 0x9

	b	$L3488
	lw	$22,2040($19)

$L3507:
	sll	$3,$18,4
	sll	$2,$18,6
	subu	$2,$2,$3
	addu	$2,$2,$20
	addiu	$2,$2,15414
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$17,4($2)
	li	$16,64			# 0x40
	lw	$6,9756($19)
	subu	$16,$16,$17
	lw	$4,152($sp)
	lw	$5,140($sp)
	lw	$25,168($sp)
	li	$7,5			# 0x5
	sw	$17,16($sp)
	sw	$16,20($sp)
	jalr	$25
	sw	$0,24($sp)

	lw	$6,9760($19)
	lw	$4,156($sp)
	lw	$25,164($sp)
	move	$5,$21
	li	$7,5			# 0x5
	sw	$17,16($sp)
	sw	$16,20($sp)
	jalr	$25
	sw	$0,24($sp)

	lw	$6,9760($19)
	lw	$28,56($sp)
	sw	$17,288($sp)
	sw	$16,292($sp)
	sw	$0,296($sp)
	lw	$4,160($sp)
	lw	$5,136($sp)
	b	$L3492
	li	$7,5			# 0x5

	.set	macro
	.set	reorder
	.end	mc_part
	.align	2
	.ent	hl_motion
	.type	hl_motion, @function
hl_motion:
	.set	nomips16
	.frame	$sp,208,$31		# vars= 88, regs= 10/0, args= 72, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-208
	sw	$31,204($sp)
	sw	$fp,200($sp)
	sw	$23,196($sp)
	sw	$22,192($sp)
	sw	$21,188($sp)
	sw	$20,184($sp)
	sw	$19,180($sp)
	sw	$18,176($sp)
	sw	$17,172($sp)
	sw	$16,168($sp)
	.cprestore	72
	move	$21,$4
	lw	$2,152($21)
	lw	$9,6172($21)
	lw	$4,6168($4)
	mul	$8,$9,$2
	lw	$3,1568($21)
	addu	$2,$8,$4
	sll	$2,$2,2
	lb	$8,9468($21)
	addu	$3,$3,$2
	lw	$10,228($sp)
	lw	$2,236($sp)
	sw	$5,96($sp)
	sw	$6,100($sp)
	sw	$7,104($sp)
	lw	$22,0($3)
	lw	$23,224($sp)
	sw	$10,108($sp)
	lw	$fp,232($sp)
	sw	$2,112($sp)
	lw	$19,240($sp)
	bltz	$8,$L3518
	lw	$20,244($sp)

	sll	$2,$8,3
	sll	$3,$8,5
	subu	$3,$3,$2
	lh	$5,9184($21)
	lh	$17,9186($21)
	sll	$16,$4,4
	sll	$2,$3,4
	addu	$3,$3,$2
	sra	$5,$5,2
	sll	$2,$9,4
	addiu	$16,$16,8
	sra	$17,$17,2
	andi	$4,$4,0x3
	addu	$16,$16,$5
	addu	$17,$17,$2
	lw	$5,9756($21)
	sll	$4,$4,2
	addu	$4,$17,$4
	addu	$3,$21,$3
	li	$18,65536			# 0x10000
	addu	$18,$18,$3
	mul	$3,$4,$5
	addiu	$2,$16,64
	addu	$4,$3,$2
	lw	$3,32320($18)
	lw	$5,176($21)
	lw	$25,5148($21)
	addu	$4,$3,$4
	jalr	$25
	li	$6,4			# 0x4

	lw	$2,6168($21)
	lw	$3,180($21)
	andi	$2,$2,0x7
	sra	$17,$17,1
	addu	$17,$17,$2
	mul	$2,$17,$3
	sra	$16,$16,1
	lw	$4,32324($18)
	lw	$5,32328($18)
	addiu	$16,$16,64
	addu	$17,$2,$16
	lw	$25,5148($21)
	subu	$5,$5,$4
	li	$6,2			# 0x2
	jalr	$25
	addu	$4,$4,$17

$L3518:
	andi	$2,$22,0x8
	bne	$2,$0,$L3533
	andi	$2,$22,0x10

	bne	$2,$0,$L3534
	andi	$2,$22,0x20

	bne	$2,$0,$L3535
	addiu	$3,$23,64

	sw	$3,84($sp)
	li	$2,59272			# 0xe788
	lw	$3,112($sp)
	addiu	$4,$fp,64
	addu	$2,$21,$2
	addiu	$3,$3,8
	sw	$4,80($sp)
	sw	$2,88($sp)
	addiu	$4,$19,24
	lw	$2,108($sp)
	sw	$3,120($sp)
	sw	$4,124($sp)
	lw	$3,108($sp)
	lw	$4,112($sp)
	addiu	$8,$19,12
	addiu	$10,$20,12
	addiu	$2,$2,8
	addiu	$23,$23,128
	sw	$8,156($sp)
	sw	$10,160($sp)
	addiu	$8,$20,24
	addiu	$10,$19,20
	sw	$2,116($sp)
	addiu	$3,$3,4
	addiu	$2,$20,20
	addiu	$4,$4,4
	addiu	$19,$19,16
	addiu	$20,$20,16
	sw	$23,92($sp)
	addiu	$fp,$fp,128
	move	$23,$0
	move	$22,$0
	sw	$8,128($sp)
	sw	$10,132($sp)
	sw	$2,136($sp)
	sw	$3,140($sp)
	sw	$4,144($sp)
	sw	$19,148($sp)
	sw	$20,152($sp)
$L3528:
	lw	$8,88($sp)
	andi	$2,$23,0x1
	lw	$16,0($8)
	andi	$3,$23,0x2
	andi	$4,$16,0x8
	sll	$18,$2,2
	bne	$4,$0,$L3536
	sll	$19,$3,1

	andi	$2,$16,0x10
	bne	$2,$0,$L3537
	andi	$2,$16,0x20

	bne	$2,$0,$L3538
	lw	$4,120($sp)

	andi	$20,$16,0x4000
	andi	$17,$16,0x1000
	move	$16,$0
$L3527:
	andi	$2,$16,0x1
	lw	$4,116($sp)
	lw	$10,120($sp)
	andi	$3,$16,0x2
	sll	$2,$2,1
	addu	$2,$2,$18
	addu	$3,$3,$19
	lw	$8,0($4)
	lw	$9,0($10)
	sw	$2,32($sp)
	sw	$3,36($sp)
	lw	$2,96($sp)
	lw	$3,100($sp)
	sw	$8,44($sp)
	sw	$2,20($sp)
	sw	$3,24($sp)
	lw	$8,104($sp)
	lw	$10,92($sp)
	lw	$2,124($sp)
	lw	$3,128($sp)
	addu	$5,$22,$16
	move	$4,$21
	li	$6,1			# 0x1
	li	$7,2			# 0x2
	sw	$9,52($sp)
	sw	$0,16($sp)
	sw	$8,28($sp)
	sw	$10,40($sp)
	sw	$fp,48($sp)
	sw	$2,56($sp)
	sw	$3,60($sp)
	sw	$17,64($sp)
	sw	$20,68($sp)
	.option	pic0
	jal	mc_part
	.option	pic2
	addiu	$16,$16,1

	li	$4,4			# 0x4
	bne	$16,$4,$L3527
	lw	$28,72($sp)

$L3524:
	lw	$8,88($sp)
	addiu	$23,$23,1
	addiu	$8,$8,4
	li	$10,4			# 0x4
	sw	$8,88($sp)
	bne	$23,$10,$L3528
	addiu	$22,$22,4

$L3520:
	lb	$2,9508($21)
	bltz	$2,$L3530
	sll	$3,$2,5

	lw	$4,6168($21)
	lh	$17,9346($21)
	lw	$5,6172($21)
	sll	$2,$2,3
	subu	$3,$3,$2
	sll	$16,$4,4
	sll	$2,$3,4
	sll	$5,$5,4
	sra	$17,$17,2
	andi	$4,$4,0x3
	addu	$17,$17,$5
	addu	$3,$3,$2
	lw	$5,9756($21)
	sll	$4,$4,2
	lh	$6,9344($21)
	addu	$3,$21,$3
	addu	$4,$17,$4
	li	$18,131072			# 0x20000
	addu	$18,$18,$3
	mul	$3,$4,$5
	sra	$6,$6,2
	addiu	$16,$16,8
	addu	$16,$16,$6
	addiu	$2,$16,64
	addu	$4,$3,$2
	lw	$3,-13632($18)
	lw	$5,176($21)
	lw	$25,5148($21)
	addu	$4,$3,$4
	jalr	$25
	li	$6,4			# 0x4

	lw	$2,6168($21)
	lw	$3,180($21)
	andi	$2,$2,0x7
	sra	$17,$17,1
	addu	$17,$17,$2
	mul	$2,$17,$3
	sra	$16,$16,1
	lw	$4,-13628($18)
	addiu	$16,$16,64
	lw	$5,-13624($18)
	addu	$17,$2,$16
	lw	$28,72($sp)
	lw	$25,5148($21)
	subu	$5,$5,$4
	lw	$31,204($sp)
	addu	$4,$4,$17
	lw	$fp,200($sp)
	lw	$23,196($sp)
	lw	$22,192($sp)
	lw	$21,188($sp)
	lw	$20,184($sp)
	lw	$19,180($sp)
	lw	$18,176($sp)
	lw	$17,172($sp)
	lw	$16,168($sp)
	li	$6,2			# 0x2
	jr	$25
	addiu	$sp,$sp,208

$L3536:
	lw	$10,108($sp)
	lw	$2,112($sp)
	lw	$3,4($10)
	lw	$8,4($2)
	lw	$10,104($sp)
	sw	$3,44($sp)
	sw	$8,52($sp)
	lw	$3,96($sp)
	lw	$8,100($sp)
	andi	$2,$16,0x1000
	sw	$2,64($sp)
	sw	$3,20($sp)
	sw	$8,24($sp)
	sw	$10,28($sp)
	lw	$2,84($sp)
	lw	$3,80($sp)
	lw	$8,156($sp)
	lw	$10,160($sp)
	andi	$9,$16,0x4000
	move	$4,$21
	move	$5,$22
	li	$6,1			# 0x1
	li	$7,4			# 0x4
	sw	$18,32($sp)
	sw	$19,36($sp)
	sw	$9,68($sp)
	sw	$0,16($sp)
	sw	$2,40($sp)
	sw	$3,48($sp)
	sw	$8,56($sp)
	.option	pic0
	jal	mc_part
	.option	pic2
	sw	$10,60($sp)

	b	$L3524
	lw	$28,72($sp)

$L3530:
	lw	$31,204($sp)
	lw	$fp,200($sp)
	lw	$23,196($sp)
	lw	$22,192($sp)
	lw	$21,188($sp)
	lw	$20,184($sp)
	lw	$19,180($sp)
	lw	$18,176($sp)
	lw	$17,172($sp)
	lw	$16,168($sp)
	j	$31
	addiu	$sp,$sp,208

$L3537:
	lw	$3,140($sp)
	lw	$4,144($sp)
	lw	$2,0($3)
	lw	$10,96($sp)
	lw	$3,0($4)
	sw	$2,44($sp)
	lw	$2,100($sp)
	li	$8,4			# 0x4
	sw	$3,52($sp)
	sw	$8,16($sp)
	lw	$3,104($sp)
	lw	$8,92($sp)
	sw	$10,20($sp)
	sw	$2,24($sp)
	lw	$10,148($sp)
	lw	$2,152($sp)
	andi	$17,$16,0x4000
	move	$4,$21
	andi	$16,$16,0x1000
	move	$5,$22
	move	$6,$0
	li	$7,2			# 0x2
	sw	$3,28($sp)
	sw	$8,40($sp)
	sw	$10,56($sp)
	sw	$2,60($sp)
	sw	$18,32($sp)
	sw	$19,36($sp)
	sw	$fp,48($sp)
	sw	$16,64($sp)
	.option	pic0
	jal	mc_part
	.option	pic2
	sw	$17,68($sp)

	lw	$4,140($sp)
	lw	$10,144($sp)
	lw	$3,0($4)
	lw	$8,0($10)
	addiu	$2,$19,2
	sw	$3,44($sp)
	sw	$8,52($sp)
	lw	$3,96($sp)
	lw	$8,100($sp)
	sw	$2,36($sp)
	li	$2,4			# 0x4
	sw	$2,16($sp)
	sw	$3,20($sp)
	sw	$8,24($sp)
	lw	$10,104($sp)
	lw	$2,92($sp)
	lw	$3,148($sp)
	lw	$8,152($sp)
	move	$4,$21
	addiu	$5,$22,2
	move	$6,$0
	li	$7,2			# 0x2
	sw	$18,32($sp)
	sw	$16,64($sp)
	sw	$17,68($sp)
	sw	$10,28($sp)
	sw	$2,40($sp)
	sw	$fp,48($sp)
	sw	$3,56($sp)
	.option	pic0
	jal	mc_part
	.option	pic2
	sw	$8,60($sp)

	b	$L3524
	lw	$28,72($sp)

$L3533:
	lw	$3,108($sp)
	lw	$4,112($sp)
	lw	$10,96($sp)
	lw	$2,0($3)
	lw	$3,0($4)
	sw	$10,20($sp)
	lw	$10,100($sp)
	andi	$9,$22,0x4000
	sw	$10,24($sp)
	lw	$10,104($sp)
	andi	$8,$22,0x1000
	move	$4,$21
	move	$5,$0
	li	$6,1			# 0x1
	li	$7,8			# 0x8
	sw	$10,28($sp)
	sw	$23,40($sp)
	sw	$2,44($sp)
	sw	$fp,48($sp)
	sw	$3,52($sp)
	sw	$19,56($sp)
	sw	$20,60($sp)
	sw	$8,64($sp)
	sw	$9,68($sp)
	sw	$0,16($sp)
	sw	$0,32($sp)
	.option	pic0
	jal	mc_part
	.option	pic2
	sw	$0,36($sp)

	b	$L3520
	lw	$28,72($sp)

$L3538:
	lw	$10,116($sp)
	lw	$8,0($4)
	lw	$2,9756($21)
	lw	$3,0($10)
	lw	$10,100($sp)
	sw	$8,52($sp)
	lw	$8,96($sp)
	sll	$2,$2,2
	sw	$2,16($sp)
	sw	$3,44($sp)
	lw	$2,104($sp)
	lw	$3,92($sp)
	sw	$8,20($sp)
	sw	$10,24($sp)
	lw	$8,132($sp)
	lw	$10,136($sp)
	andi	$17,$16,0x4000
	move	$4,$21
	andi	$16,$16,0x1000
	move	$5,$22
	move	$6,$0
	li	$7,4			# 0x4
	sw	$2,28($sp)
	sw	$3,40($sp)
	sw	$8,56($sp)
	sw	$10,60($sp)
	sw	$18,32($sp)
	sw	$19,36($sp)
	sw	$fp,48($sp)
	sw	$16,64($sp)
	.option	pic0
	jal	mc_part
	.option	pic2
	sw	$17,68($sp)

	lw	$3,116($sp)
	lw	$4,120($sp)
	lw	$8,0($3)
	lw	$2,9756($21)
	lw	$9,0($4)
	lw	$10,100($sp)
	sw	$8,44($sp)
	lw	$8,96($sp)
	sll	$2,$2,2
	addiu	$3,$18,2
	sw	$2,16($sp)
	sw	$3,32($sp)
	sw	$8,20($sp)
	sw	$10,24($sp)
	lw	$2,104($sp)
	lw	$3,92($sp)
	lw	$8,132($sp)
	lw	$10,136($sp)
	move	$4,$21
	addiu	$5,$22,1
	move	$6,$0
	li	$7,4			# 0x4
	sw	$19,36($sp)
	sw	$9,52($sp)
	sw	$16,64($sp)
	sw	$17,68($sp)
	sw	$2,28($sp)
	sw	$3,40($sp)
	sw	$fp,48($sp)
	sw	$8,56($sp)
	.option	pic0
	jal	mc_part
	.option	pic2
	sw	$10,60($sp)

	b	$L3524
	lw	$28,72($sp)

$L3534:
	lw	$2,108($sp)
	lw	$3,112($sp)
	lw	$8,0($2)
	andi	$2,$22,0x1000
	lw	$9,0($3)
	lw	$10,100($sp)
	sw	$8,44($sp)
	sw	$2,64($sp)
	lw	$8,96($sp)
	lw	$2,104($sp)
	andi	$3,$22,0x4000
	addiu	$17,$23,64
	addiu	$18,$fp,64
	addiu	$19,$19,4
	addiu	$20,$20,4
	li	$16,8			# 0x8
	move	$4,$21
	move	$5,$0
	move	$6,$0
	li	$7,4			# 0x4
	sw	$9,52($sp)
	sw	$3,68($sp)
	sw	$8,20($sp)
	sw	$10,24($sp)
	sw	$2,28($sp)
	sw	$16,16($sp)
	sw	$0,32($sp)
	sw	$0,36($sp)
	sw	$17,40($sp)
	sw	$18,48($sp)
	sw	$19,56($sp)
	.option	pic0
	jal	mc_part
	.option	pic2
	sw	$20,60($sp)

	lw	$4,108($sp)
	lw	$10,112($sp)
	lw	$2,96($sp)
	lw	$3,0($4)
	lw	$8,0($10)
	sw	$2,20($sp)
	lw	$2,100($sp)
	andi	$10,$22,0x8000
	sw	$2,24($sp)
	lw	$2,104($sp)
	andi	$9,$22,0x2000
	sw	$2,28($sp)
	move	$4,$21
	li	$2,4			# 0x4
	li	$5,8			# 0x8
	move	$6,$0
	li	$7,4			# 0x4
	sw	$16,16($sp)
	sw	$2,36($sp)
	sw	$17,40($sp)
	sw	$3,44($sp)
	sw	$18,48($sp)
	sw	$8,52($sp)
	sw	$19,56($sp)
	sw	$20,60($sp)
	sw	$9,64($sp)
	sw	$10,68($sp)
	.option	pic0
	jal	mc_part
	.option	pic2
	sw	$0,32($sp)

	b	$L3520
	lw	$28,72($sp)

$L3535:
	lw	$4,112($sp)
	lw	$2,9756($21)
	lw	$10,4($4)
	lw	$3,108($sp)
	sll	$2,$2,3
	andi	$8,$22,0x4000
	lw	$9,4($3)
	sw	$2,16($sp)
	sw	$10,52($sp)
	lw	$2,104($sp)
	lw	$10,100($sp)
	sw	$8,68($sp)
	lw	$8,96($sp)
	addiu	$18,$19,8
	andi	$3,$22,0x1000
	addiu	$16,$23,64
	addiu	$17,$fp,64
	addiu	$19,$20,8
	move	$4,$21
	move	$5,$0
	move	$6,$0
	li	$7,8			# 0x8
	sw	$9,44($sp)
	sw	$3,64($sp)
	sw	$8,20($sp)
	sw	$10,24($sp)
	sw	$2,28($sp)
	sw	$0,32($sp)
	sw	$0,36($sp)
	sw	$16,40($sp)
	sw	$17,48($sp)
	sw	$18,56($sp)
	.option	pic0
	jal	mc_part
	.option	pic2
	sw	$19,60($sp)

	lw	$2,9756($21)
	lw	$4,108($sp)
	lw	$10,112($sp)
	sll	$2,$2,3
	lw	$3,4($4)
	lw	$8,4($10)
	sw	$2,16($sp)
	lw	$2,96($sp)
	andi	$10,$22,0x8000
	sw	$2,20($sp)
	lw	$2,100($sp)
	andi	$9,$22,0x2000
	sw	$2,24($sp)
	lw	$2,104($sp)
	move	$4,$21
	sw	$2,28($sp)
	li	$5,4			# 0x4
	li	$2,4			# 0x4
	move	$6,$0
	li	$7,8			# 0x8
	sw	$2,32($sp)
	sw	$16,40($sp)
	sw	$3,44($sp)
	sw	$17,48($sp)
	sw	$8,52($sp)
	sw	$18,56($sp)
	sw	$19,60($sp)
	sw	$9,64($sp)
	sw	$10,68($sp)
	.option	pic0
	jal	mc_part
	.option	pic2
	sw	$0,36($sp)

	b	$L3520
	lw	$28,72($sp)

	.set	macro
	.set	reorder
	.end	hl_motion
	.align	2
	.ent	hl_decode_mb_complex
	.type	hl_decode_mb_complex, @function
hl_decode_mb_complex:
	.set	nomips16
	.frame	$sp,320,$31		# vars= 232, regs= 10/0, args= 40, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-320
	sw	$31,316($sp)
	sw	$fp,312($sp)
	sw	$23,308($sp)
	sw	$22,304($sp)
	sw	$21,300($sp)
	sw	$20,296($sp)
	sw	$19,292($sp)
	sw	$18,288($sp)
	sw	$17,284($sp)
	sw	$16,280($sp)
	.cprestore	40
	lw	$3,6168($4)
	lw	$2,6172($4)
	sw	$3,192($sp)
	sw	$2,196($sp)
	move	$20,$4
	lw	$2,152($4)
	lw	$3,1568($4)
	lw	$4,192($sp)
	lw	$5,196($sp)
	mtlo	$4
	lw	$4,196($sp)
	andi	$5,$5,0x1
	madd	$4,$2
	lw	$4,2056($20)
	mflo	$17
	sw	$5,252($sp)
	sll	$2,$17,2
	addu	$3,$3,$2
	lw	$3,0($3)
	beq	$4,$0,$L3540
	sw	$3,200($sp)

	sw	$0,216($sp)
$L3541:
	lw	$5,176($20)
	lw	$2,196($sp)
	lw	$6,192($sp)
	mul	$3,$2,$5
	sll	$4,$5,2
	andi	$2,$6,0x3
	lw	$7,180($20)
	mul	$4,$4,$2
	lw	$2,196($sp)
	sll	$6,$6,4
	mul	$7,$2,$7
	lw	$8,192($sp)
	lw	$2,1464($20)
	sll	$3,$3,4
	addu	$3,$3,$6
	sll	$8,$8,3
	addu	$23,$2,$3
	sll	$7,$7,3
	lw	$2,1472($20)
	addu	$7,$7,$8
	lw	$3,1468($20)
	addu	$2,$2,$7
	lw	$25,5148($20)
	addiu	$4,$4,64
	sw	$6,176($sp)
	sw	$8,180($sp)
	addu	$4,$23,$4
	li	$6,4			# 0x4
	sw	$2,204($sp)
	addu	$fp,$3,$7
	jalr	$25
	lw	$16,44($20)

	lw	$4,6168($20)
	lw	$2,180($20)
	andi	$4,$4,0x7
	mul	$4,$4,$2
	lw	$2,204($sp)
	lw	$25,5148($20)
	addiu	$4,$4,64
	subu	$5,$2,$fp
	addu	$4,$fp,$4
	jalr	$25
	li	$6,2			# 0x2

	li	$2,65536			# 0x10000
	addu	$2,$20,$2
	lw	$3,-6272($2)
	beq	$3,$0,$L3542
	lw	$28,40($sp)

	lw	$5,176($20)
	lw	$4,180($20)
	lw	$7,252($sp)
	sll	$3,$4,1
	sll	$21,$5,1
	addiu	$6,$20,9644
	sw	$3,208($sp)
	sw	$21,9756($20)
	sw	$3,9760($20)
	beq	$7,$0,$L3543
	sw	$6,212($sp)

	lw	$8,204($sp)
	sll	$3,$4,3
	subu	$3,$4,$3
	sll	$2,$5,4
	subu	$2,$5,$2
	addu	$8,$8,$3
	addu	$23,$23,$2
	sw	$8,204($sp)
	addu	$fp,$fp,$3
$L3543:
	li	$2,65536			# 0x10000
	addu	$9,$20,$2
	lw	$3,-6276($9)
	bne	$3,$0,$L3652
	nop

$L3544:
	lw	$6,216($sp)
	beq	$6,$0,$L3668
	lw	$12,200($sp)

$L3655:
	lw	$7,200($sp)
	li	$2,16777216			# 0x1000000
	and	$2,$7,$2
	beq	$2,$0,$L3551
	nop

	lw	$8,2160($20)
	sw	$8,224($sp)
	sw	$8,156($sp)
$L3552:
	beq	$3,$0,$L3669
	lw	$7,200($sp)

	li	$2,65536			# 0x10000
	addu	$2,$20,$2
	lw	$3,5340($2)
	beq	$3,$0,$L3670
	andi	$2,$7,0x4

	lw	$6,200($sp)
	andi	$2,$6,0x7
	bne	$2,$0,$L3653
	lw	$7,252($sp)

$L3554:
	lw	$7,200($sp)
$L3669:
	andi	$2,$7,0x4
$L3670:
	beq	$2,$0,$L3556
	xori	$2,$16,0x1c

	lw	$13,212($sp)
	li	$2,65536			# 0x10000
	ori	$14,$2,0xd6c
	move	$10,$13
	move	$2,$0
	li	$12,4			# 0x4
	li	$15,256			# 0x100
$L3557:
	move	$8,$2
	move	$9,$0
	addiu	$11,$2,16
$L3562:
	addu	$2,$8,$14
	sll	$2,$2,1
	addu	$6,$20,$2
	move	$5,$0
	addu	$7,$23,$9
$L3558:
	lw	$2,0($10)
	addu	$3,$7,$5
	lhu	$4,0($6)
	addu	$3,$3,$2
	addiu	$5,$5,1
	sb	$4,0($3)
	bne	$5,$12,$L3558
	addiu	$6,$6,2

	addiu	$8,$8,4
	bne	$11,$8,$L3562
	addu	$9,$9,$21

	beq	$11,$15,$L3654
	addiu	$10,$10,4

	b	$L3557
	move	$2,$11

$L3542:
	lw	$4,180($20)
	lw	$21,176($20)
	lw	$6,216($sp)
	addiu	$5,$20,9548
	sw	$4,208($sp)
	lw	$3,-6276($2)
	sw	$21,9756($20)
	sw	$4,9760($20)
	bne	$6,$0,$L3655
	sw	$5,212($sp)

	lw	$12,200($sp)
$L3668:
	li	$2,16777216			# 0x1000000
	and	$2,$12,$2
	beq	$2,$0,$L3553
	nop

	lw	$25,5128($20)
	lw	$2,5120($20)
	sw	$25,224($sp)
	b	$L3552
	sw	$2,156($sp)

$L3540:
	lw	$2,9924($20)
	sltu	$2,$0,$2
	b	$L3541
	sw	$2,216($sp)

$L3553:
	lw	$4,5124($20)
	lw	$5,5116($20)
	sw	$4,224($sp)
	b	$L3552
	sw	$5,156($sp)

$L3551:
	lw	$9,2164($20)
	sw	$9,224($sp)
	b	$L3552
	sw	$9,156($sp)

$L3652:
	lw	$2,5944($9)
	beq	$2,$0,$L3544
	lw	$25,200($sp)

	lui	$2,%hi(scan8)
	lui	$3,%hi(scan8+16)
	addiu	$14,$2,%lo(scan8)
	addiu	$15,$3,%lo(scan8+16)
	addiu	$11,$20,9456
	move	$6,$0
	move	$5,$0
	li	$12,12288			# 0x3000
	andi	$13,$25,0x8
	move	$18,$9
$L3549:
	sll	$2,$6,1
	lw	$3,200($sp)
	sll	$2,$12,$2
	and	$2,$2,$3
	beq	$2,$0,$L3545
	nop

	beq	$13,$0,$L3546
	sll	$2,$6,5

	sll	$2,$5,5
	sll	$4,$5,3
	addu	$4,$4,$2
	addiu	$4,$4,12
	addu	$4,$11,$4
	lw	$5,6172($20)
	lb	$3,0($4)
	andi	$5,$5,0x1
	addiu	$3,$3,16
	xor	$3,$3,$5
	sll	$2,$3,8
	addu	$2,$2,$3
	sll	$5,$2,16
	addu	$2,$2,$5
	sw	$2,24($4)
	sw	$2,0($4)
	sw	$2,8($4)
	sw	$2,16($4)
$L3545:
	lw	$2,5944($18)
$L3667:
	addiu	$6,$6,1
	sltu	$2,$6,$2
	bne	$2,$0,$L3549
	move	$5,$6

	b	$L3544
	lw	$3,-6276($9)

$L3556:
	lw	$6,200($sp)
	andi	$6,$6,0x7
	sltu	$2,$2,1
	sw	$6,152($sp)
	beq	$6,$0,$L3571
	sw	$2,220($sp)

	li	$2,65536			# 0x10000
	addu	$2,$20,$2
	lw	$3,5340($2)
	beq	$3,$0,$L3572
	nop

	lw	$2,-6276($2)
	beq	$2,$0,$L3656
	lw	$8,208($sp)

$L3572:
	lw	$2,56($20)
	andi	$2,$2,0x2000
	beq	$2,$0,$L3657
	lw	$5,208($sp)

$L3573:
	lw	$9,200($sp)
	andi	$9,$9,0x1
	beq	$9,$0,$L3574
	sw	$9,172($sp)

	lw	$2,52($20)
	bne	$2,$0,$L3664
	li	$2,65536			# 0x10000

	lw	$12,200($sp)
	li	$2,16777216			# 0x1000000
	and	$2,$12,$2
	beq	$2,$0,$L3576
	li	$2,131072			# 0x20000

	ori	$2,$2,0x1ad8
	addu	$18,$20,$2
	lw	$25,212($sp)
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	sw	$2,256($sp)
	sw	$25,168($sp)
	move	$22,$18
	sw	$18,164($sp)
	move	$17,$0
$L3579:
	lw	$3,256($sp)
	lw	$5,168($sp)
	addu	$2,$3,$17
	lbu	$3,0($2)
	lw	$4,0($5)
	addu	$3,$20,$3
	lb	$2,8776($3)
	lw	$5,8980($20)
	addiu	$2,$2,2218
	lw	$6,8988($20)
	sll	$2,$2,2
	addu	$2,$20,$2
	addu	$16,$23,$4
	sll	$5,$5,$17
	sll	$6,$6,$17
	lw	$25,4($2)
	lbu	$19,9080($3)
	andi	$5,$5,0x8000
	andi	$6,$6,0x4000
	move	$4,$16
	jalr	$25
	move	$7,$21

	lw	$28,40($sp)
	move	$4,$16
	lw	$5,164($sp)
	beq	$19,$0,$L3577
	move	$6,$21

	li	$7,1			# 0x1
	bne	$19,$7,$L3671
	lw	$25,156($sp)

	lh	$2,0($18)
	bne	$2,$0,$L3658
	nop

$L3671:
	jalr	$25
	nop

	lw	$28,40($sp)
$L3577:
	lw	$2,168($sp)
	lw	$3,164($sp)
	addiu	$2,$2,16
	addiu	$3,$3,128
	addiu	$17,$17,4
	li	$4,16			# 0x10
	sw	$2,168($sp)
	addiu	$22,$22,128
	sw	$3,164($sp)
	bne	$17,$4,$L3579
	addiu	$18,$18,128

$L3575:
	li	$2,65536			# 0x10000
$L3664:
	addu	$2,$20,$2
	lw	$3,5340($2)
	beq	$3,$0,$L3672
	lw	$25,172($sp)

	lw	$2,-6276($2)
	bne	$2,$0,$L3672
	lw	$9,208($sp)

	lw	$7,204($sp)
	move	$4,$20
	move	$5,$23
	move	$6,$fp
	sw	$21,16($sp)
	sw	$9,20($sp)
	sw	$0,24($sp)
	.option	pic0
	jal	xchg_mb_border
	.option	pic2
	sw	$0,28($sp)

	b	$L3592
	lw	$28,40($sp)

$L3654:
	li	$2,65536			# 0x10000
	lw	$9,212($sp)
	ori	$12,$2,0xd6c
	li	$10,272			# 0x110
	li	$11,4			# 0x4
	li	$14,336			# 0x150
$L3561:
	addiu	$8,$10,-16
	move	$7,$0
$L3566:
	addu	$2,$8,$12
	sll	$2,$2,1
	addu	$6,$20,$2
	move	$5,$0
$L3563:
	lw	$2,64($9)
	addu	$3,$fp,$5
	lhu	$4,0($6)
	addu	$3,$3,$7
	addu	$3,$3,$2
	addiu	$5,$5,1
	sb	$4,0($3)
	bne	$5,$11,$L3563
	addiu	$6,$6,2

	lw	$25,208($sp)
	addiu	$8,$8,4
	bne	$8,$10,$L3566
	addu	$7,$7,$25

	addiu	$10,$8,16
	bne	$10,$14,$L3561
	addiu	$9,$9,4

	li	$2,65536			# 0x10000
	ori	$11,$2,0xd6c
	li	$9,336			# 0x150
	li	$10,4			# 0x4
	li	$12,400			# 0x190
$L3565:
	addiu	$8,$9,-16
	move	$7,$0
$L3570:
	addu	$2,$8,$11
	sll	$2,$2,1
	addu	$6,$20,$2
	move	$5,$0
$L3567:
	lw	$4,204($sp)
	lw	$2,80($13)
	addu	$3,$4,$5
	addu	$3,$3,$7
	lhu	$4,0($6)
	addu	$3,$3,$2
	addiu	$5,$5,1
	sb	$4,0($3)
	bne	$5,$10,$L3567
	addiu	$6,$6,2

	lw	$5,208($sp)
	addiu	$8,$8,4
	bne	$8,$9,$L3570
	addu	$7,$7,$5

	addiu	$9,$9,16
	bne	$9,$12,$L3565
	addiu	$13,$13,4

$L3569:
	li	$2,65536			# 0x10000
$L3665:
	addu	$2,$20,$2
	lw	$3,5340($2)
	beq	$3,$0,$L3673
	lw	$31,316($sp)

	lw	$2,-6276($2)
	beq	$2,$0,$L3622
	lw	$5,208($sp)

	lw	$24,6172($20)
	lw	$3,192($sp)
	lw	$2,152($20)
	addiu	$12,$24,-1
	mtlo	$3
	madd	$12,$2
	lw	$5,252($sp)
	mflo	$3
	sw	$12,232($sp)
	sw	$3,248($sp)
	lw	$4,248($sp)
	lw	$3,1568($20)
	addu	$2,$4,$2
	sll	$2,$2,2
	sll	$4,$4,2
	addu	$2,$3,$2
	addu	$3,$3,$4
	lw	$3,0($3)
	lw	$2,0($2)
	sw	$3,184($sp)
	sw	$2,188($sp)
	beq	$5,$0,$L3630
	move	$22,$24

	lw	$2,180($sp)
	lw	$11,180($20)
	mtlo	$2
	sll	$3,$11,3
	madd	$3,$12
	lw	$2,176($sp)
	lw	$10,176($20)
	mflo	$3
	sll	$4,$10,4
	mtlo	$2
	madd	$4,$12
	lw	$8,188($sp)
	lw	$9,184($sp)
	lw	$6,1464($20)
	mflo	$4
	lw	$7,1468($20)
	lw	$5,1472($20)
	or	$2,$8,$9
	addu	$6,$6,$4
	addu	$5,$5,$3
	addu	$7,$7,$3
	andi	$2,$2,0x7
	sw	$6,236($sp)
	sw	$5,244($sp)
	beq	$2,$0,$L3623
	sw	$7,240($sp)

	move	$5,$6
	move	$6,$7
	lw	$7,244($sp)
	move	$4,$20
	sw	$10,16($sp)
	sw	$11,20($sp)
	.option	pic0
	jal	xchg_pair_border
	.option	pic2
	sw	$0,24($sp)

	lw	$10,176($20)
	lw	$11,180($20)
	lw	$24,6172($20)
$L3623:
	lw	$14,6168($20)
	lw	$15,8996($20)
	sll	$3,$14,5
	addu	$2,$15,$3
	lbu	$4,15($2)
	lw	$18,9000($20)
	sb	$4,9004($20)
	addu	$3,$18,$3
	lbu	$4,15($3)
	lw	$25,236($sp)
	sb	$4,9005($20)
	sll	$5,$10,1
	lw	$4,240($sp)
	sll	$19,$11,1
	lw	$3,244($sp)
	subu	$2,$0,$19
	subu	$12,$25,$5
	addu	$17,$4,$2
	addu	$16,$3,$2
	addu	$5,$12,$5
	li	$4,2			# 0x2
	li	$6,34			# 0x22
$L3624:
	lbu	$3,15($5)
	addu	$2,$20,$4
	addiu	$4,$4,1
	sb	$3,9004($2)
	bne	$4,$6,$L3624
	addu	$5,$5,$10

	sll	$5,$10,5
	addu	$2,$12,$5
	lw	$6,0($2)
	lw	$7,4($2)
	sll	$4,$14,5
	addu	$13,$15,$4
	sw	$6,0($13)
	sw	$7,4($13)
	addu	$2,$12,$5
	lw	$8,8($2)
	lw	$9,12($2)
	addiu	$6,$4,8
	addu	$2,$15,$6
	addu	$5,$5,$10
	sw	$8,0($2)
	sw	$9,4($2)
	addu	$5,$12,$5
	lw	$2,0($5)
	lw	$3,4($5)
	addu	$8,$18,$4
	sw	$2,0($8)
	sw	$3,4($8)
	lw	$4,56($20)
	lw	$2,8($5)
	lw	$3,12($5)
	addu	$6,$18,$6
	andi	$4,$4,0x2000
	sw	$2,0($6)
	bne	$4,$0,$L3625
	sw	$3,4($6)

	lbu	$2,23($13)
	addu	$7,$16,$19
	sb	$2,9038($20)
	lbu	$3,23($8)
	addu	$6,$17,$19
	sb	$3,9039($20)
	lbu	$2,31($13)
	move	$4,$20
	sb	$2,9056($20)
	lbu	$3,31($8)
	li	$5,2			# 0x2
	sb	$3,9057($20)
	li	$8,18			# 0x12
$L3626:
	lbu	$2,7($6)
	addiu	$5,$5,1
	sb	$2,9040($4)
	lbu	$3,7($7)
	addu	$6,$6,$11
	sb	$3,9058($4)
	addu	$7,$7,$11
	bne	$5,$8,$L3626
	addiu	$4,$4,1

	sll	$6,$11,4
	addu	$2,$17,$6
	sll	$7,$14,5
	lw	$4,0($2)
	lw	$5,4($2)
	addiu	$7,$7,16
	addu	$2,$15,$7
	sw	$4,0($2)
	sw	$5,4($2)
	addu	$3,$16,$6
	lw	$4,0($3)
	lw	$5,4($3)
	sll	$8,$14,5
	addu	$2,$15,$8
	addu	$6,$6,$11
	sw	$4,24($2)
	sw	$5,28($2)
	addu	$3,$17,$6
	lw	$4,0($3)
	lw	$5,4($3)
	addu	$7,$18,$7
	sw	$4,0($7)
	sw	$5,4($7)
	addu	$6,$16,$6
	lw	$2,0($6)
	lw	$3,4($6)
	addu	$8,$18,$8
	sw	$2,24($8)
	sw	$3,28($8)
$L3625:
	addiu	$2,$24,-1
	lw	$5,184($sp)
	sw	$2,6172($20)
	move	$4,$20
	.option	pic0
	jal	fill_caches
	.option	pic2
	li	$6,1			# 0x1

	lw	$3,1548($20)
	lw	$5,248($sp)
	lw	$8,240($sp)
	addu	$3,$3,$5
	lbu	$2,0($3)
	lw	$9,244($sp)
	addu	$2,$20,$2
	lbu	$5,12096($2)
	lw	$12,208($sp)
	sw	$5,8740($20)
	lbu	$2,0($3)
	lw	$7,236($sp)
	addu	$2,$20,$2
	lbu	$3,12352($2)
	lw	$6,232($sp)
	lw	$5,192($sp)
	sw	$8,16($sp)
	move	$4,$20
	sw	$3,8744($20)
	sw	$9,20($sp)
	sw	$12,28($sp)
	.option	pic0
	jal	filter_mb
	.option	pic2
	sw	$21,24($sp)

	lw	$2,6172($20)
	lw	$5,188($sp)
	addiu	$2,$2,1
	sw	$2,6172($20)
	move	$4,$20
	.option	pic0
	jal	fill_caches
	.option	pic2
	li	$6,1			# 0x1

	lw	$3,1548($20)
	lw	$25,248($sp)
	lw	$4,152($20)
	addu	$3,$3,$25
	addu	$3,$3,$4
	lbu	$2,0($3)
	lw	$5,192($sp)
	addu	$2,$20,$2
	lbu	$6,12096($2)
	move	$4,$20
	sw	$6,8740($20)
	lbu	$2,0($3)
	move	$6,$22
	addu	$2,$20,$2
	lbu	$3,12352($2)
	lw	$2,204($sp)
	sw	$3,8744($20)
	lw	$3,208($sp)
	move	$7,$23
	sw	$fp,16($sp)
	sw	$2,20($sp)
	sw	$21,24($sp)
	.option	pic0
	jal	filter_mb
	.option	pic2
	sw	$3,28($sp)

	lw	$28,40($sp)
$L3630:
	lw	$31,316($sp)
$L3673:
	lw	$fp,312($sp)
	lw	$23,308($sp)
	lw	$22,304($sp)
	lw	$21,300($sp)
	lw	$20,296($sp)
	lw	$19,292($sp)
	lw	$18,288($sp)
	lw	$17,284($sp)
	lw	$16,280($sp)
	j	$31
	addiu	$sp,$sp,320

$L3622:
	lw	$14,6168($20)
	lw	$15,8996($20)
	sll	$2,$14,5
	addu	$2,$15,$2
	lbu	$3,15($2)
	sb	$3,9004($20)
	lw	$6,204($sp)
	subu	$4,$0,$5
	subu	$8,$23,$21
	addu	$9,$6,$4
	addu	$10,$fp,$4
	addu	$5,$8,$21
	li	$4,1			# 0x1
	li	$6,17			# 0x11
$L3627:
	lbu	$3,15($5)
	addu	$2,$20,$4
	addiu	$4,$4,1
	sb	$3,9004($2)
	bne	$4,$6,$L3627
	addu	$5,$5,$21

	sll	$2,$21,4
	addu	$2,$8,$2
	lw	$6,0($2)
	lw	$7,4($2)
	sll	$3,$14,5
	addu	$5,$15,$3
	sw	$6,0($5)
	sw	$7,4($5)
	lw	$3,56($20)
	lw	$6,8($2)
	lw	$7,12($2)
	andi	$3,$3,0x2000
	sw	$6,8($5)
	bne	$3,$0,$L3628
	sw	$7,12($5)

	lbu	$2,23($5)
	lw	$8,208($sp)
	sb	$2,9021($20)
	lbu	$3,31($5)
	addu	$7,$10,$8
	addu	$6,$9,$8
	move	$4,$20
	sb	$3,9030($20)
	li	$5,1			# 0x1
	li	$8,9			# 0x9
$L3629:
	lbu	$2,7($7)
	addiu	$5,$5,1
	sb	$2,9022($4)
	lw	$12,208($sp)
	lbu	$3,7($6)
	addu	$7,$7,$12
	sb	$3,9031($4)
	addu	$6,$6,$12
	bne	$5,$8,$L3629
	addiu	$4,$4,1

	sll	$6,$12,3
	addu	$3,$10,$6
	lw	$4,0($3)
	lw	$5,4($3)
	sll	$2,$14,5
	addu	$2,$15,$2
	sw	$4,16($2)
	sw	$5,20($2)
	addu	$6,$9,$6
	lw	$4,0($6)
	lw	$5,4($6)
	sll	$2,$14,5
	addu	$2,$15,$2
	sw	$4,24($2)
	sw	$5,28($2)
$L3628:
	lw	$5,200($sp)
	move	$4,$20
	.option	pic0
	jal	fill_caches
	.option	pic2
	li	$6,1			# 0x1

	lw	$25,204($sp)
	lw	$2,208($sp)
	lw	$5,192($sp)
	lw	$6,196($sp)
	move	$4,$20
	move	$7,$23
	sw	$fp,16($sp)
	sw	$21,24($sp)
	sw	$25,20($sp)
	.option	pic0
	jal	filter_mb_fast
	.option	pic2
	sw	$2,28($sp)

	lw	$31,316($sp)
	lw	$28,40($sp)
	lw	$fp,312($sp)
	lw	$23,308($sp)
	lw	$22,304($sp)
	lw	$21,300($sp)
	lw	$20,296($sp)
	lw	$19,292($sp)
	lw	$18,288($sp)
	lw	$17,284($sp)
	lw	$16,280($sp)
	j	$31
	addiu	$sp,$sp,320

$L3571:
	lw	$12,220($sp)
	bne	$12,$0,$L3593
	lw	$25,200($sp)

	andi	$25,$25,0x1
	sw	$25,172($sp)
$L3592:
	lw	$25,172($sp)
$L3672:
	bne	$25,$0,$L3594
	lw	$2,220($sp)

	beq	$2,$0,$L3595
	li	$2,131072			# 0x20000

	lw	$3,200($sp)
	andi	$2,$3,0x2
	beq	$2,$0,$L3596
	li	$2,16777216			# 0x1000000

	li	$2,131072			# 0x20000
	ori	$2,$2,0x1ad8
	addu	$2,$20,$2
	sw	$2,144($sp)
	lui	$3,%hi(scan8+16)
	lui	$2,%hi(scan8)
	addiu	$16,$2,%lo(scan8)
	addiu	$22,$3,%lo(scan8+16)
	lw	$19,212($sp)
	lw	$17,144($sp)
	b	$L3599
	move	$18,$0

$L3597:
	lh	$2,0($17)
	bne	$2,$0,$L3659
	lw	$2,144($sp)

$L3598:
	addiu	$16,$16,1
	addiu	$19,$19,4
	addiu	$18,$18,32
	beq	$22,$16,$L3594
	addiu	$17,$17,32

$L3599:
	lbu	$2,0($16)
	addu	$2,$20,$2
	lbu	$3,9080($2)
	beq	$3,$0,$L3597
	lw	$6,144($sp)

	lw	$4,0($19)
	lw	$25,156($sp)
	addu	$5,$6,$18
	addu	$4,$23,$4
	jalr	$25
	move	$6,$21

	b	$L3598
	lw	$28,40($sp)

$L3653:
	beq	$7,$0,$L3555
	nop

	lw	$2,152($20)
	lw	$4,1568($20)
	subu	$2,$17,$2
	sll	$2,$2,2
	addu	$4,$4,$2
	lw	$3,0($4)
	andi	$3,$3,0x7
	bne	$3,$0,$L3669
	lw	$7,200($sp)

$L3555:
	lw	$8,176($20)
	lw	$4,176($sp)
	lw	$12,196($sp)
	li	$2,-2			# 0xfffffffffffffffe
	and	$2,$12,$2
	sll	$5,$8,4
	mtlo	$4
	lw	$9,180($20)
	madd	$5,$2
	lw	$6,180($sp)
	mflo	$5
	sll	$3,$9,3
	mtlo	$6
	madd	$3,$2
	lw	$4,1464($20)
	lw	$6,1468($20)
	lw	$7,1472($20)
	mflo	$3
	addu	$5,$4,$5
	li	$2,1			# 0x1
	addu	$7,$7,$3
	addu	$6,$6,$3
	move	$4,$20
	sw	$8,16($sp)
	sw	$9,20($sp)
	.option	pic0
	jal	xchg_pair_border
	.option	pic2
	sw	$2,24($sp)

	b	$L3554
	lw	$28,40($sp)

$L3657:
	lw	$2,8756($20)
	addiu	$2,$2,2230
	sll	$2,$2,2
	addu	$2,$20,$2
	lw	$25,4($2)
	jalr	$25
	move	$4,$fp

	lw	$2,8756($20)
	lw	$4,204($sp)
	addiu	$2,$2,2230
	sll	$2,$2,2
	addu	$2,$20,$2
	lw	$25,4($2)
	jalr	$25
	lw	$5,208($sp)

	b	$L3573
	lw	$28,40($sp)

$L3593:
	lw	$12,200($sp)
	lw	$3,6140($20)
	lw	$8,6144($20)
	lw	$7,204($sp)
	addiu	$2,$20,3492
	addiu	$9,$20,3516
	addiu	$10,$20,4552
	addiu	$11,$20,4592
	andi	$12,$12,0x1
	move	$4,$20
	move	$5,$23
	move	$6,$fp
	sw	$12,172($sp)
	sw	$3,16($sp)
	sw	$2,20($sp)
	sw	$8,24($sp)
	sw	$9,28($sp)
	sw	$10,32($sp)
	.option	pic0
	jal	hl_motion
	.option	pic2
	sw	$11,36($sp)

	b	$L3592
	lw	$28,40($sp)

$L3574:
	lw	$2,8760($20)
	move	$5,$21
	addiu	$2,$2,2236
	sll	$2,$2,2
	addu	$2,$20,$2
	lw	$25,8($2)
	jalr	$25
	move	$4,$23

	lw	$5,220($sp)
	beq	$5,$0,$L3587
	lw	$28,40($sp)

	lw	$6,216($sp)
	bne	$6,$0,$L3664
	li	$2,65536			# 0x10000

	li	$5,65536			# 0x10000
	lw	$3,2056($20)
	addu	$4,$20,$5
	lw	$2,-6332($4)
	sll	$3,$3,6
	addu	$2,$2,$3
	lw	$12,0($2)
	addiu	$10,$sp,60
	lui	$2,%hi(y_offset.10108)
	lui	$3,%hi(y_offset.10108+16)
	addiu	$11,$2,%lo(y_offset.10108)
	addiu	$13,$3,%lo(y_offset.10108+16)
	ori	$17,$5,0xdbc
	move	$9,$10
	ori	$14,$5,0xd6c
	ori	$15,$5,0xdac
	ori	$16,$5,0xd7c
$L3588:
	lw	$2,0($11)
	addiu	$11,$11,4
	addu	$6,$2,$17
	addu	$3,$2,$14
	addu	$5,$2,$15
	addu	$2,$2,$16
	sll	$3,$3,1
	sll	$5,$5,1
	sll	$2,$2,1
	sll	$6,$6,1
	addu	$3,$20,$3
	addu	$5,$20,$5
	addu	$2,$20,$2
	addu	$6,$20,$6
	lh	$7,0($3)
	lh	$4,0($5)
	lh	$3,0($2)
	lh	$5,0($6)
	subu	$8,$7,$4
	addu	$2,$5,$3
	addu	$4,$4,$7
	subu	$3,$3,$5
	subu	$6,$8,$3
	subu	$5,$4,$2
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$2,0($9)
	sw	$3,4($9)
	sw	$6,8($9)
	sw	$5,12($9)
	bne	$13,$11,$L3588
	addiu	$9,$9,16

	li	$2,65536			# 0x10000
	lui	$3,%hi(x_offset.10107)
	lui	$4,%hi(x_offset.10107+16)
	addiu	$11,$3,%lo(x_offset.10107)
	addiu	$13,$4,%lo(x_offset.10107+16)
	ori	$17,$2,0xe0c
	ori	$14,$2,0xd6c
	ori	$15,$2,0xd8c
	ori	$16,$2,0xdec
$L3589:
	lw	$6,0($10)
	lw	$5,48($10)
	lw	$2,32($10)
	lw	$3,16($10)
	subu	$7,$6,$2
	addu	$4,$5,$3
	addu	$2,$2,$6
	subu	$3,$3,$5
	subu	$6,$7,$3
	subu	$5,$2,$4
	addu	$3,$3,$7
	addu	$4,$4,$2
	mul	$4,$4,$12
	mul	$3,$3,$12
	mul	$6,$6,$12
	mul	$5,$5,$12
	lw	$2,0($11)
	addiu	$4,$4,128
	addu	$9,$2,$17
	addu	$7,$2,$14
	addu	$8,$2,$15
	addu	$2,$2,$16
	sll	$7,$7,1
	sll	$8,$8,1
	addiu	$3,$3,128
	sll	$2,$2,1
	addiu	$6,$6,128
	sll	$9,$9,1
	addiu	$5,$5,128
	addu	$7,$20,$7
	sra	$4,$4,8
	addu	$8,$20,$8
	sra	$3,$3,8
	addu	$2,$20,$2
	sra	$6,$6,8
	addu	$9,$20,$9
	sra	$5,$5,8
	addiu	$11,$11,4
	sh	$4,0($7)
	addiu	$10,$10,4
	sh	$3,0($8)
	sh	$6,0($2)
	bne	$13,$11,$L3589
	sh	$5,0($9)

	b	$L3664
	li	$2,65536			# 0x10000

$L3596:
	and	$2,$3,$2
	li	$4,4			# 0x4
	li	$5,1			# 0x1
	li	$3,131072			# 0x20000
	movn	$5,$4,$2
	ori	$3,$3,0x1ad8
	lui	$2,%hi(scan8)
	addu	$17,$20,$3
	addiu	$2,$2,%lo(scan8)
	sll	$6,$5,2
	lw	$22,212($sp)
	sw	$5,228($sp)
	sw	$2,256($sp)
	sw	$6,136($sp)
	sll	$18,$5,5
	sw	$17,140($sp)
	move	$19,$17
	move	$16,$0
$L3604:
	lw	$7,256($sp)
	move	$5,$17
	addu	$3,$7,$16
	lbu	$2,0($3)
	addu	$2,$20,$2
	lbu	$2,9080($2)
	beq	$2,$0,$L3602
	move	$6,$21

	li	$8,1			# 0x1
	bne	$2,$8,$L3603
	nop

	lh	$2,0($19)
	bne	$2,$0,$L3660
	lw	$25,224($sp)

$L3603:
	lw	$4,0($22)
	lw	$25,156($sp)
	jalr	$25
	addu	$4,$23,$4

	lw	$28,40($sp)
$L3602:
	lw	$2,228($sp)
	lw	$4,140($sp)
	addu	$16,$2,$16
	lw	$3,136($sp)
	addu	$4,$4,$18
	slt	$2,$16,16
	addu	$22,$22,$3
	sw	$4,140($sp)
	addu	$17,$17,$18
	bne	$2,$0,$L3604
	addu	$19,$19,$18

$L3594:
	lw	$2,56($20)
$L3666:
	andi	$2,$2,0x2000
	bne	$2,$0,$L3569
	nop

	lw	$9,204($sp)
	lw	$12,216($sp)
	sw	$fp,52($sp)
	beq	$12,$0,$L3608
	sw	$9,56($sp)

	lw	$25,2164($20)
	sw	$25,132($sp)
	sw	$25,128($sp)
$L3609:
	lw	$7,220($sp)
	beq	$7,$0,$L3614
	li	$2,131072			# 0x20000

	ori	$2,$2,0x1cd8
	addu	$19,$20,$2
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addiu	$8,$sp,48
	lw	$22,212($sp)
	sw	$2,256($sp)
	move	$17,$19
	move	$18,$19
	li	$16,16			# 0x10
	b	$L3617
	sw	$8,260($sp)

$L3615:
	lh	$2,0($17)
	bne	$2,$0,$L3661
	lw	$3,260($sp)

$L3616:
	addiu	$16,$16,1
	li	$2,24			# 0x18
	addiu	$22,$22,4
	addiu	$18,$18,32
	addiu	$17,$17,32
	beq	$16,$2,$L3569
	addiu	$19,$19,32

$L3617:
	lw	$9,256($sp)
	addu	$2,$9,$16
	lbu	$3,0($2)
	addu	$3,$20,$3
	lbu	$2,9080($3)
	beq	$2,$0,$L3615
	lw	$12,260($sp)

	andi	$2,$16,0x4
	addu	$2,$12,$2
	lw	$3,4($2)
	lw	$4,64($22)
	lw	$6,208($sp)
	lw	$25,132($sp)
	move	$5,$18
	jalr	$25
	addu	$4,$3,$4

	b	$L3616
	lw	$28,40($sp)

$L3661:
	andi	$2,$16,0x4
	addu	$2,$3,$2
	lw	$3,4($2)
	lw	$4,64($22)
	lw	$6,208($sp)
	lw	$25,128($sp)
	move	$5,$19
	jalr	$25
	addu	$4,$3,$4

	b	$L3616
	lw	$28,40($sp)

$L3659:
	lw	$4,0($19)
	lw	$25,224($sp)
	addu	$5,$2,$18
	addu	$4,$23,$4
	jalr	$25
	move	$6,$21

	b	$L3598
	lw	$28,40($sp)

$L3614:
	ori	$2,$2,0x1cd8
	addu	$19,$20,$2
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	lw	$18,212($sp)
	sw	$2,256($sp)
	move	$17,$19
	li	$16,16			# 0x10
	addiu	$22,$sp,48
$L3620:
	lw	$3,256($sp)
	andi	$4,$16,0x4
	addu	$2,$3,$16
	lbu	$3,0($2)
	move	$5,$17
	addu	$3,$20,$3
	lbu	$2,9080($3)
	addu	$4,$22,$4
	addiu	$16,$16,1
	addiu	$17,$17,32
	bne	$2,$0,$L3618
	lw	$6,208($sp)

	lh	$2,0($19)
	beq	$2,$0,$L3674
	li	$9,24			# 0x18

$L3618:
	lw	$3,4($4)
	lw	$2,2056($20)
	lui	$4,%hi(chroma_qp)
	addiu	$4,$4,%lo(chroma_qp)
	addu	$2,$2,$4
	lbu	$7,12($2)
	lw	$4,64($18)
	li	$8,2			# 0x2
	addiu	$7,$7,-12
	addu	$4,$3,$4
	.option	pic0
	jal	svq3_add_idct_c
	.option	pic2
	sw	$8,16($sp)

	lw	$28,40($sp)
	li	$9,24			# 0x18
$L3674:
	addiu	$19,$19,32
	bne	$16,$9,$L3620
	addiu	$18,$18,4

	b	$L3665
	li	$2,65536			# 0x10000

$L3608:
	lw	$4,152($sp)
	li	$3,1			# 0x1
	li	$2,4			# 0x4
	movn	$2,$3,$4
	addiu	$2,$2,14800
	li	$9,131072			# 0x20000
	sll	$2,$2,2
	addu	$2,$20,$2
	ori	$8,$9,0x1cd8
	lw	$3,8740($20)
	addu	$8,$20,$8
	addu	$13,$20,$9
	lw	$6,4($2)
	lh	$10,32($8)
	lh	$11,96($8)
	lh	$7,7384($13)
	lh	$4,64($8)
	sll	$3,$3,6
	addu	$6,$6,$3
	lw	$2,0($6)
	addu	$5,$11,$4
	addu	$12,$10,$7
	subu	$4,$4,$11
	subu	$7,$7,$10
	subu	$6,$7,$4
	subu	$10,$12,$5
	addu	$4,$4,$7
	addu	$5,$5,$12
	lw	$7,152($sp)
	mul	$6,$6,$2
	mul	$5,$5,$2
	mul	$4,$4,$2
	mul	$10,$10,$2
	li	$3,5			# 0x5
	li	$2,2			# 0x2
	movn	$3,$2,$7
	addiu	$3,$3,14800
	sll	$3,$3,2
	sra	$5,$5,7
	sra	$4,$4,7
	sra	$10,$10,7
	sra	$6,$6,7
	addu	$3,$20,$3
	ori	$9,$9,0x1d58
	lw	$7,8744($20)
	sh	$5,7384($13)
	addu	$9,$20,$9
	sh	$4,32($8)
	sh	$6,96($8)
	sh	$10,64($8)
	lw	$5,4($3)
	lh	$6,7512($13)
	lh	$8,32($9)
	lh	$2,64($9)
	lh	$10,96($9)
	sll	$7,$7,6
	addu	$5,$5,$7
	lw	$4,0($5)
	addu	$11,$8,$6
	addu	$3,$10,$2
	subu	$6,$6,$8
	subu	$2,$2,$10
	subu	$5,$6,$2
	subu	$7,$11,$3
	addu	$2,$2,$6
	addu	$3,$3,$11
	mul	$5,$5,$4
	mul	$3,$3,$4
	mul	$2,$2,$4
	mul	$7,$7,$4
	lw	$6,5124($20)
	lw	$4,5116($20)
	sra	$3,$3,7
	sra	$2,$2,7
	sra	$7,$7,7
	sra	$5,$5,7
	sh	$3,7512($13)
	sw	$4,132($sp)
	sw	$6,128($sp)
	sh	$5,96($9)
	sh	$2,32($9)
	b	$L3609
	sh	$7,64($9)

$L3595:
	lw	$5,152($sp)
	ori	$2,$2,0x1ad8
	addu	$19,$20,$2
	lui	$3,%hi(scan8+16)
	lui	$2,%hi(scan8)
	sltu	$5,$0,$5
	lw	$18,212($sp)
	addiu	$16,$2,%lo(scan8)
	addiu	$22,$3,%lo(scan8+16)
	move	$17,$19
	sw	$5,264($sp)
$L3607:
	lbu	$2,0($16)
	move	$5,$17
	addu	$2,$20,$2
	lbu	$3,9080($2)
	addiu	$16,$16,1
	addiu	$17,$17,32
	bne	$3,$0,$L3605
	move	$6,$21

	lh	$2,0($19)
	beq	$2,$0,$L3606
	nop

$L3605:
	lw	$4,0($18)
	lw	$7,2056($20)
	lw	$8,264($sp)
	addu	$4,$23,$4
	.option	pic0
	jal	svq3_add_idct_c
	.option	pic2
	sw	$8,16($sp)

	lw	$28,40($sp)
$L3606:
	addiu	$19,$19,32
	bne	$22,$16,$L3607
	addiu	$18,$18,4

	b	$L3666
	lw	$2,56($20)

$L3546:
	sll	$3,$6,3
	addu	$3,$3,$2
	sll	$4,$5,5
	sll	$2,$5,3
	addu	$8,$2,$4
	addu	$10,$20,$3
	move	$5,$14
$L3548:
	lbu	$2,0($5)
	addiu	$5,$5,4
	addu	$3,$10,$2
	lb	$4,9456($3)
	addu	$2,$8,$2
	addiu	$3,$4,16
	bltz	$4,$L3547
	addu	$7,$11,$2

	lw	$2,6172($20)
	andi	$2,$2,0x1
	xor	$2,$3,$2
	sll	$3,$2,8
	addu	$3,$3,$2
	andi	$3,$3,0xffff
	sh	$3,8($7)
	sh	$3,0($7)
$L3547:
	bne	$15,$5,$L3548
	nop

	b	$L3667
	lw	$2,5944($18)

$L3576:
	ori	$2,$2,0x1ad8
	addu	$2,$20,$2
	sw	$2,148($sp)
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	sw	$2,256($sp)
	lw	$5,148($sp)
	li	$2,4			# 0x4
	li	$6,3			# 0x3
	subu	$2,$2,$21
	subu	$6,$6,$21
	addiu	$7,$sp,48
	sw	$2,268($sp)
	lw	$19,212($sp)
	sw	$5,160($sp)
	move	$17,$0
	move	$18,$0
	sw	$6,272($sp)
	b	$L3586
	sw	$7,276($sp)

$L3663:
	li	$12,7			# 0x7
	beq	$6,$12,$L3580
	move	$5,$0

$L3581:
	addiu	$2,$6,2204
	sll	$2,$2,2
	addu	$2,$20,$2
	lw	$25,4($2)
	move	$4,$16
	jalr	$25
	move	$6,$21

	lbu	$2,9080($22)
	beq	$2,$0,$L3583
	lw	$28,40($sp)

	lw	$3,220($sp)
	beq	$3,$0,$L3584
	li	$4,1			# 0x1

	bne	$2,$4,$L3675
	lw	$2,148($sp)

	lw	$5,160($sp)
	lh	$2,0($5)
	bne	$2,$0,$L3662
	lw	$2,148($sp)

$L3675:
	lw	$25,156($sp)
	move	$4,$16
	addu	$5,$2,$18
	jalr	$25
	move	$6,$21

	lw	$28,40($sp)
$L3583:
	lw	$3,160($sp)
	addiu	$17,$17,1
	addiu	$3,$3,32
	li	$4,16			# 0x10
	addiu	$19,$19,4
	addiu	$18,$18,32
	beq	$17,$4,$L3575
	sw	$3,160($sp)

$L3586:
	lw	$8,256($sp)
	lw	$4,0($19)
	addu	$2,$8,$17
	lbu	$3,0($2)
	li	$9,3			# 0x3
	addu	$22,$20,$3
	lb	$6,8776($22)
	bne	$6,$9,$L3663
	addu	$16,$23,$4

$L3580:
	lw	$2,8988($20)
	sll	$2,$2,$17
	andi	$2,$2,0x8000
	bne	$2,$0,$L3582
	lw	$2,268($sp)

	lw	$25,272($sp)
	lw	$5,276($sp)
	addu	$2,$16,$25
	lbu	$4,0($2)
	sll	$2,$4,8
	addu	$2,$2,$4
	sll	$3,$2,16
	addu	$2,$2,$3
	b	$L3581
	sw	$2,48($sp)

$L3582:
	b	$L3581
	addu	$5,$16,$2

$L3584:
	lw	$2,148($sp)
	lw	$7,2056($20)
	move	$4,$16
	addu	$5,$2,$18
	move	$6,$21
	.option	pic0
	jal	svq3_add_idct_c
	.option	pic2
	sw	$0,16($sp)

	b	$L3583
	lw	$28,40($sp)

$L3660:
	lw	$4,0($22)
	lw	$5,140($sp)
	jalr	$25
	addu	$4,$23,$4

	b	$L3602
	lw	$28,40($sp)

$L3656:
	lw	$7,204($sp)
	li	$2,1			# 0x1
	move	$4,$20
	move	$5,$23
	move	$6,$fp
	sw	$2,24($sp)
	sw	$21,16($sp)
	sw	$8,20($sp)
	.option	pic0
	jal	xchg_mb_border
	.option	pic2
	sw	$0,28($sp)

	b	$L3572
	lw	$28,40($sp)

$L3658:
	lw	$25,224($sp)
	jalr	$25
	move	$5,$22

	b	$L3577
	lw	$28,40($sp)

$L3587:
	lw	$3,2056($20)
	lui	$2,%hi(svq3_dequant_coeff)
	addiu	$2,$2,%lo(svq3_dequant_coeff)
	sll	$3,$3,2
	addu	$3,$3,$2
	li	$2,131072			# 0x20000
	ori	$2,$2,0x1ad8
	lw	$18,0($3)
	addiu	$16,$sp,60
	addu	$15,$20,$2
	lui	$3,%hi(y_offset.17473)
	lui	$2,%hi(y_offset.17473+16)
	addiu	$17,$3,%lo(y_offset.17473)
	addiu	$19,$2,%lo(y_offset.17473+16)
	move	$14,$16
$L3590:
	lw	$2,0($17)
	addiu	$17,$17,4
	addiu	$3,$2,64
	addiu	$5,$2,80
	sll	$4,$2,1
	sll	$3,$3,1
	addiu	$2,$2,16
	addu	$4,$15,$4
	addu	$3,$15,$3
	sll	$2,$2,1
	sll	$5,$5,1
	lh	$8,0($4)
	lh	$6,0($3)
	addu	$2,$15,$2
	addu	$5,$15,$5
	lh	$10,0($2)
	lh	$7,0($5)
	subu	$11,$8,$6
	addu	$6,$6,$8
	sll	$12,$6,2
	sll	$5,$6,4
	sll	$13,$11,2
	sll	$8,$11,4
	sll	$9,$7,4
	sll	$3,$10,3
	sll	$2,$7,3
	sll	$4,$10,4
	addu	$4,$4,$10
	subu	$5,$5,$12
	subu	$8,$8,$13
	subu	$2,$2,$7
	addu	$9,$9,$7
	subu	$3,$3,$10
	addu	$5,$5,$6
	addu	$8,$8,$11
	subu	$3,$3,$9
	addu	$2,$2,$4
	subu	$6,$8,$3
	subu	$4,$5,$2
	addu	$3,$3,$8
	addu	$2,$2,$5
	sw	$2,0($14)
	sw	$3,4($14)
	sw	$6,8($14)
	sw	$4,12($14)
	bne	$19,$17,$L3590
	addiu	$14,$14,16

	lui	$2,%hi(x_offset.17472)
	lui	$3,%hi(x_offset.17472+16)
	addiu	$14,$2,%lo(x_offset.17472)
	addiu	$17,$3,%lo(x_offset.17472+16)
	li	$19,524288			# 0x80000
$L3591:
	lw	$2,0($16)
	lw	$4,32($16)
	lw	$10,16($16)
	lw	$6,48($16)
	subu	$11,$2,$4
	addu	$4,$4,$2
	sll	$12,$4,2
	sll	$7,$4,4
	sll	$3,$6,3
	sll	$5,$10,4
	addu	$5,$5,$10
	subu	$3,$3,$6
	subu	$7,$7,$12
	addu	$7,$7,$4
	addu	$3,$3,$5
	sll	$2,$10,3
	subu	$2,$2,$10
	subu	$10,$7,$3
	addu	$3,$3,$7
	sll	$9,$6,4
	mul	$5,$3,$18
	sll	$13,$11,2
	sll	$8,$11,4
	addu	$9,$9,$6
	subu	$8,$8,$13
	addu	$8,$8,$11
	subu	$2,$2,$9
	subu	$9,$8,$2
	addu	$2,$2,$8
	addu	$3,$5,$19
	mul	$6,$9,$18
	mul	$5,$2,$18
	mul	$8,$10,$18
	lw	$4,0($14)
	addu	$2,$5,$19
	addiu	$7,$4,160
	addiu	$5,$4,32
	addu	$9,$6,$19
	addiu	$6,$4,128
	addu	$10,$8,$19
	sll	$5,$5,1
	sll	$6,$6,1
	sll	$7,$7,1
	sll	$4,$4,1
	addu	$4,$15,$4
	sra	$3,$3,20
	addu	$5,$15,$5
	sra	$2,$2,20
	addu	$6,$15,$6
	sra	$9,$9,20
	addu	$7,$15,$7
	sra	$10,$10,20
	addiu	$14,$14,4
	sh	$3,0($4)
	addiu	$16,$16,4
	sh	$2,0($5)
	sh	$9,0($6)
	bne	$17,$14,$L3591
	sh	$10,0($7)

	b	$L3664
	li	$2,65536			# 0x10000

$L3662:
	lw	$6,148($sp)
	lw	$25,224($sp)
	addu	$5,$6,$18
	move	$4,$16
	jalr	$25
	move	$6,$21

	b	$L3583
	lw	$28,40($sp)

	.set	macro
	.set	reorder
	.end	hl_decode_mb_complex
	.align	2
	.ent	hl_decode_mb
	.type	hl_decode_mb, @function
hl_decode_mb:
	.set	nomips16
	.frame	$sp,248,$31		# vars= 160, regs= 10/0, args= 40, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-248
	sw	$31,244($sp)
	sw	$fp,240($sp)
	sw	$23,236($sp)
	sw	$22,232($sp)
	sw	$21,228($sp)
	sw	$20,224($sp)
	sw	$19,220($sp)
	sw	$18,216($sp)
	sw	$17,212($sp)
	sw	$16,208($sp)
	.cprestore	40
	lw	$2,6168($4)
	lw	$3,6172($4)
	move	$22,$4
	lw	$4,152($4)
	mtlo	$2
	madd	$3,$4
	sw	$3,176($sp)
	mflo	$4
	lw	$3,1568($22)
	sw	$2,180($sp)
	sll	$4,$4,2
	li	$2,65536			# 0x10000
	addu	$5,$22,$2
	addu	$3,$3,$4
	lw	$3,0($3)
	lw	$2,-6276($5)
	bne	$2,$0,$L3677
	sw	$3,172($sp)

	lw	$2,-6272($5)
	beq	$2,$0,$L3756
	andi	$2,$3,0x4

$L3677:
	li	$3,1			# 0x1
$L3678:
	lw	$2,2136($22)
	beq	$2,$0,$L3769
	lw	$31,244($sp)

	bne	$3,$0,$L3757
	nop

	lw	$2,2056($22)
	beq	$2,$0,$L3681
	nop

	sw	$0,152($sp)
$L3682:
	lw	$5,176($22)
	lw	$4,180($sp)
	lw	$7,180($sp)
	andi	$3,$4,0x3
	sll	$4,$5,2
	mul	$4,$4,$3
	lw	$3,180($sp)
	lw	$6,1464($22)
	mtlo	$3
	lw	$3,176($sp)
	lw	$25,5148($22)
	madd	$3,$5
	lw	$3,180($22)
	mflo	$2
	mtlo	$7
	lw	$7,176($sp)
	sll	$2,$2,4
	madd	$7,$3
	addu	$6,$6,$2
	mflo	$3
	lw	$7,1468($22)
	lw	$2,1472($22)
	sll	$3,$3,3
	addu	$2,$2,$3
	addu	$7,$7,$3
	addiu	$4,$4,64
	addu	$4,$6,$4
	sw	$6,164($sp)
	sw	$2,156($sp)
	li	$6,4			# 0x4
	jalr	$25
	sw	$7,160($sp)

	lw	$4,6168($22)
	lw	$2,180($22)
	andi	$4,$4,0x7
	mul	$4,$4,$2
	lw	$3,156($sp)
	lw	$2,160($sp)
	lw	$25,5148($22)
	addiu	$4,$4,64
	addu	$4,$2,$4
	subu	$5,$3,$2
	jalr	$25
	li	$6,2			# 0x2

	lw	$4,176($22)
	lw	$23,180($22)
	lw	$5,152($sp)
	sw	$4,140($sp)
	sw	$4,9756($22)
	beq	$5,$0,$L3683
	sw	$23,9760($22)

	lw	$6,172($sp)
	li	$2,16777216			# 0x1000000
	and	$2,$6,$2
	beq	$2,$0,$L3684
	nop

	lw	$7,2160($22)
	sw	$7,148($sp)
	sw	$7,136($sp)
$L3685:
	lw	$6,172($sp)
	andi	$6,$6,0x7
	beq	$6,$0,$L3687
	sw	$6,168($sp)

	li	$2,65536			# 0x10000
	addu	$4,$22,$2
	lw	$3,5340($4)
	bne	$3,$0,$L3758
	li	$2,2			# 0x2

$L3688:
	lw	$2,8756($22)
	lw	$4,160($sp)
	addiu	$2,$2,2230
	sll	$2,$2,2
	addu	$2,$22,$2
	lw	$25,4($2)
	jalr	$25
	move	$5,$23

	lw	$2,8756($22)
	lw	$4,156($sp)
	addiu	$2,$2,2230
	sll	$2,$2,2
	addu	$2,$22,$2
	lw	$25,4($2)
	lw	$2,172($sp)
	move	$5,$23
	andi	$2,$2,0x1
	jalr	$25
	sw	$2,144($sp)

	lw	$3,144($sp)
	beq	$3,$0,$L3696
	lw	$4,172($sp)

	li	$2,16777216			# 0x1000000
	and	$2,$4,$2
	beq	$2,$0,$L3697
	li	$2,131072			# 0x20000

	ori	$2,$2,0x1ad8
	addu	$21,$22,$2
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	sw	$2,184($sp)
	move	$20,$22
	move	$fp,$21
	move	$19,$21
	move	$17,$0
$L3700:
	lw	$5,184($sp)
	lw	$4,9548($20)
	addu	$2,$5,$17
	lbu	$3,0($2)
	lw	$7,164($sp)
	addu	$3,$22,$3
	lb	$2,8776($3)
	lw	$5,8980($22)
	addiu	$2,$2,2218
	lw	$6,8988($22)
	sll	$2,$2,2
	addu	$2,$22,$2
	addu	$16,$7,$4
	sll	$5,$5,$17
	sll	$6,$6,$17
	lw	$25,4($2)
	lbu	$18,9080($3)
	lw	$7,140($sp)
	andi	$5,$5,0x8000
	andi	$6,$6,0x4000
	jalr	$25
	move	$4,$16

	lw	$28,40($sp)
	move	$4,$16
	move	$5,$19
	beq	$18,$0,$L3698
	lw	$6,140($sp)

	li	$8,1			# 0x1
	bne	$18,$8,$L3770
	lw	$25,136($sp)

	lh	$2,0($21)
	bne	$2,$0,$L3759
	nop

$L3770:
	jalr	$25
	nop

	lw	$28,40($sp)
$L3698:
	addiu	$17,$17,4
	li	$2,16			# 0x10
	addiu	$20,$20,16
	addiu	$fp,$fp,128
	addiu	$19,$19,128
	bne	$17,$2,$L3700
	addiu	$21,$21,128

$L3701:
	li	$2,65536			# 0x10000
	addu	$4,$22,$2
	lw	$3,5340($4)
	bne	$3,$0,$L3760
	li	$2,2			# 0x2

$L3710:
	lw	$3,144($sp)
$L3773:
	bne	$3,$0,$L3771
	lw	$4,160($sp)

	lw	$4,172($sp)
	andi	$2,$4,0x2
	beq	$2,$0,$L3719
	lw	$3,172($sp)

	li	$2,131072			# 0x20000
	ori	$2,$2,0x1ad8
	addu	$20,$22,$2
	lui	$3,%hi(scan8+16)
	addiu	$21,$3,%lo(scan8+16)
	lw	$16,184($sp)
	move	$19,$22
	move	$17,$20
	b	$L3722
	move	$18,$0

$L3720:
	lh	$2,0($17)
	bne	$2,$0,$L3761
	lw	$2,164($sp)

$L3721:
	addiu	$16,$16,1
	addiu	$19,$19,4
	addiu	$18,$18,32
	beq	$21,$16,$L3718
	addiu	$17,$17,32

$L3722:
	lbu	$2,0($16)
	addu	$2,$22,$2
	lbu	$3,9080($2)
	beq	$3,$0,$L3720
	lw	$6,164($sp)

	lw	$4,9548($19)
	lw	$25,136($sp)
	addu	$4,$6,$4
	lw	$6,140($sp)
	jalr	$25
	addu	$5,$20,$18

	b	$L3721
	lw	$28,40($sp)

$L3764:
	li	$2,65536			# 0x10000
	addu	$2,$22,$2
	lw	$3,5340($2)
	beq	$3,$0,$L3739
	lw	$6,140($sp)

	lw	$8,6168($22)
	lw	$9,8996($22)
	sll	$2,$8,5
	addu	$2,$9,$2
	lbu	$4,15($2)
	lw	$5,164($sp)
	sb	$4,9004($22)
	lw	$25,156($sp)
	lw	$2,160($sp)
	subu	$3,$0,$23
	subu	$7,$5,$6
	addu	$5,$7,$6
	addu	$11,$25,$3
	addu	$10,$2,$3
	li	$4,1			# 0x1
	li	$6,17			# 0x11
$L3737:
	lbu	$3,15($5)
	addu	$2,$22,$4
	sb	$3,9004($2)
	lw	$3,140($sp)
	addiu	$4,$4,1
	bne	$4,$6,$L3737
	addu	$5,$5,$3

	sll	$2,$3,4
	addu	$2,$7,$2
	lw	$4,0($2)
	lw	$5,4($2)
	sll	$6,$8,5
	addu	$6,$9,$6
	sw	$4,0($6)
	sw	$5,4($6)
	lw	$4,8($2)
	lw	$5,12($2)
	lbu	$3,23($6)
	sw	$4,8($6)
	sw	$5,12($6)
	sb	$3,9021($22)
	lbu	$2,31($6)
	addu	$7,$10,$23
	addu	$5,$11,$23
	sb	$2,9030($22)
	li	$4,1			# 0x1
	li	$6,9			# 0x9
$L3738:
	lbu	$2,7($7)
	addiu	$4,$4,1
	sb	$2,9022($21)
	lbu	$3,7($5)
	addu	$7,$7,$23
	sb	$3,9031($21)
	addu	$5,$5,$23
	bne	$4,$6,$L3738
	addiu	$21,$21,1

	sll	$6,$23,3
	addu	$3,$10,$6
	lw	$4,0($3)
	lw	$5,4($3)
	sll	$2,$8,5
	addu	$2,$9,$2
	addu	$6,$11,$6
	sw	$4,16($2)
	sw	$5,20($2)
	lw	$5,4($6)
	sll	$2,$8,5
	lw	$4,0($6)
	addu	$2,$9,$2
	sw	$5,28($2)
	lw	$5,172($sp)
	sw	$4,24($2)
	li	$6,1			# 0x1
	.option	pic0
	jal	fill_caches
	.option	pic2
	move	$4,$22

	lw	$8,160($sp)
	lw	$25,156($sp)
	lw	$2,140($sp)
	lw	$5,180($sp)
	lw	$6,176($sp)
	lw	$7,164($sp)
	move	$4,$22
	sw	$8,16($sp)
	sw	$25,20($sp)
	sw	$2,24($sp)
	.option	pic0
	jal	filter_mb_fast
	.option	pic2
	sw	$23,28($sp)

	lw	$28,40($sp)
$L3739:
	lw	$31,244($sp)
$L3769:
	lw	$fp,240($sp)
	lw	$23,236($sp)
	lw	$22,232($sp)
	lw	$21,228($sp)
	lw	$20,224($sp)
	lw	$19,220($sp)
	lw	$18,216($sp)
	lw	$17,212($sp)
	lw	$16,208($sp)
	j	$31
	addiu	$sp,$sp,248

$L3756:
	bne	$2,$0,$L3678
	li	$3,1			# 0x1

	lw	$3,44($22)
	li	$2,28			# 0x1c
	bne	$3,$2,$L3678
	li	$3,1			# 0x1

	lw	$2,56($22)
	andi	$2,$2,0x2000
	bne	$2,$0,$L3678
	nop

	lw	$2,52($22)
	b	$L3678
	sltu	$3,$0,$2

$L3757:
	.option	pic0
	jal	hl_decode_mb_complex
	.option	pic2
	move	$4,$22

	lw	$31,244($sp)
	lw	$28,40($sp)
	lw	$fp,240($sp)
	lw	$23,236($sp)
	lw	$22,232($sp)
	lw	$21,228($sp)
	lw	$20,224($sp)
	lw	$19,220($sp)
	lw	$18,216($sp)
	lw	$17,212($sp)
	lw	$16,208($sp)
	j	$31
	addiu	$sp,$sp,248

$L3681:
	lw	$2,9924($22)
	sltu	$2,$0,$2
	b	$L3682
	sw	$2,152($sp)

$L3719:
	li	$2,16777216			# 0x1000000
	and	$2,$3,$2
	li	$4,4			# 0x4
	li	$fp,1			# 0x1
	li	$3,131072			# 0x20000
	movn	$fp,$4,$2
	ori	$3,$3,0x1ad8
	addu	$21,$22,$3
	sll	$4,$fp,2
	sw	$4,132($sp)
	move	$19,$22
	sll	$18,$fp,5
	move	$17,$21
	move	$20,$21
	move	$16,$0
$L3727:
	lw	$5,184($sp)
	lw	$6,140($sp)
	addu	$3,$5,$16
	lbu	$2,0($3)
	addu	$2,$22,$2
	lbu	$2,9080($2)
	beq	$2,$0,$L3725
	move	$5,$17

	li	$7,1			# 0x1
	bne	$2,$7,$L3726
	nop

	lh	$2,0($20)
	bne	$2,$0,$L3762
	lw	$8,164($sp)

$L3726:
	lw	$4,9548($19)
	lw	$2,164($sp)
	lw	$25,136($sp)
	jalr	$25
	addu	$4,$2,$4

	lw	$28,40($sp)
$L3725:
	addu	$16,$fp,$16
	lw	$3,132($sp)
	slt	$2,$16,16
	addu	$19,$19,$3
	addu	$21,$21,$18
	addu	$17,$17,$18
	bne	$2,$0,$L3727
	addu	$20,$20,$18

$L3718:
	lw	$4,160($sp)
$L3771:
	lw	$5,156($sp)
	lw	$6,152($sp)
	sw	$4,52($sp)
	beq	$6,$0,$L3728
	sw	$5,56($sp)

	lw	$fp,2164($22)
	sw	$fp,128($sp)
$L3729:
	li	$2,131072			# 0x20000
	ori	$2,$2,0x1cd8
	addu	$19,$22,$2
	addiu	$5,$sp,48
	move	$21,$22
	move	$17,$19
	move	$18,$22
	move	$20,$19
	li	$16,16			# 0x10
	b	$L3736
	sw	$5,188($sp)

$L3734:
	lh	$2,0($17)
	bne	$2,$0,$L3763
	lw	$3,188($sp)

$L3735:
	addiu	$16,$16,1
	li	$2,24			# 0x18
	addiu	$18,$18,4
	addiu	$19,$19,32
	addiu	$17,$17,32
	beq	$16,$2,$L3764
	addiu	$20,$20,32

$L3736:
	lw	$6,184($sp)
	addu	$2,$6,$16
	lbu	$3,0($2)
	addu	$3,$22,$3
	lbu	$2,9080($3)
	beq	$2,$0,$L3734
	lw	$7,188($sp)

	andi	$2,$16,0x4
	addu	$2,$7,$2
	lw	$3,4($2)
	lw	$4,9612($18)
	move	$5,$19
	addu	$4,$3,$4
	move	$25,$fp
	jalr	$25
	move	$6,$23

	b	$L3735
	lw	$28,40($sp)

$L3763:
	andi	$2,$16,0x4
	addu	$2,$3,$2
	lw	$3,4($2)
	lw	$4,9612($18)
	lw	$25,128($sp)
	move	$5,$20
	addu	$4,$3,$4
	jalr	$25
	move	$6,$23

	b	$L3735
	lw	$28,40($sp)

$L3761:
	lw	$4,9548($19)
	lw	$6,140($sp)
	lw	$25,148($sp)
	addu	$5,$20,$18
	jalr	$25
	addu	$4,$2,$4

	b	$L3721
	lw	$28,40($sp)

$L3728:
	lw	$7,168($sp)
	li	$3,1			# 0x1
	li	$2,4			# 0x4
	movn	$2,$3,$7
	addiu	$2,$2,14800
	li	$9,131072			# 0x20000
	sll	$2,$2,2
	addu	$2,$22,$2
	ori	$7,$9,0x1cd8
	lw	$5,8740($22)
	addu	$7,$22,$7
	addu	$12,$22,$9
	lw	$6,4($2)
	lh	$10,32($7)
	lh	$8,96($7)
	lh	$3,7384($12)
	lh	$4,64($7)
	sll	$5,$5,6
	addu	$6,$6,$5
	lw	$2,0($6)
	addu	$11,$10,$3
	addu	$5,$8,$4
	subu	$3,$3,$10
	subu	$4,$4,$8
	subu	$10,$11,$5
	subu	$6,$3,$4
	addu	$5,$5,$11
	addu	$4,$4,$3
	lw	$8,168($sp)
	mul	$6,$6,$2
	mul	$5,$5,$2
	mul	$4,$4,$2
	mul	$10,$10,$2
	li	$3,5			# 0x5
	li	$2,2			# 0x2
	movn	$3,$2,$8
	addiu	$3,$3,14800
	sll	$3,$3,2
	sra	$5,$5,7
	sra	$4,$4,7
	sra	$10,$10,7
	sra	$6,$6,7
	addu	$3,$22,$3
	ori	$9,$9,0x1d58
	lw	$8,8744($22)
	sh	$5,7384($12)
	addu	$9,$22,$9
	sh	$6,96($7)
	sh	$4,32($7)
	sh	$10,64($7)
	lw	$6,4($3)
	lh	$5,7512($12)
	lh	$7,32($9)
	lh	$2,64($9)
	lh	$10,96($9)
	sll	$8,$8,6
	addu	$6,$6,$8
	lw	$4,0($6)
	addu	$11,$7,$5
	addu	$3,$10,$2
	subu	$5,$5,$7
	subu	$2,$2,$10
	subu	$7,$11,$3
	subu	$6,$5,$2
	addu	$3,$3,$11
	addu	$2,$2,$5
	mul	$6,$6,$4
	mul	$3,$3,$4
	mul	$2,$2,$4
	mul	$7,$7,$4
	lw	$4,5124($22)
	sra	$3,$3,7
	sra	$2,$2,7
	sra	$7,$7,7
	sra	$6,$6,7
	sh	$3,7512($12)
	lw	$fp,5116($22)
	sw	$4,128($sp)
	sh	$6,96($9)
	sh	$2,32($9)
	b	$L3729
	sh	$7,64($9)

$L3683:
	lw	$25,172($sp)
	li	$2,16777216			# 0x1000000
	and	$2,$25,$2
	beq	$2,$0,$L3686
	nop

	lw	$2,5128($22)
	lw	$3,5120($22)
	sw	$2,148($sp)
	b	$L3685
	sw	$3,136($sp)

$L3687:
	lw	$3,6140($22)
	lw	$11,6144($22)
	lw	$5,164($sp)
	lw	$6,160($sp)
	lw	$7,156($sp)
	addiu	$2,$22,3492
	addiu	$8,$22,3516
	addiu	$9,$22,4552
	addiu	$10,$22,4592
	move	$4,$22
	sw	$2,20($sp)
	sw	$3,16($sp)
	sw	$11,24($sp)
	sw	$8,28($sp)
	sw	$9,32($sp)
	.option	pic0
	jal	hl_motion
	.option	pic2
	sw	$10,36($sp)

	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	sw	$2,184($sp)
	lw	$2,172($sp)
	lw	$28,40($sp)
	andi	$2,$2,0x1
	b	$L3710
	sw	$2,144($sp)

$L3684:
	lw	$8,2164($22)
	sw	$8,148($sp)
	b	$L3685
	sw	$8,136($sp)

$L3686:
	lw	$4,5124($22)
	lw	$5,5116($22)
	sw	$4,148($sp)
	b	$L3685
	sw	$5,136($sp)

$L3697:
	ori	$2,$2,0x1ad8
	addu	$fp,$22,$2
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	lw	$3,140($sp)
	sw	$2,184($sp)
	li	$4,3			# 0x3
	li	$2,4			# 0x4
	subu	$2,$2,$3
	subu	$4,$4,$3
	addiu	$5,$sp,48
	sw	$2,192($sp)
	move	$19,$22
	move	$20,$fp
	move	$21,$fp
	move	$17,$0
	sw	$4,196($sp)
	b	$L3707
	sw	$5,200($sp)

$L3766:
	li	$25,7			# 0x7
	beq	$6,$25,$L3702
	move	$5,$0

$L3703:
	addiu	$2,$6,2204
	sll	$2,$2,2
	addu	$2,$22,$2
	lw	$25,4($2)
	lw	$6,140($sp)
	jalr	$25
	move	$4,$16

	lbu	$2,9080($18)
	beq	$2,$0,$L3705
	lw	$28,40($sp)

	li	$5,1			# 0x1
	bne	$2,$5,$L3772
	lw	$6,140($sp)

	lh	$2,0($21)
	bne	$2,$0,$L3765
	lw	$25,148($sp)

$L3772:
	lw	$25,136($sp)
	move	$4,$16
	jalr	$25
	move	$5,$20

	lw	$28,40($sp)
$L3705:
	addiu	$17,$17,1
	li	$2,16			# 0x10
	addiu	$19,$19,4
	addiu	$fp,$fp,32
	addiu	$20,$20,32
	beq	$17,$2,$L3701
	addiu	$21,$21,32

$L3707:
	lw	$6,184($sp)
	lw	$4,9548($19)
	addu	$2,$6,$17
	lbu	$3,0($2)
	lw	$7,164($sp)
	addu	$18,$22,$3
	lb	$6,8776($18)
	li	$8,3			# 0x3
	bne	$6,$8,$L3766
	addu	$16,$7,$4

$L3702:
	lw	$2,8988($22)
	sll	$2,$2,$17
	andi	$2,$2,0x8000
	bne	$2,$0,$L3704
	lw	$3,196($sp)

	lw	$5,200($sp)
	addu	$2,$16,$3
	lbu	$4,0($2)
	sll	$2,$4,8
	addu	$2,$2,$4
	sll	$3,$2,16
	addu	$2,$2,$3
	b	$L3703
	sw	$2,48($sp)

$L3704:
	lw	$4,192($sp)
	b	$L3703
	addu	$5,$16,$4

$L3765:
	move	$4,$16
	jalr	$25
	move	$5,$fp

	b	$L3705
	lw	$28,40($sp)

$L3696:
	lw	$2,8760($22)
	lw	$4,164($sp)
	addiu	$2,$2,2236
	sll	$2,$2,2
	addu	$2,$22,$2
	lw	$25,8($2)
	jalr	$25
	lw	$5,140($sp)

	lw	$3,152($sp)
	bne	$3,$0,$L3755
	lw	$28,40($sp)

	li	$5,65536			# 0x10000
	lw	$3,2056($22)
	addu	$4,$22,$5
	lw	$2,-6332($4)
	sll	$3,$3,6
	addu	$2,$2,$3
	lw	$12,0($2)
	addiu	$11,$sp,60
	lui	$2,%hi(y_offset.10108)
	lui	$3,%hi(y_offset.10108+16)
	addiu	$10,$2,%lo(y_offset.10108)
	addiu	$16,$3,%lo(y_offset.10108+16)
	ori	$17,$5,0xdbc
	move	$9,$11
	ori	$13,$5,0xd6c
	ori	$14,$5,0xdac
	ori	$15,$5,0xd7c
$L3708:
	lw	$3,0($10)
	addiu	$10,$10,4
	addu	$6,$3,$17
	addu	$2,$3,$13
	addu	$5,$3,$14
	addu	$3,$3,$15
	sll	$2,$2,1
	sll	$5,$5,1
	sll	$3,$3,1
	sll	$6,$6,1
	addu	$2,$22,$2
	addu	$5,$22,$5
	addu	$3,$22,$3
	addu	$6,$22,$6
	lh	$7,0($2)
	lh	$4,0($5)
	lh	$2,0($3)
	lh	$5,0($6)
	subu	$8,$7,$4
	addu	$3,$5,$2
	addu	$4,$4,$7
	subu	$2,$2,$5
	subu	$6,$8,$2
	subu	$5,$4,$3
	addu	$2,$2,$8
	addu	$3,$3,$4
	sw	$3,0($9)
	sw	$2,4($9)
	sw	$6,8($9)
	sw	$5,12($9)
	bne	$16,$10,$L3708
	addiu	$9,$9,16

	li	$2,65536			# 0x10000
	lui	$3,%hi(x_offset.10107)
	lui	$4,%hi(x_offset.10107+16)
	addiu	$10,$3,%lo(x_offset.10107)
	addiu	$16,$4,%lo(x_offset.10107+16)
	ori	$17,$2,0xe0c
	ori	$13,$2,0xd6c
	ori	$14,$2,0xd8c
	ori	$15,$2,0xdec
$L3709:
	lw	$6,0($11)
	lw	$5,48($11)
	lw	$2,32($11)
	lw	$3,16($11)
	subu	$7,$6,$2
	addu	$4,$5,$3
	addu	$2,$2,$6
	subu	$3,$3,$5
	subu	$6,$7,$3
	subu	$5,$2,$4
	addu	$3,$3,$7
	addu	$4,$4,$2
	mul	$4,$4,$12
	mul	$3,$3,$12
	mul	$6,$6,$12
	mul	$5,$5,$12
	lw	$2,0($10)
	addiu	$4,$4,128
	addu	$9,$2,$17
	addu	$7,$2,$13
	addu	$8,$2,$14
	addu	$2,$2,$15
	sll	$7,$7,1
	sll	$8,$8,1
	addiu	$3,$3,128
	sll	$2,$2,1
	addiu	$6,$6,128
	sll	$9,$9,1
	addiu	$5,$5,128
	addu	$7,$22,$7
	sra	$4,$4,8
	addu	$8,$22,$8
	sra	$3,$3,8
	addu	$2,$22,$2
	sra	$6,$6,8
	addu	$9,$22,$9
	sra	$5,$5,8
	addiu	$10,$10,4
	sh	$4,0($7)
	addiu	$11,$11,4
	sh	$3,0($8)
	sh	$6,0($2)
	bne	$16,$10,$L3709
	sh	$5,0($9)

$L3755:
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	b	$L3701
	sw	$2,184($sp)

$L3758:
	beq	$3,$2,$L3767
	nop

	lw	$2,6168($22)
	lw	$3,6172($22)
	slt	$12,$0,$2
	slt	$13,$0,$3
$L3690:
	lw	$5,140($sp)
	lw	$6,164($sp)
	lw	$7,156($sp)
	lw	$8,160($sp)
	nor	$3,$0,$23
	nor	$2,$0,$5
	addu	$10,$6,$2
	addu	$15,$7,$3
	beq	$12,$0,$L3691
	addu	$14,$8,$3

	sltu	$7,$13,1
	mul	$3,$7,$5
	addu	$2,$22,$7
	addu	$6,$3,$10
	addiu	$5,$2,9004
$L3692:
	lbu	$2,0($5)
	lbu	$3,0($6)
	addiu	$7,$7,1
	sb	$3,0($5)
	sb	$2,0($6)
	lw	$8,140($sp)
	slt	$4,$7,17
	addiu	$5,$5,1
	bne	$4,$0,$L3692
	addu	$6,$6,$8

$L3691:
	beq	$13,$0,$L3693
	nop

	lw	$3,6168($22)
	lw	$11,8996($22)
	sll	$2,$3,5
	addu	$2,$11,$2
	lw	$8,0($2)
	lw	$9,4($2)
	lw	$6,1($10)
	lw	$7,5($10)
	sll	$4,$3,5
	addiu	$4,$4,8
	sw	$6,0($2)
	sw	$7,4($2)
	addu	$4,$11,$4
	sw	$8,1($10)
	sw	$9,5($10)
	lw	$5,144($22)
	lw	$6,0($4)
	lw	$7,4($4)
	lw	$2,9($10)
	addiu	$8,$3,1
	lw	$3,13($10)
	slt	$5,$8,$5
	sw	$2,0($4)
	sw	$3,4($4)
	sw	$6,9($10)
	beq	$5,$0,$L3693
	sw	$7,13($10)

	sll	$2,$8,5
	addu	$2,$11,$2
	lw	$6,0($2)
	lw	$7,4($2)
	lw	$4,17($10)
	lw	$5,21($10)
	sw	$4,0($2)
	sw	$5,4($2)
	sw	$6,17($10)
	sw	$7,21($10)
$L3693:
	beq	$12,$0,$L3694
	sltu	$8,$13,1

	mul	$3,$8,$23
	addu	$2,$22,$8
	addiu	$5,$2,9021
	addu	$7,$15,$3
	addu	$6,$14,$3
$L3695:
	lbu	$2,0($6)
	lbu	$3,0($5)
	sb	$2,0($5)
	sb	$3,0($6)
	lbu	$3,9($5)
	lbu	$2,0($7)
	addiu	$8,$8,1
	slt	$4,$8,9
	sb	$2,9($5)
	addu	$6,$6,$23
	sb	$3,0($7)
	addiu	$5,$5,1
	bne	$4,$0,$L3695
	addu	$7,$7,$23

$L3694:
	beq	$13,$0,$L3688
	nop

	lw	$3,6168($22)
	lw	$8,8996($22)
	sll	$2,$3,5
	addiu	$2,$2,16
	addu	$2,$8,$2
	lw	$6,0($2)
	lw	$7,4($2)
	lw	$4,1($14)
	lw	$5,5($14)
	sll	$3,$3,5
	addiu	$3,$3,24
	sw	$4,0($2)
	sw	$5,4($2)
	addu	$8,$8,$3
	sw	$6,1($14)
	sw	$7,5($14)
	lw	$4,0($8)
	lw	$5,4($8)
	lw	$2,1($15)
	lw	$3,5($15)
	sw	$2,0($8)
	sw	$3,4($8)
	sw	$4,1($15)
	b	$L3688
	sw	$5,5($15)

$L3760:
	beq	$3,$2,$L3768
	nop

	lw	$2,6168($22)
	lw	$3,6172($22)
	slt	$12,$0,$2
	slt	$11,$0,$3
$L3712:
	lw	$5,140($sp)
	lw	$6,164($sp)
	lw	$7,156($sp)
	lw	$8,160($sp)
	nor	$3,$0,$23
	nor	$2,$0,$5
	addu	$9,$6,$2
	addu	$14,$7,$3
	beq	$12,$0,$L3713
	addu	$13,$8,$3

	sltu	$6,$11,1
	mul	$3,$6,$5
	addu	$2,$22,$6
	addu	$5,$3,$9
	addiu	$4,$2,9004
$L3714:
	lbu	$2,0($4)
	addiu	$6,$6,1
	sb	$2,0($5)
	lw	$7,140($sp)
	slt	$3,$6,17
	addiu	$4,$4,1
	bne	$3,$0,$L3714
	addu	$5,$5,$7

$L3713:
	beq	$11,$0,$L3715
	nop

	lw	$3,6168($22)
	lw	$8,8996($22)
	sll	$2,$3,5
	addu	$2,$8,$2
	lw	$6,0($2)
	lw	$7,4($2)
	sll	$4,$3,5
	addiu	$4,$4,8
	sw	$6,1($9)
	sw	$7,5($9)
	addu	$4,$8,$4
	lw	$5,144($22)
	lw	$6,0($4)
	lw	$7,4($4)
	lw	$2,9($9)
	addiu	$10,$3,1
	lw	$3,13($9)
	slt	$5,$10,$5
	sw	$2,0($4)
	sw	$3,4($4)
	sw	$6,9($9)
	beq	$5,$0,$L3715
	sw	$7,13($9)

	sll	$2,$10,5
	addu	$2,$8,$2
	lw	$6,0($2)
	lw	$7,4($2)
	lw	$4,17($9)
	lw	$5,21($9)
	sw	$4,0($2)
	sw	$5,4($2)
	sw	$6,17($9)
	sw	$7,21($9)
$L3715:
	beq	$12,$0,$L3716
	nop

	sltu	$7,$11,1
	mul	$3,$7,$23
	addu	$2,$22,$7
	addiu	$4,$2,9021
	addu	$6,$14,$3
	addu	$5,$13,$3
$L3717:
	lbu	$2,0($4)
	addiu	$7,$7,1
	sb	$2,0($5)
	lbu	$3,9($4)
	slt	$2,$7,9
	sb	$3,0($6)
	addiu	$4,$4,1
	addu	$5,$5,$23
	bne	$2,$0,$L3717
	addu	$6,$6,$23

$L3716:
	beq	$11,$0,$L3773
	lw	$3,144($sp)

	lw	$3,6168($22)
	lw	$8,8996($22)
	sll	$2,$3,5
	addiu	$2,$2,16
	addu	$2,$8,$2
	lw	$6,0($2)
	lw	$7,4($2)
	lw	$4,1($13)
	lw	$5,5($13)
	sll	$3,$3,5
	addiu	$3,$3,24
	sw	$4,0($2)
	sw	$5,4($2)
	addu	$8,$8,$3
	sw	$6,1($13)
	sw	$7,5($13)
	lw	$4,0($8)
	lw	$5,4($8)
	lw	$2,1($14)
	lw	$3,5($14)
	sw	$2,0($8)
	sw	$3,4($8)
	sw	$4,1($14)
	b	$L3710
	sw	$5,5($14)

$L3762:
	lw	$4,9548($19)
	lw	$25,148($sp)
	move	$5,$21
	jalr	$25
	addu	$4,$8,$4

	b	$L3725
	lw	$28,40($sp)

$L3759:
	lw	$25,148($sp)
	jalr	$25
	move	$5,$fp

	b	$L3698
	lw	$28,40($sp)

$L3768:
	lw	$6,152($22)
	lw	$5,6172($22)
	lw	$2,-6288($4)
	mul	$4,$6,$5
	lw	$3,6168($22)
	addu	$6,$4,$3
	lw	$4,8764($22)
	addu	$6,$2,$6
	addu	$2,$2,$4
	lbu	$5,0($6)
	lbu	$3,-1($6)
	lbu	$4,0($2)
	xor	$3,$3,$5
	xor	$4,$4,$5
	sltu	$12,$3,1
	b	$L3712
	sltu	$11,$4,1

$L3767:
	lw	$6,152($22)
	lw	$5,6172($22)
	lw	$2,-6288($4)
	mul	$4,$6,$5
	lw	$3,6168($22)
	addu	$6,$4,$3
	lw	$4,8764($22)
	addu	$6,$2,$6
	addu	$2,$2,$4
	lbu	$5,0($6)
	lbu	$3,-1($6)
	lbu	$4,0($2)
	xor	$3,$3,$5
	xor	$4,$4,$5
	sltu	$12,$3,1
	b	$L3690
	sltu	$13,$4,1

	.set	macro
	.set	reorder
	.end	hl_decode_mb
	.section	.rodata.str1.4
	.align	2
$LC72:
	.ascii	"SEQH\000"
	.align	2
$LC73:
	.ascii	"%c hpel:%d, tpel:%d aqp:%d qp:%d\012\000"
	.align	2
$LC74:
	.ascii	"error in B-frame picture id\012\000"
	.align	2
$LC75:
	.ascii	"luma prediction:%d\012\000"
	.align	2
$LC76:
	.ascii	"weird prediction\012\000"
	.align	2
$LC77:
	.ascii	"check_intra_pred_mode = -1\012\000"
	.align	2
$LC78:
	.ascii	"cbp_vlc=%d\012\000"
	.align	2
$LC79:
	.ascii	"qscale:%d\012\000"
	.align	2
$LC80:
	.ascii	"error while decoding intra luma dc\012\000"
	.align	2
$LC81:
	.ascii	"error while decoding block\012\000"
	.align	2
$LC82:
	.ascii	"error while decoding chroma dc block\012\000"
	.align	2
$LC83:
	.ascii	"error while decoding chroma ac block\012\000"
	.align	2
$LC84:
	.ascii	"error while decoding MB %d %d\012\000"
	.text
	.align	2
	.ent	svq3_decode_frame
	.type	svq3_decode_frame, @function
svq3_decode_frame:
	.set	nomips16
	.frame	$sp,272,$31		# vars= 184, regs= 10/0, args= 40, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-272
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,268($sp)
	sw	$fp,264($sp)
	sw	$23,260($sp)
	sw	$22,256($sp)
	sw	$21,252($sp)
	sw	$20,248($sp)
	sw	$19,244($sp)
	sw	$18,240($sp)
	sw	$17,236($sp)
	sw	$16,232($sp)
	.cprestore	40
	lw	$17,136($4)
	lw	$2,12($4)
	lw	$21,288($sp)
	sw	$2,56($17)
	lw	$3,604($4)
	lw	$2,112($17)
	li	$8,1			# 0x1
	move	$23,$4
	sw	$3,60($17)
	sw	$5,276($sp)
	sw	$6,280($sp)
	move	$22,$7
	beq	$2,$0,$L4129
	sw	$8,2128($17)

$L3775:
	bne	$21,$0,$L3784
	nop

	lw	$2,1876($17)
	beq	$2,$0,$L4201
	lw	$31,268($sp)

	lw	$2,8240($17)
	bne	$2,$0,$L4203
	move	$2,$21

	lw	$8,276($sp)
	addiu	$7,$17,840
	addiu	$6,$17,648
$L3786:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($8)
	sw	$3,4($8)
	sw	$4,8($8)
	sw	$5,12($8)
	bne	$6,$7,$L3786
	addiu	$8,$8,16

	lw	$2,4($6)
	lw	$3,0($6)
	sw	$2,4($8)
	sw	$3,0($8)
	lw	$3,280($sp)
	li	$2,200			# 0xc8
	sw	$2,0($3)
$L3785:
	lw	$31,268($sp)
$L4201:
	move	$2,$21
$L4203:
	lw	$fp,264($sp)
	lw	$23,260($sp)
	lw	$22,256($sp)
	lw	$21,252($sp)
	lw	$20,248($sp)
	lw	$19,244($sp)
	lw	$18,240($sp)
	lw	$17,236($sp)
	lw	$16,232($sp)
	j	$31
	addiu	$sp,$sp,272

$L4129:
	lw	$2,40($4)
	lw	$25,%call16(MPV_common_init)($28)
	sw	$2,4($17)
	lw	$3,44($23)
	li	$4,4			# 0x4
	sw	$4,8740($17)
	sw	$4,8744($17)
	sw	$3,8($17)
	sw	$8,9776($17)
	sw	$8,9772($17)
	sw	$0,9780($17)
	jalr	$25
	move	$4,$17

	bltz	$2,$L3776
	lw	$28,40($sp)

	lw	$2,144($17)
	move	$4,$17
	sll	$2,$2,2
	.option	pic0
	jal	alloc_tables
	.option	pic2
	sw	$2,9748($17)

	lw	$19,28($23)
	lw	$28,40($sp)
	blez	$19,$L3777
	lw	$18,24($23)

	lui	$2,%hi($LC72)
	addiu	$20,$2,%lo($LC72)
	b	$L3778
	move	$16,$0

$L4130:
	beq	$3,$0,$L3777
	addiu	$18,$18,1

$L3778:
	lw	$25,%call16(memcmp)($28)
	move	$4,$18
	move	$5,$20
	jalr	$25
	li	$6,4			# 0x4

	addiu	$16,$16,1
	lw	$28,40($sp)
	bne	$2,$0,$L4130
	slt	$3,$16,$19

$L3777:
	beq	$18,$0,$L3775
	lw	$25,%call16(memcmp)($28)

	lui	$5,%hi($LC72)
	addiu	$5,$5,%lo($LC72)
	move	$4,$18
	jalr	$25
	li	$6,4			# 0x4

	bne	$2,$0,$L3775
	lw	$28,40($sp)

	lbu	$2,4($18)
	lbu	$4,5($18)
	sll	$2,$2,24
	sll	$4,$4,16
	lbu	$5,7($18)
	lbu	$3,6($18)
	or	$2,$2,$4
	or	$2,$2,$5
	sll	$3,$3,8
	or	$2,$2,$3
	sll	$2,$2,3
	sra	$4,$2,3
	bltz	$4,$L3779
	nop

	bltz	$2,$L3779
	nop

	addiu	$3,$18,8
	addu	$6,$3,$4
$L3780:
	addiu	$4,$sp,48
	li	$5,3			# 0x3
	sw	$3,48($sp)
	sw	$2,60($sp)
	sw	$6,52($sp)
	.option	pic0
	jal	get_bits
	.option	pic2
	sw	$0,56($sp)

	li	$3,7			# 0x7
	beq	$2,$3,$L4097
	lw	$28,40($sp)

	lw	$5,56($sp)
$L3781:
	lw	$6,48($sp)
	sra	$2,$5,3
	addu	$2,$6,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$2,$5,1
	srl	$3,$3,7
	sw	$2,56($sp)
	sw	$3,9772($17)
	lw	$5,56($sp)
	sra	$2,$5,3
	addu	$2,$6,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,56($sp)
	sw	$3,9776($17)
	lw	$5,56($sp)
	addiu	$4,$5,4
	sra	$3,$4,3
	sw	$4,56($sp)
	addu	$3,$6,$3
	lbu	$2,0($3)
	andi	$4,$4,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,5
	srl	$2,$2,7
	sw	$5,56($sp)
	sw	$2,8240($17)
	lw	$5,56($sp)
	addiu	$4,$5,1
	sra	$3,$4,3
	sw	$4,56($sp)
	addu	$3,$6,$3
	lbu	$2,0($3)
	andi	$4,$4,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,2
	srl	$2,$2,7
	beq	$2,$0,$L3782
	sw	$5,56($sp)

$L4069:
	addiu	$4,$5,8
	sra	$3,$4,3
	sw	$4,56($sp)
	addu	$3,$6,$3
	lbu	$2,0($3)
	andi	$4,$4,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	addiu	$5,$5,9
	srl	$2,$2,7
	bne	$2,$0,$L4069
	sw	$5,56($sp)

$L3782:
	sra	$2,$5,3
	addu	$2,$6,$2
	lbu	$3,0($2)
	addiu	$4,$5,1
	sw	$4,56($sp)
	andi	$2,$5,0x7
	lw	$4,8240($17)
	sll	$3,$3,$2
	andi	$3,$3,0x00ff
	srl	$3,$3,7
	sltu	$4,$4,1
	sw	$3,9780($17)
	b	$L3775
	sw	$4,268($23)

$L3784:
	sll	$4,$21,3
	sra	$2,$4,3
	bltz	$2,$L3787
	sw	$4,196($sp)

	bltz	$4,$L3787
	nop

	addu	$3,$22,$2
	move	$7,$22
	move	$2,$4
$L3788:
	sw	$7,8448($17)
	sw	$2,8460($17)
	sw	$3,8452($17)
	sw	$0,8456($17)
	sw	$0,6172($17)
	sw	$0,6168($17)
	.option	pic0
	jal	svq3_decode_slice_header
	.option	pic2
	move	$4,$17

	bne	$2,$0,$L3776
	lw	$28,40($sp)

	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	lw	$4,-6284($2)
	sw	$4,2084($17)
	lw	$3,-6296($2)
	sw	$3,124($17)
	lw	$2,412($23)
	andi	$2,$2,0x1
	bne	$2,$0,$L4131
	lw	$25,%call16(av_get_pict_type_char)($28)

$L3789:
	lw	$4,2084($17)
	lw	$3,1872($17)
	xori	$2,$4,0x1
	sltu	$2,$2,1
	sw	$2,1512($17)
	beq	$3,$0,$L4132
	sw	$4,1516($17)

$L3790:
	lw	$3,128($23)
	beq	$3,$0,$L3792
	li	$2,3			# 0x3

	beq	$4,$2,$L3791
	slt	$2,$3,5

	bne	$2,$0,$L3792
	nop

$L3791:
	b	$L3785
	move	$21,$0

$L3776:
	b	$L3785
	li	$21,-1			# 0xffffffffffffffff

$L3787:
	move	$2,$0
	move	$7,$0
	b	$L3788
	move	$3,$0

$L3792:
	lw	$3,716($23)
	slt	$2,$3,8
	beq	$2,$0,$L4133
	li	$2,3			# 0x3

$L3793:
	lw	$2,7988($17)
	beq	$2,$0,$L3794
	li	$2,3			# 0x3

	beq	$4,$2,$L3791
	nop

	sw	$0,7988($17)
$L3794:
	.option	pic0
	jal	frame_start
	.option	pic2
	move	$4,$17

	bltz	$2,$L3776
	lw	$28,40($sp)

	lw	$3,2084($17)
	li	$2,3			# 0x3
	beq	$3,$2,$L4134
	li	$2,65536			# 0x10000

	addu	$4,$17,$2
	lw	$3,-6228($4)
	lw	$2,-6296($4)
	sw	$3,-6208($4)
	subu	$3,$2,$3
	sw	$2,-6228($4)
	bgez	$3,$L3798
	sw	$3,-6212($4)

	addiu	$2,$3,256
	sw	$2,-6212($4)
$L3798:
	move	$6,$0
$L4212:
	li	$8,1
	li	$9,4			# 0x4
	li	$10,35			# 0x23
	li	$11,-2
	li	$12,43			# 0x2b
	li	$13,2			# 0x2
	sll	$2,$6,3
$L4204:
	sll	$3,$6,5
	addu	$2,$2,$3
	addiu	$4,$2,9472
	addu	$5,$17,$4
	move	$7,$2
	li	$4,11			# 0xb
$L3803:
	addu	$2,$7,$4
	addiu	$2,$2,9456
	addu	$3,$17,$2
	li	$2,-1			# 0xffffffffffffffff
$L3800:
	addiu	$2,$2,1
	sb	$8,0($3)
	bne	$2,$9,$L3800
	addiu	$3,$3,1

	bne	$4,$10,$L4135
	nop

	addiu	$6,$6,1
$L4192:
	bne	$6,$13,$L4204
	sll	$2,$6,3

	lw	$2,148($17)
	blez	$2,$L3804
	sw	$0,6172($17)

	li	$2,131072			# 0x20000
	ori	$2,$2,0x1ad8
	addu	$2,$17,$2
	addiu	$6,$17,240
	addiu	$8,$17,2612
	sw	$2,160($sp)
	addiu	$2,$17,648
	sw	$6,128($sp)
	sw	$8,96($sp)
	sw	$2,116($sp)
	addiu	$3,$17,2676
	addiu	$4,$17,9136
	addiu	$6,$17,9456
	addiu	$8,$17,8776
	addiu	$2,$17,9088
	sw	$3,104($sp)
	sw	$4,144($sp)
	sw	$6,148($sp)
	sw	$8,152($sp)
	sw	$2,156($sp)
	addiu	$20,$17,8448
$L4047:
	lw	$2,144($17)
	blez	$2,$L3805
	sw	$0,6168($17)

$L4068:
	lw	$7,8456($17)
	lw	$3,8460($17)
	addiu	$2,$7,7
	slt	$2,$2,$3
	bne	$2,$0,$L4136
	andi	$8,$7,0x7

	beq	$8,$0,$L3808
	sra	$2,$7,3

	lw	$10,8448($17)
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	subu	$2,$0,$7
	or	$3,$3,$6
	andi	$2,$2,0x7
	sll	$3,$3,$8
	subu	$2,$0,$2
	srl	$2,$3,$2
	bne	$2,$0,$L4205
	li	$2,-1434451968			# 0xffffffffaa800000

$L3808:
	lw	$2,9784($17)
	lw	$3,196($sp)
	sw	$2,8456($17)
	sw	$3,8460($17)
	.option	pic0
	jal	svq3_decode_slice_header
	.option	pic2
	move	$4,$17

	bne	$2,$0,$L3776
	lw	$28,40($sp)

	lw	$7,8456($17)
	lw	$10,8448($17)
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$2,0($3)
	lbu	$6,3($3)
	lbu	$4,2($3)
	lbu	$5,1($3)
	sll	$2,$2,24
	or	$2,$2,$6
	sll	$4,$4,8
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	andi	$3,$7,0x7
	sll	$3,$2,$3
$L3807:
	li	$2,-1434451968			# 0xffffffffaa800000
$L4205:
	and	$2,$3,$2
	bne	$2,$0,$L3809
	srl	$8,$3,24

	lw	$16,%got(ff_interleaved_golomb_vlc_len)($28)
	addu	$2,$16,$8
	lbu	$6,0($2)
	sltu	$3,$6,9
	beq	$3,$0,$L4137
	li	$2,9			# 0x9

	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	li	$9,1			# 0x1
$L3816:
	addu	$7,$7,$6
$L3814:
	addu	$2,$12,$8
$L4190:
	addiu	$3,$6,-1
	sra	$3,$3,1
	lbu	$4,0($2)
	sll	$3,$9,$3
	or	$4,$4,$3
	addiu	$4,$4,-1
	sw	$7,8456($17)
	sw	$4,200($sp)
$L3812:
	lw	$3,2084($17)
	li	$2,1			# 0x1
	beq	$3,$2,$L4138
	li	$2,3			# 0x3

	beq	$3,$2,$L4139
	lw	$6,200($sp)

$L3819:
	lw	$8,200($sp)
	slt	$2,$8,34
	beq	$2,$0,$L3821
	nop

$L3820:
	lw	$8,6172($17)
	lw	$5,9748($17)
	lw	$7,6168($17)
	mul	$2,$8,$5
	lw	$6,152($17)
	mtlo	$7
	li	$4,65535			# 0xffff
	addu	$5,$2,$7
	madd	$8,$6
	li	$2,24415			# 0x5f5f
	li	$3,13311			# 0x33ff
	movn	$2,$4,$7
	move	$9,$4
	movz	$9,$3,$8
	sw	$2,8992($17)
	lw	$3,200($sp)
	mflo	$2
	sll	$5,$5,2
	sw	$4,8988($17)
	sw	$2,180($sp)
	sw	$5,184($sp)
	bne	$3,$0,$L3826
	sw	$9,8984($17)

	lw	$3,2084($17)
	li	$2,2			# 0x2
	beq	$3,$2,$L4206
	sll	$22,$7,4

	lw	$4,180($sp)
	lw	$2,752($17)
	sll	$3,$4,2
	addu	$2,$2,$3
	lw	$4,0($2)
	li	$3,-1			# 0xffffffffffffffff
	bne	$4,$3,$L3828
	sltu	$2,$4,7

$L4206:
	bltz	$22,$L4140
	sll	$fp,$8,4

	lw	$5,164($17)
	addiu	$2,$5,-17
	slt	$2,$22,$2
	beq	$2,$0,$L4125
	nop

	bltz	$fp,$L4125
	nop

	lw	$4,168($17)
	addiu	$2,$4,-17
	slt	$2,$fp,$2
	beq	$2,$0,$L3833
	move	$19,$fp

	lw	$18,176($17)
	lw	$3,240($17)
	mul	$4,$18,$fp
	move	$6,$18
	addu	$2,$4,$22
	addu	$5,$3,$2
	lw	$2,1464($17)
	sw	$2,132($sp)
	sw	$22,80($sp)
	sw	$0,136($sp)
$L3835:
	lw	$2,132($sp)
	addu	$4,$22,$4
	lw	$25,2596($17)
	addu	$4,$2,$4
	jalr	$25
	li	$7,16			# 0x10

	lw	$2,56($17)
	andi	$2,$2,0x2000
	bne	$2,$0,$L3840
	lw	$28,40($sp)

	lw	$3,80($sp)
	lw	$4,80($sp)
	slt	$2,$3,$22
	slt	$3,$19,$fp
	addu	$3,$3,$19
	addu	$2,$2,$4
	sra	$2,$2,1
	sra	$3,$3,1
	sra	$22,$22,1
	sw	$2,88($sp)
	sw	$3,84($sp)
	sw	$22,100($sp)
	sra	$fp,$fp,1
	move	$19,$0
$L3843:
	lw	$6,128($sp)
	lw	$18,180($17)
	addu	$2,$6,$19
	lw	$4,4($2)
	lw	$2,88($sp)
	mtlo	$2
	lw	$2,84($sp)
	madd	$2,$18
	addu	$2,$17,$19
	mflo	$3
	addu	$5,$4,$3
	lw	$3,136($sp)
	bne	$3,$0,$L3841
	lw	$22,1468($2)

	move	$6,$18
$L3842:
	lw	$2,100($sp)
	lw	$3,96($sp)
	mtlo	$2
	madd	$fp,$18
	lw	$25,0($3)
	mflo	$4
	li	$7,8			# 0x8
	jalr	$25
	addu	$4,$22,$4

	addiu	$19,$19,4
	li	$2,8			# 0x8
	bne	$19,$2,$L3843
	lw	$28,40($sp)

$L3840:
	lw	$3,2084($17)
	li	$2,3			# 0x3
	beq	$3,$2,$L3844
	nop

$L4121:
	li	$4,2048			# 0x800
	sw	$0,176($sp)
	sw	$4,192($sp)
$L3845:
	li	$2,1			# 0x1
$L4215:
	beq	$3,$2,$L3928
	move	$18,$0

	lw	$3,184($sp)
	lw	$2,9748($17)
	mtlo	$3
	madd	$18,$2
	lw	$2,1560($17)
	mflo	$4
	lw	$25,%call16(memset)($28)
	sll	$4,$4,2
	addu	$4,$2,$4
	move	$5,$0
	li	$6,16			# 0x10
	li	$19,4			# 0x4
	jalr	$25
	addiu	$18,$18,1

	beq	$18,$19,$L3929
	lw	$28,40($sp)

$L4141:
	lw	$3,184($sp)
	lw	$2,9748($17)
	mtlo	$3
	madd	$18,$2
	lw	$2,1560($17)
	mflo	$4
	lw	$25,%call16(memset)($28)
	sll	$4,$4,2
	addu	$4,$2,$4
	move	$5,$0
	li	$6,16			# 0x10
	jalr	$25
	addiu	$18,$18,1

	bne	$18,$19,$L4141
	lw	$28,40($sp)

$L3929:
	lw	$3,2084($17)
	li	$2,3			# 0x3
	beq	$3,$2,$L4142
	move	$18,$0

$L3928:
	lw	$4,192($sp)
$L4195:
	andi	$22,$4,0x1
	beq	$22,$0,$L3932
	nop

	andi	$18,$4,0x800
	andi	$19,$4,0x2
$L3933:
	beq	$18,$0,$L3934
	nop

	lw	$3,2084($17)
	li	$2,3			# 0x3
	beq	$3,$2,$L3934
	nop

$L3935:
	beq	$19,$0,$L4143
	nop

$L3936:
	lw	$9,8456($17)
	lw	$10,8448($17)
	sra	$2,$9,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$9,0x7
	sll	$8,$3,$4
	li	$2,-1434451968			# 0xffffffffaa800000
	and	$2,$8,$2
	beq	$2,$0,$L3952
	lw	$7,2056($17)

	srl	$4,$8,24
	addu	$2,$16,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_interleaved_se_golomb_vlc_code)($28)
	addu	$3,$3,$9
	addu	$2,$2,$4
	lb	$2,0($2)
	sw	$3,8456($17)
$L3953:
	addu	$7,$2,$7
	slt	$2,$7,32
	beq	$2,$0,$L4144
	sw	$7,2056($17)

	beq	$19,$0,$L3950
	lui	$2,%hi(luma_dc_zigzag_scan)

	lw	$10,0($20)
	lw	$18,%got(ff_interleaved_ue_golomb_vlc_code)($28)
	lw	$11,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	addiu	$25,$2,%lo(luma_dc_zigzag_scan)
	move	$13,$0
	li	$15,-1434451968			# 0xffffffffaa800000
	li	$14,9			# 0x9
	li	$24,-2147483648			# 0xffffffff80000000
$L3959:
	lw	$7,8($20)
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	and	$4,$2,$15
	bne	$4,$0,$L3966
	nop

	srl	$8,$2,24
	addu	$2,$16,$8
	lbu	$6,0($2)
	sltu	$3,$6,9
	beq	$3,$0,$L4145
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

	li	$9,1			# 0x1
$L3973:
	addu	$7,$7,$6
$L3971:
	addu	$2,$12,$8
$L4187:
	addiu	$3,$6,-1
	sra	$3,$3,1
	lbu	$4,0($2)
	sll	$3,$9,$3
	or	$4,$4,$3
	sw	$7,8($20)
	addiu	$5,$4,-1
$L3969:
	beq	$5,$0,$L4207
	lw	$2,176($sp)

	beq	$5,$24,$L3960
	addiu	$2,$5,1

	sra	$4,$2,1
	slt	$3,$4,16
	bne	$3,$0,$L4146
	sll	$2,$4,1

	andi	$3,$4,0xf
	bne	$3,$0,$L3963
	slt	$2,$3,3

	li	$6,4			# 0x4
$L3964:
	sra	$2,$4,4
	addu	$7,$6,$2
$L3962:
	addu	$6,$3,$13
	slt	$2,$6,16
	beq	$2,$0,$L3960
	addu	$2,$25,$6

	lbu	$4,0($2)
	andi	$3,$5,0x1
	addiu	$3,$3,-1
	lw	$8,160($sp)
	sll	$4,$4,1
	xor	$2,$7,$3
	subu	$2,$2,$3
	addu	$4,$8,$4
	sh	$2,0($4)
	b	$L3959
	addiu	$13,$6,1

$L3934:
	lw	$25,%call16(memset)($28)
	lw	$4,156($sp)
	move	$5,$0
	jalr	$25
	li	$6,36			# 0x24

	lw	$25,2180($17)
	jalr	$25
	lw	$4,160($sp)

	b	$L3935
	lw	$28,40($sp)

$L4146:
	lui	$6,%hi(svq3_dct_tables)
	addiu	$6,$6,%lo(svq3_dct_tables)
	addu	$2,$2,$6
	lbu	$7,1($2)
	b	$L3962
	lbu	$3,0($2)

$L3966:
	srl	$4,$2,24
	addu	$3,$16,$4
	lbu	$2,0($3)
	addu	$4,$18,$4
	addu	$2,$2,$7
	sw	$2,8($20)
	b	$L3969
	lbu	$5,0($4)

$L4145:
	bne	$6,$14,$L4147
	addiu	$7,$7,8

	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	li	$9,1			# 0x1
$L3972:
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	addu	$5,$11,$8
	srl	$8,$2,24
	addu	$3,$16,$8
	lbu	$6,0($3)
	lbu	$4,0($5)
	sll	$2,$9,4
	sltu	$3,$6,9
	bne	$3,$0,$L3973
	or	$9,$4,$2

	beq	$6,$14,$L3972
	addiu	$7,$7,8

	b	$L4187
	addu	$2,$12,$8

$L3950:
	lw	$2,176($sp)
$L4207:
	beq	$2,$0,$L4194
	lw	$4,180($sp)

	lw	$2,2056($17)
	sltu	$19,$0,$19
	slt	$2,$2,24
	beq	$2,$0,$L3976
	sw	$19,112($sp)

	beq	$22,$0,$L4208
	li	$4,1			# 0x1

	li	$3,2			# 0x2
	sw	$3,188($sp)
$L3977:
	lw	$6,188($sp)
	li	$3,16			# 0x10
	sll	$2,$6,1
	addu	$2,$2,$6
	sra	$24,$2,2
	lui	$2,%hi(scan_patterns.17734)
	sll	$4,$6,2
	addiu	$2,$2,%lo(scan_patterns.17734)
	addu	$2,$2,$4
	sra	$3,$3,$24
	lw	$14,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	sw	$2,208($sp)
	sw	$3,64($sp)
	move	$25,$0
	li	$15,9			# 0x9
	lw	$8,176($sp)
$L4209:
	sra	$2,$8,$25
	andi	$2,$2,0x1
	beq	$2,$0,$L3978
	andi	$2,$25,0x2

	lw	$4,208($sp)
	sll	$2,$2,1
	andi	$3,$25,0x1
	addu	$3,$2,$3
	sll	$6,$25,2
	lw	$19,0($4)
	sw	$3,164($sp)
	sw	$0,168($sp)
	sw	$6,204($sp)
	li	$22,-1434451968			# 0xffffffffaa800000
	li	$31,-2147483648			# 0xffffffff80000000
	sll	$fp,$24,4
$L4058:
	lw	$8,112($sp)
	beq	$8,$0,$L3979
	lw	$6,204($sp)

	lw	$3,168($sp)
	lw	$4,164($sp)
	andi	$2,$3,0x2
	addu	$2,$2,$4
	sll	$2,$2,1
	andi	$3,$3,0x1
	addu	$4,$2,$3
$L3980:
	lui	$2,%hi(scan8)
	addiu	$2,$2,%lo(scan8)
	addu	$3,$2,$4
	lbu	$2,0($3)
	li	$3,1
	addu	$2,$17,$2
	sb	$3,9080($2)
	lw	$3,160($sp)
	sll	$4,$4,5
	lw	$11,112($sp)
	lw	$13,64($sp)
	lw	$10,0($20)
	addu	$18,$3,$4
$L4109:
	lw	$7,8($20)
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	and	$4,$2,$22
	bne	$4,$0,$L3993
	srl	$8,$2,24

	addu	$2,$16,$8
	lbu	$6,0($2)
	sltu	$3,$6,9
	beq	$3,$0,$L4148
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

	li	$9,1			# 0x1
$L4000:
	addu	$7,$7,$6
$L3998:
	addu	$2,$12,$8
$L4188:
	addiu	$3,$6,-1
	sra	$3,$3,1
	lbu	$4,0($2)
	sll	$3,$9,$3
	or	$4,$4,$3
	sw	$7,8($20)
	addiu	$5,$4,-1
$L3996:
	beq	$5,$0,$L4149
	lw	$2,188($sp)

	beq	$5,$31,$L3982
	addiu	$2,$5,1

	sra	$4,$2,1
	slt	$3,$4,16
	beq	$3,$0,$L3983
	addu	$2,$fp,$4

	lui	$4,%hi(svq3_dct_tables)
	sll	$2,$2,1
	addiu	$4,$4,%lo(svq3_dct_tables)
	addu	$2,$2,$4
	lbu	$7,1($2)
	lbu	$3,0($2)
$L3984:
	addu	$6,$3,$11
	slt	$2,$6,$13
	beq	$2,$0,$L3982
	addu	$2,$19,$6

	lbu	$4,0($2)
	andi	$3,$5,0x1
	addiu	$3,$3,-1
	sll	$4,$4,1
	xor	$2,$7,$3
	subu	$2,$2,$3
	addu	$4,$18,$4
	sh	$2,0($4)
	b	$L4109
	addiu	$11,$6,1

$L3993:
	srl	$4,$2,24
	addu	$3,$16,$4
	lbu	$2,0($3)
	lw	$8,%got(ff_interleaved_ue_golomb_vlc_code)($28)
	addu	$2,$2,$7
	addu	$4,$8,$4
	sw	$2,8($20)
	b	$L3996
	lbu	$5,0($4)

$L3983:
	beq	$24,$0,$L3985
	andi	$3,$4,0xf

	andi	$3,$4,0x7
	bne	$3,$0,$L3986
	li	$6,1			# 0x1

	li	$6,8			# 0x8
	sra	$2,$4,3
	b	$L3984
	addu	$7,$6,$2

$L4148:
	bne	$6,$15,$L4150
	addiu	$7,$7,8

	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	li	$9,1			# 0x1
$L3999:
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	addu	$5,$14,$8
	srl	$8,$2,24
	addu	$3,$16,$8
	lbu	$6,0($3)
	lbu	$4,0($5)
	sll	$2,$9,4
	sltu	$3,$6,9
	bne	$3,$0,$L4000
	or	$9,$4,$2

	beq	$6,$15,$L3999
	addiu	$7,$7,8

	b	$L4188
	addu	$2,$12,$8

$L3985:
	bne	$3,$0,$L3990
	slt	$2,$3,3

	li	$6,4			# 0x4
	sra	$2,$4,4
	b	$L3984
	addu	$7,$6,$2

$L3990:
	beq	$2,$0,$L3992
	slt	$6,$3,10

	li	$6,2			# 0x2
	sra	$2,$4,4
	b	$L3984
	addu	$7,$6,$2

$L3986:
	beq	$3,$6,$L4151
	slt	$2,$3,5

	li	$6,-1			# 0xffffffffffffffff
	movn	$6,$0,$2
	sra	$2,$4,3
	b	$L3984
	addu	$7,$6,$2

$L3992:
	sra	$2,$4,4
	b	$L3984
	addu	$7,$6,$2

$L4003:
	lw	$6,168($sp)
	li	$2,4			# 0x4
	addiu	$6,$6,1
	bne	$6,$2,$L4058
	sw	$6,168($sp)

$L3978:
	addiu	$25,$25,1
	li	$2,4			# 0x4
	bne	$25,$2,$L4209
	lw	$8,176($sp)

	lw	$4,176($sp)
	andi	$2,$4,0x30
	beq	$2,$0,$L4194
	lw	$4,180($sp)

	lw	$6,160($sp)
	lw	$10,0($20)
	addiu	$18,$6,512
	lw	$22,%got(ff_interleaved_ue_golomb_vlc_code)($28)
	lw	$13,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	move	$11,$18
	li	$19,-1434451968			# 0xffffffffaa800000
	li	$15,9			# 0x9
	li	$24,-2147483648			# 0xffffffff80000000
	li	$25,3			# 0x3
	addiu	$fp,$6,768
$L4059:
	move	$14,$0
$L4005:
	lw	$7,8($20)
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	and	$4,$2,$19
	bne	$4,$0,$L4010
	srl	$8,$2,24

	addu	$2,$16,$8
	lbu	$6,0($2)
	sltu	$3,$6,9
	beq	$3,$0,$L4152
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

	li	$9,1			# 0x1
$L4017:
	addu	$7,$7,$6
$L4015:
	addu	$2,$12,$8
$L4189:
	addiu	$3,$6,-1
	sra	$3,$3,1
	lbu	$4,0($2)
	sll	$3,$9,$3
	or	$4,$4,$3
	sw	$7,8($20)
	addiu	$5,$4,-1
$L4013:
	beq	$5,$0,$L4153
	nop

	beq	$5,$24,$L4006
	addiu	$2,$5,1

	sra	$7,$2,1
	slt	$3,$7,3
	beq	$3,$0,$L4007
	move	$3,$0

$L4008:
	addu	$6,$3,$14
	slt	$2,$6,4
	beq	$2,$0,$L4006
	lui	$8,%hi(chroma_dc_scan)

	addiu	$8,$8,%lo(chroma_dc_scan)
	addu	$2,$8,$6
	lbu	$4,0($2)
	andi	$3,$5,0x1
	addiu	$3,$3,-1
	sll	$4,$4,1
	xor	$2,$7,$3
	subu	$2,$2,$3
	addu	$4,$11,$4
	sh	$2,0($4)
	b	$L4005
	addiu	$14,$6,1

$L4007:
	bne	$7,$25,$L4009
	addiu	$2,$7,9

	li	$7,1			# 0x1
	b	$L4008
	li	$3,1			# 0x1

$L4010:
	srl	$4,$2,24
	addu	$3,$16,$4
	lbu	$2,0($3)
	addu	$4,$22,$4
	addu	$2,$2,$7
	sw	$2,8($20)
	b	$L4013
	lbu	$5,0($4)

$L4149:
	li	$3,2			# 0x2
	bne	$2,$3,$L4003
	slt	$2,$13,16

	beq	$2,$0,$L4003
	move	$11,$13

	b	$L4109
	addiu	$13,$13,8

$L3979:
	lw	$8,168($sp)
	b	$L3980
	addu	$4,$6,$8

$L3982:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC81)
	addiu	$6,$6,%lo($LC81)
	jalr	$25
	move	$5,$0

	lw	$28,40($sp)
$L3821:
	lw	$2,6172($17)
$L4199:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lw	$7,6168($17)
	lui	$6,%hi($LC84)
	sw	$2,16($sp)
	addiu	$6,$6,%lo($LC84)
	jalr	$25
	move	$5,$0

	lw	$28,40($sp)
	b	$L3785
	li	$21,-1			# 0xffffffffffffffff

$L4152:
	bne	$6,$15,$L4154
	addiu	$7,$7,8

	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	li	$9,1			# 0x1
$L4016:
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	addu	$5,$13,$8
	srl	$8,$2,24
	addu	$3,$16,$8
	lbu	$6,0($3)
	lbu	$4,0($5)
	sll	$2,$9,4
	sltu	$3,$6,9
	bne	$3,$0,$L4017
	or	$9,$4,$2

	beq	$6,$15,$L4016
	addiu	$7,$7,8

	b	$L4189
	addu	$2,$12,$8

$L4151:
	li	$6,2			# 0x2
	sra	$2,$4,3
	b	$L3984
	addu	$7,$6,$2

$L4009:
	sra	$2,$2,2
	andi	$3,$7,0x3
	b	$L4008
	subu	$7,$2,$3

$L4143:
	beq	$18,$0,$L3937
	li	$2,3			# 0x3

	lw	$3,2084($17)
	beq	$3,$2,$L3937
	nop

$L3938:
	li	$2,1			# 0x1
	beq	$3,$2,$L4207
	lw	$2,176($sp)

	lw	$2,2076($17)
	beq	$2,$0,$L4207
	lw	$2,176($sp)

	lw	$4,176($sp)
	bne	$4,$0,$L3936
	lw	$4,180($sp)

$L4194:
	lw	$6,192($sp)
	lw	$2,1568($17)
	sll	$3,$4,2
	addu	$2,$2,$3
	andi	$4,$6,0x7
	bne	$4,$0,$L4155
	sw	$6,0($2)

$L4039:
	lw	$8,200($sp)
	beq	$8,$0,$L4063
	nop

	.option	pic0
	jal	hl_decode_mb
	.option	pic2
	move	$4,$17

	lw	$28,40($sp)
$L4063:
	lw	$3,2084($17)
	li	$2,3			# 0x3
	beq	$3,$2,$L4043
	nop

	lw	$2,8240($17)
	bne	$2,$0,$L4043
	li	$2,2			# 0x2

	lw	$7,1568($17)
	lw	$5,6168($17)
	lw	$6,6172($17)
	beq	$3,$2,$L4156
	lw	$4,152($17)

$L4044:
	li	$3,-1			# 0xffffffffffffffff
	mul	$8,$4,$6
$L4216:
	addu	$2,$8,$5
	sll	$2,$2,2
	addu	$2,$7,$2
	sw	$3,0($2)
$L4043:
	lw	$2,6168($17)
	lw	$3,144($17)
	addiu	$2,$2,1
	slt	$3,$2,$3
	bne	$3,$0,$L4068
	sw	$2,6168($17)

$L3805:
	lw	$5,6172($17)
	lw	$25,%call16(ff_draw_horiz_band)($28)
	sll	$5,$5,4
	move	$4,$17
	jalr	$25
	li	$6,16			# 0x10

	lw	$2,6172($17)
	lw	$3,148($17)
	addiu	$2,$2,1
	slt	$3,$2,$3
	lw	$28,40($sp)
	bne	$3,$0,$L4047
	sw	$2,6172($17)

$L3804:
	lw	$25,%call16(MPV_frame_end)($28)
	jalr	$25
	move	$4,$17

	lw	$3,2084($17)
	li	$2,3			# 0x3
	beq	$3,$2,$L4048
	lw	$28,40($sp)

	lw	$2,8240($17)
	beq	$2,$0,$L4049
	addiu	$6,$17,240

$L4048:
	lw	$7,276($sp)
	addiu	$6,$17,1464
	addiu	$8,$17,1656
$L4050:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L4050
	addiu	$7,$7,16

	lw	$2,4($6)
$L4202:
	lw	$3,0($6)
	sw	$2,4($7)
	sw	$3,0($7)
	lw	$2,124($17)
	lw	$3,1872($17)
	addiu	$2,$2,-1
	beq	$3,$0,$L4157
	sw	$2,80($23)

	lw	$3,280($sp)
$L4214:
	li	$2,200			# 0xc8
	b	$L3785
	sw	$2,0($3)

$L4156:
	lw	$8,200($sp)
	slt	$2,$8,8
	beq	$2,$0,$L4044
	addiu	$3,$8,-1

	b	$L4216
	mul	$8,$4,$6

$L3826:
	lw	$6,200($sp)
	sltu	$2,$6,8
	beq	$2,$0,$L3862
	lw	$4,200($sp)

	lw	$6,9776($17)
	bne	$6,$0,$L4100
	nop

	lw	$3,9772($17)
$L3863:
	beq	$3,$0,$L4210
	li	$3,1			# 0x1

	lw	$5,8456($17)
	lw	$3,8448($17)
	sra	$4,$5,3
	addu	$3,$3,$4
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	srl	$2,$2,7
	addiu	$5,$5,1
	sltu	$2,$2,1
	beq	$6,$2,$L4158
	sw	$5,8456($17)

	li	$3,1			# 0x1
$L4210:
	sw	$3,172($sp)
$L3864:
	lw	$4,180($sp)
	lw	$6,144($sp)
	addiu	$2,$4,-1
	sll	$2,$2,3
	lw	$8,148($sp)
	lw	$3,184($sp)
	sw	$2,140($sp)
	lw	$2,148($sp)
	addiu	$8,$8,3
	addiu	$9,$6,44
	addiu	$3,$3,-1
	addiu	$4,$17,80
	sw	$8,92($sp)
	move	$19,$17
	addiu	$8,$2,4
	addiu	$18,$6,16
	move	$fp,$9
	move	$22,$17
	li	$10,4			# 0x4
	sw	$3,212($sp)
	sw	$4,216($sp)
$L3882:
	blez	$7,$L3866
	lw	$6,140($sp)

	lw	$2,8816($17)
	addu	$2,$2,$6
	lb	$3,0($2)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L3866
	move	$4,$0

	lw	$3,212($sp)
	lw	$2,9748($17)
	mtlo	$3
	madd	$2,$4
	lw	$6,1560($22)
	mflo	$2
	move	$5,$fp
	sll	$2,$2,2
	addu	$2,$6,$2
	lw	$3,0($2)
	addiu	$4,$4,1
	sw	$3,0($5)
	beq	$4,$10,$L3867
	addiu	$5,$5,32

$L4159:
	lw	$3,212($sp)
	lw	$2,9748($17)
	mtlo	$3
	madd	$2,$4
	addiu	$4,$4,1
	mflo	$2
	sll	$2,$2,2
	addu	$2,$6,$2
	lw	$3,0($2)
	sw	$3,0($5)
	bne	$4,$10,$L4159
	addiu	$5,$5,32

$L3867:
	lw	$2,6172($17)
$L4191:
	blez	$2,$L3870
	lw	$4,184($sp)

	lw	$3,9748($17)
	lw	$2,1560($22)
	subu	$3,$4,$3
	sll	$3,$3,2
	addu	$2,$2,$3
	lwl	$4,3($2)
	lwl	$3,7($2)
	lwr	$4,0($2)
	lwl	$5,11($2)
	lwl	$6,15($2)
	lwr	$3,4($2)
	lwr	$6,12($2)
	lwr	$5,8($2)
	swl	$4,3($18)
	swr	$4,0($18)
	swl	$3,7($18)
	swr	$3,4($18)
	swl	$5,11($18)
	swr	$5,8($18)
	swl	$6,15($18)
	swr	$6,12($18)
	lw	$2,152($17)
	lw	$6,180($sp)
	lw	$3,8816($17)
	subu	$2,$6,$2
	sll	$2,$2,3
	addu	$3,$3,$2
	lb	$4,4($3)
	li	$2,1			# 0x1
	nor	$4,$0,$4
	li	$3,-2			# 0xfffffffffffffffe
	movn	$3,$2,$4
	sb	$3,3($8)
	sb	$3,0($8)
	sb	$3,1($8)
	sb	$3,2($8)
	lw	$2,144($17)
	lw	$7,6168($17)
	addiu	$2,$2,-1
	slt	$2,$7,$2
	beq	$2,$0,$L3873
	li	$2,-2

	lw	$2,9748($17)
	lw	$4,184($sp)
	lw	$3,1560($22)
	subu	$2,$4,$2
	addiu	$2,$2,4
	sll	$2,$2,2
	addu	$3,$3,$2
	lw	$4,0($3)
	lw	$5,8816($17)
	sw	$4,16($18)
	lw	$3,152($17)
	subu	$4,$6,$3
	addiu	$2,$4,1
	sll	$2,$2,3
	addu	$2,$5,$2
	lb	$3,0($2)
	li	$6,-1			# 0xffffffffffffffff
	beq	$3,$6,$L3874
	sll	$2,$4,3

	addu	$2,$5,$2
	lb	$3,4($2)
	beq	$3,$6,$L3874
	li	$2,1			# 0x1

	lw	$7,6168($17)
	sb	$2,9464($19)
$L3876:
	blez	$7,$L3877
	lw	$4,184($sp)

	lw	$2,9748($17)
	lw	$3,1560($22)
	subu	$2,$2,$4
	addiu	$2,$2,1
	sll	$2,$2,2
	subu	$3,$3,$2
	lw	$4,0($3)
	lw	$6,180($sp)
	sw	$4,-4($18)
	lw	$2,152($17)
	lw	$5,8816($17)
	subu	$2,$2,$6
	addiu	$2,$2,1
	sll	$2,$2,3
	subu	$5,$5,$2
	lb	$3,3($5)
	li	$2,-2			# 0xfffffffffffffffe
	nor	$3,$0,$3
	li	$4,1			# 0x1
	movn	$2,$4,$3
	sb	$2,9459($19)
$L3880:
	lw	$3,2084($17)
	li	$2,3			# 0x3
	bne	$3,$2,$L3881
	lw	$4,216($sp)

	lw	$3,92($sp)
	addiu	$3,$3,40
	addiu	$19,$19,40
	sw	$3,92($sp)
	addiu	$9,$9,160
	addiu	$fp,$fp,160
	addiu	$22,$22,4
	addiu	$8,$8,40
	beq	$19,$4,$L3883
	addiu	$18,$18,160

	b	$L3882
	lw	$7,6168($17)

$L4158:
	li	$2,2			# 0x2
	b	$L3864
	sw	$2,172($sp)

$L3809:
	lw	$16,%got(ff_interleaved_golomb_vlc_len)($28)
	srl	$4,$3,24
	addu	$2,$16,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_interleaved_ue_golomb_vlc_code)($28)
	addu	$3,$3,$7
	addu	$2,$2,$4
	lbu	$2,0($2)
	sw	$3,8456($17)
	b	$L3812
	sw	$2,200($sp)

$L3963:
	beq	$2,$0,$L3965
	nop

	b	$L3964
	li	$6,2			# 0x2

$L3976:
	li	$4,1			# 0x1
$L4208:
	b	$L3977
	sw	$4,188($sp)

$L4138:
	lw	$4,200($sp)
	addiu	$4,$4,8
	b	$L3819
	sw	$4,200($sp)

$L4136:
	lw	$10,8448($17)
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,2($3)
	lbu	$6,1($3)
	sll	$4,$4,24
	or	$2,$2,$4
	sll	$5,$5,8
	or	$2,$2,$5
	sll	$6,$6,16
	or	$2,$2,$6
	andi	$3,$7,0x7
	b	$L3807
	sll	$3,$2,$3

$L4125:
	lw	$4,168($17)
$L3833:
	lw	$2,56($17)
	srl	$2,$2,14
	andi	$2,$2,0x1
	sw	$2,136($sp)
$L3830:
	addiu	$3,$5,-1
	slt	$2,$22,$3
	movn	$3,$22,$2
	sw	$3,80($sp)
	move	$6,$3
$L3831:
	slt	$2,$fp,-16
	beq	$2,$0,$L3836
	addiu	$19,$4,-1

	li	$19,-16			# 0xfffffffffffffff0
$L3837:
	lw	$18,176($17)
	lw	$3,240($17)
	mul	$4,$19,$18
	lw	$8,136($sp)
	addu	$2,$4,$6
	lw	$6,1464($17)
	addu	$5,$3,$2
	bne	$8,$0,$L3839
	sw	$6,132($sp)

	move	$6,$18
	b	$L3835
	mul	$4,$18,$fp

$L4137:
	bne	$6,$2,$L4160
	addiu	$7,$7,8

	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	li	$9,1			# 0x1
	li	$11,9			# 0x9
$L3815:
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	addu	$5,$12,$8
	srl	$8,$2,24
	addu	$3,$16,$8
	lbu	$6,0($3)
	lbu	$4,0($5)
	sll	$2,$9,4
	sltu	$3,$6,9
	bne	$3,$0,$L3816
	or	$9,$4,$2

	beq	$6,$11,$L3815
	addiu	$7,$7,8

	b	$L4190
	addu	$2,$12,$8

$L4131:
	jalr	$25
	lw	$16,0($17)

	lw	$4,9772($17)
	lw	$28,40($sp)
	sw	$4,16($sp)
	lw	$3,9776($17)
	lw	$25,%call16(av_log)($28)
	sw	$3,20($sp)
	lw	$5,2076($17)
	lui	$6,%hi($LC73)
	sw	$5,24($sp)
	lw	$3,2056($17)
	move	$4,$16
	addiu	$6,$6,%lo($LC73)
	sw	$3,28($sp)
	move	$7,$2
	jalr	$25
	li	$5,2			# 0x2

	b	$L3789
	lw	$28,40($sp)

$L4155:
	lw	$2,8984($17)
	lw	$4,8992($17)
	andi	$2,$2,0x8000
	li	$3,4			# 0x4
	andi	$4,$4,0x8000
	bne	$4,$0,$L4042
	movn	$3,$0,$2

	lui	$2,%hi(left.8912)
	addiu	$2,$2,%lo(left.8912)
	addu	$2,$3,$2
	lb	$3,0($2)
	bltz	$3,$L4161
	lw	$25,%call16(av_log)($28)

$L4042:
	b	$L4039
	sw	$3,8756($17)

$L3862:
	li	$2,8			# 0x8
	beq	$4,$2,$L3890
	li	$2,33			# 0x21

	beq	$4,$2,$L3891
	lw	$25,%call16(memset)($28)

	lw	$3,200($sp)
	addiu	$2,$3,-8
	lui	$3,%hi(i_mb_type_info)
	addiu	$6,$3,%lo(i_mb_type_info)
	sll	$5,$2,2
	addu	$2,$6,$5
	lbu	$3,2($2)
	andi	$4,$3,0x1
	sll	$2,$4,1
	sra	$3,$3,1
	addu	$2,$2,$4
	xori	$3,$3,0x1
	xor	$3,$3,$2
	sltu	$4,$3,7
	beq	$4,$0,$L4162
	andi	$2,$9,0x8000

	bne	$2,$0,$L3924
	lui	$2,%hi(top.8911)

	addiu	$2,$2,%lo(top.8911)
	addu	$2,$3,$2
	lb	$3,0($2)
	bltz	$3,$L4163
	lw	$25,%call16(av_log)($28)

$L3924:
	lw	$2,8992($17)
	andi	$2,$2,0x8000
	bne	$2,$0,$L3925
	li	$2,-1			# 0xffffffffffffffff

	lui	$2,%hi(left.8912)
	addiu	$2,$2,%lo(left.8912)
	addu	$2,$3,$2
	lb	$2,0($2)
	bltz	$2,$L4164
	lw	$25,%call16(av_log)($28)

	sw	$2,8760($17)
$L3927:
	addu	$2,$6,$5
	lbu	$2,3($2)
	li	$4,2			# 0x2
	sw	$2,176($sp)
	lw	$3,2084($17)
	b	$L3845
	sw	$4,192($sp)

$L3866:
	move	$3,$9
	move	$2,$0
$L3869:
	addiu	$2,$2,1
	sw	$0,0($3)
	bne	$2,$10,$L3869
	addiu	$3,$3,32

	b	$L4191
	lw	$2,6172($17)

$L3883:
	lw	$3,200($sp)
	li	$2,2			# 0x2
$L4213:
	bne	$3,$2,$L4165
	lw	$3,184($sp)

	lw	$2,9748($17)
	move	$18,$0
	mtlo	$3
	madd	$2,$18
	lw	$2,1560($17)
	mflo	$4
	lw	$25,%call16(memset)($28)
	sll	$4,$4,2
	addu	$4,$2,$4
	move	$5,$0
	li	$6,16			# 0x10
	li	$19,4			# 0x4
	jalr	$25
	addiu	$18,$18,1

	beq	$18,$19,$L3886
	lw	$28,40($sp)

$L4166:
	lw	$3,184($sp)
	lw	$2,9748($17)
	mtlo	$3
	madd	$2,$18
	lw	$2,1560($17)
	mflo	$4
	lw	$25,%call16(memset)($28)
	sll	$4,$4,2
	addu	$4,$2,$4
	move	$5,$0
	li	$6,16			# 0x10
	jalr	$25
	addiu	$18,$18,1

	bne	$18,$19,$L4166
	lw	$28,40($sp)

$L3886:
	lw	$6,200($sp)
	move	$4,$17
	xori	$2,$6,0x3
	lw	$6,172($sp)
	sltu	$2,$2,1
	move	$5,$0
	li	$7,1			# 0x1
$L4123:
	.option	pic0
	jal	svq3_mc_dir
	.option	pic2
	sw	$2,16($sp)

	bltz	$2,$L3821
	lw	$28,40($sp)

$L3861:
	li	$4,8			# 0x8
$L4200:
	sw	$4,192($sp)
	sw	$0,176($sp)
	move	$18,$0
	move	$19,$0
$L4056:
	lw	$8,180($sp)
	lw	$2,8816($17)
	sll	$4,$8,3
	addu	$2,$2,$4
	li	$3,2
	sb	$3,7($2)
	sb	$3,0($2)
	sb	$3,1($2)
	sb	$3,2($2)
	sb	$3,3($2)
	sb	$3,4($2)
	sb	$3,5($2)
	sb	$3,6($2)
	b	$L3933
	move	$22,$0

$L3937:
	lw	$8,8456($17)
	lw	$10,8448($17)
	sra	$2,$8,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$3,$3,$4
	li	$2,-1434451968			# 0xffffffffaa800000
	and	$2,$3,$2
	bne	$2,$0,$L3939
	srl	$9,$3,24

	addu	$2,$16,$9
	lbu	$6,0($2)
	sltu	$3,$6,9
	beq	$3,$0,$L4167
	li	$2,9			# 0x9

	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	li	$7,1			# 0x1
$L3946:
	addu	$8,$8,$6
$L3944:
	addu	$2,$12,$9
$L4196:
	addiu	$3,$6,-1
	sra	$3,$3,1
	lbu	$4,0($2)
	sll	$3,$7,$3
	or	$4,$4,$3
	sw	$8,8456($17)
	addiu	$7,$4,-1
$L3942:
	sltu	$2,$7,48
	beq	$2,$0,$L4168
	lw	$3,192($sp)

	andi	$2,$3,0x7
	beq	$2,$0,$L3949
	lui	$2,%hi(golomb_to_inter_cbp)

	lui	$2,%hi(golomb_to_intra4x4_cbp)
	addiu	$2,$2,%lo(golomb_to_intra4x4_cbp)
	addu	$2,$7,$2
	lbu	$2,0($2)
	lw	$3,2084($17)
	b	$L3938
	sw	$2,176($sp)

$L4135:
	addiu	$4,$4,8
	sb	$11,0($5)
	bne	$4,$12,$L3803
	addiu	$5,$5,8

	b	$L4192
	addiu	$6,$6,1

$L4139:
	slt	$2,$6,4
	bne	$2,$0,$L3820
	addiu	$6,$6,4

	b	$L3819
	sw	$6,200($sp)

$L3836:
	slt	$2,$19,$fp
	b	$L3837
	movz	$19,$fp,$2

$L4133:
	beq	$4,$2,$L3791
	slt	$2,$3,32

	bne	$2,$0,$L3793
	li	$2,1			# 0x1

	bne	$4,$2,$L3791
	slt	$2,$3,48

	bne	$2,$0,$L3793
	nop

	b	$L3785
	move	$21,$0

$L3965:
	b	$L3964
	slt	$6,$3,10

$L3873:
	b	$L3876
	sb	$2,9464($19)

$L3841:
	lw	$2,84($sp)
	lw	$8,88($sp)
	li	$6,9			# 0x9
	lw	$4,2040($17)
	sw	$6,16($sp)
	sw	$8,20($sp)
	sw	$2,24($sp)
	lw	$2,164($17)
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sra	$2,$2,1
	sw	$2,28($sp)
	lw	$3,168($17)
	move	$6,$18
	sra	$3,$3,1
	sw	$3,32($sp)
	jalr	$25
	li	$7,9			# 0x9

	lw	$5,2040($17)
	b	$L3842
	lw	$6,180($17)

$L3839:
	li	$2,17			# 0x11
	lw	$4,2040($17)
	sw	$2,16($sp)
	lw	$2,80($sp)
	sw	$19,24($sp)
	sw	$2,20($sp)
	lw	$2,164($17)
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sw	$2,28($sp)
	lw	$3,168($17)
	move	$6,$18
	sw	$3,32($sp)
	jalr	$25
	li	$7,17			# 0x11

	mul	$4,$18,$fp
	lw	$5,2040($17)
	b	$L3835
	lw	$6,176($17)

$L4140:
	lw	$2,56($17)
	slt	$3,$22,-16
	srl	$2,$2,14
	andi	$2,$2,0x1
	sw	$2,136($sp)
	lw	$5,164($17)
	beq	$3,$0,$L3830
	lw	$4,168($17)

	li	$6,-16			# 0xfffffffffffffff0
	b	$L3831
	sw	$6,80($sp)

$L3870:
	lw	$25,%call16(memset)($28)
	lw	$4,92($sp)
	sw	$8,220($sp)
	sw	$9,224($sp)
	sw	$10,228($sp)
	li	$5,-2			# 0xfffffffffffffffe
	jalr	$25
	li	$6,8			# 0x8

	lw	$28,40($sp)
	lw	$10,228($sp)
	lw	$9,224($sp)
	b	$L3880
	lw	$8,220($sp)

$L3891:
	lw	$4,152($sp)
	li	$5,-1			# 0xffffffffffffffff
	jalr	$25
	li	$6,40			# 0x28

	li	$2,33685504			# 0x2020000
	ori	$2,$2,0x202
	lw	$28,40($sp)
	sw	$2,8812($17)
	sw	$2,8788($17)
	sw	$2,8796($17)
	sw	$2,8804($17)
	lw	$4,152($17)
$L4197:
	lw	$5,6172($17)
	lw	$2,6168($17)
	mul	$6,$4,$5
	lw	$3,8816($17)
	addu	$4,$6,$2
	sll	$4,$4,3
	lbu	$6,8791($17)
	addu	$3,$3,$4
	sb	$6,0($3)
	lw	$2,8816($17)
	lbu	$5,8799($17)
	addu	$2,$2,$4
	sb	$5,1($2)
	lw	$3,8816($17)
	lbu	$5,8807($17)
	addu	$3,$3,$4
	sb	$5,2($3)
	lw	$2,8816($17)
	lbu	$5,8815($17)
	addu	$2,$2,$4
	sb	$5,3($2)
	lw	$3,8816($17)
	lbu	$5,8812($17)
	addu	$3,$3,$4
	sb	$5,4($3)
	lw	$2,8816($17)
	lbu	$5,8813($17)
	addu	$2,$2,$4
	sb	$5,5($2)
	lw	$3,8816($17)
	lbu	$5,8814($17)
	addu	$3,$3,$4
	sb	$5,6($3)
	lw	$8,200($sp)
	li	$2,8			# 0x8
	beq	$8,$2,$L4169
	li	$2,185270272			# 0xb0b0000

	ori	$2,$2,0xb0b
	sw	$2,8812($17)
	sw	$2,8788($17)
	sw	$2,8796($17)
	sw	$2,8804($17)
	li	$3,13311			# 0x33ff
	li	$4,24415			# 0x5f5f
	li	$2,1			# 0x1
	sw	$3,8984($17)
	sw	$4,8992($17)
	lw	$3,2084($17)
	sw	$0,176($sp)
	b	$L4215
	sw	$2,192($sp)

$L4132:
	li	$2,3			# 0x3
	bne	$4,$2,$L3790
	nop

	b	$L3785
	move	$21,$0

$L3939:
	srl	$4,$3,24
	addu	$2,$16,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_interleaved_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($17)
	b	$L3942
	lbu	$7,0($2)

$L3949:
	addiu	$2,$2,%lo(golomb_to_inter_cbp)
	addu	$2,$7,$2
	lbu	$2,0($2)
	lw	$3,2084($17)
	b	$L3938
	sw	$2,176($sp)

$L4006:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC82)
	addiu	$6,$6,%lo($LC82)
	jalr	$25
	move	$5,$0

	b	$L3821
	lw	$28,40($sp)

$L4153:
	addiu	$11,$11,128
	bne	$11,$fp,$L4059
	lw	$3,176($sp)

	andi	$2,$3,0x20
	beq	$2,$0,$L4194
	lw	$4,180($sp)

	lui	$2,%hi(scan8+16)
	lui	$3,%hi(scan8+24)
	lw	$22,%got(ff_interleaved_ue_golomb_vlc_code)($28)
	lw	$13,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	addiu	$15,$2,%lo(scan8+16)
	addiu	$25,$3,%lo(scan8+24)
	li	$19,-1434451968			# 0xffffffffaa800000
	li	$14,9			# 0x9
	li	$24,-2147483648			# 0xffffffff80000000
$L4061:
	lbu	$2,0($15)
	li	$3,1
	addu	$2,$17,$2
	sb	$3,9080($2)
	lw	$10,0($20)
	li	$11,1			# 0x1
$L4021:
	lw	$7,8($20)
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	and	$4,$2,$19
	bne	$4,$0,$L4028
	srl	$8,$2,24

	addu	$2,$16,$8
	lbu	$6,0($2)
	sltu	$3,$6,9
	beq	$3,$0,$L4170
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

	li	$9,1			# 0x1
$L4035:
	addu	$7,$7,$6
$L4033:
	addu	$2,$12,$8
$L4193:
	addiu	$3,$6,-1
	sra	$3,$3,1
	lbu	$4,0($2)
	sll	$3,$9,$3
	or	$4,$4,$3
	sw	$7,8($20)
	addiu	$5,$4,-1
$L4031:
	beq	$5,$0,$L4171
	nop

	beq	$5,$24,$L4022
	addiu	$2,$5,1

	sra	$4,$2,1
	slt	$3,$4,16
	bne	$3,$0,$L4172
	sll	$2,$4,1

	andi	$3,$4,0xf
	bne	$3,$0,$L4025
	slt	$2,$3,3

	li	$6,4			# 0x4
$L4026:
	sra	$2,$4,4
	addu	$7,$6,$2
$L4024:
	addu	$6,$3,$11
	slt	$2,$6,16
	beq	$2,$0,$L4022
	lui	$8,%hi(zigzag_scan)

	addiu	$8,$8,%lo(zigzag_scan)
	addu	$2,$8,$6
	lbu	$4,0($2)
	andi	$3,$5,0x1
	addiu	$3,$3,-1
	sll	$4,$4,1
	xor	$2,$7,$3
	subu	$2,$2,$3
	addu	$4,$18,$4
	sh	$2,0($4)
	b	$L4021
	addiu	$11,$6,1

$L4172:
	lui	$4,%hi(svq3_dct_tables)
	addiu	$4,$4,%lo(svq3_dct_tables)
	addu	$2,$2,$4
	lbu	$7,1($2)
	b	$L4024
	lbu	$3,0($2)

$L4028:
	srl	$4,$2,24
	addu	$3,$16,$4
	lbu	$2,0($3)
	addu	$4,$22,$4
	addu	$2,$2,$7
	sw	$2,8($20)
	b	$L4031
	lbu	$5,0($4)

$L4170:
	bne	$6,$14,$L4173
	addiu	$7,$7,8

	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	li	$9,1			# 0x1
$L4034:
	sra	$3,$7,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$7,0x7
	sll	$2,$2,$3
	addu	$5,$13,$8
	srl	$8,$2,24
	addu	$3,$16,$8
	lbu	$6,0($3)
	lbu	$4,0($5)
	sll	$2,$9,4
	sltu	$3,$6,9
	bne	$3,$0,$L4035
	or	$9,$4,$2

	beq	$6,$14,$L4034
	addiu	$7,$7,8

	b	$L4193
	addu	$2,$12,$8

$L4025:
	beq	$2,$0,$L4027
	nop

	b	$L4026
	li	$6,2			# 0x2

$L4027:
	b	$L4026
	slt	$6,$3,10

$L4171:
	addiu	$15,$15,1
	bne	$15,$25,$L4061
	addiu	$18,$18,32

	b	$L4194
	lw	$4,180($sp)

$L4022:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC83)
	addiu	$6,$6,%lo($LC83)
	jalr	$25
	move	$5,$0

	b	$L3821
	lw	$28,40($sp)

$L4100:
	lw	$5,8456($17)
	lw	$3,8448($17)
	sra	$4,$5,3
	addu	$3,$3,$4
	lbu	$2,0($3)
	andi	$4,$5,0x7
	sll	$2,$2,$4
	andi	$2,$2,0x00ff
	srl	$2,$2,7
	lw	$3,9772($17)
	addiu	$5,$5,1
	sltu	$2,$2,1
	bne	$3,$2,$L3863
	sw	$5,8456($17)

	li	$8,3			# 0x3
	b	$L3864
	sw	$8,172($sp)

$L3960:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC80)
	addiu	$6,$6,%lo($LC80)
	jalr	$25
	move	$5,$0

	b	$L3821
	lw	$28,40($sp)

$L3877:
	li	$6,-2
	b	$L3880
	sb	$6,9459($19)

$L4142:
	lw	$3,184($sp)
	lw	$2,9748($17)
	mtlo	$3
	madd	$18,$2
	lw	$2,1564($17)
	mflo	$4
	lw	$25,%call16(memset)($28)
	sll	$4,$4,2
	addu	$4,$2,$4
	move	$5,$0
	li	$6,16			# 0x10
	li	$19,4			# 0x4
	jalr	$25
	addiu	$18,$18,1

	beq	$18,$19,$L3928
	lw	$28,40($sp)

$L4174:
	lw	$3,184($sp)
	lw	$2,9748($17)
	mtlo	$3
	madd	$18,$2
	lw	$2,1564($17)
	mflo	$4
	lw	$25,%call16(memset)($28)
	sll	$4,$4,2
	addu	$4,$2,$4
	move	$5,$0
	li	$6,16			# 0x10
	jalr	$25
	addiu	$18,$18,1

	bne	$18,$19,$L4174
	lw	$28,40($sp)

	b	$L4195
	lw	$4,192($sp)

$L3874:
	li	$2,-2			# 0xfffffffffffffffe
	sb	$2,9464($19)
	b	$L3876
	lw	$7,6168($17)

$L3844:
	lw	$2,6168($17)
	lw	$3,6172($17)
	sll	$22,$2,4
	bltz	$22,$L4175
	sll	$fp,$3,4

	lw	$5,164($17)
	addiu	$2,$5,-17
	slt	$2,$22,$2
	beq	$2,$0,$L4126
	nop

	bltz	$fp,$L4126
	nop

	lw	$4,168($17)
	addiu	$2,$4,-17
	slt	$2,$fp,$2
	beq	$2,$0,$L3850
	move	$19,$fp

	lw	$6,176($17)
	lw	$3,648($17)
	mul	$4,$fp,$6
	move	$18,$6
	addu	$2,$22,$4
	addu	$5,$3,$2
	lw	$2,1464($17)
	sw	$2,120($sp)
	sw	$22,68($sp)
	sw	$0,124($sp)
$L3852:
	lw	$2,120($sp)
	addu	$4,$22,$4
	lw	$25,2660($17)
	addu	$4,$2,$4
	move	$6,$18
	jalr	$25
	li	$7,16			# 0x10

	lw	$2,56($17)
	andi	$2,$2,0x2000
	bne	$2,$0,$L4120
	lw	$28,40($sp)

	lw	$6,68($sp)
	slt	$3,$19,$fp
	slt	$2,$6,$22
	addu	$3,$3,$19
	addu	$2,$2,$6
	sra	$22,$22,1
	sra	$2,$2,1
	sra	$3,$3,1
	sw	$22,108($sp)
	sw	$2,76($sp)
	sw	$3,72($sp)
	sra	$22,$fp,1
	move	$19,$0
$L3860:
	lw	$8,116($sp)
	lw	$18,180($17)
	addu	$2,$8,$19
	lw	$4,4($2)
	lw	$2,76($sp)
	mtlo	$2
	lw	$2,72($sp)
	madd	$2,$18
	addu	$2,$17,$19
	mflo	$3
	addu	$5,$4,$3
	lw	$3,124($sp)
	bne	$3,$0,$L3858
	lw	$fp,1468($2)

	move	$6,$18
$L3859:
	lw	$2,108($sp)
	lw	$3,104($sp)
	mtlo	$2
	madd	$22,$18
	lw	$25,0($3)
	mflo	$4
	li	$7,8			# 0x8
	jalr	$25
	addu	$4,$fp,$4

	addiu	$19,$19,4
	li	$2,8			# 0x8
	bne	$19,$2,$L3860
	lw	$28,40($sp)

$L4120:
	b	$L4121
	lw	$3,2084($17)

$L4167:
	bne	$6,$2,$L4176
	addiu	$8,$8,8

	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	li	$7,1			# 0x1
	li	$11,9			# 0x9
$L3945:
	sra	$3,$8,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$8,0x7
	sll	$2,$2,$3
	addu	$5,$12,$9
	srl	$9,$2,24
	addu	$3,$16,$9
	lbu	$6,0($3)
	lbu	$4,0($5)
	sll	$2,$7,4
	sltu	$3,$6,9
	bne	$3,$0,$L3946
	or	$7,$4,$2

	beq	$6,$11,$L3945
	addiu	$8,$8,8

	b	$L4196
	addu	$2,$12,$9

$L3779:
	move	$2,$0
	move	$3,$0
	b	$L3780
	move	$6,$0

$L3932:
	lw	$6,192($sp)
	andi	$18,$6,0x800
	b	$L4056
	andi	$19,$6,0x2

$L4126:
	lw	$4,168($17)
$L3850:
	lw	$2,56($17)
	srl	$2,$2,14
	andi	$2,$2,0x1
	sw	$2,124($sp)
$L3847:
	addiu	$3,$5,-1
	slt	$2,$22,$3
	movn	$3,$22,$2
	sw	$3,68($sp)
	move	$6,$3
$L3848:
	slt	$2,$fp,-16
	bne	$2,$0,$L3854
	li	$19,-16			# 0xfffffffffffffff0

	addiu	$19,$4,-1
	slt	$2,$19,$fp
	movz	$19,$fp,$2
$L3854:
	lw	$18,176($17)
	lw	$3,648($17)
	mul	$4,$19,$18
	lw	$8,124($sp)
	addu	$2,$4,$6
	lw	$6,1464($17)
	addu	$5,$3,$2
	bne	$8,$0,$L3856
	sw	$6,120($sp)

	b	$L3852
	mul	$4,$fp,$18

$L3890:
	lw	$25,%call16(memset)($28)
	lw	$4,152($sp)
	li	$5,-1			# 0xffffffffffffffff
	jalr	$25
	li	$6,40			# 0x28

	lw	$2,6168($17)
	blez	$2,$L3893
	lw	$28,40($sp)

	lw	$6,180($sp)
	lw	$3,8816($17)
	addiu	$2,$6,-1
	sll	$2,$2,3
	addu	$6,$3,$2
	move	$5,$17
	move	$4,$0
	li	$7,4			# 0x4
$L3894:
	addu	$2,$6,$4
	lbu	$3,0($2)
	addiu	$4,$4,1
	sb	$3,8787($5)
	bne	$4,$7,$L3894
	addiu	$5,$5,8

	lb	$3,8787($17)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L4178
	li	$2,24415			# 0x5f5f

$L3893:
	lw	$2,6172($17)
	blez	$2,$L3895
	lw	$8,180($sp)

	lw	$2,152($17)
	lw	$4,8816($17)
	subu	$2,$8,$2
	sll	$2,$2,3
	addu	$4,$4,$2
	lbu	$3,4($4)
	sb	$3,8780($17)
	lbu	$5,5($4)
	sll	$6,$3,24
	sb	$5,8781($17)
	lbu	$2,6($4)
	sra	$6,$6,24
	sb	$2,8782($17)
	lbu	$3,3($4)
	li	$2,-1			# 0xffffffffffffffff
	beq	$6,$2,$L4179
	sb	$3,8783($17)

$L3895:
	lui	$2,%hi(scan8)
	lui	$3,%hi(scan8+16)
	lw	$14,%got(ff_interleaved_ue_golomb_vlc_code)($28)
	lw	$15,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	addiu	$11,$2,%lo(scan8)
	addiu	$22,$3,%lo(scan8+16)
	li	$13,-1434451968			# 0xffffffffaa800000
	li	$18,9			# 0x9
	li	$19,-1			# 0xffffffffffffffff
$L3908:
	lw	$9,8456($17)
	lw	$10,8448($17)
	sra	$3,$9,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$9,0x7
	sll	$2,$2,$3
	and	$4,$2,$13
	bne	$4,$0,$L3896
	srl	$4,$2,24

	srl	$7,$2,24
	addu	$2,$16,$7
	lbu	$6,0($2)
	sltu	$3,$6,9
	beq	$3,$0,$L4180
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

	li	$8,1			# 0x1
$L3903:
	addu	$9,$9,$6
$L3901:
	addu	$2,$12,$7
$L4198:
	addiu	$3,$6,-1
	sra	$3,$3,1
	lbu	$4,0($2)
	sll	$3,$8,$3
	or	$4,$4,$3
	sw	$9,8456($17)
	addiu	$7,$4,-1
$L3899:
	sltu	$2,$7,25
	beq	$2,$0,$L4181
	sll	$8,$7,1

	lbu	$6,0($11)
	addu	$2,$17,$6
	lb	$3,8768($2)
	lb	$5,8775($2)
	addiu	$3,$3,1
	addiu	$5,$5,1
	sll	$2,$3,5
	sll	$3,$3,1
	sll	$4,$5,2
	subu	$2,$2,$3
	lui	$3,%hi(svq3_pred_0)
	addu	$4,$4,$5
	addiu	$3,$3,%lo(svq3_pred_0)
	addu	$8,$8,$3
	addu	$2,$2,$4
	lui	$4,%hi(svq3_pred_1)
	lbu	$3,0($8)
	addiu	$4,$4,%lo(svq3_pred_1)
	addu	$2,$2,$4
	addu	$2,$2,$3
	lb	$5,0($2)
	addiu	$7,$6,8775
	addu	$7,$17,$7
	sb	$5,1($7)
	addu	$6,$17,$6
	lb	$4,8769($6)
	addiu	$5,$5,1
	addiu	$4,$4,1
	sll	$2,$4,5
	sll	$3,$5,2
	sll	$4,$4,1
	subu	$2,$2,$4
	addu	$3,$3,$5
	lui	$6,%hi(svq3_pred_1)
	addu	$2,$2,$3
	lbu	$4,1($8)
	addiu	$6,$6,%lo(svq3_pred_1)
	addu	$2,$2,$6
	addu	$2,$2,$4
	lb	$2,0($2)
	lb	$3,1($7)
	beq	$3,$19,$L3906
	sb	$2,2($7)

	beq	$2,$19,$L3906
	addiu	$11,$11,2

	bne	$11,$22,$L3908
	nop

	b	$L4197
	lw	$4,152($17)

$L3896:
	addu	$3,$16,$4
	lbu	$2,0($3)
	addu	$4,$14,$4
	addu	$2,$2,$9
	sw	$2,8456($17)
	b	$L3899
	lbu	$7,0($4)

$L4180:
	bne	$6,$18,$L4182
	addiu	$9,$9,8

	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)
	li	$8,1			# 0x1
$L3902:
	sra	$3,$9,3
	addu	$3,$10,$3
	lbu	$4,0($3)
	lbu	$2,3($3)
	lbu	$5,1($3)
	sll	$4,$4,24
	lbu	$6,2($3)
	or	$2,$2,$4
	sll	$5,$5,16
	or	$2,$2,$5
	sll	$6,$6,8
	or	$2,$2,$6
	andi	$3,$9,0x7
	sll	$2,$2,$3
	addu	$5,$15,$7
	srl	$7,$2,24
	addu	$3,$16,$7
	lbu	$6,0($3)
	lbu	$4,0($5)
	sll	$2,$8,4
	sltu	$3,$6,9
	bne	$3,$0,$L3903
	or	$8,$4,$2

	beq	$6,$18,$L3902
	addiu	$9,$9,8

	b	$L4198
	addu	$2,$12,$7

$L3925:
	bne	$3,$2,$L3927
	sw	$3,8760($17)

$L4055:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC77)
	addiu	$6,$6,%lo($LC77)
	jalr	$25
	move	$5,$0

	b	$L3821
	lw	$28,40($sp)

$L4097:
	lw	$5,56($sp)
	addiu	$5,$5,24
	b	$L3781
	sw	$5,56($sp)

$L4175:
	lw	$2,56($17)
	slt	$3,$22,-16
	srl	$2,$2,14
	andi	$2,$2,0x1
	sw	$2,124($sp)
	lw	$5,164($17)
	beq	$3,$0,$L3847
	lw	$4,168($17)

	li	$6,-16			# 0xfffffffffffffff0
	b	$L3848
	sw	$6,68($sp)

$L3858:
	lw	$2,72($sp)
	lw	$8,76($sp)
	li	$6,9			# 0x9
	lw	$4,2040($17)
	sw	$6,16($sp)
	sw	$8,20($sp)
	sw	$2,24($sp)
	lw	$2,164($17)
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sra	$2,$2,1
	sw	$2,28($sp)
	lw	$3,168($17)
	move	$6,$18
	sra	$3,$3,1
	sw	$3,32($sp)
	jalr	$25
	li	$7,9			# 0x9

	lw	$5,2040($17)
	b	$L3859
	lw	$6,180($17)

$L4134:
	addu	$4,$17,$2
	lw	$3,-6296($4)
	lw	$2,-6208($4)
	subu	$2,$3,$2
	bltz	$2,$L4183
	sw	$2,-6216($4)

$L3796:
	li	$2,65536			# 0x10000
	addu	$2,$17,$2
	lw	$3,-6216($2)
	beq	$3,$0,$L4211
	lw	$25,%call16(av_log)($28)

	lw	$2,-6212($2)
	slt	$2,$3,$2
	bne	$2,$0,$L4212
	move	$6,$0

	lw	$25,%call16(av_log)($28)
$L4211:
	lw	$4,0($17)
	lui	$6,%hi($LC74)
	addiu	$6,$6,%lo($LC74)
	jalr	$25
	move	$5,$0

	lw	$28,40($sp)
	b	$L3785
	li	$21,-1			# 0xffffffffffffffff

$L3952:
	addiu	$9,$9,8
	sra	$2,$9,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$2,$9,0x7
	sll	$3,$3,$2
	ori	$4,$8,0x1
	srl	$3,$3,8
	li	$2,-1431699456			# 0xffffffffaaaa0000
	or	$6,$4,$3
	ori	$2,$2,0xaaaa
	and	$2,$6,$2
	beq	$2,$0,$L4184
	nop

	bltz	$6,$L4185
	li	$5,31			# 0x1f

$L3957:
	sll	$3,$6,$5
	sll	$4,$6,2
	srl	$2,$6,30
	addiu	$5,$5,-1
	addu	$2,$2,$4
	srl	$3,$3,$5
	subu	$6,$2,$3
	bgez	$6,$L3957
	sll	$2,$5,1

	subu	$8,$0,$2
$L3956:
	sll	$2,$6,$5
	srl	$2,$2,$5
	andi	$3,$6,0x1
	addiu	$2,$2,-1
	subu	$3,$0,$3
	xor	$2,$2,$3
	addiu	$4,$9,55
	addu	$4,$4,$8
	addiu	$2,$2,1
	sw	$4,8456($17)
	b	$L3953
	sra	$2,$2,1

$L3856:
	li	$2,17			# 0x11
	lw	$4,2040($17)
	sw	$2,16($sp)
	lw	$2,68($sp)
	sw	$19,24($sp)
	sw	$2,20($sp)
	lw	$2,164($17)
	lw	$25,%call16(ff_emulated_edge_mc)($28)
	sw	$2,28($sp)
	lw	$3,168($17)
	move	$6,$18
	sw	$3,32($sp)
	jalr	$25
	li	$7,17			# 0x11

	mul	$4,$fp,$18
	lw	$5,2040($17)
	b	$L3852
	lw	$18,176($17)

$L3906:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC76)
	addiu	$6,$6,%lo($LC76)
	jalr	$25
	move	$5,$0

	b	$L3821
	lw	$28,40($sp)

$L4169:
	lw	$2,8984($17)
	andi	$2,$2,0x8000
	bne	$2,$0,$L3910
	lui	$2,%hi(top.8874)

	addiu	$6,$2,%lo(top.8874)
	move	$3,$17
	move	$4,$0
	b	$L3914
	li	$5,4			# 0x4

$L3911:
	beq	$7,$0,$L3913
	nop

	sb	$7,8788($3)
$L3913:
	beq	$4,$5,$L3910
	addiu	$3,$3,1

$L3914:
	lb	$2,8788($3)
	addu	$2,$6,$2
	lb	$7,0($2)
	bgez	$7,$L3911
	addiu	$4,$4,1

	lw	$2,6168($17)
	lw	$4,0($17)
	sw	$2,16($sp)
	lw	$3,6172($17)
	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC48)
	sw	$3,20($sp)
	addiu	$6,$6,%lo($LC48)
	jalr	$25
	move	$5,$0

	lw	$28,40($sp)
$L3912:
	lw	$5,6172($17)
	lw	$6,6168($17)
	li	$4,65535			# 0xffff
	li	$3,24415			# 0x5f5f
	li	$2,13311			# 0x33ff
	movn	$2,$4,$5
	li	$8,1			# 0x1
	movz	$4,$3,$6
	sw	$2,8984($17)
	sw	$4,8992($17)
	lw	$3,2084($17)
	sw	$0,176($sp)
	b	$L3845
	sw	$8,192($sp)

$L3910:
	lw	$2,8992($17)
	andi	$2,$2,0x8000
	bne	$2,$0,$L3912
	move	$4,$0

	move	$3,$17
	b	$L3917
	li	$5,4			# 0x4

$L3915:
	beq	$7,$0,$L3916
	nop

	sb	$7,8788($3)
$L3916:
	beq	$4,$5,$L3912
	addiu	$3,$3,8

$L3917:
	lb	$2,8788($3)
	lui	$6,%hi(left.8875)
	addiu	$6,$6,%lo(left.8875)
	addu	$2,$6,$2
	lb	$7,0($2)
	bgez	$7,$L3915
	addiu	$4,$4,1

	lw	$2,6168($17)
	lw	$4,0($17)
	sw	$2,16($sp)
	lw	$3,6172($17)
	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC49)
	sw	$3,20($sp)
	addiu	$6,$6,%lo($LC49)
	jalr	$25
	move	$5,$0

	b	$L3912
	lw	$28,40($sp)

$L3881:
	li	$2,2			# 0x2
	bne	$3,$2,$L4213
	lw	$3,200($sp)

	lw	$8,200($sp)
	lw	$6,172($sp)
	move	$4,$17
	addiu	$5,$8,-1
	move	$7,$0
	.option	pic0
	jal	svq3_mc_dir
	.option	pic2
	sw	$0,16($sp)

	bgez	$2,$L3861
	lw	$28,40($sp)

	b	$L4199
	lw	$2,6172($17)

$L3828:
	li	$18,6			# 0x6
	movn	$18,$4,$2
	move	$5,$18
	move	$4,$17
	li	$6,4			# 0x4
	move	$7,$0
	.option	pic0
	jal	svq3_mc_dir
	.option	pic2
	sw	$0,16($sp)

	bltz	$2,$L3821
	lw	$28,40($sp)

	move	$5,$18
	move	$4,$17
	li	$6,4			# 0x4
	li	$7,1			# 0x1
	b	$L4123
	li	$2,1			# 0x1

$L4163:
	lw	$4,0($17)
	lui	$6,%hi($LC1)
	sw	$8,16($sp)
	addiu	$6,$6,%lo($LC1)
	jalr	$25
	move	$5,$0

	lw	$28,40($sp)
$L3923:
	li	$2,-1			# 0xffffffffffffffff
	b	$L4055
	sw	$2,8760($17)

$L4176:
	li	$7,1			# 0x1
	b	$L3944
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

$L4178:
	b	$L3893
	sw	$2,8992($17)

$L4165:
	lw	$6,172($sp)
	move	$4,$17
	move	$5,$0
	move	$7,$0
	.option	pic0
	jal	svq3_mc_dir
	.option	pic2
	sw	$0,16($sp)

	bltz	$2,$L3821
	lw	$28,40($sp)

	lw	$4,200($sp)
	li	$2,1			# 0x1
	bne	$4,$2,$L3886
	lw	$3,184($sp)

	lw	$2,9748($17)
	move	$18,$0
	mtlo	$3
	madd	$2,$18
	lw	$2,1564($17)
	mflo	$4
	lw	$25,%call16(memset)($28)
	sll	$4,$4,2
	addu	$4,$2,$4
	move	$5,$0
	li	$6,16			# 0x10
	li	$19,4			# 0x4
	jalr	$25
	addiu	$18,$18,1

	beq	$18,$19,$L3861
	lw	$28,40($sp)

$L4186:
	lw	$3,184($sp)
	lw	$2,9748($17)
	mtlo	$3
	madd	$2,$18
	lw	$2,1564($17)
	mflo	$4
	lw	$25,%call16(memset)($28)
	sll	$4,$4,2
	addu	$4,$2,$4
	move	$5,$0
	li	$6,16			# 0x10
	jalr	$25
	addiu	$18,$18,1

	bne	$18,$19,$L4186
	lw	$28,40($sp)

	b	$L4200
	li	$4,8			# 0x8

$L4162:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC0)
	sw	$8,16($sp)
	addiu	$6,$6,%lo($LC0)
	jalr	$25
	move	$5,$0

	b	$L3923
	lw	$28,40($sp)

$L4182:
	li	$8,1			# 0x1
	b	$L3901
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

$L4185:
	b	$L3956
	li	$8,-62			# 0xffffffffffffffc2

$L4184:
	b	$L3953
	li	$2,-2147483648			# 0xffffffff80000000

$L4160:
	li	$9,1			# 0x1
	b	$L3814
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

$L4161:
	lw	$2,6172($17)
	lw	$4,0($17)
	lw	$7,6168($17)
	lui	$6,%hi($LC2)
	sw	$2,16($sp)
	addiu	$6,$6,%lo($LC2)
	jalr	$25
	move	$5,$0

	li	$3,-1			# 0xffffffffffffffff
	lw	$28,40($sp)
	b	$L4039
	sw	$3,8756($17)

$L4157:
	lw	$2,8240($17)
	bne	$2,$0,$L4214
	lw	$3,280($sp)

	b	$L4201
	lw	$31,268($sp)

$L4147:
	li	$9,1			# 0x1
	b	$L3971
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

$L4179:
	li	$2,13311			# 0x33ff
	b	$L3895
	sw	$2,8984($17)

$L4164:
	lw	$4,0($17)
	lui	$6,%hi($LC2)
	sw	$8,16($sp)
	addiu	$6,$6,%lo($LC2)
	jalr	$25
	move	$5,$0

	b	$L3923
	lw	$28,40($sp)

$L4183:
	addiu	$2,$2,256
	b	$L3796
	sw	$2,-6216($4)

$L4049:
	lw	$7,276($sp)
	addiu	$8,$17,432
$L4052:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L4052
	addiu	$7,$7,16

	b	$L4202
	lw	$2,4($6)

$L4144:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC79)
	addiu	$6,$6,%lo($LC79)
	jalr	$25
	move	$5,$0

	b	$L3821
	lw	$28,40($sp)

$L4181:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC75)
	addiu	$6,$6,%lo($LC75)
	jalr	$25
	move	$5,$0

	b	$L3821
	lw	$28,40($sp)

$L4168:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($17)
	lui	$6,%hi($LC78)
	addiu	$6,$6,%lo($LC78)
	jalr	$25
	move	$5,$0

	b	$L3821
	lw	$28,40($sp)

$L4173:
	li	$9,1			# 0x1
	b	$L4033
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

$L4150:
	li	$9,1			# 0x1
	b	$L3998
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

$L4154:
	li	$9,1			# 0x1
	b	$L4015
	lw	$12,%got(ff_interleaved_dirac_golomb_vlc_code)($28)

	.set	macro
	.set	reorder
	.end	svq3_decode_frame
	.section	.rodata.str1.4
	.align	2
$LC85:
	.ascii	"error while decoding MB %d %d, bytestream (%td)\012\000"
	.text
	.align	2
	.ent	decode_slice
	.type	decode_slice, @function
decode_slice:
	.set	nomips16
	.frame	$sp,64,$31		# vars= 0, regs= 8/0, args= 24, gp= 8
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-64
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,60($sp)
	sw	$22,56($sp)
	sw	$21,52($sp)
	sw	$20,48($sp)
	sw	$19,44($sp)
	sw	$18,40($sp)
	sw	$17,36($sp)
	sw	$16,32($sp)
	.cprestore	24
	move	$16,$5
	lw	$4,8228($5)
	lw	$5,11808($5)
	li	$20,127			# 0x7f
	li	$2,18			# 0x12
	li	$3,-1			# 0xffffffffffffffff
	movn	$20,$2,$4
	beq	$5,$0,$L4258
	sw	$3,6176($16)

	lw	$3,8456($16)
	subu	$2,$0,$3
	andi	$2,$2,0x7
	beq	$2,$0,$L4221
	addu	$2,$2,$3

	sw	$2,8456($16)
$L4221:
	li	$2,131072			# 0x20000
	ori	$2,$2,0x1fd8
	addu	$17,$16,$2
	lw	$25,%call16(ff_init_cabac_states)($28)
	jalr	$25
	move	$4,$17

	lw	$2,8456($16)
	lw	$28,24($sp)
	bltz	$2,$L4273
	move	$5,$2

$L4222:
	lw	$6,8460($16)
	lw	$4,8448($16)
	addiu	$6,$6,7
	subu	$6,$6,$2
	addiu	$3,$6,7
	slt	$2,$6,0
	movn	$6,$3,$2
	lw	$25,%call16(ff_init_cabac_decoder)($28)
	sra	$5,$5,3
	addu	$5,$4,$5
	sra	$6,$6,3
	jalr	$25
	move	$4,$17

	li	$4,131072			# 0x20000
	ori	$3,$4,0x2004
	lui	$2,%hi(cabac_context_init_I)
	addu	$6,$16,$3
	addiu	$7,$2,%lo(cabac_context_init_I)
	li	$3,65536			# 0x10000
	lui	$2,%hi(cabac_context_init_PB)
	lw	$10,2056($16)
	addu	$8,$16,$3
	addu	$11,$16,$4
	addiu	$13,$2,%lo(cabac_context_init_PB)
	move	$5,$0
	li	$12,1			# 0x1
	li	$14,63			# 0x3f
	b	$L4232
	li	$9,460			# 0x1cc

$L4277:
	beq	$2,$0,$L4274
	sll	$2,$3,1

	subu	$2,$14,$3
	sll	$2,$2,1
	andi	$2,$2,0x00ff
$L4229:
	addiu	$5,$5,1
$L4284:
	sb	$2,0($6)
	addiu	$7,$7,2
	beq	$5,$9,$L4275
	addiu	$6,$6,1

$L4232:
	lw	$2,-6284($8)
	beq	$2,$12,$L4276
	nop

	lw	$2,8656($11)
	mul	$3,$2,$9
	addu	$2,$3,$5
	sll	$2,$2,1
	addu	$2,$2,$13
	lb	$3,0($2)
	lb	$4,1($2)
	mul	$3,$3,$10
	sra	$3,$3,4
	addu	$3,$3,$4
	blez	$3,$L4229
	li	$2,124			# 0x7c

$L4268:
	slt	$2,$3,127
	bne	$2,$0,$L4277
	slt	$2,$3,64

	li	$2,125			# 0x7d
	addiu	$5,$5,1
	sb	$2,0($6)
	addiu	$7,$7,2
	bne	$5,$9,$L4232
	addiu	$6,$6,1

$L4275:
	li	$2,65536			# 0x10000
	addu	$21,$16,$2
	li	$3,131072			# 0x20000
	li	$2,-65536			# 0xffffffffffff0000
	addu	$17,$16,$3
	ori	$22,$2,0x1
$L4259:
	.option	pic0
	jal	decode_mb_cabac
	.option	pic2
	move	$4,$16

	lw	$28,24($sp)
	bltz	$2,$L4269
	move	$18,$2

	.option	pic0
	jal	hl_decode_mb
	.option	pic2
	move	$4,$16

	lw	$2,-6276($21)
	beq	$2,$0,$L4269
	lw	$28,24($sp)

	lw	$2,6172($16)
	move	$4,$16
	addiu	$2,$2,1
	.option	pic0
	jal	decode_mb_cabac
	.option	pic2
	sw	$2,6172($16)

	lw	$28,24($sp)
	bltz	$2,$L4234
	move	$18,$2

	.option	pic0
	jal	hl_decode_mb
	.option	pic2
	move	$4,$16

	lw	$28,24($sp)
$L4234:
	lw	$5,8156($17)
	lw	$8,6172($16)
	addiu	$4,$5,-2
	lw	$3,8152($17)
	sll	$2,$4,17
	addiu	$8,$8,-1
	slt	$2,$3,$2
	sw	$8,6172($16)
	beq	$2,$0,$L4235
	sw	$4,8156($17)

$L4282:
	addiu	$2,$5,-258
	srl	$2,$2,31
	sll	$5,$3,$2
	andi	$3,$5,0xffff
	sll	$2,$4,$2
	sw	$2,8156($17)
	beq	$3,$0,$L4236
	sw	$5,8152($17)

	lw	$5,8168($17)
	move	$19,$0
$L4237:
	bltz	$18,$L4278
	li	$2,131072			# 0x20000

	lw	$3,8172($17)
	addiu	$2,$3,2
	sltu	$2,$2,$5
	bne	$2,$0,$L4239
	nop

	lw	$2,6168($16)
	lw	$3,144($16)
	addiu	$2,$2,1
	slt	$3,$2,$3
	beq	$3,$0,$L4279
	sw	$2,6168($16)

$L4242:
	bne	$19,$0,$L4283
	andi	$2,$20,0x70

	lw	$2,148($16)
	slt	$2,$8,$2
	bne	$2,$0,$L4259
	andi	$2,$20,0x70

$L4283:
	lw	$25,%call16(ff_er_add_slice)($28)
	lw	$5,7960($16)
	lw	$6,7964($16)
	lw	$7,6168($16)
	sw	$8,16($sp)
	sw	$2,20($sp)
$L4270:
	move	$4,$16
	jalr	$25
	addiu	$7,$7,-1

	lw	$31,60($sp)
	lw	$28,24($sp)
	move	$2,$0
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	j	$31
	addiu	$sp,$sp,64

$L4276:
	lb	$2,0($7)
	lb	$3,1($7)
	mul	$2,$2,$10
	sra	$2,$2,4
	addu	$3,$2,$3
	bgtz	$3,$L4268
	li	$2,124			# 0x7c

	b	$L4284
	addiu	$5,$5,1

$L4274:
	addiu	$2,$2,-127
	b	$L4229
	andi	$2,$2,0x00ff

$L4258:
	li	$2,65536			# 0x10000
	addu	$17,$16,$2
$L4263:
	.option	pic0
	jal	decode_mb_cavlc
	.option	pic2
	move	$4,$16

	lw	$28,24($sp)
	bgez	$2,$L4266
	move	$4,$16

	lw	$8,6172($16)
$L4246:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($16)
	lw	$7,6168($16)
	lui	$6,%hi($LC84)
	sw	$8,16($sp)
	addiu	$6,$6,%lo($LC84)
	jalr	$25
	move	$5,$0

	lw	$28,24($sp)
$L4252:
	lw	$2,6172($16)
	andi	$3,$20,0xe
	lw	$25,%call16(ff_er_add_slice)($28)
	lw	$5,7960($16)
	lw	$6,7964($16)
	lw	$7,6168($16)
	sw	$2,16($sp)
	sw	$3,20($sp)
$L4271:
	jalr	$25
	move	$4,$16

	lw	$31,60($sp)
	lw	$28,24($sp)
	li	$2,-1			# 0xffffffffffffffff
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	j	$31
	addiu	$sp,$sp,64

$L4266:
	.option	pic0
	jal	hl_decode_mb
	nop

	.option	pic2
	lw	$2,-6276($17)
	bne	$2,$0,$L4280
	lw	$28,24($sp)

$L4247:
	lw	$2,6168($16)
	lw	$3,144($16)
	addiu	$2,$2,1
	slt	$3,$2,$3
	beq	$3,$0,$L4281
	sw	$2,6168($16)

$L4249:
	lw	$4,8456($16)
	lw	$3,8460($16)
	slt	$2,$4,$3
	bne	$2,$0,$L4263
	nop

	lw	$2,6176($16)
	bgtz	$2,$L4263
	nop

	bne	$3,$4,$L4252
	andi	$3,$20,0x70

	lw	$2,6172($16)
	lw	$5,7960($16)
	lw	$6,7964($16)
	lw	$7,6168($16)
	lw	$25,%call16(ff_er_add_slice)($28)
	sw	$2,16($sp)
	b	$L4270
	sw	$3,20($sp)

$L4281:
	lw	$5,6172($16)
	lw	$25,%call16(ff_draw_horiz_band)($28)
	sw	$0,6168($16)
	sll	$5,$5,4
	move	$4,$16
	jalr	$25
	li	$6,16			# 0x10

	lw	$8,6172($16)
	lw	$3,-6276($17)
	move	$2,$8
	addiu	$8,$8,1
	lw	$28,24($sp)
	addiu	$2,$2,2
	beq	$3,$0,$L4250
	sw	$8,6172($16)

	sw	$2,6172($16)
	move	$8,$2
$L4250:
	lw	$2,148($16)
	slt	$2,$8,$2
	bne	$2,$0,$L4249
	nop

	lw	$3,8460($16)
	lw	$2,8456($16)
	beq	$3,$2,$L4283
	andi	$2,$20,0x70

	lw	$5,7960($16)
	lw	$6,7964($16)
	lw	$7,6168($16)
	lw	$25,%call16(ff_er_add_slice)($28)
	sw	$8,16($sp)
	b	$L4271
	sw	$2,20($sp)

$L4280:
	lw	$2,6172($16)
	move	$4,$16
	addiu	$2,$2,1
	.option	pic0
	jal	decode_mb_cavlc
	.option	pic2
	sw	$2,6172($16)

	lw	$28,24($sp)
	bltz	$2,$L4248
	move	$4,$16

	.option	pic0
	jal	hl_decode_mb
	nop

	.option	pic2
	lw	$2,6172($16)
	lw	$28,24($sp)
	addiu	$2,$2,-1
	b	$L4247
	sw	$2,6172($16)

$L4248:
	lw	$8,6172($16)
	addiu	$8,$8,-1
	b	$L4246
	sw	$8,6172($16)

$L4279:
	lw	$25,%call16(ff_draw_horiz_band)($28)
	sll	$5,$8,4
	sw	$0,6168($16)
	move	$4,$16
	jalr	$25
	li	$6,16			# 0x10

	lw	$8,6172($16)
	lw	$2,-6276($21)
	move	$3,$8
	addiu	$8,$8,1
	lw	$28,24($sp)
	beq	$2,$0,$L4242
	sw	$8,6172($16)

	addiu	$2,$3,2
	sw	$2,6172($16)
	b	$L4242
	move	$8,$2

$L4269:
	lw	$5,8156($17)
	lw	$3,8152($17)
	addiu	$4,$5,-2
	sll	$2,$4,17
	slt	$2,$3,$2
	lw	$8,6172($16)
	bne	$2,$0,$L4282
	sw	$4,8156($17)

$L4235:
	lw	$5,8168($17)
	lw	$2,8164($17)
	b	$L4237
	subu	$19,$5,$2

$L4236:
	lw	$2,8168($17)
	move	$19,$0
	lbu	$3,0($2)
	lbu	$4,1($2)
	sll	$3,$3,9
	addu	$3,$3,$22
	sll	$4,$4,1
	addu	$3,$3,$4
	addu	$3,$3,$5
	addiu	$5,$2,2
	sw	$3,8152($17)
	b	$L4237
	sw	$5,8168($17)

$L4273:
	b	$L4222
	addiu	$5,$2,7

$L4278:
	addu	$2,$16,$2
	lw	$3,8172($2)
$L4239:
	lw	$4,0($16)
	lw	$7,6168($16)
	subu	$2,$3,$5
	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC85)
	sw	$8,16($sp)
	sw	$2,20($sp)
	addiu	$6,$6,%lo($LC85)
	jalr	$25
	move	$5,$0

	b	$L4252
	lw	$28,24($sp)

	.set	macro
	.set	reorder
	.end	decode_slice
	.align	2
	.ent	execute_decode_slices
	.type	execute_decode_slices, @function
execute_decode_slices:
	.set	nomips16
	.frame	$sp,48,$31		# vars= 0, regs= 4/0, args= 24, gp= 8
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$18,40($sp)
	sw	$17,36($sp)
	sw	$16,32($sp)
	.cprestore	24
	li	$2,1			# 0x1
	move	$18,$4
	move	$17,$5
	beq	$5,$2,$L4286
	lw	$7,0($4)

	slt	$2,$5,2
	bne	$2,$0,$L4296
	li	$2,131072			# 0x20000

	ori	$2,$2,0x24a4
	addu	$16,$4,$2
	move	$6,$16
	li	$5,1			# 0x1
$L4289:
	lw	$2,0($6)
	lw	$3,256($7)
	addiu	$5,$5,1
	slt	$4,$5,$17
	sw	$3,7992($2)
	sw	$0,7952($2)
	bne	$4,$0,$L4289
	addiu	$6,$6,4

	sw	$17,16($sp)
	li	$6,131072			# 0x20000
	lw	$25,624($7)
	lui	$5,%hi(decode_slice)
	ori	$6,$6,0x24a0
	move	$4,$7
	addiu	$5,$5,%lo(decode_slice)
	addu	$6,$18,$6
	jalr	$25
	move	$7,$0

	li	$2,35111			# 0x8927
	addu	$2,$17,$2
	sll	$2,$2,2
	addu	$2,$18,$2
	lw	$4,0($2)
	li	$3,35112			# 0x8928
	lw	$5,6172($4)
	lw	$2,6168($4)
	addu	$3,$17,$3
	sll	$3,$3,2
	lw	$28,24($sp)
	lw	$6,7952($18)
	sw	$2,6168($18)
	sw	$5,6172($18)
	addu	$4,$18,$3
$L4290:
	lw	$3,0($16)
	addiu	$16,$16,4
	lw	$2,7952($3)
	addu	$6,$6,$2
	bne	$16,$4,$L4290
	sw	$6,7952($18)

	lw	$31,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	j	$31
	addiu	$sp,$sp,48

$L4286:
	move	$5,$18
	lw	$31,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	move	$4,$7
	.option	pic0
	j	decode_slice
	.option	pic2
	addiu	$sp,$sp,48

$L4296:
	sw	$5,16($sp)
	li	$6,131072			# 0x20000
	lw	$25,624($7)
	lui	$5,%hi(decode_slice)
	ori	$6,$6,0x24a0
	move	$4,$7
	addu	$6,$18,$6
	addiu	$5,$5,%lo(decode_slice)
	jalr	$25
	move	$7,$0

	li	$2,35111			# 0x8927
	addu	$2,$17,$2
	sll	$2,$2,2
	addu	$2,$18,$2
	lw	$3,0($2)
	lw	$31,44($sp)
	lw	$4,6172($3)
	lw	$2,6168($3)
	lw	$28,24($sp)
	sw	$4,6172($18)
	sw	$2,6168($18)
	lw	$17,36($sp)
	lw	$18,40($sp)
	lw	$16,32($sp)
	j	$31
	addiu	$sp,$sp,48

	.set	macro
	.set	reorder
	.end	execute_decode_slices
	.section	.rodata.str1.4
	.align	2
$LC86:
	.ascii	"AVC: nal size %d\012\000"
	.align	2
$LC87:
	.ascii	"NAL %d at %d/%d length %d\012\000"
	.align	2
$LC88:
	.ascii	"AVC: Consumed only %d bytes instead of %d\012\000"
	.align	2
$LC89:
	.ascii	"Invalid mix of idr and non-idr slices\000"
	.align	2
$LC90:
	.ascii	"pps\000"
	.align	2
$LC91:
	.ascii	"sps_id out of range\012\000"
	.align	2
$LC92:
	.ascii	"FMO not supported\012\000"
	.align	2
$LC93:
	.ascii	"reference overflow (pps)\012\000"
	.align	2
$LC94:
	.ascii	"CAVLC\000"
	.align	2
$LC95:
	.ascii	"CABAC\000"
	.align	2
$LC96:
	.ascii	"weighted\000"
	.align	2
$LC97:
	.ascii	"LPAR\000"
	.align	2
$LC98:
	.ascii	"CONSTR\000"
	.align	2
$LC99:
	.ascii	"REDU\000"
	.align	2
$LC100:
	.ascii	"8x8DCT\000"
	.align	2
$LC101:
	.ascii	"pps:%u sps:%u %s slice_groups:%d ref:%d/%d %s qp:%d/%d/%"
	.ascii	"d/%d %s %s %s %s\012\000"
	.align	2
$LC102:
	.ascii	"Unknown NAL code: %d (%d bits)\012\000"
	.align	2
$LC103:
	.ascii	"decode_slice_header error\012\000"
	.text
	.align	2
	.ent	decode_nal_units
	.type	decode_nal_units, @function
decode_nal_units:
	.set	nomips16
	.frame	$sp,144,$31		# vars= 24, regs= 10/0, args= 72, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-144
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,140($sp)
	sw	$fp,136($sp)
	sw	$23,132($sp)
	sw	$22,128($sp)
	sw	$21,124($sp)
	sw	$20,120($sp)
	sw	$19,116($sp)
	sw	$18,112($sp)
	sw	$17,108($sp)
	sw	$16,104($sp)
	.cprestore	72
	lw	$2,0($4)
	move	$18,$4
	sw	$2,96($sp)
	lw	$3,96($sp)
	lw	$2,60($4)
	lw	$4,620($3)
	li	$3,131072			# 0x20000
	addu	$3,$18,$3
	andi	$2,$2,0x8000
	sw	$4,9412($3)
	sw	$5,148($sp)
	bne	$2,$0,$L4298
	sw	$6,152($sp)

	sw	$0,9408($3)
	sw	$0,1880($18)
$L4298:
	addiu	$4,$18,10780
	lw	$9,8728($18)
	sw	$4,84($sp)
	move	$21,$0
	move	$22,$0
$L4480:
	bne	$9,$0,$L4299
	lw	$5,152($sp)

	addiu	$3,$21,3
	slt	$2,$3,$5
	beq	$2,$0,$L4301
	nop

	lw	$5,148($sp)
	addu	$4,$5,$21
	li	$5,1			# 0x1
$L4310:
	lbu	$2,0($4)
	bne	$2,$0,$L4308
	nop

	lbu	$2,1($4)
	bne	$2,$0,$L4308
	nop

	lbu	$2,2($4)
	beq	$2,$5,$L4309
	li	$2,35112			# 0x8928

$L4308:
	addiu	$21,$21,1
	lw	$6,152($sp)
	addiu	$3,$21,3
	slt	$2,$3,$6
	bne	$2,$0,$L4310
	addiu	$4,$4,1

$L4301:
	bne	$22,$0,$L4485
	nop

$L4353:
	lw	$31,140($sp)
	move	$2,$21
	lw	$fp,136($sp)
	lw	$23,132($sp)
	lw	$22,128($sp)
	lw	$21,124($sp)
	lw	$20,120($sp)
	lw	$19,116($sp)
	lw	$18,112($sp)
	lw	$17,108($sp)
	lw	$16,104($sp)
	j	$31
	addiu	$sp,$sp,144

$L4299:
	lw	$6,152($sp)
	slt	$2,$21,$6
	beq	$2,$0,$L4301
	nop

	lw	$8,8736($18)
	blez	$8,$L4486
	lw	$15,148($sp)

	move	$5,$0
	addu	$6,$15,$21
	move	$7,$0
$L4304:
	lbu	$2,0($6)
	addiu	$5,$5,1
	sll	$3,$7,8
	slt	$4,$5,$8
	or	$7,$3,$2
	bne	$4,$0,$L4304
	addiu	$6,$6,1

	slt	$2,$7,2
	bne	$2,$0,$L4305
	addu	$21,$21,$8

	lw	$3,152($sp)
	addu	$2,$7,$21
	slt	$2,$3,$2
	beq	$2,$0,$L4487
	li	$2,35112			# 0x8928

$L4303:
	lw	$25,%call16(av_log)($28)
$L4548:
	lw	$4,0($18)
	lui	$6,%hi($LC86)
	addiu	$6,$6,%lo($LC86)
	jalr	$25
	move	$5,$0

	beq	$22,$0,$L4353
	lw	$28,72($sp)

	b	$L4516
	move	$4,$18

$L4309:
	addu	$2,$22,$2
	sll	$2,$2,2
	addu	$2,$18,$2
	lw	$15,148($sp)
	lw	$20,0($2)
	lw	$2,152($sp)
	addu	$4,$15,$3
	subu	$7,$2,$3
	lbu	$2,0($4)
	move	$21,$3
	srl	$2,$2,5
	sw	$2,8704($20)
	lbu	$3,0($4)
	addiu	$7,$7,-1
	andi	$5,$3,0x1f
	slt	$2,$7,2
	move	$23,$0
	sw	$5,8708($20)
	bne	$2,$0,$L4488
	addiu	$19,$4,1

$L4311:
	b	$L4318
	move	$17,$0

$L4491:
	beq	$17,$0,$L4314
	addiu	$2,$17,-1

	lbu	$3,-1($3)
	movz	$17,$2,$3
$L4314:
	addiu	$3,$17,2
	slt	$2,$3,$7
	beq	$2,$0,$L4519
	addiu	$2,$3,1

	addu	$4,$19,$17
	lbu	$2,1($4)
	bne	$2,$0,$L4519
	addiu	$2,$3,1

	lbu	$4,2($4)
	sltu	$2,$4,4
	bne	$2,$0,$L4489
	addiu	$2,$3,1

$L4519:
	slt	$2,$2,$7
	beq	$2,$0,$L4312
	move	$17,$7

	move	$17,$3
$L4318:
	addu	$3,$19,$17
	lbu	$2,0($3)
	beq	$2,$0,$L4491
	nop

	addiu	$3,$17,2
	addiu	$2,$3,1
	slt	$2,$2,$7
	bne	$2,$0,$L4318
	move	$17,$3

	move	$17,$7
$L4312:
	addiu	$2,$17,-1
	slt	$2,$3,$2
	bne	$2,$0,$L4319
	nop

$L4506:
	beq	$19,$0,$L4320
	nop

	bltz	$17,$L4320
	addiu	$16,$17,1

	move	$fp,$19
$L4321:
	addu	$3,$fp,$17
	lbu	$2,-1($3)
	bne	$2,$0,$L4329
	nop

	bne	$17,$0,$L4331
	nop

	b	$L4517
	lw	$4,0($18)

$L4492:
	beq	$17,$0,$L4330
	addiu	$3,$3,-1

$L4331:
	lbu	$2,-2($3)
	beq	$2,$0,$L4492
	addiu	$17,$17,-1

$L4329:
	beq	$17,$0,$L4330
	move	$4,$2

	li	$3,1			# 0x1
	li	$5,9			# 0x9
$L4493:
	andi	$2,$4,0x1
	bne	$2,$0,$L4332
	nop

	addiu	$3,$3,1
	bne	$3,$5,$L4493
	sra	$4,$4,1

	move	$3,$0
$L4332:
	lw	$4,0($18)
	sll	$2,$17,3
	subu	$19,$2,$3
	lw	$2,412($4)
	andi	$2,$2,0x100
	bne	$2,$0,$L4520
	lw	$3,152($sp)

$L4336:
	lw	$9,8728($18)
	beq	$9,$0,$L4337
	nop

	beq	$23,$16,$L4337
	lw	$25,%call16(av_log)($28)

	lw	$4,0($18)
	lui	$6,%hi($LC88)
	sw	$23,16($sp)
	addiu	$6,$6,%lo($LC88)
	move	$5,$0
	jalr	$25
	move	$7,$16

	lw	$28,72($sp)
$L4337:
	lw	$3,6164($18)
	li	$2,1			# 0x1
	beq	$3,$2,$L4338
	addu	$21,$21,$16

	lw	$4,96($sp)
	lw	$2,716($4)
	slt	$2,$2,8
	beq	$2,$0,$L4338
	addiu	$2,$19,7

$L4545:
	lw	$3,8708($20)
	sra	$2,$2,3
	sw	$2,92($sp)
	addu	$23,$fp,$2
	sltu	$2,$3,20
	bne	$2,$0,$L4521
	lui	$5,%hi($L4351)

$L4341:
	lw	$25,%call16(av_log)($28)
$L4523:
	lw	$7,8708($18)
	lui	$15,%hi($LC102)
	lw	$4,96($sp)
	sw	$19,16($sp)
	li	$5,2			# 0x2
	jalr	$25
	addiu	$6,$15,%lo($LC102)

	lw	$28,72($sp)
	move	$16,$0
$L4356:
	li	$2,131072			# 0x20000
$L4527:
	addu	$2,$18,$2
	lw	$3,9412($2)
	beq	$3,$22,$L4496
	move	$5,$22

	bltz	$16,$L4522
	lw	$25,%call16(av_log)($28)

$L4463:
	li	$2,1			# 0x1
	bne	$16,$2,$L4483
	nop

	lw	$3,8708($20)
	lw	$2,8704($20)
	sw	$3,8708($18)
	move	$20,$18
	lw	$3,8708($18)
	sw	$2,8704($18)
	sltu	$2,$3,20
	beq	$2,$0,$L4523
	lw	$25,%call16(av_log)($28)

	lui	$5,%hi($L4351)
$L4521:
	sll	$2,$3,2
	addiu	$5,$5,%lo($L4351)
	addu	$2,$5,$2
	lw	$3,0($2)
	addu	$3,$3,$28
	j	$3
	nop

	.rdata
	.align	2
	.align	2
$L4351:
	.gpword	$L4341
	.gpword	$L4342
	.gpword	$L4343
	.gpword	$L4344
	.gpword	$L4345
	.gpword	$L4346
	.gpword	$L4347
	.gpword	$L4348
	.gpword	$L4349
	.gpword	$L4350
	.gpword	$L4350
	.gpword	$L4350
	.gpword	$L4350
	.gpword	$L4350
	.gpword	$L4341
	.gpword	$L4341
	.gpword	$L4341
	.gpword	$L4341
	.gpword	$L4341
	.gpword	$L4350
	.text
$L4496:
	.option	pic0
	jal	execute_decode_slices
	.option	pic2
	move	$4,$18

	move	$22,$0
	bgez	$16,$L4463
	lw	$28,72($sp)

	lw	$25,%call16(av_log)($28)
$L4522:
	lw	$4,0($18)
	lui	$6,%hi($LC103)
	addiu	$6,$6,%lo($LC103)
	jalr	$25
	move	$5,$0

	lw	$28,72($sp)
$L4483:
	b	$L4480
	lw	$9,8728($18)

$L4345:
	lw	$4,92($sp)
	bltz	$4,$L4524
	move	$7,$0

	bltz	$19,$L4525
	move	$6,$0

	move	$7,$19
	move	$6,$fp
	move	$5,$23
$L4363:
	li	$2,65536			# 0x10000
	addu	$8,$20,$2
	li	$3,131072			# 0x20000
	ori	$2,$3,0x1ac0
	lw	$4,5352($8)
	addu	$3,$20,$3
	addu	$2,$20,$2
	sw	$6,6848($3)
	sw	$7,6860($3)
	sw	$5,6852($3)
	sw	$2,6868($3)
	bne	$4,$0,$L4350
	sw	$0,6856($3)

	lw	$2,6864($3)
	beq	$2,$0,$L4356
	move	$16,$0

	lw	$2,8224($20)
	beq	$2,$0,$L4527
	li	$2,131072			# 0x20000

	lw	$2,112($18)
	beq	$2,$0,$L4527
	li	$2,131072			# 0x20000

	lw	$2,6164($18)
	slt	$2,$2,5
	beq	$2,$0,$L4356
	lw	$5,96($sp)

	lw	$3,716($5)
	slt	$2,$3,8
	bne	$2,$0,$L4364
	nop

	lw	$2,8704($20)
	beq	$2,$0,$L4356
	slt	$2,$3,16

	bne	$2,$0,$L4364
	li	$2,3			# 0x3

	lw	$4,-6284($8)
	beq	$4,$2,$L4356
	slt	$2,$3,32

	bne	$2,$0,$L4364
	li	$2,1			# 0x1

	bne	$4,$2,$L4356
	slt	$2,$3,48

	bne	$2,$0,$L4364
	nop

$L4350:
	b	$L4356
	move	$16,$0

$L4346:
	lw	$3,8708($18)
	li	$2,5			# 0x5
	bne	$3,$2,$L4498
	lw	$25,%call16(av_log)($28)

	.option	pic0
	jal	idr
	.option	pic2
	move	$4,$18

$L4342:
	lw	$6,92($sp)
	bltz	$6,$L4526
	move	$6,$0

	bltz	$19,$L4354
	nop

	move	$6,$19
	move	$5,$fp
	move	$4,$23
$L4355:
	li	$2,131072			# 0x20000
	addu	$2,$20,$2
	addiu	$3,$20,8448
	sw	$5,8448($20)
	sw	$4,8452($20)
	sw	$3,6864($2)
	sw	$6,8460($20)
	sw	$0,8456($20)
	sw	$3,6868($2)
	sw	$0,8224($20)
	move	$4,$20
	.option	pic0
	jal	decode_slice_header
	.option	pic2
	move	$5,$18

	lw	$28,72($sp)
	bne	$2,$0,$L4356
	move	$16,$2

	lw	$4,1880($18)
	lw	$2,8708($20)
	lw	$3,48($4)
	xori	$2,$2,0x5
	sltu	$2,$2,1
	or	$3,$3,$2
	li	$2,65536			# 0x10000
	sw	$3,48($4)
	addu	$4,$20,$2
	lw	$3,5352($4)
	bne	$3,$0,$L4527
	li	$2,131072			# 0x20000

	lw	$2,6164($20)
	slt	$2,$2,5
	beq	$2,$0,$L4527
	li	$2,131072			# 0x20000

	lw	$15,96($sp)
	lw	$3,716($15)
	slt	$2,$3,8
	bne	$2,$0,$L4357
	nop

	lw	$2,8704($20)
	beq	$2,$0,$L4527
	li	$2,131072			# 0x20000

	slt	$2,$3,16
	bne	$2,$0,$L4357
	li	$2,3			# 0x3

	lw	$4,-6284($4)
	beq	$4,$2,$L4356
	slt	$2,$3,32

	bne	$2,$0,$L4357
	li	$2,1			# 0x1

	bne	$4,$2,$L4527
	li	$2,131072			# 0x20000

	slt	$2,$3,48
	beq	$2,$0,$L4527
	li	$2,131072			# 0x20000

$L4357:
	b	$L4356
	addiu	$22,$22,1

$L4349:
	lw	$4,92($sp)
	bltz	$4,$L4528
	move	$3,$0

	bltz	$19,$L4529
	move	$4,$0

	move	$3,$19
	move	$4,$fp
	move	$2,$23
$L4379:
	sw	$3,8460($18)
	sw	$2,8452($18)
	sw	$4,8448($18)
	sw	$0,8456($18)
	lbu	$2,0($4)
	lbu	$5,3($4)
	lbu	$3,1($4)
	sll	$2,$2,24
	lbu	$4,2($4)
	or	$5,$5,$2
	sll	$3,$3,16
	or	$5,$5,$3
	sll	$4,$4,8
	or	$4,$5,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$4,$2
	beq	$2,$0,$L4499
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$4,$2
	bne	$2,$0,$L4382
	srl	$3,$4,16

	move	$3,$4
	move	$5,$0
$L4383:
	andi	$2,$3,0xff00
	beq	$2,$0,$L4530
	lw	$2,%got(ff_log2_tab)($28)

	srl	$3,$3,8
	addiu	$5,$5,8
$L4530:
	addu	$2,$2,$3
	lbu	$3,0($2)
	li	$2,32			# 0x20
	addu	$3,$3,$5
	sll	$3,$3,1
	addiu	$3,$3,-31
	subu	$2,$2,$3
	srl	$3,$4,$3
	addiu	$3,$3,-1
	sw	$2,8456($18)
	sw	$3,80($sp)
$L4381:
	lw	$5,84($sp)
	lw	$6,80($sp)
	lui	$15,%hi($LC90)
	li	$2,808			# 0x328
	addiu	$15,$15,%lo($LC90)
	move	$4,$18
	li	$7,256			# 0x100
	sw	$2,16($sp)
	.option	pic0
	jal	alloc_parameter_set
	.option	pic2
	sw	$15,20($sp)

	lw	$28,72($sp)
	beq	$2,$0,$L4350
	move	$16,$2

	lw	$8,8456($18)
	lw	$10,8448($18)
	sra	$2,$8,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	sll	$6,$6,8
	or	$3,$3,$5
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$6,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$6,$2
	beq	$2,$0,$L4500
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$6,$2
	bne	$2,$0,$L4387
	srl	$5,$6,16

	move	$5,$6
	move	$7,$0
$L4388:
	andi	$2,$5,0xff00
	beq	$2,$0,$L4531
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$7,$7,8
$L4531:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$7
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$6,$2
	sw	$4,8456($18)
	addiu	$4,$2,-1
$L4386:
	sltu	$2,$4,32
	beq	$2,$0,$L4390
	addiu	$2,$4,2446

	sll	$2,$2,2
	addu	$2,$18,$2
	lw	$3,4($2)
	beq	$3,$0,$L4532
	lw	$25,%call16(av_log)($28)

	sw	$4,0($16)
	lw	$5,8456($18)
	sra	$2,$5,3
	addu	$2,$10,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($18)
	sw	$3,4($16)
	lw	$5,8456($18)
	sra	$2,$5,3
	addu	$2,$10,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($18)
	sw	$3,8($16)
	lw	$8,8456($18)
	sra	$2,$8,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L4501
	lw	$2,%got(ff_golomb_vlc_len)($28)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$7,$2
	bne	$2,$0,$L4394
	srl	$5,$7,16

	move	$5,$7
	move	$6,$0
$L4395:
	andi	$2,$5,0xff00
	beq	$2,$0,$L4533
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L4533:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$7,$2
	sw	$4,8456($18)
	addiu	$2,$2,-1
$L4393:
	addiu	$2,$2,1
	slt	$3,$2,2
	bne	$3,$0,$L4397
	sw	$2,12($16)

	lw	$8,8456($18)
	sra	$2,$8,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L4502
	lw	$2,%got(ff_golomb_vlc_len)($28)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$7,$2
	bne	$2,$0,$L4400
	srl	$5,$7,16

	move	$5,$7
	move	$6,$0
$L4401:
	andi	$2,$5,0xff00
	beq	$2,$0,$L4534
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L4534:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$7,$2
	sw	$4,8456($18)
	addiu	$2,$2,-1
$L4399:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($18)
	lui	$6,%hi($LC92)
	sw	$2,16($16)
	addiu	$6,$6,%lo($LC92)
	jalr	$25
	move	$5,$0

	lw	$28,72($sp)
	lw	$10,8448($18)
$L4397:
	lw	$8,8456($18)
	sra	$2,$8,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L4503
	lw	$2,%got(ff_golomb_vlc_len)($28)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$7,$2
	bne	$2,$0,$L4405
	srl	$5,$7,16

	move	$5,$7
	move	$6,$0
$L4406:
	andi	$2,$5,0xff00
	beq	$2,$0,$L4535
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L4535:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$7,$2
	sw	$4,8456($18)
	addiu	$2,$2,-1
$L4404:
	addiu	$2,$2,1
	sw	$2,20($16)
	lw	$8,8456($18)
	sra	$2,$8,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L4504
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$7,$2
	bne	$2,$0,$L4410
	srl	$5,$7,16

	move	$5,$7
	move	$6,$0
$L4411:
	andi	$2,$5,0xff00
	beq	$2,$0,$L4536
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L4536:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	subu	$4,$4,$2
	srl	$2,$7,$2
	sw	$4,8456($18)
	addiu	$4,$2,-1
$L4409:
	lw	$2,20($16)
	addiu	$3,$4,1
	addiu	$2,$2,-1
	sltu	$2,$2,32
	beq	$2,$0,$L4413
	sw	$3,24($16)

	sltu	$2,$4,32
	bne	$2,$0,$L4414
	nop

$L4413:
	lw	$25,%call16(av_log)($28)
	lw	$4,0($18)
	lui	$6,%hi($LC93)
	addiu	$6,$6,%lo($LC93)
	jalr	$25
	move	$5,$0

	li	$2,1			# 0x1
	sw	$2,20($16)
	sw	$2,24($16)
	lw	$28,72($sp)
	b	$L4356
	move	$16,$0

$L4344:
	lw	$3,92($sp)
	bltz	$3,$L4537
	move	$6,$0

	bltz	$19,$L4538
	move	$5,$0

	move	$6,$19
	move	$5,$fp
	move	$4,$23
$L4361:
	li	$2,131072			# 0x20000
	ori	$3,$2,0x1ab0
	addu	$3,$20,$3
	addu	$2,$20,$2
	sw	$3,6864($2)
	sw	$5,6832($2)
	sw	$6,6844($2)
	sw	$4,6836($2)
	sw	$0,6840($2)
	b	$L4356
	move	$16,$0

$L4343:
	lw	$2,92($sp)
	bltz	$2,$L4539
	move	$5,$0

	bltz	$19,$L4540
	move	$4,$0

	move	$5,$19
	move	$4,$fp
	move	$2,$23
$L4359:
	li	$3,131072			# 0x20000
	addu	$3,$20,$3
	sw	$2,8452($20)
	li	$2,1			# 0x1
	sw	$4,8448($20)
	sw	$5,8460($20)
	sw	$0,6864($3)
	sw	$2,8224($20)
	sw	$0,8456($20)
	sw	$0,6868($3)
	move	$4,$20
	.option	pic0
	jal	decode_slice_header
	.option	pic2
	move	$5,$18

	lw	$28,72($sp)
	b	$L4356
	move	$16,$2

$L4348:
	lw	$15,92($sp)
	bltz	$15,$L4541
	move	$4,$0

	bltz	$19,$L4542
	move	$3,$0

	move	$4,$19
	move	$3,$fp
	move	$2,$23
$L4376:
	sw	$3,8448($18)
	sw	$4,8460($18)
	sw	$2,8452($18)
	sw	$0,8456($18)
	.option	pic0
	jal	decode_seq_parameter_set
	.option	pic2
	move	$4,$18

	lw	$2,56($18)
	li	$3,524288			# 0x80000
	and	$2,$2,$3
	beq	$2,$0,$L4377
	lw	$28,72($sp)

	li	$2,1			# 0x1
	sw	$2,8240($18)
$L4377:
	lw	$3,96($sp)
	lw	$2,268($3)
	slt	$2,$2,2
	beq	$2,$0,$L4350
	nop

	lw	$2,8240($18)
	move	$16,$0
	sltu	$2,$2,1
	b	$L4356
	sw	$2,268($3)

$L4347:
	lw	$6,92($sp)
	bltz	$6,$L4543
	move	$2,$0

	bltz	$19,$L4544
	move	$4,$0

	move	$2,$19
	move	$4,$fp
	move	$3,$23
$L4366:
	sw	$4,8448($18)
	sw	$3,8452($18)
	sw	$2,8460($18)
	sw	$0,8456($18)
	move	$11,$2
	li	$16,255			# 0xff
	li	$17,5			# 0x5
$L4367:
	lw	$7,8456($18)
$L4373:
	addiu	$2,$7,16
	slt	$2,$2,$11
	beq	$2,$0,$L4350
	move	$9,$0

	lw	$10,8448($18)
$L4368:
	sra	$2,$7,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	andi	$2,$7,0x7
	or	$3,$3,$6
	sll	$3,$3,$2
	srl	$3,$3,24
	addiu	$7,$7,8
	addu	$9,$3,$9
	beq	$3,$16,$L4368
	sw	$7,8456($18)

	move	$8,$0
$L4369:
	sra	$2,$7,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	andi	$2,$7,0x7
	or	$3,$3,$6
	sll	$3,$3,$2
	srl	$3,$3,24
	addiu	$7,$7,8
	addu	$8,$8,$3
	beq	$3,$16,$L4369
	sw	$7,8456($18)

	beq	$9,$17,$L4505
	sll	$2,$8,3

	addu	$2,$2,$7
	sw	$2,8456($18)
$L4372:
	lw	$7,8456($18)
	subu	$2,$0,$7
	andi	$2,$2,0x7
	beq	$2,$0,$L4373
	addu	$2,$7,$2

	b	$L4367
	sw	$2,8456($18)

$L4354:
$L4526:
	move	$5,$0
	b	$L4355
	move	$4,$0

$L4338:
	lw	$2,8704($18)
	bne	$2,$0,$L4545
	addiu	$2,$19,7

	b	$L4480
	lw	$9,8728($18)

$L4505:
	move	$5,$8
	.option	pic0
	jal	decode_unregistered_user_data
	.option	pic2
	move	$4,$18

	bltz	$2,$L4350
	lw	$28,72($sp)

	b	$L4372
	lw	$11,8460($18)

$L4543:
	move	$4,$0
$L4544:
	b	$L4366
	move	$3,$0

$L4541:
	move	$3,$0
$L4542:
	b	$L4376
	move	$2,$0

$L4539:
	move	$4,$0
$L4540:
	b	$L4359
	move	$2,$0

$L4524:
	move	$6,$0
$L4525:
	b	$L4363
	move	$5,$0

$L4528:
	move	$4,$0
$L4529:
	b	$L4379
	move	$2,$0

$L4537:
	move	$5,$0
$L4538:
	b	$L4361
	move	$4,$0

$L4330:
	lw	$4,0($18)
$L4517:
	lw	$2,412($4)
	andi	$2,$2,0x100
	beq	$2,$0,$L4336
	move	$19,$0

	lw	$3,152($sp)
$L4520:
	lw	$7,8708($20)
	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC87)
	sw	$17,24($sp)
	sw	$21,16($sp)
	sw	$3,20($sp)
	addiu	$6,$6,%lo($LC87)
	jalr	$25
	li	$5,2			# 0x2

	b	$L4336
	lw	$28,72($sp)

$L4499:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	lw	$3,%got(ff_ue_golomb_vlc_code)($28)
	srl	$4,$4,23
	addu	$2,$2,$4
	addu	$3,$3,$4
	lbu	$5,0($2)
	lbu	$3,0($3)
	sw	$5,8456($18)
	b	$L4381
	sw	$3,80($sp)

$L4390:
	lw	$25,%call16(av_log)($28)
$L4532:
	lw	$4,0($18)
	lui	$6,%hi($LC91)
	addiu	$6,$6,%lo($LC91)
	jalr	$25
	move	$5,$0

	lw	$28,72($sp)
	b	$L4356
	move	$16,$0

$L4500:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$6,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($18)
	b	$L4386
	lbu	$4,0($2)

$L4382:
	b	$L4383
	li	$5,16			# 0x10

$L4487:
	addu	$2,$22,$2
	sll	$2,$2,2
	addu	$2,$18,$2
	lw	$20,0($2)
	lw	$2,148($sp)
	move	$23,$7
	addu	$4,$2,$21
	lbu	$2,0($4)
	addiu	$7,$7,-1
	srl	$2,$2,5
	sw	$2,8704($20)
	lbu	$3,0($4)
	slt	$2,$7,2
	andi	$5,$3,0x1f
	sw	$5,8708($20)
	beq	$2,$0,$L4311
	addiu	$19,$4,1

$L4488:
	move	$17,$7
	move	$3,$0
	addiu	$2,$17,-1
	slt	$2,$3,$2
	beq	$2,$0,$L4506
	nop

$L4319:
	xori	$5,$5,0x4
	sltu	$5,$5,1
	addiu	$16,$5,2178
	sll	$16,$16,2
	addu	$16,$20,$16
	addiu	$5,$5,2180
	lw	$25,%call16(av_fast_realloc)($28)
	sll	$5,$5,2
	lw	$4,0($16)
	addu	$5,$20,$5
	jalr	$25
	move	$6,$17

	lw	$28,72($sp)
	move	$fp,$2
	beq	$2,$0,$L4320
	sw	$2,0($16)

	blez	$17,$L4507
	move	$7,$0

	move	$5,$0
	b	$L4328
	li	$6,3			# 0x3

$L4508:
	lbu	$4,0($3)
	bne	$4,$0,$L4546
	addu	$2,$fp,$5

	lbu	$2,1($3)
	bne	$2,$0,$L4546
	addu	$2,$fp,$5

	lbu	$3,2($3)
	sltu	$2,$3,4
	beq	$2,$0,$L4546
	addu	$2,$fp,$5

	bne	$3,$6,$L4547
	addiu	$16,$7,1

	addiu	$7,$7,3
	sb	$0,0($2)
	sb	$0,1($2)
	slt	$2,$7,$17
	beq	$2,$0,$L4484
	addiu	$5,$5,2

$L4328:
	addiu	$2,$7,2
	slt	$2,$2,$17
	bne	$2,$0,$L4508
	addu	$3,$19,$7

	addu	$2,$19,$7
	lbu	$4,0($2)
	addu	$2,$fp,$5
$L4546:
	addiu	$7,$7,1
	sb	$4,0($2)
	slt	$2,$7,$17
	bne	$2,$0,$L4328
	addiu	$5,$5,1

$L4484:
	addiu	$16,$7,1
$L4547:
	b	$L4321
	move	$17,$5

$L4387:
	b	$L4388
	li	$7,16			# 0x10

$L4504:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($18)
	b	$L4409
	lbu	$4,0($2)

$L4503:
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($18)
	b	$L4404
	lbu	$2,0($2)

$L4501:
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($18)
	b	$L4393
	lbu	$2,0($2)

$L4305:
	li	$2,1			# 0x1
	bne	$7,$2,$L4548
	lw	$25,%call16(av_log)($28)

	b	$L4480
	addiu	$21,$21,1

$L4489:
	li	$2,3			# 0x3
	beq	$4,$2,$L4509
	nop

	b	$L4312
	move	$3,$17

$L4502:
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_ue_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	sw	$3,8456($18)
	b	$L4399
	lbu	$2,0($2)

$L4410:
	b	$L4411
	li	$6,16			# 0x10

$L4405:
	b	$L4406
	li	$6,16			# 0x10

$L4394:
	b	$L4395
	li	$6,16			# 0x10

$L4486:
	b	$L4303
	move	$7,$0

$L4414:
	lw	$5,8456($18)
	sra	$2,$5,3
	addu	$2,$10,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($18)
	sw	$3,28($16)
	lw	$7,8456($18)
	sra	$2,$7,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	lbu	$6,2($2)
	sll	$4,$4,24
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	andi	$2,$7,0x7
	or	$3,$3,$6
	sll	$3,$3,$2
	srl	$3,$3,30
	addiu	$7,$7,2
	sw	$7,8456($18)
	sw	$3,32($16)
	lw	$8,8456($18)
	sra	$2,$8,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L4510
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$7,$2
	bne	$2,$0,$L4417
	srl	$5,$7,16

	move	$5,$7
	move	$6,$0
$L4418:
	andi	$2,$5,0xff00
	beq	$2,$0,$L4549
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L4549:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$7,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L4420
	sw	$4,8456($18)

	srl	$2,$5,1
	b	$L4416
	subu	$2,$0,$2

$L4400:
	b	$L4401
	li	$6,16			# 0x10

$L4509:
	move	$3,$17
	b	$L4312
	move	$17,$7

$L4320:
	b	$L4353
	li	$21,-1			# 0xffffffffffffffff

$L4510:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_se_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lb	$2,0($2)
	sw	$3,8456($18)
$L4416:
	addiu	$2,$2,26
	sw	$2,36($16)
	lw	$8,8456($18)
	sra	$2,$8,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L4511
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$7,$2
	bne	$2,$0,$L4424
	srl	$5,$7,16

	move	$5,$7
	move	$6,$0
$L4425:
	andi	$2,$5,0xff00
	beq	$2,$0,$L4550
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L4550:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$7,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L4427
	sw	$4,8456($18)

	srl	$2,$5,1
	b	$L4423
	subu	$2,$0,$2

$L4511:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_se_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lb	$2,0($2)
	sw	$3,8456($18)
$L4423:
	addiu	$2,$2,26
	sw	$2,40($16)
	lw	$8,8456($18)
	sra	$2,$8,3
	addu	$2,$10,$2
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L4512
	li	$2,-65536			# 0xffffffffffff0000

	and	$2,$7,$2
	bne	$2,$0,$L4431
	srl	$5,$7,16

	move	$5,$7
	move	$6,$0
$L4432:
	andi	$2,$5,0xff00
	beq	$2,$0,$L4551
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L4551:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$7,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L4434
	sw	$4,8456($18)

	srl	$2,$5,1
	b	$L4430
	subu	$2,$0,$2

$L4512:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_se_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lb	$2,0($2)
	sw	$3,8456($18)
$L4430:
	sw	$2,44($16)
	lw	$5,8456($18)
	li	$6,65536			# 0x10000
	sra	$2,$5,3
	addu	$2,$10,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($18)
	sw	$3,52($16)
	lw	$5,8456($18)
	lw	$25,%call16(memset)($28)
	sra	$2,$5,3
	addu	$2,$10,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	addiu	$5,$5,1
	srl	$3,$3,7
	sw	$5,8456($18)
	sw	$3,56($16)
	lw	$5,8456($18)
	addu	$6,$18,$6
	sra	$2,$5,3
	addu	$2,$10,$2
	lbu	$3,0($2)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	andi	$3,$3,0x00ff
	srl	$3,$3,7
	addiu	$5,$5,1
	li	$2,-1			# 0xffffffffffffffff
	addiu	$17,$16,68
	sw	$5,8456($18)
	move	$4,$17
	sw	$3,60($16)
	sw	$0,64($16)
	li	$5,16			# 0x10
	sw	$2,-6300($6)
	jalr	$25
	li	$6,96			# 0x60

	lw	$28,72($sp)
	addiu	$2,$16,164
	lw	$25,%call16(memset)($28)
	li	$5,16			# 0x10
	sw	$2,88($sp)
	move	$4,$2
	jalr	$25
	li	$6,128			# 0x80

	lw	$5,8456($18)
	slt	$2,$5,$19
	bne	$2,$0,$L4513
	lw	$28,72($sp)

	lw	$6,44($16)
	sw	$6,48($16)
$L4444:
	move	$5,$0
	li	$8,51			# 0x33
	li	$7,255			# 0xff
$L4445:
	addu	$2,$5,$6
	slt	$3,$2,52
	movz	$2,$8,$3
	slt	$4,$2,0
	movn	$2,$0,$4
	lui	$4,%hi(chroma_qp)
	addiu	$4,$4,%lo(chroma_qp)
	addu	$2,$4,$2
	andi	$3,$5,0xff
	lbu	$4,0($2)
	addu	$3,$16,$3
	addiu	$5,$5,1
	bne	$5,$7,$L4445
	sb	$4,292($3)

	lw	$7,48($16)
	beq	$6,$7,$L4446
	move	$5,$0

	li	$6,51			# 0x33
	li	$8,255			# 0xff
$L4447:
	addu	$2,$5,$7
	slt	$3,$2,52
	movz	$2,$6,$3
	slt	$4,$2,0
	lui	$15,%hi(chroma_qp)
	movn	$2,$0,$4
	addiu	$15,$15,%lo(chroma_qp)
	addu	$2,$15,$2
	andi	$3,$5,0xff
	lbu	$4,0($2)
	addu	$3,$16,$3
	addiu	$5,$5,1
	bne	$5,$8,$L4447
	sb	$4,548($3)

	li	$2,1			# 0x1
	sw	$2,12608($18)
	lw	$31,0($18)
$L4518:
	lw	$2,412($31)
	andi	$2,$2,0x1
	beq	$2,$0,$L4350
	nop

	lw	$2,4($16)
	bne	$2,$0,$L4450
	lw	$24,0($16)

	lui	$2,%hi($LC94)
	addiu	$17,$2,%lo($LC94)
$L4451:
	lw	$3,28($16)
	lui	$14,%hi($LC44)
	lui	$15,%hi($LC96)
	addiu	$15,$15,%lo($LC96)
	addiu	$14,$14,%lo($LC44)
	lw	$4,52($16)
	movn	$14,$15,$3
	lui	$15,%hi($LC44)
	lui	$3,%hi($LC97)
	addiu	$3,$3,%lo($LC97)
	addiu	$15,$15,%lo($LC44)
	lw	$5,56($16)
	movn	$15,$3,$4
	lui	$3,%hi($LC44)
	lui	$4,%hi($LC98)
	addiu	$4,$4,%lo($LC98)
	addiu	$3,$3,%lo($LC44)
	lw	$6,60($16)
	movn	$3,$4,$5
	lui	$4,%hi($LC44)
	lui	$5,%hi($LC99)
	addiu	$5,$5,%lo($LC99)
	addiu	$4,$4,%lo($LC44)
	lw	$2,64($16)
	lw	$7,12($16)
	movn	$4,$5,$6
	lui	$5,%hi($LC44)
	lui	$6,%hi($LC100)
	lw	$8,20($16)
	lw	$9,24($16)
	lw	$10,36($16)
	lw	$11,40($16)
	lw	$12,44($16)
	lw	$13,48($16)
	addiu	$6,$6,%lo($LC100)
	addiu	$5,$5,%lo($LC44)
	movn	$5,$6,$2
	lw	$25,%call16(av_log)($28)
	sw	$7,24($sp)
	lui	$6,%hi($LC101)
	lw	$7,80($sp)
	sw	$4,64($sp)
	sw	$5,68($sp)
	sw	$24,16($sp)
	sw	$17,20($sp)
	sw	$8,28($sp)
	sw	$9,32($sp)
	sw	$14,36($sp)
	sw	$10,40($sp)
	sw	$11,44($sp)
	sw	$12,48($sp)
	sw	$13,52($sp)
	sw	$15,56($sp)
	sw	$3,60($sp)
	move	$4,$31
	addiu	$6,$6,%lo($LC101)
	jalr	$25
	li	$5,2			# 0x2

	lw	$28,72($sp)
	b	$L4356
	move	$16,$0

$L4450:
	lui	$17,%hi($LC95)
	b	$L4451
	addiu	$17,$17,%lo($LC95)

$L4431:
	b	$L4432
	li	$6,16			# 0x10

$L4424:
	b	$L4425
	li	$6,16			# 0x10

$L4417:
	b	$L4418
	li	$6,16			# 0x10

$L4485:
	move	$4,$18
$L4516:
	.option	pic0
	jal	execute_decode_slices
	.option	pic2
	move	$5,$22

	b	$L4353
	lw	$28,72($sp)

$L4420:
	b	$L4416
	srl	$2,$5,1

$L4498:
	lw	$4,0($18)
	lui	$6,%hi($LC89)
	addiu	$6,$6,%lo($LC89)
	jalr	$25
	move	$5,$0

	lw	$28,72($sp)
	b	$L4353
	li	$21,-1			# 0xffffffffffffffff

$L4446:
	addiu	$8,$16,548
	addiu	$7,$16,292
	move	$6,$8
$L4449:
	lwl	$2,3($7)
	lwl	$3,7($7)
	lwl	$4,11($7)
	lwl	$5,15($7)
	lwr	$2,0($7)
	lwr	$3,4($7)
	lwr	$4,8($7)
	lwr	$5,12($7)
	swl	$2,3($6)
	swr	$2,0($6)
	swl	$3,7($6)
	swr	$3,4($6)
	swl	$4,11($6)
	swr	$4,8($6)
	addiu	$7,$7,16
	swl	$5,15($6)
	swr	$5,12($6)
	bne	$7,$8,$L4449
	addiu	$6,$6,16

	b	$L4518
	lw	$31,0($18)

$L4513:
	lw	$2,8448($18)
	sra	$3,$5,3
	addiu	$4,$5,1
	addu	$2,$2,$3
	lbu	$3,0($2)
	sw	$4,8456($18)
	lw	$2,0($16)
	andi	$4,$5,0x7
	sll	$3,$3,$4
	addiu	$2,$2,2446
	sll	$2,$2,2
	andi	$3,$3,0x00ff
	addu	$2,$18,$2
	srl	$3,$3,7
	lw	$5,4($2)
	sw	$3,64($16)
	lw	$3,88($sp)
	move	$4,$18
	move	$6,$16
	move	$7,$0
	sw	$3,20($sp)
	.option	pic0
	jal	decode_scaling_matrices
	.option	pic2
	sw	$17,16($sp)

	lw	$8,8456($18)
	lw	$2,8448($18)
	sra	$3,$8,3
	addu	$2,$2,$3
	lbu	$4,0($2)
	lbu	$3,3($2)
	lbu	$5,1($2)
	sll	$4,$4,24
	lbu	$6,2($2)
	or	$3,$3,$4
	sll	$5,$5,16
	or	$3,$3,$5
	sll	$6,$6,8
	or	$3,$3,$6
	andi	$4,$8,0x7
	sll	$7,$3,$4
	li	$2,134217728			# 0x8000000
	sltu	$2,$7,$2
	beq	$2,$0,$L4514
	lw	$28,72($sp)

	li	$2,-65536			# 0xffffffffffff0000
	and	$2,$7,$2
	beq	$2,$0,$L4515
	move	$5,$7

	srl	$5,$7,16
	li	$6,16			# 0x10
$L4440:
	andi	$2,$5,0xff00
	beq	$2,$0,$L4552
	lw	$3,%got(ff_log2_tab)($28)

	srl	$5,$5,8
	addiu	$6,$6,8
$L4552:
	addiu	$4,$8,32
	addu	$3,$3,$5
	lbu	$2,0($3)
	addu	$2,$2,$6
	sll	$2,$2,1
	addiu	$2,$2,-31
	srl	$5,$7,$2
	subu	$4,$4,$2
	andi	$3,$5,0x1
	beq	$3,$0,$L4442
	sw	$4,8456($18)

	srl	$2,$5,1
	subu	$2,$0,$2
	sw	$2,48($16)
	b	$L4444
	lw	$6,44($16)

$L4434:
	b	$L4430
	srl	$2,$5,1

$L4427:
	b	$L4423
	srl	$2,$5,1

$L4515:
	b	$L4440
	move	$6,$0

$L4364:
	addiu	$22,$22,1
	b	$L4356
	move	$16,$0

$L4442:
	srl	$2,$5,1
	sw	$2,48($16)
	b	$L4444
	lw	$6,44($16)

$L4514:
	lw	$2,%got(ff_golomb_vlc_len)($28)
	srl	$4,$7,23
	addu	$2,$2,$4
	lbu	$3,0($2)
	lw	$2,%got(ff_se_golomb_vlc_code)($28)
	addu	$3,$3,$8
	addu	$2,$2,$4
	lb	$2,0($2)
	sw	$3,8456($18)
	lw	$6,44($16)
	b	$L4444
	sw	$2,48($16)

$L4507:
	move	$5,$0
	li	$16,1			# 0x1
	b	$L4321
	move	$17,$5

	.set	macro
	.set	reorder
	.end	decode_nal_units
	.section	.rodata.str1.4
	.align	2
$LC104:
	.ascii	"avcC too short\012\000"
	.align	2
$LC105:
	.ascii	"Unknown avcC version %d\012\000"
	.align	2
$LC106:
	.ascii	"Decoding sps %d from avcC failed\012\000"
	.align	2
$LC107:
	.ascii	"Decoding pps %d from avcC failed\012\000"
	.align	2
$LC108:
	.ascii	"no frame!\012\000"
	.align	2
$LC109:
	.ascii	"no mmco here\012\000"
	.align	2
$LC110:
	.ascii	"mmco:%d %d %d\012\000"
	.align	2
$LC111:
	.ascii	"mmco: remove_short() failure\012\000"
	.align	2
$LC112:
	.ascii	"mmco: remove_long() failure\012\000"
	.align	2
$LC113:
	.ascii	"illegal short term buffer state detected\012\000"
	.align	2
$LC114:
	.ascii	"no picture\012\000"
	.text
	.align	2
	.ent	decode_frame
	.type	decode_frame, @function
decode_frame:
	.set	nomips16
	.frame	$sp,96,$31		# vars= 24, regs= 10/0, args= 24, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-96
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$31,92($sp)
	sw	$fp,88($sp)
	sw	$23,84($sp)
	sw	$22,80($sp)
	sw	$21,76($sp)
	sw	$20,72($sp)
	sw	$19,68($sp)
	sw	$18,64($sp)
	sw	$17,60($sp)
	sw	$16,56($sp)
	.cprestore	24
	lw	$19,136($4)
	lw	$3,12($4)
	sw	$4,96($sp)
	lw	$8,96($sp)
	lw	$4,112($sp)
	sw	$3,56($19)
	lw	$2,604($8)
	sw	$5,100($sp)
	sw	$2,60($19)
	sw	$6,104($sp)
	bne	$4,$0,$L4554
	sw	$7,108($sp)

	li	$3,131072			# 0x20000
	addu	$2,$19,$3
	lw	$4,5956($2)
	beq	$4,$0,$L4555
	lw	$8,5952($2)

	lw	$2,48($4)
	bne	$2,$0,$L4752
	move	$2,$8

	ori	$2,$3,0x1748
	addu	$6,$19,$2
	li	$5,1			# 0x1
	b	$L4561
	move	$7,$0

$L4557:
	lw	$2,48($4)
	bne	$2,$0,$L4726
	addiu	$6,$6,4

$L4561:
	lw	$2,228($4)
	lw	$3,228($8)
	slt	$2,$2,$3
	movn	$8,$4,$2
	lw	$4,0($6)
	movn	$7,$5,$2
	bne	$4,$0,$L4557
	addiu	$5,$5,1

$L4726:
	li	$2,34256			# 0x85d0
	addu	$2,$7,$2
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$2,0($2)
$L4558:
	beq	$2,$0,$L4560
	li	$2,34257			# 0x85d1

	addu	$2,$7,$2
	sll	$2,$2,2
	addu	$3,$19,$2
$L4562:
	lw	$2,0($3)
	sw	$2,-4($3)
	bne	$2,$0,$L4562
	addiu	$3,$3,4

$L4560:
	beq	$8,$0,$L4563
	lw	$3,104($sp)

	li	$2,200			# 0xc8
	lw	$7,100($sp)
	move	$6,$8
	sw	$2,0($3)
	addiu	$8,$8,192
$L4564:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L4564
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$3,0($6)
	sw	$2,4($7)
	sw	$3,0($7)
	sw	$0,44($sp)
$L4565:
	lw	$31,92($sp)
	lw	$2,44($sp)
	lw	$fp,88($sp)
	lw	$23,84($sp)
	lw	$22,80($sp)
	lw	$21,76($sp)
	lw	$20,72($sp)
	lw	$19,68($sp)
	lw	$18,64($sp)
	lw	$17,60($sp)
	lw	$16,56($sp)
	j	$31
	addiu	$sp,$sp,96

$L4554:
	li	$2,65536			# 0x10000
	and	$2,$3,$2
	bne	$2,$0,$L4732
	lw	$25,%call16(ff_h264_find_frame_end)($28)

$L4566:
	lw	$2,8728($19)
	beq	$2,$0,$L4567
	nop

	lw	$2,8732($19)
	bne	$2,$0,$L4567
	lw	$8,96($sp)

	lw	$2,28($8)
	slt	$2,$2,7
	bne	$2,$0,$L4733
	lw	$5,24($8)

	lbu	$7,0($5)
	li	$2,1			# 0x1
	bne	$7,$2,$L4734
	li	$2,2			# 0x2

	sw	$2,8736($19)
	lbu	$3,5($5)
	andi	$20,$3,0x1f
	beq	$20,$0,$L4570
	addiu	$16,$5,6

	b	$L4572
	move	$18,$0

$L4571:
	addiu	$18,$18,1
	slt	$2,$18,$20
	beq	$2,$0,$L4570
	addu	$16,$16,$17

$L4572:
	lbu	$2,0($16)
	lbu	$3,1($16)
	sll	$2,$2,8
	or	$3,$3,$2
	addiu	$17,$3,2
	move	$4,$19
	move	$5,$16
	.option	pic0
	jal	decode_nal_units
	.option	pic2
	move	$6,$17

	bgez	$2,$L4571
	lw	$28,24($sp)

	lw	$25,%call16(av_log)($28)
	lw	$4,96($sp)
	lui	$6,%hi($LC106)
	addiu	$6,$6,%lo($LC106)
	move	$7,$18
	jalr	$25
	move	$5,$0

	li	$4,-1			# 0xffffffffffffffff
	lw	$28,24($sp)
	b	$L4565
	sw	$4,44($sp)

$L4573:
	lw	$3,96($sp)
	li	$4,1			# 0x1
	lw	$2,24($3)
	lbu	$3,4($2)
	sw	$4,8732($19)
	andi	$3,$3,0x3
	addiu	$3,$3,1
	sw	$3,8736($19)
$L4567:
	lw	$4,96($sp)
	lw	$2,80($4)
	bne	$2,$0,$L4753
	lw	$5,108($sp)

	lw	$2,8728($19)
	beq	$2,$0,$L4735
	nop

$L4576:
	lw	$5,108($sp)
$L4753:
	lw	$6,112($sp)
	.option	pic0
	jal	decode_nal_units
	.option	pic2
	move	$4,$19

	lw	$28,24($sp)
	bltz	$2,$L4731
	sw	$2,44($sp)

	lw	$2,60($19)
	andi	$2,$2,0x8000
	bne	$2,$0,$L4578
	nop

	lw	$6,1880($19)
	beq	$6,$0,$L4736
	sw	$6,32($sp)

$L4579:
	li	$2,2			# 0x2
	sw	$0,6172($19)
	sw	$2,160($6)
	lw	$3,2084($19)
	li	$2,65536			# 0x10000
	sw	$3,52($6)
	addu	$5,$19,$2
	lw	$3,-6216($5)
	lw	$4,-6228($5)
	sw	$3,-6212($5)
	sw	$4,-6208($5)
	lw	$3,80($6)
	lw	$2,8500($19)
	li	$7,131072			# 0x20000
	addu	$4,$19,$7
	and	$2,$2,$3
	lw	$3,6024($4)
	bne	$2,$0,$L4737
	sw	$3,40($sp)

$L4581:
	lw	$25,%call16(ff_er_frame_end)($28)
	jalr	$25
	move	$4,$19

	lw	$28,24($sp)
	lw	$25,%call16(MPV_frame_end)($28)
	jalr	$25
	move	$4,$19

	lw	$2,10544($19)
	beq	$2,$0,$L4649
	lw	$28,24($sp)

	lw	$4,0($19)
	lw	$3,10548($19)
	lw	$2,268($4)
	slt	$2,$2,$3
	bne	$2,$0,$L4738
	nop

$L4649:
	li	$4,131072			# 0x20000
	addu	$2,$19,$4
	lw	$3,5952($2)
	beq	$3,$0,$L4739
	ori	$2,$4,0x1744

	addu	$3,$19,$2
	move	$8,$0
$L4652:
	lw	$2,0($3)
	addiu	$8,$8,1
	bne	$2,$0,$L4652
	addiu	$3,$3,4

	addiu	$11,$8,1
$L4651:
	lw	$4,32($sp)
	li	$2,34256			# 0x85d0
	addu	$2,$8,$2
	sll	$2,$2,2
	lw	$3,80($4)
	addu	$2,$19,$2
	bne	$3,$0,$L4653
	sw	$4,0($2)

	li	$2,4			# 0x4
	sw	$2,80($4)
$L4653:
	li	$3,131072			# 0x20000
	addu	$2,$19,$3
	lw	$7,5952($2)
	beq	$7,$0,$L4740
	ori	$2,$3,0x1744

	addu	$4,$19,$2
	move	$3,$7
	move	$10,$0
$L4658:
	lw	$2,48($3)
	bne	$2,$0,$L4656
	nop

	lw	$2,228($3)
	bne	$2,$0,$L4657
	nop

$L4656:
	li	$10,1			# 0x1
$L4657:
	lw	$3,0($4)
	bne	$3,$0,$L4658
	addiu	$4,$4,4

$L4655:
	li	$3,131072			# 0x20000
	addu	$2,$19,$3
	lw	$4,5956($2)
	beq	$4,$0,$L4754
	move	$5,$7

	lw	$2,48($4)
	bne	$2,$0,$L4754
	ori	$2,$3,0x1748

	addu	$6,$19,$2
	li	$5,1			# 0x1
	b	$L4662
	move	$9,$0

$L4741:
	lw	$2,48($4)
	bne	$2,$0,$L4661
	addiu	$6,$6,4

$L4662:
	lw	$2,228($4)
	lw	$3,228($7)
	slt	$2,$2,$3
	movn	$7,$4,$2
	lw	$4,0($6)
	movn	$9,$5,$2
	bne	$4,$0,$L4741
	addiu	$5,$5,1

$L4661:
	move	$5,$7
$L4663:
	bne	$10,$0,$L4665
	move	$6,$0

	lw	$2,40($sp)
	beq	$2,$0,$L4665
	nop

	lw	$3,228($7)
	lw	$2,228($2)
	slt	$6,$3,$2
$L4665:
	lw	$2,10544($19)
	beq	$2,$0,$L4755
	lw	$3,40($sp)

	lw	$4,0($19)
	lw	$3,10548($19)
	lw	$2,268($4)
	slt	$2,$2,$3
	beq	$2,$0,$L4667
	lw	$3,40($sp)

$L4755:
	beq	$3,$0,$L4668
	nop

	lw	$4,0($19)
	lw	$2,268($4)
	slt	$2,$2,$11
	bne	$2,$0,$L4668
	nop

	lw	$5,40($sp)
$L4667:
	bne	$6,$0,$L4756
	li	$2,34256			# 0x85d0

$L4674:
	lw	$2,268($4)
	slt	$2,$2,$11
	bne	$2,$0,$L4756
	li	$2,34256			# 0x85d0

$L4677:
	lw	$2,40($sp)
$L4750:
	beq	$2,$5,$L4742
	lw	$4,104($sp)

	li	$2,200			# 0xc8
	sw	$2,0($4)
$L4680:
	lw	$8,40($sp)
	beq	$8,$0,$L4757
	li	$2,131072			# 0x20000

	beq	$8,$5,$L4681
	li	$2,4			# 0x4

	lw	$3,80($8)
	beq	$3,$2,$L4743
	nop

$L4681:
	li	$2,131072			# 0x20000
$L4757:
	addu	$2,$19,$2
	beq	$5,$0,$L4682
	sw	$5,6024($2)

	lw	$7,100($sp)
	move	$6,$5
	addiu	$8,$5,192
$L4683:
	lw	$2,0($6)
	lw	$3,4($6)
	lw	$4,8($6)
	lw	$5,12($6)
	addiu	$6,$6,16
	sw	$2,0($7)
	sw	$3,4($7)
	sw	$4,8($7)
	sw	$5,12($7)
	bne	$6,$8,$L4683
	addiu	$7,$7,16

	lw	$2,4($6)
	lw	$3,0($6)
	sw	$2,4($7)
	sw	$3,0($7)
$L4580:
	lw	$25,%call16(ff_print_debug_info)($28)
$L4758:
	lw	$5,100($sp)
$L4759:
	jalr	$25
	move	$4,$19

	lw	$2,56($19)
	li	$3,65536			# 0x10000
	and	$2,$2,$3
	lw	$28,24($sp)
	beq	$2,$0,$L4684
	lw	$3,112($sp)

	lw	$3,44($sp)
	lw	$2,8004($19)
	lw	$31,92($sp)
	subu	$2,$3,$2
	slt	$3,$2,0
	movn	$2,$0,$3
	sw	$2,44($sp)
	lw	$2,44($sp)
	lw	$fp,88($sp)
	lw	$23,84($sp)
	lw	$22,80($sp)
	lw	$21,76($sp)
	lw	$20,72($sp)
	lw	$19,68($sp)
	lw	$18,64($sp)
	lw	$17,60($sp)
	lw	$16,56($sp)
	j	$31
	addiu	$sp,$sp,96

$L4735:
	lw	$2,0($19)
	lw	$6,28($2)
	beq	$6,$0,$L4753
	lw	$5,108($sp)

	lw	$5,24($2)
	.option	pic0
	jal	decode_nal_units
	.option	pic2
	move	$4,$19

	bgez	$2,$L4576
	lw	$28,24($sp)

$L4731:
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,44($sp)
$L4749:
	lw	$31,92($sp)
	lw	$2,44($sp)
	lw	$fp,88($sp)
	lw	$23,84($sp)
	lw	$22,80($sp)
	lw	$21,76($sp)
	lw	$20,72($sp)
	lw	$19,68($sp)
	lw	$18,64($sp)
	lw	$17,60($sp)
	lw	$16,56($sp)
	j	$31
	addiu	$sp,$sp,96

$L4732:
	move	$5,$7
	move	$6,$4
	jalr	$25
	move	$4,$19

	lw	$28,24($sp)
	move	$5,$2
	lw	$25,%call16(ff_combine_frame)($28)
	addiu	$4,$19,7996
	addiu	$6,$sp,108
	jalr	$25
	addiu	$7,$sp,112

	bgez	$2,$L4566
	lw	$28,24($sp)

	lw	$4,112($sp)
	b	$L4565
	sw	$4,44($sp)

$L4578:
	lw	$3,148($19)
	lw	$2,6172($19)
	slt	$2,$2,$3
	bne	$2,$0,$L4758
	lw	$25,%call16(ff_print_debug_info)($28)

	beq	$3,$0,$L4759
	lw	$5,100($sp)

	lw	$6,1880($19)
	b	$L4579
	sw	$6,32($sp)

$L4668:
	bne	$6,$0,$L4744
	nop

$L4670:
	lw	$2,8240($19)
	beq	$2,$0,$L4672
	nop

	bne	$10,$0,$L4673
	lw	$4,40($sp)

	beq	$4,$0,$L4673
	nop

	lw	$2,228($4)
	lw	$3,228($7)
	addiu	$2,$2,2
	slt	$3,$2,$3
	bne	$3,$0,$L4729
	nop

$L4673:
	lw	$8,32($sp)
	li	$2,3			# 0x3
	lw	$3,52($8)
	beq	$3,$2,$L4729
	nop

$L4672:
	beq	$6,$0,$L4745
	li	$2,34256			# 0x85d0

	lw	$5,40($sp)
$L4756:
	addu	$2,$9,$2
	sll	$2,$2,2
	addu	$2,$19,$2
	lw	$3,0($2)
	beq	$3,$0,$L4677
	li	$2,34257			# 0x85d1

	addu	$2,$9,$2
	sll	$2,$2,2
	addu	$3,$19,$2
$L4678:
	lw	$2,0($3)
	sw	$2,-4($3)
	bne	$2,$0,$L4678
	addiu	$3,$3,4

	b	$L4750
	lw	$2,40($sp)

$L4684:
	lw	$4,44($sp)
	bne	$4,$0,$L4686
	addiu	$2,$4,9

	li	$8,1			# 0x1
	sw	$8,44($sp)
	li	$2,10			# 0xa
$L4686:
	lw	$8,44($sp)
	slt	$2,$2,$3
	movz	$8,$3,$2
	lw	$31,92($sp)
	sw	$8,44($sp)
	lw	$2,44($sp)
	lw	$fp,88($sp)
	lw	$23,84($sp)
	lw	$22,80($sp)
	lw	$21,76($sp)
	lw	$20,72($sp)
	lw	$19,68($sp)
	lw	$18,64($sp)
	lw	$17,60($sp)
	lw	$16,56($sp)
	j	$31
	addiu	$sp,$sp,96

$L4563:
	b	$L4565
	sw	$0,44($sp)

$L4570:
	lbu	$20,0($16)
	beq	$20,$0,$L4573
	addiu	$17,$16,1

	b	$L4575
	move	$18,$0

$L4574:
	addiu	$18,$18,1
	slt	$2,$18,$20
	beq	$2,$0,$L4573
	addu	$17,$17,$3

$L4575:
	lbu	$2,0($17)
	lbu	$16,1($17)
	sll	$2,$2,8
	or	$16,$16,$2
	addiu	$16,$16,2
	move	$4,$19
	move	$5,$17
	.option	pic0
	jal	decode_nal_units
	.option	pic2
	move	$6,$16

	lw	$28,24($sp)
	beq	$2,$16,$L4574
	move	$3,$2

	lw	$25,%call16(av_log)($28)
	lw	$4,96($sp)
	lui	$6,%hi($LC107)
	addiu	$6,$6,%lo($LC107)
	move	$7,$18
	jalr	$25
	move	$5,$0

	li	$8,-1			# 0xffffffffffffffff
	lw	$28,24($sp)
	b	$L4565
	sw	$8,44($sp)

$L4737:
	lw	$2,-6244($5)
	lw	$3,-6248($5)
	lw	$10,0($19)
	sw	$2,-6224($5)
	sw	$3,-6220($5)
	lw	$3,412($10)
	lw	$4,6820($4)
	ori	$2,$7,0x178c
	andi	$9,$3,0x800
	addu	$2,$19,$2
	beq	$9,$0,$L4582
	sw	$4,48($sp)

	bne	$4,$0,$L4582
	lw	$25,%call16(av_log)($28)

	lui	$6,%hi($LC109)
	addiu	$6,$6,%lo($LC109)
	move	$4,$10
	jalr	$25
	li	$5,2			# 0x2

	lw	$6,1880($19)
$L4583:
	lw	$5,232($6)
	.option	pic0
	jal	remove_short
	.option	pic2
	move	$4,$19

	lw	$28,24($sp)
	beq	$2,$0,$L4641
	move	$3,$2

	li	$5,131072			# 0x20000
	addu	$4,$19,$5
	lw	$2,6024($4)
	beq	$3,$2,$L4644
	sw	$0,80($3)

	lw	$2,5952($4)
	beq	$2,$0,$L4760
	lw	$25,%call16(av_log)($28)

	beq	$3,$2,$L4644
	ori	$2,$5,0x1744

	b	$L4646
	addu	$2,$19,$2

$L4647:
	beq	$3,$4,$L4644
	addiu	$2,$2,4

$L4646:
	lw	$4,0($2)
	bne	$4,$0,$L4647
	nop

$L4643:
	lw	$25,%call16(av_log)($28)
$L4760:
	lw	$4,0($19)
	lui	$6,%hi($LC113)
	addiu	$6,$6,%lo($LC113)
	jalr	$25
	move	$5,$0

	lw	$28,24($sp)
$L4641:
	li	$2,131072			# 0x20000
	addu	$2,$19,$2
	lw	$6,6828($2)
	beq	$6,$0,$L4648
	lw	$25,%call16(memmove)($28)

	li	$4,65536			# 0x10000
	ori	$5,$4,0x173c
	ori	$4,$4,0x1740
	addu	$4,$19,$4
	addu	$5,$19,$5
	jalr	$25
	sll	$6,$6,2

$L4648:
	lw	$5,1880($19)
	li	$4,131072			# 0x20000
	sw	$0,240($5)
	addu	$4,$19,$4
	lw	$2,6828($4)
	li	$3,65536			# 0x10000
	addu	$3,$19,$3
	addiu	$2,$2,1
	sw	$2,6828($4)
	b	$L4640
	sw	$5,5948($3)

$L4738:
	sw	$3,268($4)
	b	$L4649
	sw	$0,8240($19)

$L4744:
	lw	$4,0($19)
	lw	$2,268($4)
	bne	$2,$8,$L4670
	slt	$2,$11,15

	beq	$2,$0,$L4670
	nop

$L4671:
	sw	$0,8240($19)
	lw	$2,268($4)
	lw	$5,40($sp)
	addiu	$2,$2,1
	b	$L4667
	sw	$2,268($4)

$L4555:
	move	$2,$8
$L4752:
	b	$L4558
	move	$7,$0

$L4582:
	lw	$4,48($sp)
	blez	$4,$L4583
	li	$5,65536			# 0x10000

	li	$4,131072			# 0x20000
	ori	$7,$5,0x17bc
	ori	$6,$4,0x1744
	ori	$8,$5,0x17fc
	ori	$3,$4,0x178c
	addu	$7,$19,$7
	move	$18,$2
	addu	$22,$19,$3
	addu	$20,$19,$6
	sw	$7,52($sp)
	addu	$21,$19,$8
	move	$23,$0
	sw	$0,36($sp)
	addu	$16,$19,$4
	bne	$9,$0,$L4746
	addu	$fp,$19,$5

$L4584:
	lw	$3,0($18)
	sltu	$2,$3,7
	beq	$2,$0,$L4585
	lui	$8,%hi($L4592)

	sll	$2,$3,2
	addiu	$8,$8,%lo($L4592)
	addu	$2,$8,$2
	lw	$3,0($2)
	addu	$3,$3,$28
	j	$3
	nop

	.rdata
	.align	2
	.align	2
$L4592:
	.gpword	$L4585
	.gpword	$L4586
	.gpword	$L4587
	.gpword	$L4588
	.gpword	$L4589
	.gpword	$L4693
	.gpword	$L4591
	.text
$L4588:
	lw	$17,8($18)
	addiu	$2,$17,17902
	sll	$2,$2,2
	addu	$5,$19,$2
	lw	$4,4($5)
	beq	$4,$0,$L4599
	nop

	lw	$2,6824($16)
	lw	$3,6024($16)
	addiu	$2,$2,-1
	sw	$2,6824($16)
	sw	$0,4($5)
	beq	$4,$3,$L4601
	sw	$0,80($4)

	lw	$2,5952($16)
	beq	$2,$0,$L4727
	nop

	beq	$4,$2,$L4601
	move	$2,$20

	b	$L4762
	lw	$3,0($2)

$L4604:
	beq	$4,$3,$L4601
	addiu	$2,$2,4

	lw	$3,0($2)
$L4762:
	bne	$3,$0,$L4604
	nop

$L4727:
	lw	$17,8($18)
$L4599:
	lw	$5,4($18)
	.option	pic0
	jal	remove_short
	.option	pic2
	move	$4,$19

	lw	$3,8($18)
	addiu	$4,$17,17902
	sll	$4,$4,2
	addiu	$3,$3,17902
	addu	$4,$19,$4
	sll	$3,$3,2
	sw	$2,4($4)
	addu	$3,$19,$3
	lw	$2,4($3)
	beq	$2,$0,$L4585
	lw	$28,24($sp)

	li	$3,1			# 0x1
	sw	$3,240($2)
	lw	$2,6824($16)
	addiu	$2,$2,1
	sw	$2,6824($16)
$L4585:
	lw	$3,48($sp)
$L4751:
	addiu	$23,$23,1
$L4768:
	slt	$2,$23,$3
	addiu	$18,$18,12
	beq	$2,$0,$L4638
	addiu	$22,$22,12

	lw	$10,0($19)
	lw	$3,412($10)
	andi	$9,$3,0x800
	beq	$9,$0,$L4584
	nop

$L4746:
	lw	$2,4($22)
	lw	$7,0($22)
	sw	$2,16($sp)
	lw	$3,8($22)
	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC110)
	sw	$3,20($sp)
	move	$4,$10
	li	$5,2			# 0x2
	jalr	$25
	addiu	$6,$6,%lo($LC110)

	b	$L4584
	lw	$28,24($sp)

$L4591:
	lw	$17,8($18)
	addiu	$2,$17,17902
	sll	$2,$2,2
	addu	$5,$19,$2
	lw	$4,4($5)
	beq	$4,$0,$L4612
	nop

	lw	$2,6824($16)
	lw	$3,6024($16)
	addiu	$2,$2,-1
	sw	$2,6824($16)
	sw	$0,4($5)
	beq	$4,$3,$L4614
	sw	$0,80($4)

	lw	$2,5952($16)
	beq	$2,$0,$L4728
	nop

	beq	$4,$2,$L4614
	move	$2,$20

	b	$L4763
	lw	$3,0($2)

$L4617:
	beq	$4,$3,$L4614
	addiu	$2,$2,4

	lw	$3,0($2)
$L4763:
	bne	$3,$0,$L4617
	nop

$L4728:
	lw	$17,8($18)
$L4612:
	lw	$6,1880($19)
	li	$2,1			# 0x1
	sw	$2,240($6)
	lw	$2,6824($16)
	addiu	$3,$17,17902
	addiu	$2,$2,1
	sll	$3,$3,2
	addu	$3,$19,$3
	sw	$2,6824($16)
	li	$2,1			# 0x1
	sw	$6,4($3)
	b	$L4585
	sw	$2,36($sp)

$L4589:
	lw	$3,8($18)
	slt	$2,$3,16
	beq	$2,$0,$L4585
	addiu	$2,$3,17902

	sll	$2,$2,2
	addu	$2,$19,$2
	addiu	$5,$2,4
	li	$6,4			# 0x4
$L4624:
	lw	$4,0($5)
	beq	$4,$0,$L4618
	nop

	lw	$2,6824($16)
	lw	$3,6024($16)
	addiu	$2,$2,-1
	sw	$2,6824($16)
	sw	$0,0($5)
	beq	$4,$3,$L4620
	sw	$0,80($4)

	lw	$2,5952($16)
	beq	$2,$0,$L4618
	nop

	beq	$4,$2,$L4620
	move	$2,$20

	b	$L4764
	lw	$3,0($2)

$L4623:
	beq	$4,$3,$L4620
	addiu	$2,$2,4

	lw	$3,0($2)
$L4764:
	bne	$3,$0,$L4623
	nop

$L4618:
	addiu	$5,$5,4
	bne	$5,$21,$L4624
	nop

	b	$L4751
	lw	$3,48($sp)

$L4587:
	lw	$2,8($18)
	addiu	$2,$2,17902
	sll	$2,$2,2
	addu	$5,$19,$2
	lw	$4,4($5)
	beq	$4,$0,$L4605
	nop

	lw	$2,6824($16)
	lw	$3,6024($16)
	addiu	$2,$2,-1
	sw	$2,6824($16)
	sw	$0,4($5)
	beq	$4,$3,$L4607
	sw	$0,80($4)

	lw	$2,5952($16)
	beq	$2,$0,$L4751
	lw	$3,48($sp)

	beq	$4,$2,$L4607
	move	$2,$20

	b	$L4765
	lw	$3,0($2)

$L4611:
	beq	$4,$3,$L4607
	addiu	$2,$2,4

	lw	$3,0($2)
$L4765:
	bne	$3,$0,$L4611
	nop

	b	$L4751
	lw	$3,48($sp)

$L4586:
	lw	$5,4($18)
	.option	pic0
	jal	remove_short
	.option	pic2
	move	$4,$19

	lw	$28,24($sp)
	beq	$2,$0,$L4593
	move	$4,$2

	lw	$2,6024($16)
	beq	$4,$2,$L4607
	sw	$0,80($4)

	lw	$2,5952($16)
	beq	$2,$0,$L4751
	lw	$3,48($sp)

	beq	$4,$2,$L4607
	move	$2,$20

	b	$L4766
	lw	$3,0($2)

$L4598:
	beq	$4,$3,$L4607
	addiu	$2,$2,4

	lw	$3,0($2)
$L4766:
	bne	$3,$0,$L4598
	nop

	b	$L4751
	lw	$3,48($sp)

$L4693:
	li	$17,4			# 0x4
$L4714:
	lw	$2,6828($16)
	beq	$2,$0,$L4761
	lw	$5,52($sp)

$L4630:
	lw	$2,5948($fp)
	move	$4,$19
	.option	pic0
	jal	remove_short
	.option	pic2
	lw	$5,232($2)

	lw	$28,24($sp)
	beq	$2,$0,$L4714
	move	$3,$2

	lw	$2,6024($16)
	beq	$3,$2,$L4626
	sw	$0,80($3)

	lw	$2,5952($16)
	beq	$2,$0,$L4714
	nop

	beq	$3,$2,$L4626
	move	$2,$20

$L4628:
	lw	$4,0($2)
	beq	$4,$0,$L4714
	nop

	bne	$3,$4,$L4628
	addiu	$2,$2,4

$L4626:
	sw	$17,80($3)
	lw	$2,6828($16)
	bne	$2,$0,$L4630
	lw	$5,52($sp)

$L4761:
	li	$6,4			# 0x4
$L4637:
	lw	$4,0($5)
	beq	$4,$0,$L4631
	nop

	lw	$2,6824($16)
	lw	$3,6024($16)
	addiu	$2,$2,-1
	sw	$2,6824($16)
	sw	$0,0($5)
	beq	$4,$3,$L4633
	sw	$0,80($4)

	lw	$2,5952($16)
	beq	$2,$0,$L4631
	nop

	beq	$4,$2,$L4633
	move	$2,$20

	b	$L4767
	lw	$3,0($2)

$L4636:
	beq	$4,$3,$L4633
	addiu	$2,$2,4

	lw	$3,0($2)
$L4767:
	bne	$3,$0,$L4636
	nop

$L4631:
	addiu	$5,$5,4
	bne	$5,$21,$L4637
	lw	$3,48($sp)

	b	$L4768
	addiu	$23,$23,1

$L4745:
	b	$L4674
	lw	$4,0($19)

$L4729:
	b	$L4671
	lw	$4,0($19)

$L4620:
	addiu	$5,$5,4
	bne	$5,$21,$L4624
	sw	$6,80($4)

	b	$L4751
	lw	$3,48($sp)

$L4633:
	addiu	$5,$5,4
	bne	$5,$21,$L4637
	sw	$6,80($4)

	b	$L4751
	lw	$3,48($sp)

$L4607:
	li	$2,4			# 0x4
	b	$L4585
	sw	$2,80($4)

$L4614:
	li	$2,4			# 0x4
	sw	$2,80($4)
	b	$L4612
	lw	$17,8($18)

$L4601:
	li	$2,4			# 0x4
	sw	$2,80($4)
	b	$L4599
	lw	$17,8($18)

$L4605:
	lw	$4,0($19)
	lw	$2,412($4)
	andi	$2,$2,0x800
	beq	$2,$0,$L4751
	lw	$3,48($sp)

	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC112)
	li	$5,2			# 0x2
	jalr	$25
	addiu	$6,$6,%lo($LC112)

	b	$L4585
	lw	$28,24($sp)

$L4593:
	lw	$4,0($19)
	lw	$2,412($4)
	andi	$2,$2,0x800
	beq	$2,$0,$L4751
	lw	$3,48($sp)

	lw	$25,%call16(av_log)($28)
	lui	$6,%hi($LC111)
	li	$5,2			# 0x2
	jalr	$25
	addiu	$6,$6,%lo($LC111)

	b	$L4585
	lw	$28,24($sp)

$L4638:
	lw	$4,36($sp)
	beq	$4,$0,$L4748
	nop

$L4640:
	.option	pic0
	jal	print_short_term
	.option	pic2
	move	$4,$19

	.option	pic0
	jal	print_long_term
	.option	pic2
	move	$4,$19

	b	$L4581
	lw	$28,24($sp)

$L4743:
	b	$L4681
	sw	$0,80($8)

$L4742:
	lw	$3,104($sp)
	b	$L4680
	sw	$0,0($3)

$L4736:
	lw	$8,96($sp)
	lw	$2,716($8)
	slt	$2,$2,8
	beq	$2,$0,$L4563
	nop

	lw	$2,6164($19)
	bne	$2,$0,$L4563
	lui	$6,%hi($LC108)

	lw	$25,%call16(av_log)($28)
	move	$4,$8
	addiu	$6,$6,%lo($LC108)
$L4730:
	jalr	$25
	move	$5,$0

	li	$2,-1			# 0xffffffffffffffff
	lw	$28,24($sp)
	b	$L4749
	sw	$2,44($sp)

$L4754:
	b	$L4663
	move	$9,$0

$L4682:
	lw	$25,%call16(av_log)($28)
	lw	$4,96($sp)
	lui	$6,%hi($LC114)
	addiu	$6,$6,%lo($LC114)
	jalr	$25
	li	$5,2			# 0x2

	b	$L4580
	lw	$28,24($sp)

$L4748:
	b	$L4583
	lw	$6,1880($19)

$L4740:
	b	$L4655
	move	$10,$0

$L4739:
	move	$8,$0
	b	$L4651
	li	$11,1			# 0x1

$L4734:
	lw	$25,%call16(av_log)($28)
	lw	$4,96($sp)
	lui	$6,%hi($LC105)
	addiu	$6,$6,%lo($LC105)
	jalr	$25
	move	$5,$0

	li	$3,-1			# 0xffffffffffffffff
	lw	$28,24($sp)
	b	$L4565
	sw	$3,44($sp)

$L4644:
	li	$2,4			# 0x4
	b	$L4643
	sw	$2,80($3)

$L4733:
	lui	$6,%hi($LC104)
	lw	$25,%call16(av_log)($28)
	move	$4,$8
	b	$L4730
	addiu	$6,$6,%lo($LC104)

	.set	macro
	.set	reorder
	.end	decode_frame
	.globl	ff_rem6
	.rdata
	.align	2
	.type	ff_rem6, @object
	.size	ff_rem6, 52
ff_rem6:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.globl	ff_div6
	.align	2
	.type	ff_div6, @object
	.size	ff_div6, 52
ff_div6:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.globl	h264_decoder
	.section	.rodata.str1.4
	.align	2
$LC115:
	.ascii	"h264\000"
	.section	.data.rel.local,"aw",@progbits
	.align	2
	.type	h264_decoder, @object
	.size	h264_decoder, 52
h264_decoder:
	.word	$LC115
	.word	0
	.word	28
	.word	140496
	.word	decode_init
	.word	0
	.word	decode_end
	.word	decode_frame
	.word	42
	.space	4
	.word	flush_dpb
	.space	8
	.globl	svq3_decoder
	.section	.rodata.str1.4
	.align	2
$LC116:
	.ascii	"svq3\000"
	.section	.data.rel.local
	.align	2
	.type	svq3_decoder, @object
	.size	svq3_decoder, 52
svq3_decoder:
	.word	$LC116
	.word	0
	.word	24
	.word	140496
	.word	decode_init
	.word	0
	.word	decode_end
	.word	svq3_decode_frame
	.word	35
	.space	16
	.rdata
	.align	2
	.type	last_coeff_flag_offset_8x8, @object
	.size	last_coeff_flag_offset_8x8, 63
last_coeff_flag_offset_8x8:
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	8
	.align	2
	.type	scan8, @object
	.size	scan8, 24
scan8:
	.byte	12
	.byte	13
	.byte	20
	.byte	21
	.byte	14
	.byte	15
	.byte	22
	.byte	23
	.byte	28
	.byte	29
	.byte	36
	.byte	37
	.byte	30
	.byte	31
	.byte	38
	.byte	39
	.byte	9
	.byte	10
	.byte	17
	.byte	18
	.byte	33
	.byte	34
	.byte	41
	.byte	42
	.align	2
	.type	dequant4_coeff_init, @object
	.size	dequant4_coeff_init, 18
dequant4_coeff_init:
	.byte	10
	.byte	13
	.byte	16
	.byte	11
	.byte	14
	.byte	18
	.byte	13
	.byte	16
	.byte	20
	.byte	14
	.byte	18
	.byte	23
	.byte	16
	.byte	20
	.byte	25
	.byte	18
	.byte	23
	.byte	29
	.align	2
	.type	dequant8_coeff_init_scan, @object
	.size	dequant8_coeff_init_scan, 16
dequant8_coeff_init_scan:
	.byte	0
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	1
	.byte	5
	.byte	1
	.byte	4
	.byte	5
	.byte	2
	.byte	5
	.byte	3
	.byte	1
	.byte	5
	.byte	1
	.align	2
	.type	dequant8_coeff_init, @object
	.size	dequant8_coeff_init, 36
dequant8_coeff_init:
	.byte	20
	.byte	18
	.byte	32
	.byte	19
	.byte	25
	.byte	24
	.byte	22
	.byte	19
	.byte	35
	.byte	21
	.byte	28
	.byte	26
	.byte	26
	.byte	23
	.byte	42
	.byte	24
	.byte	33
	.byte	31
	.byte	28
	.byte	25
	.byte	45
	.byte	26
	.byte	35
	.byte	33
	.byte	32
	.byte	28
	.byte	51
	.byte	30
	.byte	40
	.byte	38
	.byte	36
	.byte	32
	.byte	58
	.byte	34
	.byte	46
	.byte	43
	.align	2
	.type	golomb_to_pict_type, @object
	.size	golomb_to_pict_type, 5
golomb_to_pict_type:
	.byte	2
	.byte	3
	.byte	1
	.byte	6
	.byte	5
	.align	2
	.type	svq3_pred_0, @object
	.size	svq3_pred_0, 50
svq3_pred_0:
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	1
	.byte	1
	.byte	2
	.byte	0
	.byte	3
	.byte	0
	.byte	2
	.byte	1
	.byte	1
	.byte	2
	.byte	0
	.byte	3
	.byte	0
	.byte	4
	.byte	1
	.byte	3
	.byte	2
	.byte	2
	.byte	3
	.byte	1
	.byte	4
	.byte	0
	.byte	4
	.byte	1
	.byte	3
	.byte	2
	.byte	2
	.byte	3
	.byte	1
	.byte	4
	.byte	2
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	2
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.align	2
	.type	svq3_pred_1, @object
	.size	svq3_pred_1, 180
svq3_pred_1:
	.byte	2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	1
	.byte	2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	1
	.byte	2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	1
	.byte	2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	1
	.byte	4
	.byte	3
	.byte	0
	.byte	1
	.byte	2
	.byte	4
	.byte	3
	.byte	0
	.byte	2
	.byte	1
	.byte	4
	.byte	3
	.byte	2
	.byte	0
	.byte	1
	.byte	3
	.byte	4
	.byte	0
	.byte	4
	.byte	2
	.byte	1
	.byte	3
	.byte	2
	.byte	0
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	1
	.byte	0
	.byte	4
	.byte	3
	.byte	1
	.byte	2
	.byte	4
	.byte	0
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	4
	.byte	3
	.byte	0
	.byte	1
	.byte	2
	.byte	4
	.byte	0
	.byte	3
	.byte	2
	.byte	0
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	2
	.byte	0
	.byte	1
	.byte	4
	.byte	3
	.byte	1
	.byte	2
	.byte	0
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	3
	.byte	4
	.byte	0
	.byte	2
	.byte	4
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	1
	.byte	3
	.byte	4
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	4
	.byte	2
	.byte	0
	.byte	1
	.byte	3
	.byte	4
	.byte	2
	.byte	1
	.byte	3
	.byte	0
	.byte	4
	.byte	2
	.byte	0
	.byte	4
	.byte	3
	.byte	1
	.byte	0
	.byte	2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	2
	.byte	4
	.byte	1
	.byte	3
	.byte	1
	.byte	4
	.byte	2
	.byte	0
	.byte	3
	.byte	4
	.byte	2
	.byte	0
	.byte	1
	.byte	3
	.byte	2
	.byte	0
	.byte	1
	.byte	4
	.byte	3
	.byte	4
	.byte	2
	.byte	1
	.byte	0
	.byte	3
	.align	2
	.type	i_mb_type_info, @object
	.size	i_mb_type_info, 104
i_mb_type_info:
	.half	1
	.byte	-1
	.byte	-1
	.half	2
	.byte	2
	.byte	0
	.half	2
	.byte	1
	.byte	0
	.half	2
	.byte	0
	.byte	0
	.half	2
	.byte	3
	.byte	0
	.half	2
	.byte	2
	.byte	16
	.half	2
	.byte	1
	.byte	16
	.half	2
	.byte	0
	.byte	16
	.half	2
	.byte	3
	.byte	16
	.half	2
	.byte	2
	.byte	32
	.half	2
	.byte	1
	.byte	32
	.half	2
	.byte	0
	.byte	32
	.half	2
	.byte	3
	.byte	32
	.half	2
	.byte	2
	.byte	15
	.half	2
	.byte	1
	.byte	15
	.half	2
	.byte	0
	.byte	15
	.half	2
	.byte	3
	.byte	15
	.half	2
	.byte	2
	.byte	31
	.half	2
	.byte	1
	.byte	31
	.half	2
	.byte	0
	.byte	31
	.half	2
	.byte	3
	.byte	31
	.half	2
	.byte	2
	.byte	47
	.half	2
	.byte	1
	.byte	47
	.half	2
	.byte	0
	.byte	47
	.half	2
	.byte	3
	.byte	47
	.half	4
	.byte	-1
	.byte	-1
	.align	2
	.type	golomb_to_intra4x4_cbp, @object
	.size	golomb_to_intra4x4_cbp, 48
golomb_to_intra4x4_cbp:
	.byte	47
	.byte	31
	.byte	15
	.byte	0
	.byte	23
	.byte	27
	.byte	29
	.byte	30
	.byte	7
	.byte	11
	.byte	13
	.byte	14
	.byte	39
	.byte	43
	.byte	45
	.byte	46
	.byte	16
	.byte	3
	.byte	5
	.byte	10
	.byte	12
	.byte	19
	.byte	21
	.byte	26
	.byte	28
	.byte	35
	.byte	37
	.byte	42
	.byte	44
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	6
	.byte	9
	.byte	22
	.byte	25
	.byte	32
	.byte	33
	.byte	34
	.byte	36
	.byte	40
	.byte	38
	.byte	41
	.align	2
	.type	golomb_to_inter_cbp, @object
	.size	golomb_to_inter_cbp, 48
golomb_to_inter_cbp:
	.byte	0
	.byte	16
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	32
	.byte	3
	.byte	5
	.byte	10
	.byte	12
	.byte	15
	.byte	47
	.byte	7
	.byte	11
	.byte	13
	.byte	14
	.byte	6
	.byte	9
	.byte	31
	.byte	35
	.byte	37
	.byte	42
	.byte	44
	.byte	33
	.byte	34
	.byte	36
	.byte	40
	.byte	39
	.byte	43
	.byte	45
	.byte	46
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	19
	.byte	21
	.byte	26
	.byte	28
	.byte	23
	.byte	27
	.byte	29
	.byte	30
	.byte	22
	.byte	25
	.byte	38
	.byte	41
	.align	2
	.type	left.8875, @object
	.size	left.8875, 12
left.8875:
	.byte	0
	.byte	-1
	.byte	10
	.byte	0
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.byte	-1
	.byte	11
	.space	2
	.align	2
	.type	top.8874, @object
	.size	top.8874, 12
top.8874:
	.byte	-1
	.byte	0
	.byte	9
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	0
	.space	3
	.align	2
	.type	svq3_dct_tables, @object
	.size	svq3_dct_tables, 64
svq3_dct_tables:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	0
	.byte	2
	.byte	3
	.byte	1
	.byte	4
	.byte	1
	.byte	5
	.byte	1
	.byte	0
	.byte	3
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	6
	.byte	1
	.byte	7
	.byte	1
	.byte	8
	.byte	1
	.byte	9
	.byte	1
	.byte	0
	.byte	4
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	2
	.byte	2
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	4
	.byte	0
	.byte	5
	.byte	3
	.byte	1
	.byte	4
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	3
	.byte	0
	.byte	6
	.byte	0
	.byte	7
	.byte	0
	.byte	8
	.byte	0
	.byte	9
	.section	.data.rel.ro.local,"aw",@progbits
	.align	2
	.type	scan_patterns.17734, @object
	.size	scan_patterns.17734, 16
scan_patterns.17734:
	.word	luma_dc_zigzag_scan
	.word	zigzag_scan
	.word	svq3_scan
	.word	chroma_dc_scan
	.rdata
	.align	2
	.type	luma_dc_zigzag_scan, @object
	.size	luma_dc_zigzag_scan, 16
luma_dc_zigzag_scan:
	.byte	0
	.byte	16
	.byte	32
	.byte	-128
	.byte	48
	.byte	64
	.byte	80
	.byte	96
	.byte	-112
	.byte	-96
	.byte	-80
	.byte	-64
	.byte	112
	.byte	-48
	.byte	-32
	.byte	-16
	.align	2
	.type	zigzag_scan, @object
	.size	zigzag_scan, 16
zigzag_scan:
	.byte	0
	.byte	1
	.byte	4
	.byte	8
	.byte	5
	.byte	2
	.byte	3
	.byte	6
	.byte	9
	.byte	12
	.byte	13
	.byte	10
	.byte	7
	.byte	11
	.byte	14
	.byte	15
	.align	2
	.type	chroma_dc_scan, @object
	.size	chroma_dc_scan, 4
chroma_dc_scan:
	.byte	0
	.byte	16
	.byte	32
	.byte	48
	.align	2
	.type	left.8912, @object
	.size	left.8912, 7
left.8912:
	.byte	5
	.byte	-1
	.byte	2
	.byte	-1
	.byte	6
	.space	2
	.align	2
	.type	top.8911, @object
	.size	top.8911, 7
top.8911:
	.byte	4
	.byte	1
	.byte	-1
	.byte	-1
	.space	3
	.align	2
	.type	chroma_qp, @object
	.size	chroma_qp, 52
chroma_qp:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	34
	.byte	34
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	37
	.byte	37
	.byte	37
	.byte	38
	.byte	38
	.byte	38
	.byte	39
	.byte	39
	.byte	39
	.byte	39
	.align	2
	.type	y_offset.10108, @object
	.size	y_offset.10108, 16
y_offset.10108:
	.word	0
	.word	32
	.word	128
	.word	160
	.align	2
	.type	x_offset.10107, @object
	.size	x_offset.10107, 16
x_offset.10107:
	.word	0
	.word	16
	.word	64
	.word	80
	.align	2
	.type	svq3_dequant_coeff, @object
	.size	svq3_dequant_coeff, 128
svq3_dequant_coeff:
	.word	3881
	.word	4351
	.word	4890
	.word	5481
	.word	6154
	.word	6914
	.word	7761
	.word	8718
	.word	9781
	.word	10987
	.word	12339
	.word	13828
	.word	15523
	.word	17435
	.word	19561
	.word	21873
	.word	24552
	.word	27656
	.word	30847
	.word	34870
	.word	38807
	.word	43747
	.word	49103
	.word	54683
	.word	61694
	.word	68745
	.word	77615
	.word	89113
	.word	100253
	.word	109366
	.word	126635
	.word	141533
	.align	2
	.type	y_offset.17473, @object
	.size	y_offset.17473, 16
y_offset.17473:
	.word	0
	.word	32
	.word	128
	.word	160
	.align	2
	.type	x_offset.17472, @object
	.size	x_offset.17472, 16
x_offset.17472:
	.word	0
	.word	16
	.word	64
	.word	80
	.align	2
	.type	nnz_idx.16229, @object
	.size	nnz_idx.16229, 16
nnz_idx.16229:
	.word	4
	.word	5
	.word	6
	.word	3
	.align	2
	.type	ref2frm.16201, @object
	.size	ref2frm.16201, 136
ref2frm.16201:
	.word	-1
	.word	-1
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.align	2
	.type	alpha_table, @object
	.size	alpha_table, 156
alpha_table:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	12
	.byte	13
	.byte	15
	.byte	17
	.byte	20
	.byte	22
	.byte	25
	.byte	28
	.byte	32
	.byte	36
	.byte	40
	.byte	45
	.byte	50
	.byte	56
	.byte	63
	.byte	71
	.byte	80
	.byte	90
	.byte	101
	.byte	113
	.byte	127
	.byte	-112
	.byte	-94
	.byte	-74
	.byte	-53
	.byte	-30
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.align	2
	.type	beta_table, @object
	.size	beta_table, 156
beta_table:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	11
	.byte	11
	.byte	12
	.byte	12
	.byte	13
	.byte	13
	.byte	14
	.byte	14
	.byte	15
	.byte	15
	.byte	16
	.byte	16
	.byte	17
	.byte	17
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.byte	18
	.align	2
	.type	tc0_table, @object
	.size	tc0_table, 468
tc0_table:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	2
	.byte	3
	.byte	1
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	2
	.byte	4
	.byte	2
	.byte	3
	.byte	4
	.byte	2
	.byte	3
	.byte	4
	.byte	3
	.byte	3
	.byte	5
	.byte	3
	.byte	4
	.byte	6
	.byte	3
	.byte	4
	.byte	6
	.byte	4
	.byte	5
	.byte	7
	.byte	4
	.byte	5
	.byte	8
	.byte	4
	.byte	6
	.byte	9
	.byte	5
	.byte	7
	.byte	10
	.byte	6
	.byte	8
	.byte	11
	.byte	6
	.byte	8
	.byte	13
	.byte	7
	.byte	10
	.byte	14
	.byte	8
	.byte	11
	.byte	16
	.byte	9
	.byte	12
	.byte	18
	.byte	10
	.byte	13
	.byte	20
	.byte	11
	.byte	15
	.byte	23
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.byte	13
	.byte	17
	.byte	25
	.align	2
	.type	C.669.16108, @object
	.size	C.669.16108, 8
C.669.16108:
	.half	3
	.half	3
	.half	3
	.half	3
	.align	2
	.type	C.668.16107, @object
	.size	C.668.16107, 8
C.668.16107:
	.half	4
	.half	4
	.half	4
	.half	4
	.align	2
	.type	slice_type_map.12934, @object
	.size	slice_type_map.12934, 5
slice_type_map.12934:
	.byte	2
	.byte	3
	.byte	1
	.byte	6
	.byte	5
	.align	2
	.type	field_scan, @object
	.size	field_scan, 16
field_scan:
	.byte	0
	.byte	4
	.byte	1
	.byte	8
	.byte	12
	.byte	5
	.byte	9
	.byte	13
	.byte	2
	.byte	6
	.byte	10
	.byte	14
	.byte	3
	.byte	7
	.byte	11
	.byte	15
	.align	2
	.type	zigzag_scan8x8, @object
	.size	zigzag_scan8x8, 64
zigzag_scan8x8:
	.byte	0
	.byte	1
	.byte	8
	.byte	16
	.byte	9
	.byte	2
	.byte	3
	.byte	10
	.byte	17
	.byte	24
	.byte	32
	.byte	25
	.byte	18
	.byte	11
	.byte	4
	.byte	5
	.byte	12
	.byte	19
	.byte	26
	.byte	33
	.byte	40
	.byte	48
	.byte	41
	.byte	34
	.byte	27
	.byte	20
	.byte	13
	.byte	6
	.byte	7
	.byte	14
	.byte	21
	.byte	28
	.byte	35
	.byte	42
	.byte	49
	.byte	56
	.byte	57
	.byte	50
	.byte	43
	.byte	36
	.byte	29
	.byte	22
	.byte	15
	.byte	23
	.byte	30
	.byte	37
	.byte	44
	.byte	51
	.byte	58
	.byte	59
	.byte	52
	.byte	45
	.byte	38
	.byte	31
	.byte	39
	.byte	46
	.byte	53
	.byte	60
	.byte	61
	.byte	54
	.byte	47
	.byte	55
	.byte	62
	.byte	63
	.align	2
	.type	zigzag_scan8x8_cavlc, @object
	.size	zigzag_scan8x8_cavlc, 64
zigzag_scan8x8_cavlc:
	.byte	0
	.byte	9
	.byte	17
	.byte	18
	.byte	12
	.byte	40
	.byte	27
	.byte	7
	.byte	35
	.byte	57
	.byte	29
	.byte	30
	.byte	58
	.byte	38
	.byte	53
	.byte	47
	.byte	1
	.byte	2
	.byte	24
	.byte	11
	.byte	19
	.byte	48
	.byte	20
	.byte	14
	.byte	42
	.byte	50
	.byte	22
	.byte	37
	.byte	59
	.byte	31
	.byte	60
	.byte	55
	.byte	8
	.byte	3
	.byte	32
	.byte	4
	.byte	26
	.byte	41
	.byte	13
	.byte	21
	.byte	49
	.byte	43
	.byte	15
	.byte	44
	.byte	52
	.byte	39
	.byte	61
	.byte	62
	.byte	16
	.byte	10
	.byte	25
	.byte	5
	.byte	33
	.byte	34
	.byte	6
	.byte	28
	.byte	56
	.byte	36
	.byte	23
	.byte	51
	.byte	45
	.byte	46
	.byte	54
	.byte	63
	.align	2
	.type	field_scan8x8, @object
	.size	field_scan8x8, 64
field_scan8x8:
	.byte	0
	.byte	8
	.byte	16
	.byte	1
	.byte	9
	.byte	24
	.byte	32
	.byte	17
	.byte	2
	.byte	25
	.byte	40
	.byte	48
	.byte	56
	.byte	33
	.byte	10
	.byte	3
	.byte	18
	.byte	41
	.byte	49
	.byte	57
	.byte	26
	.byte	11
	.byte	4
	.byte	19
	.byte	34
	.byte	42
	.byte	50
	.byte	58
	.byte	27
	.byte	12
	.byte	5
	.byte	20
	.byte	35
	.byte	43
	.byte	51
	.byte	59
	.byte	28
	.byte	13
	.byte	6
	.byte	21
	.byte	36
	.byte	44
	.byte	52
	.byte	60
	.byte	29
	.byte	14
	.byte	22
	.byte	37
	.byte	45
	.byte	53
	.byte	61
	.byte	30
	.byte	7
	.byte	15
	.byte	38
	.byte	46
	.byte	54
	.byte	62
	.byte	23
	.byte	31
	.byte	39
	.byte	47
	.byte	55
	.byte	63
	.align	2
	.type	field_scan8x8_cavlc, @object
	.size	field_scan8x8_cavlc, 64
field_scan8x8_cavlc:
	.byte	0
	.byte	9
	.byte	2
	.byte	56
	.byte	18
	.byte	26
	.byte	34
	.byte	27
	.byte	35
	.byte	28
	.byte	36
	.byte	29
	.byte	45
	.byte	7
	.byte	54
	.byte	39
	.byte	8
	.byte	24
	.byte	25
	.byte	33
	.byte	41
	.byte	11
	.byte	42
	.byte	12
	.byte	43
	.byte	13
	.byte	44
	.byte	14
	.byte	53
	.byte	15
	.byte	62
	.byte	47
	.byte	16
	.byte	32
	.byte	40
	.byte	10
	.byte	49
	.byte	4
	.byte	50
	.byte	5
	.byte	51
	.byte	6
	.byte	52
	.byte	22
	.byte	61
	.byte	38
	.byte	23
	.byte	55
	.byte	1
	.byte	17
	.byte	48
	.byte	3
	.byte	57
	.byte	19
	.byte	58
	.byte	20
	.byte	59
	.byte	21
	.byte	60
	.byte	37
	.byte	30
	.byte	46
	.byte	31
	.byte	63
	.align	2
	.type	default_scaling4, @object
	.size	default_scaling4, 32
default_scaling4:
	.byte	6
	.byte	13
	.byte	20
	.byte	28
	.byte	13
	.byte	20
	.byte	28
	.byte	32
	.byte	20
	.byte	28
	.byte	32
	.byte	37
	.byte	28
	.byte	32
	.byte	37
	.byte	42
	.byte	10
	.byte	14
	.byte	20
	.byte	24
	.byte	14
	.byte	20
	.byte	24
	.byte	27
	.byte	20
	.byte	24
	.byte	27
	.byte	30
	.byte	24
	.byte	27
	.byte	30
	.byte	34
	.align	2
	.type	default_scaling8, @object
	.size	default_scaling8, 128
default_scaling8:
	.byte	6
	.byte	10
	.byte	13
	.byte	16
	.byte	18
	.byte	23
	.byte	25
	.byte	27
	.byte	10
	.byte	11
	.byte	16
	.byte	18
	.byte	23
	.byte	25
	.byte	27
	.byte	29
	.byte	13
	.byte	16
	.byte	18
	.byte	23
	.byte	25
	.byte	27
	.byte	29
	.byte	31
	.byte	16
	.byte	18
	.byte	23
	.byte	25
	.byte	27
	.byte	29
	.byte	31
	.byte	33
	.byte	18
	.byte	23
	.byte	25
	.byte	27
	.byte	29
	.byte	31
	.byte	33
	.byte	36
	.byte	23
	.byte	25
	.byte	27
	.byte	29
	.byte	31
	.byte	33
	.byte	36
	.byte	38
	.byte	25
	.byte	27
	.byte	29
	.byte	31
	.byte	33
	.byte	36
	.byte	38
	.byte	40
	.byte	27
	.byte	29
	.byte	31
	.byte	33
	.byte	36
	.byte	38
	.byte	40
	.byte	42
	.byte	9
	.byte	13
	.byte	15
	.byte	17
	.byte	19
	.byte	21
	.byte	22
	.byte	24
	.byte	13
	.byte	13
	.byte	17
	.byte	19
	.byte	21
	.byte	22
	.byte	24
	.byte	25
	.byte	15
	.byte	17
	.byte	19
	.byte	21
	.byte	22
	.byte	24
	.byte	25
	.byte	27
	.byte	17
	.byte	19
	.byte	21
	.byte	22
	.byte	24
	.byte	25
	.byte	27
	.byte	28
	.byte	19
	.byte	21
	.byte	22
	.byte	24
	.byte	25
	.byte	27
	.byte	28
	.byte	30
	.byte	21
	.byte	22
	.byte	24
	.byte	25
	.byte	27
	.byte	28
	.byte	30
	.byte	32
	.byte	22
	.byte	24
	.byte	25
	.byte	27
	.byte	28
	.byte	30
	.byte	32
	.byte	33
	.byte	24
	.byte	25
	.byte	27
	.byte	28
	.byte	30
	.byte	32
	.byte	33
	.byte	35
	.align	2
	.type	pixel_aspect, @object
	.size	pixel_aspect, 112
pixel_aspect:
	.word	0
	.word	1
	.word	1
	.word	1
	.word	12
	.word	11
	.word	10
	.word	11
	.word	16
	.word	11
	.word	40
	.word	33
	.word	24
	.word	11
	.word	20
	.word	11
	.word	32
	.word	11
	.word	80
	.word	33
	.word	18
	.word	11
	.word	15
	.word	11
	.word	64
	.word	33
	.word	160
	.word	99
	.align	2
	.type	cabac_context_init_I, @object
	.size	cabac_context_init_I, 920
cabac_context_init_I:
	.byte	20
	.byte	-15
	.byte	2
	.byte	54
	.byte	3
	.byte	74
	.byte	20
	.byte	-15
	.byte	2
	.byte	54
	.byte	3
	.byte	74
	.byte	-28
	.byte	127
	.byte	-23
	.byte	104
	.byte	-6
	.byte	53
	.byte	-1
	.byte	54
	.byte	7
	.byte	51
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	41
	.byte	0
	.byte	63
	.byte	0
	.byte	63
	.byte	0
	.byte	63
	.byte	-9
	.byte	83
	.byte	4
	.byte	86
	.byte	0
	.byte	97
	.byte	-7
	.byte	72
	.byte	13
	.byte	41
	.byte	3
	.byte	62
	.byte	0
	.byte	11
	.byte	1
	.byte	55
	.byte	0
	.byte	69
	.byte	-17
	.byte	127
	.byte	-13
	.byte	102
	.byte	0
	.byte	82
	.byte	-7
	.byte	74
	.byte	-21
	.byte	107
	.byte	-27
	.byte	127
	.byte	-31
	.byte	127
	.byte	-24
	.byte	127
	.byte	-18
	.byte	95
	.byte	-27
	.byte	127
	.byte	-21
	.byte	114
	.byte	-30
	.byte	127
	.byte	-17
	.byte	123
	.byte	-12
	.byte	115
	.byte	-16
	.byte	122
	.byte	-11
	.byte	115
	.byte	-12
	.byte	63
	.byte	-2
	.byte	68
	.byte	-15
	.byte	84
	.byte	-13
	.byte	104
	.byte	-3
	.byte	70
	.byte	-8
	.byte	93
	.byte	-10
	.byte	90
	.byte	-30
	.byte	127
	.byte	-1
	.byte	74
	.byte	-6
	.byte	97
	.byte	-7
	.byte	91
	.byte	-20
	.byte	127
	.byte	-4
	.byte	56
	.byte	-5
	.byte	82
	.byte	-7
	.byte	76
	.byte	-22
	.byte	125
	.byte	-7
	.byte	93
	.byte	-11
	.byte	87
	.byte	-3
	.byte	77
	.byte	-5
	.byte	71
	.byte	-4
	.byte	63
	.byte	-4
	.byte	68
	.byte	-12
	.byte	84
	.byte	-7
	.byte	62
	.byte	-7
	.byte	65
	.byte	8
	.byte	61
	.byte	5
	.byte	56
	.byte	-2
	.byte	66
	.byte	1
	.byte	64
	.byte	0
	.byte	61
	.byte	-2
	.byte	78
	.byte	1
	.byte	50
	.byte	7
	.byte	52
	.byte	10
	.byte	35
	.byte	0
	.byte	44
	.byte	11
	.byte	38
	.byte	1
	.byte	45
	.byte	0
	.byte	46
	.byte	5
	.byte	44
	.byte	31
	.byte	17
	.byte	1
	.byte	51
	.byte	7
	.byte	50
	.byte	28
	.byte	19
	.byte	16
	.byte	33
	.byte	14
	.byte	62
	.byte	-13
	.byte	108
	.byte	-15
	.byte	100
	.byte	-13
	.byte	101
	.byte	-13
	.byte	91
	.byte	-12
	.byte	94
	.byte	-10
	.byte	88
	.byte	-16
	.byte	84
	.byte	-10
	.byte	86
	.byte	-7
	.byte	83
	.byte	-13
	.byte	87
	.byte	-19
	.byte	94
	.byte	1
	.byte	70
	.byte	0
	.byte	72
	.byte	-5
	.byte	74
	.byte	18
	.byte	59
	.byte	-8
	.byte	102
	.byte	-15
	.byte	100
	.byte	0
	.byte	95
	.byte	-4
	.byte	75
	.byte	2
	.byte	72
	.byte	-11
	.byte	75
	.byte	-3
	.byte	71
	.byte	15
	.byte	46
	.byte	-13
	.byte	69
	.byte	0
	.byte	62
	.byte	0
	.byte	65
	.byte	21
	.byte	37
	.byte	-15
	.byte	72
	.byte	9
	.byte	57
	.byte	16
	.byte	54
	.byte	0
	.byte	62
	.byte	12
	.byte	72
	.byte	24
	.byte	0
	.byte	15
	.byte	9
	.byte	8
	.byte	25
	.byte	13
	.byte	18
	.byte	15
	.byte	9
	.byte	13
	.byte	19
	.byte	10
	.byte	37
	.byte	12
	.byte	18
	.byte	6
	.byte	29
	.byte	20
	.byte	33
	.byte	15
	.byte	30
	.byte	4
	.byte	45
	.byte	1
	.byte	58
	.byte	0
	.byte	62
	.byte	7
	.byte	61
	.byte	12
	.byte	38
	.byte	11
	.byte	45
	.byte	15
	.byte	39
	.byte	11
	.byte	42
	.byte	13
	.byte	44
	.byte	16
	.byte	45
	.byte	12
	.byte	41
	.byte	10
	.byte	49
	.byte	30
	.byte	34
	.byte	18
	.byte	42
	.byte	10
	.byte	55
	.byte	17
	.byte	51
	.byte	17
	.byte	46
	.byte	0
	.byte	89
	.byte	26
	.byte	-19
	.byte	22
	.byte	-17
	.byte	26
	.byte	-17
	.byte	30
	.byte	-25
	.byte	28
	.byte	-20
	.byte	33
	.byte	-23
	.byte	37
	.byte	-27
	.byte	33
	.byte	-23
	.byte	40
	.byte	-28
	.byte	38
	.byte	-17
	.byte	33
	.byte	-11
	.byte	40
	.byte	-15
	.byte	41
	.byte	-6
	.byte	38
	.byte	1
	.byte	41
	.byte	17
	.byte	30
	.byte	-6
	.byte	27
	.byte	3
	.byte	26
	.byte	22
	.byte	37
	.byte	-16
	.byte	35
	.byte	-4
	.byte	38
	.byte	-8
	.byte	38
	.byte	-3
	.byte	37
	.byte	3
	.byte	38
	.byte	5
	.byte	42
	.byte	0
	.byte	35
	.byte	16
	.byte	39
	.byte	22
	.byte	14
	.byte	48
	.byte	27
	.byte	37
	.byte	21
	.byte	60
	.byte	12
	.byte	68
	.byte	2
	.byte	97
	.byte	-3
	.byte	71
	.byte	-6
	.byte	42
	.byte	-5
	.byte	50
	.byte	-3
	.byte	54
	.byte	-2
	.byte	62
	.byte	0
	.byte	58
	.byte	1
	.byte	63
	.byte	-2
	.byte	72
	.byte	-1
	.byte	74
	.byte	-9
	.byte	91
	.byte	-5
	.byte	67
	.byte	-5
	.byte	27
	.byte	-3
	.byte	39
	.byte	-2
	.byte	44
	.byte	0
	.byte	46
	.byte	-16
	.byte	64
	.byte	-8
	.byte	68
	.byte	-10
	.byte	78
	.byte	-6
	.byte	77
	.byte	-10
	.byte	86
	.byte	-12
	.byte	92
	.byte	-15
	.byte	55
	.byte	-10
	.byte	60
	.byte	-6
	.byte	62
	.byte	-4
	.byte	65
	.byte	-12
	.byte	73
	.byte	-8
	.byte	76
	.byte	-7
	.byte	80
	.byte	-9
	.byte	88
	.byte	-17
	.byte	110
	.byte	-11
	.byte	97
	.byte	-20
	.byte	84
	.byte	-11
	.byte	79
	.byte	-6
	.byte	73
	.byte	-4
	.byte	74
	.byte	-13
	.byte	86
	.byte	-13
	.byte	96
	.byte	-11
	.byte	97
	.byte	-19
	.byte	117
	.byte	-8
	.byte	78
	.byte	-5
	.byte	33
	.byte	-4
	.byte	48
	.byte	-2
	.byte	53
	.byte	-3
	.byte	62
	.byte	-13
	.byte	71
	.byte	-10
	.byte	79
	.byte	-12
	.byte	86
	.byte	-13
	.byte	90
	.byte	-14
	.byte	97
	.byte	0
	.byte	0
	.byte	-6
	.byte	93
	.byte	-6
	.byte	84
	.byte	-8
	.byte	79
	.byte	0
	.byte	66
	.byte	-1
	.byte	71
	.byte	0
	.byte	62
	.byte	-2
	.byte	60
	.byte	-2
	.byte	59
	.byte	-5
	.byte	75
	.byte	-3
	.byte	62
	.byte	-4
	.byte	58
	.byte	-9
	.byte	66
	.byte	-1
	.byte	79
	.byte	0
	.byte	71
	.byte	3
	.byte	68
	.byte	10
	.byte	44
	.byte	-7
	.byte	62
	.byte	15
	.byte	36
	.byte	14
	.byte	40
	.byte	16
	.byte	27
	.byte	12
	.byte	29
	.byte	1
	.byte	44
	.byte	20
	.byte	36
	.byte	18
	.byte	32
	.byte	5
	.byte	42
	.byte	1
	.byte	48
	.byte	10
	.byte	62
	.byte	17
	.byte	46
	.byte	9
	.byte	64
	.byte	-12
	.byte	104
	.byte	-11
	.byte	97
	.byte	-16
	.byte	96
	.byte	-7
	.byte	88
	.byte	-8
	.byte	85
	.byte	-7
	.byte	85
	.byte	-9
	.byte	85
	.byte	-13
	.byte	88
	.byte	4
	.byte	66
	.byte	-3
	.byte	77
	.byte	-3
	.byte	76
	.byte	-6
	.byte	76
	.byte	10
	.byte	58
	.byte	-1
	.byte	76
	.byte	-1
	.byte	83
	.byte	-7
	.byte	99
	.byte	-14
	.byte	95
	.byte	2
	.byte	95
	.byte	0
	.byte	76
	.byte	-5
	.byte	74
	.byte	0
	.byte	70
	.byte	-11
	.byte	75
	.byte	1
	.byte	68
	.byte	0
	.byte	65
	.byte	-14
	.byte	73
	.byte	3
	.byte	62
	.byte	4
	.byte	62
	.byte	-1
	.byte	68
	.byte	-13
	.byte	75
	.byte	11
	.byte	55
	.byte	5
	.byte	64
	.byte	12
	.byte	70
	.byte	15
	.byte	6
	.byte	6
	.byte	19
	.byte	7
	.byte	16
	.byte	12
	.byte	14
	.byte	18
	.byte	13
	.byte	13
	.byte	11
	.byte	13
	.byte	15
	.byte	15
	.byte	16
	.byte	12
	.byte	23
	.byte	13
	.byte	23
	.byte	15
	.byte	20
	.byte	14
	.byte	26
	.byte	14
	.byte	44
	.byte	17
	.byte	40
	.byte	17
	.byte	47
	.byte	24
	.byte	17
	.byte	21
	.byte	21
	.byte	25
	.byte	22
	.byte	31
	.byte	27
	.byte	22
	.byte	29
	.byte	19
	.byte	35
	.byte	14
	.byte	50
	.byte	10
	.byte	57
	.byte	7
	.byte	63
	.byte	-2
	.byte	77
	.byte	-4
	.byte	82
	.byte	-3
	.byte	94
	.byte	9
	.byte	69
	.byte	-12
	.byte	109
	.byte	36
	.byte	-35
	.byte	36
	.byte	-34
	.byte	32
	.byte	-26
	.byte	37
	.byte	-30
	.byte	44
	.byte	-32
	.byte	34
	.byte	-18
	.byte	34
	.byte	-15
	.byte	40
	.byte	-15
	.byte	33
	.byte	-7
	.byte	35
	.byte	-5
	.byte	33
	.byte	0
	.byte	38
	.byte	2
	.byte	33
	.byte	13
	.byte	23
	.byte	35
	.byte	13
	.byte	58
	.byte	29
	.byte	-3
	.byte	26
	.byte	0
	.byte	22
	.byte	30
	.byte	31
	.byte	-7
	.byte	35
	.byte	-15
	.byte	34
	.byte	-3
	.byte	34
	.byte	3
	.byte	36
	.byte	-1
	.byte	34
	.byte	5
	.byte	32
	.byte	11
	.byte	35
	.byte	5
	.byte	34
	.byte	12
	.byte	39
	.byte	11
	.byte	30
	.byte	29
	.byte	34
	.byte	26
	.byte	29
	.byte	39
	.byte	19
	.byte	66
	.byte	31
	.byte	21
	.byte	31
	.byte	31
	.byte	25
	.byte	50
	.byte	-17
	.byte	120
	.byte	-20
	.byte	112
	.byte	-18
	.byte	114
	.byte	-11
	.byte	85
	.byte	-15
	.byte	92
	.byte	-14
	.byte	89
	.byte	-26
	.byte	71
	.byte	-15
	.byte	81
	.byte	-14
	.byte	80
	.byte	0
	.byte	68
	.byte	-14
	.byte	70
	.byte	-24
	.byte	56
	.byte	-23
	.byte	68
	.byte	-24
	.byte	50
	.byte	-11
	.byte	74
	.byte	23
	.byte	-13
	.byte	26
	.byte	-13
	.byte	40
	.byte	-15
	.byte	49
	.byte	-14
	.byte	44
	.byte	3
	.byte	45
	.byte	6
	.byte	44
	.byte	34
	.byte	33
	.byte	54
	.byte	19
	.byte	82
	.byte	-3
	.byte	75
	.byte	-1
	.byte	23
	.byte	1
	.byte	34
	.byte	1
	.byte	43
	.byte	0
	.byte	54
	.byte	-2
	.byte	55
	.byte	0
	.byte	61
	.byte	1
	.byte	64
	.byte	0
	.byte	68
	.byte	-9
	.byte	92
	.byte	-14
	.byte	106
	.byte	-13
	.byte	97
	.byte	-15
	.byte	90
	.byte	-12
	.byte	90
	.byte	-18
	.byte	88
	.byte	-10
	.byte	73
	.byte	-9
	.byte	79
	.byte	-14
	.byte	86
	.byte	-10
	.byte	73
	.byte	-10
	.byte	70
	.byte	-10
	.byte	69
	.byte	-5
	.byte	66
	.byte	-9
	.byte	64
	.byte	-5
	.byte	58
	.byte	2
	.byte	59
	.byte	21
	.byte	-10
	.byte	24
	.byte	-11
	.byte	28
	.byte	-8
	.byte	28
	.byte	-1
	.byte	29
	.byte	3
	.byte	29
	.byte	9
	.byte	35
	.byte	20
	.byte	29
	.byte	36
	.byte	14
	.byte	67
	.align	2
	.type	cabac_context_init_PB, @object
	.size	cabac_context_init_PB, 2760
cabac_context_init_PB:
	.byte	20
	.byte	-15
	.byte	2
	.byte	54
	.byte	3
	.byte	74
	.byte	20
	.byte	-15
	.byte	2
	.byte	54
	.byte	3
	.byte	74
	.byte	-28
	.byte	127
	.byte	-23
	.byte	104
	.byte	-6
	.byte	53
	.byte	-1
	.byte	54
	.byte	7
	.byte	51
	.byte	23
	.byte	33
	.byte	23
	.byte	2
	.byte	21
	.byte	0
	.byte	1
	.byte	9
	.byte	0
	.byte	49
	.byte	-37
	.byte	118
	.byte	5
	.byte	57
	.byte	-13
	.byte	78
	.byte	-11
	.byte	65
	.byte	1
	.byte	62
	.byte	12
	.byte	49
	.byte	-4
	.byte	73
	.byte	17
	.byte	50
	.byte	18
	.byte	64
	.byte	9
	.byte	43
	.byte	29
	.byte	0
	.byte	26
	.byte	67
	.byte	16
	.byte	90
	.byte	9
	.byte	104
	.byte	-46
	.byte	127
	.byte	-20
	.byte	104
	.byte	1
	.byte	67
	.byte	-13
	.byte	78
	.byte	-11
	.byte	65
	.byte	1
	.byte	62
	.byte	-6
	.byte	86
	.byte	-17
	.byte	95
	.byte	-6
	.byte	61
	.byte	9
	.byte	45
	.byte	-3
	.byte	69
	.byte	-6
	.byte	81
	.byte	-11
	.byte	96
	.byte	6
	.byte	55
	.byte	7
	.byte	67
	.byte	-5
	.byte	86
	.byte	2
	.byte	88
	.byte	0
	.byte	58
	.byte	-3
	.byte	76
	.byte	-10
	.byte	94
	.byte	5
	.byte	54
	.byte	4
	.byte	69
	.byte	-3
	.byte	81
	.byte	0
	.byte	88
	.byte	-7
	.byte	67
	.byte	-5
	.byte	74
	.byte	-4
	.byte	74
	.byte	-5
	.byte	80
	.byte	-7
	.byte	72
	.byte	1
	.byte	58
	.byte	0
	.byte	41
	.byte	0
	.byte	63
	.byte	0
	.byte	63
	.byte	0
	.byte	63
	.byte	-9
	.byte	83
	.byte	4
	.byte	86
	.byte	0
	.byte	97
	.byte	-7
	.byte	72
	.byte	13
	.byte	41
	.byte	3
	.byte	62
	.byte	0
	.byte	45
	.byte	-4
	.byte	78
	.byte	-3
	.byte	96
	.byte	-27
	.byte	126
	.byte	-28
	.byte	98
	.byte	-25
	.byte	101
	.byte	-23
	.byte	67
	.byte	-28
	.byte	82
	.byte	-20
	.byte	94
	.byte	-16
	.byte	83
	.byte	-22
	.byte	110
	.byte	-21
	.byte	91
	.byte	-18
	.byte	102
	.byte	-13
	.byte	93
	.byte	-29
	.byte	127
	.byte	-7
	.byte	92
	.byte	-5
	.byte	89
	.byte	-7
	.byte	96
	.byte	-13
	.byte	108
	.byte	-3
	.byte	46
	.byte	-1
	.byte	65
	.byte	-1
	.byte	57
	.byte	-9
	.byte	93
	.byte	-3
	.byte	74
	.byte	-9
	.byte	92
	.byte	-8
	.byte	87
	.byte	-23
	.byte	126
	.byte	5
	.byte	54
	.byte	6
	.byte	60
	.byte	6
	.byte	59
	.byte	6
	.byte	69
	.byte	-1
	.byte	48
	.byte	0
	.byte	68
	.byte	-4
	.byte	69
	.byte	-8
	.byte	88
	.byte	-2
	.byte	85
	.byte	-6
	.byte	78
	.byte	-1
	.byte	75
	.byte	-7
	.byte	77
	.byte	2
	.byte	54
	.byte	5
	.byte	50
	.byte	-3
	.byte	68
	.byte	1
	.byte	50
	.byte	6
	.byte	42
	.byte	-4
	.byte	81
	.byte	1
	.byte	63
	.byte	-4
	.byte	70
	.byte	0
	.byte	67
	.byte	2
	.byte	57
	.byte	-2
	.byte	76
	.byte	11
	.byte	35
	.byte	4
	.byte	64
	.byte	1
	.byte	61
	.byte	11
	.byte	35
	.byte	18
	.byte	25
	.byte	12
	.byte	24
	.byte	13
	.byte	29
	.byte	13
	.byte	36
	.byte	-10
	.byte	93
	.byte	-7
	.byte	73
	.byte	-2
	.byte	73
	.byte	13
	.byte	46
	.byte	9
	.byte	49
	.byte	-7
	.byte	100
	.byte	9
	.byte	53
	.byte	2
	.byte	53
	.byte	5
	.byte	53
	.byte	-2
	.byte	61
	.byte	0
	.byte	56
	.byte	0
	.byte	56
	.byte	-13
	.byte	63
	.byte	-5
	.byte	60
	.byte	-1
	.byte	62
	.byte	4
	.byte	57
	.byte	-6
	.byte	69
	.byte	4
	.byte	57
	.byte	14
	.byte	39
	.byte	4
	.byte	51
	.byte	13
	.byte	68
	.byte	3
	.byte	64
	.byte	1
	.byte	61
	.byte	9
	.byte	63
	.byte	7
	.byte	50
	.byte	16
	.byte	39
	.byte	5
	.byte	44
	.byte	4
	.byte	52
	.byte	11
	.byte	48
	.byte	-5
	.byte	60
	.byte	-1
	.byte	59
	.byte	0
	.byte	59
	.byte	22
	.byte	33
	.byte	5
	.byte	44
	.byte	14
	.byte	43
	.byte	-1
	.byte	78
	.byte	0
	.byte	60
	.byte	9
	.byte	69
	.byte	11
	.byte	28
	.byte	2
	.byte	40
	.byte	3
	.byte	44
	.byte	0
	.byte	49
	.byte	0
	.byte	46
	.byte	2
	.byte	44
	.byte	2
	.byte	51
	.byte	0
	.byte	47
	.byte	4
	.byte	39
	.byte	2
	.byte	62
	.byte	6
	.byte	46
	.byte	0
	.byte	54
	.byte	3
	.byte	54
	.byte	2
	.byte	58
	.byte	4
	.byte	63
	.byte	6
	.byte	51
	.byte	6
	.byte	57
	.byte	7
	.byte	53
	.byte	6
	.byte	52
	.byte	6
	.byte	55
	.byte	11
	.byte	45
	.byte	14
	.byte	36
	.byte	8
	.byte	53
	.byte	-1
	.byte	82
	.byte	7
	.byte	55
	.byte	-3
	.byte	78
	.byte	15
	.byte	46
	.byte	22
	.byte	31
	.byte	-1
	.byte	84
	.byte	25
	.byte	7
	.byte	30
	.byte	-7
	.byte	28
	.byte	3
	.byte	28
	.byte	4
	.byte	32
	.byte	0
	.byte	34
	.byte	-1
	.byte	30
	.byte	6
	.byte	30
	.byte	6
	.byte	32
	.byte	9
	.byte	31
	.byte	19
	.byte	26
	.byte	27
	.byte	26
	.byte	30
	.byte	37
	.byte	20
	.byte	28
	.byte	34
	.byte	17
	.byte	70
	.byte	1
	.byte	67
	.byte	5
	.byte	59
	.byte	9
	.byte	67
	.byte	16
	.byte	30
	.byte	18
	.byte	32
	.byte	18
	.byte	35
	.byte	22
	.byte	29
	.byte	24
	.byte	31
	.byte	23
	.byte	38
	.byte	18
	.byte	43
	.byte	20
	.byte	41
	.byte	11
	.byte	63
	.byte	9
	.byte	59
	.byte	9
	.byte	64
	.byte	-1
	.byte	94
	.byte	-2
	.byte	89
	.byte	-9
	.byte	108
	.byte	-6
	.byte	76
	.byte	-2
	.byte	44
	.byte	0
	.byte	45
	.byte	0
	.byte	52
	.byte	-3
	.byte	64
	.byte	-2
	.byte	59
	.byte	-4
	.byte	70
	.byte	-4
	.byte	75
	.byte	-8
	.byte	82
	.byte	-17
	.byte	102
	.byte	-9
	.byte	77
	.byte	3
	.byte	24
	.byte	0
	.byte	42
	.byte	0
	.byte	48
	.byte	0
	.byte	55
	.byte	-6
	.byte	59
	.byte	-7
	.byte	71
	.byte	-12
	.byte	83
	.byte	-11
	.byte	87
	.byte	-30
	.byte	119
	.byte	1
	.byte	58
	.byte	-3
	.byte	29
	.byte	-1
	.byte	36
	.byte	1
	.byte	38
	.byte	2
	.byte	43
	.byte	-6
	.byte	55
	.byte	0
	.byte	58
	.byte	0
	.byte	64
	.byte	-3
	.byte	74
	.byte	-10
	.byte	90
	.byte	0
	.byte	70
	.byte	-4
	.byte	29
	.byte	5
	.byte	31
	.byte	7
	.byte	42
	.byte	1
	.byte	59
	.byte	-2
	.byte	58
	.byte	-3
	.byte	72
	.byte	-3
	.byte	81
	.byte	-11
	.byte	97
	.byte	0
	.byte	58
	.byte	8
	.byte	5
	.byte	10
	.byte	14
	.byte	14
	.byte	18
	.byte	13
	.byte	27
	.byte	2
	.byte	40
	.byte	0
	.byte	58
	.byte	-3
	.byte	70
	.byte	-6
	.byte	79
	.byte	-8
	.byte	85
	.byte	0
	.byte	0
	.byte	-13
	.byte	106
	.byte	-16
	.byte	106
	.byte	-10
	.byte	87
	.byte	-21
	.byte	114
	.byte	-18
	.byte	110
	.byte	-14
	.byte	98
	.byte	-22
	.byte	110
	.byte	-21
	.byte	106
	.byte	-18
	.byte	103
	.byte	-21
	.byte	107
	.byte	-23
	.byte	108
	.byte	-26
	.byte	112
	.byte	-10
	.byte	96
	.byte	-12
	.byte	95
	.byte	-5
	.byte	91
	.byte	-9
	.byte	93
	.byte	-22
	.byte	94
	.byte	-5
	.byte	86
	.byte	9
	.byte	67
	.byte	-4
	.byte	80
	.byte	-10
	.byte	85
	.byte	-1
	.byte	70
	.byte	7
	.byte	60
	.byte	9
	.byte	58
	.byte	5
	.byte	61
	.byte	12
	.byte	50
	.byte	15
	.byte	50
	.byte	18
	.byte	49
	.byte	17
	.byte	54
	.byte	10
	.byte	41
	.byte	7
	.byte	46
	.byte	-1
	.byte	51
	.byte	7
	.byte	49
	.byte	8
	.byte	52
	.byte	9
	.byte	41
	.byte	6
	.byte	47
	.byte	2
	.byte	55
	.byte	13
	.byte	41
	.byte	10
	.byte	44
	.byte	6
	.byte	50
	.byte	5
	.byte	53
	.byte	13
	.byte	49
	.byte	4
	.byte	63
	.byte	6
	.byte	64
	.byte	-2
	.byte	69
	.byte	-2
	.byte	59
	.byte	6
	.byte	70
	.byte	10
	.byte	44
	.byte	9
	.byte	31
	.byte	12
	.byte	43
	.byte	3
	.byte	53
	.byte	14
	.byte	34
	.byte	10
	.byte	38
	.byte	-3
	.byte	52
	.byte	13
	.byte	40
	.byte	17
	.byte	32
	.byte	7
	.byte	44
	.byte	7
	.byte	38
	.byte	13
	.byte	50
	.byte	10
	.byte	57
	.byte	26
	.byte	43
	.byte	14
	.byte	11
	.byte	11
	.byte	14
	.byte	9
	.byte	11
	.byte	18
	.byte	11
	.byte	21
	.byte	9
	.byte	23
	.byte	-2
	.byte	32
	.byte	-15
	.byte	32
	.byte	-15
	.byte	34
	.byte	-21
	.byte	39
	.byte	-23
	.byte	42
	.byte	-33
	.byte	41
	.byte	-31
	.byte	46
	.byte	-28
	.byte	38
	.byte	-12
	.byte	21
	.byte	29
	.byte	45
	.byte	-24
	.byte	53
	.byte	-45
	.byte	48
	.byte	-26
	.byte	65
	.byte	-43
	.byte	43
	.byte	-19
	.byte	39
	.byte	-10
	.byte	30
	.byte	9
	.byte	18
	.byte	26
	.byte	20
	.byte	27
	.byte	0
	.byte	57
	.byte	-14
	.byte	82
	.byte	-5
	.byte	75
	.byte	-19
	.byte	97
	.byte	-35
	.byte	125
	.byte	27
	.byte	0
	.byte	28
	.byte	0
	.byte	31
	.byte	-4
	.byte	27
	.byte	6
	.byte	34
	.byte	8
	.byte	30
	.byte	10
	.byte	24
	.byte	22
	.byte	33
	.byte	19
	.byte	22
	.byte	32
	.byte	26
	.byte	31
	.byte	21
	.byte	41
	.byte	26
	.byte	44
	.byte	23
	.byte	47
	.byte	16
	.byte	65
	.byte	14
	.byte	71
	.byte	8
	.byte	60
	.byte	6
	.byte	63
	.byte	17
	.byte	65
	.byte	21
	.byte	24
	.byte	23
	.byte	20
	.byte	26
	.byte	23
	.byte	27
	.byte	32
	.byte	28
	.byte	23
	.byte	28
	.byte	24
	.byte	23
	.byte	40
	.byte	24
	.byte	32
	.byte	28
	.byte	29
	.byte	23
	.byte	42
	.byte	19
	.byte	57
	.byte	22
	.byte	53
	.byte	22
	.byte	61
	.byte	11
	.byte	86
	.byte	12
	.byte	40
	.byte	11
	.byte	51
	.byte	14
	.byte	59
	.byte	-4
	.byte	79
	.byte	-7
	.byte	71
	.byte	-5
	.byte	69
	.byte	-9
	.byte	70
	.byte	-8
	.byte	66
	.byte	-10
	.byte	68
	.byte	-19
	.byte	73
	.byte	-12
	.byte	69
	.byte	-16
	.byte	70
	.byte	-15
	.byte	67
	.byte	-20
	.byte	62
	.byte	-19
	.byte	70
	.byte	-16
	.byte	66
	.byte	-22
	.byte	65
	.byte	-20
	.byte	63
	.byte	9
	.byte	-2
	.byte	26
	.byte	-9
	.byte	33
	.byte	-9
	.byte	39
	.byte	-7
	.byte	41
	.byte	-2
	.byte	45
	.byte	3
	.byte	49
	.byte	9
	.byte	45
	.byte	27
	.byte	36
	.byte	59
	.byte	-6
	.byte	66
	.byte	-7
	.byte	35
	.byte	-7
	.byte	42
	.byte	-8
	.byte	45
	.byte	-5
	.byte	48
	.byte	-12
	.byte	56
	.byte	-6
	.byte	60
	.byte	-5
	.byte	62
	.byte	-8
	.byte	66
	.byte	-8
	.byte	76
	.byte	-5
	.byte	85
	.byte	-6
	.byte	81
	.byte	-10
	.byte	77
	.byte	-7
	.byte	81
	.byte	-17
	.byte	80
	.byte	-18
	.byte	73
	.byte	-4
	.byte	74
	.byte	-10
	.byte	83
	.byte	-9
	.byte	71
	.byte	-9
	.byte	67
	.byte	-1
	.byte	61
	.byte	-8
	.byte	66
	.byte	-14
	.byte	66
	.byte	0
	.byte	59
	.byte	2
	.byte	59
	.byte	21
	.byte	-13
	.byte	33
	.byte	-14
	.byte	39
	.byte	-7
	.byte	46
	.byte	-2
	.byte	51
	.byte	2
	.byte	60
	.byte	6
	.byte	61
	.byte	17
	.byte	55
	.byte	34
	.byte	42
	.byte	62
	.byte	20
	.byte	-15
	.byte	2
	.byte	54
	.byte	3
	.byte	74
	.byte	20
	.byte	-15
	.byte	2
	.byte	54
	.byte	3
	.byte	74
	.byte	-28
	.byte	127
	.byte	-23
	.byte	104
	.byte	-6
	.byte	53
	.byte	-1
	.byte	54
	.byte	7
	.byte	51
	.byte	22
	.byte	25
	.byte	34
	.byte	0
	.byte	16
	.byte	0
	.byte	-2
	.byte	9
	.byte	4
	.byte	41
	.byte	-29
	.byte	118
	.byte	2
	.byte	65
	.byte	-6
	.byte	71
	.byte	-13
	.byte	79
	.byte	5
	.byte	52
	.byte	9
	.byte	50
	.byte	-3
	.byte	70
	.byte	10
	.byte	54
	.byte	26
	.byte	34
	.byte	19
	.byte	22
	.byte	40
	.byte	0
	.byte	57
	.byte	2
	.byte	41
	.byte	36
	.byte	26
	.byte	69
	.byte	-45
	.byte	127
	.byte	-15
	.byte	101
	.byte	-4
	.byte	76
	.byte	-6
	.byte	71
	.byte	-13
	.byte	79
	.byte	5
	.byte	52
	.byte	6
	.byte	69
	.byte	-13
	.byte	90
	.byte	0
	.byte	52
	.byte	8
	.byte	43
	.byte	-2
	.byte	69
	.byte	-5
	.byte	82
	.byte	-10
	.byte	96
	.byte	2
	.byte	59
	.byte	2
	.byte	75
	.byte	-3
	.byte	87
	.byte	-3
	.byte	100
	.byte	1
	.byte	56
	.byte	-3
	.byte	74
	.byte	-6
	.byte	85
	.byte	0
	.byte	59
	.byte	-3
	.byte	81
	.byte	-7
	.byte	86
	.byte	-5
	.byte	95
	.byte	-1
	.byte	66
	.byte	-1
	.byte	77
	.byte	1
	.byte	70
	.byte	-2
	.byte	86
	.byte	-5
	.byte	72
	.byte	0
	.byte	61
	.byte	0
	.byte	41
	.byte	0
	.byte	63
	.byte	0
	.byte	63
	.byte	0
	.byte	63
	.byte	-9
	.byte	83
	.byte	4
	.byte	86
	.byte	0
	.byte	97
	.byte	-7
	.byte	72
	.byte	13
	.byte	41
	.byte	3
	.byte	62
	.byte	13
	.byte	15
	.byte	7
	.byte	51
	.byte	2
	.byte	80
	.byte	-39
	.byte	127
	.byte	-18
	.byte	91
	.byte	-17
	.byte	96
	.byte	-26
	.byte	81
	.byte	-35
	.byte	98
	.byte	-24
	.byte	102
	.byte	-23
	.byte	97
	.byte	-27
	.byte	119
	.byte	-24
	.byte	99
	.byte	-21
	.byte	110
	.byte	-18
	.byte	102
	.byte	-36
	.byte	127
	.byte	0
	.byte	80
	.byte	-5
	.byte	89
	.byte	-7
	.byte	94
	.byte	-4
	.byte	92
	.byte	0
	.byte	39
	.byte	0
	.byte	65
	.byte	-15
	.byte	84
	.byte	-35
	.byte	127
	.byte	-2
	.byte	73
	.byte	-12
	.byte	104
	.byte	-9
	.byte	91
	.byte	-31
	.byte	127
	.byte	3
	.byte	55
	.byte	7
	.byte	56
	.byte	7
	.byte	55
	.byte	8
	.byte	61
	.byte	-3
	.byte	53
	.byte	0
	.byte	68
	.byte	-7
	.byte	74
	.byte	-9
	.byte	88
	.byte	-13
	.byte	103
	.byte	-13
	.byte	91
	.byte	-9
	.byte	89
	.byte	-14
	.byte	92
	.byte	-8
	.byte	76
	.byte	-12
	.byte	87
	.byte	-23
	.byte	110
	.byte	-24
	.byte	105
	.byte	-10
	.byte	78
	.byte	-20
	.byte	112
	.byte	-17
	.byte	99
	.byte	-78
	.byte	127
	.byte	-70
	.byte	127
	.byte	-50
	.byte	127
	.byte	-46
	.byte	127
	.byte	-4
	.byte	66
	.byte	-5
	.byte	78
	.byte	-4
	.byte	71
	.byte	-8
	.byte	72
	.byte	2
	.byte	59
	.byte	-1
	.byte	55
	.byte	-7
	.byte	70
	.byte	-6
	.byte	75
	.byte	-8
	.byte	89
	.byte	-34
	.byte	119
	.byte	-3
	.byte	75
	.byte	32
	.byte	20
	.byte	30
	.byte	22
	.byte	-44
	.byte	127
	.byte	0
	.byte	54
	.byte	-5
	.byte	61
	.byte	0
	.byte	58
	.byte	-1
	.byte	60
	.byte	-3
	.byte	61
	.byte	-8
	.byte	67
	.byte	-25
	.byte	84
	.byte	-14
	.byte	74
	.byte	-5
	.byte	65
	.byte	5
	.byte	52
	.byte	2
	.byte	57
	.byte	0
	.byte	61
	.byte	-9
	.byte	69
	.byte	-11
	.byte	70
	.byte	18
	.byte	55
	.byte	-4
	.byte	71
	.byte	0
	.byte	58
	.byte	7
	.byte	61
	.byte	9
	.byte	41
	.byte	18
	.byte	25
	.byte	9
	.byte	32
	.byte	5
	.byte	43
	.byte	9
	.byte	47
	.byte	0
	.byte	44
	.byte	0
	.byte	51
	.byte	2
	.byte	46
	.byte	19
	.byte	38
	.byte	-4
	.byte	66
	.byte	15
	.byte	38
	.byte	12
	.byte	42
	.byte	9
	.byte	34
	.byte	0
	.byte	89
	.byte	4
	.byte	45
	.byte	10
	.byte	28
	.byte	10
	.byte	31
	.byte	33
	.byte	-11
	.byte	52
	.byte	-43
	.byte	18
	.byte	15
	.byte	28
	.byte	0
	.byte	35
	.byte	-22
	.byte	38
	.byte	-25
	.byte	34
	.byte	0
	.byte	39
	.byte	-18
	.byte	32
	.byte	-12
	.byte	102
	.byte	-94
	.byte	0
	.byte	0
	.byte	56
	.byte	-15
	.byte	33
	.byte	-4
	.byte	29
	.byte	10
	.byte	37
	.byte	-5
	.byte	51
	.byte	-29
	.byte	39
	.byte	-9
	.byte	52
	.byte	-34
	.byte	69
	.byte	-58
	.byte	67
	.byte	-63
	.byte	44
	.byte	-5
	.byte	32
	.byte	7
	.byte	55
	.byte	-29
	.byte	32
	.byte	1
	.byte	0
	.byte	0
	.byte	27
	.byte	36
	.byte	33
	.byte	-25
	.byte	34
	.byte	-30
	.byte	36
	.byte	-28
	.byte	38
	.byte	-28
	.byte	38
	.byte	-27
	.byte	34
	.byte	-18
	.byte	35
	.byte	-16
	.byte	34
	.byte	-14
	.byte	32
	.byte	-8
	.byte	37
	.byte	-6
	.byte	35
	.byte	0
	.byte	30
	.byte	10
	.byte	28
	.byte	18
	.byte	26
	.byte	25
	.byte	29
	.byte	41
	.byte	0
	.byte	75
	.byte	2
	.byte	72
	.byte	8
	.byte	77
	.byte	14
	.byte	35
	.byte	18
	.byte	31
	.byte	17
	.byte	35
	.byte	21
	.byte	30
	.byte	17
	.byte	45
	.byte	20
	.byte	42
	.byte	18
	.byte	45
	.byte	27
	.byte	26
	.byte	16
	.byte	54
	.byte	7
	.byte	66
	.byte	16
	.byte	56
	.byte	11
	.byte	73
	.byte	10
	.byte	67
	.byte	-10
	.byte	116
	.byte	-23
	.byte	112
	.byte	-15
	.byte	71
	.byte	-7
	.byte	61
	.byte	0
	.byte	53
	.byte	-5
	.byte	66
	.byte	-11
	.byte	77
	.byte	-9
	.byte	80
	.byte	-9
	.byte	84
	.byte	-10
	.byte	87
	.byte	-34
	.byte	127
	.byte	-21
	.byte	101
	.byte	-3
	.byte	39
	.byte	-5
	.byte	53
	.byte	-7
	.byte	61
	.byte	-11
	.byte	75
	.byte	-15
	.byte	77
	.byte	-17
	.byte	91
	.byte	-25
	.byte	107
	.byte	-25
	.byte	111
	.byte	-28
	.byte	122
	.byte	-11
	.byte	76
	.byte	-10
	.byte	44
	.byte	-10
	.byte	52
	.byte	-10
	.byte	57
	.byte	-9
	.byte	58
	.byte	-16
	.byte	72
	.byte	-7
	.byte	69
	.byte	-4
	.byte	69
	.byte	-5
	.byte	74
	.byte	-9
	.byte	86
	.byte	2
	.byte	66
	.byte	-9
	.byte	34
	.byte	1
	.byte	32
	.byte	11
	.byte	31
	.byte	5
	.byte	52
	.byte	-2
	.byte	55
	.byte	-2
	.byte	67
	.byte	0
	.byte	73
	.byte	-8
	.byte	89
	.byte	3
	.byte	52
	.byte	7
	.byte	4
	.byte	10
	.byte	8
	.byte	17
	.byte	8
	.byte	16
	.byte	19
	.byte	3
	.byte	37
	.byte	-1
	.byte	61
	.byte	-5
	.byte	73
	.byte	-1
	.byte	70
	.byte	-4
	.byte	78
	.byte	0
	.byte	0
	.byte	-21
	.byte	126
	.byte	-23
	.byte	124
	.byte	-20
	.byte	110
	.byte	-26
	.byte	126
	.byte	-25
	.byte	124
	.byte	-17
	.byte	105
	.byte	-27
	.byte	121
	.byte	-27
	.byte	117
	.byte	-17
	.byte	102
	.byte	-26
	.byte	117
	.byte	-27
	.byte	116
	.byte	-33
	.byte	122
	.byte	-10
	.byte	95
	.byte	-14
	.byte	100
	.byte	-8
	.byte	95
	.byte	-17
	.byte	111
	.byte	-28
	.byte	114
	.byte	-6
	.byte	89
	.byte	-2
	.byte	80
	.byte	-4
	.byte	82
	.byte	-9
	.byte	85
	.byte	-8
	.byte	81
	.byte	-1
	.byte	72
	.byte	5
	.byte	64
	.byte	1
	.byte	67
	.byte	9
	.byte	56
	.byte	0
	.byte	69
	.byte	1
	.byte	69
	.byte	7
	.byte	69
	.byte	-7
	.byte	69
	.byte	-6
	.byte	67
	.byte	-16
	.byte	77
	.byte	-2
	.byte	64
	.byte	2
	.byte	61
	.byte	-6
	.byte	67
	.byte	-3
	.byte	64
	.byte	2
	.byte	57
	.byte	-3
	.byte	65
	.byte	-3
	.byte	66
	.byte	0
	.byte	62
	.byte	9
	.byte	51
	.byte	-1
	.byte	66
	.byte	-2
	.byte	71
	.byte	-2
	.byte	75
	.byte	-1
	.byte	70
	.byte	-9
	.byte	72
	.byte	14
	.byte	60
	.byte	16
	.byte	37
	.byte	0
	.byte	47
	.byte	18
	.byte	35
	.byte	11
	.byte	37
	.byte	12
	.byte	41
	.byte	10
	.byte	41
	.byte	2
	.byte	48
	.byte	12
	.byte	41
	.byte	13
	.byte	41
	.byte	0
	.byte	59
	.byte	3
	.byte	50
	.byte	19
	.byte	40
	.byte	3
	.byte	66
	.byte	18
	.byte	50
	.byte	19
	.byte	-6
	.byte	18
	.byte	-6
	.byte	14
	.byte	0
	.byte	26
	.byte	-12
	.byte	31
	.byte	-16
	.byte	33
	.byte	-25
	.byte	33
	.byte	-22
	.byte	37
	.byte	-28
	.byte	39
	.byte	-30
	.byte	42
	.byte	-30
	.byte	47
	.byte	-42
	.byte	45
	.byte	-36
	.byte	49
	.byte	-34
	.byte	41
	.byte	-17
	.byte	32
	.byte	9
	.byte	69
	.byte	-71
	.byte	63
	.byte	-63
	.byte	66
	.byte	-64
	.byte	77
	.byte	-74
	.byte	54
	.byte	-39
	.byte	52
	.byte	-35
	.byte	41
	.byte	-10
	.byte	36
	.byte	0
	.byte	40
	.byte	-1
	.byte	30
	.byte	14
	.byte	28
	.byte	26
	.byte	23
	.byte	37
	.byte	12
	.byte	55
	.byte	11
	.byte	65
	.byte	37
	.byte	-33
	.byte	39
	.byte	-36
	.byte	40
	.byte	-37
	.byte	38
	.byte	-30
	.byte	46
	.byte	-33
	.byte	42
	.byte	-30
	.byte	40
	.byte	-24
	.byte	49
	.byte	-29
	.byte	38
	.byte	-12
	.byte	40
	.byte	-10
	.byte	38
	.byte	-3
	.byte	46
	.byte	-5
	.byte	31
	.byte	20
	.byte	29
	.byte	30
	.byte	25
	.byte	44
	.byte	12
	.byte	48
	.byte	11
	.byte	49
	.byte	26
	.byte	45
	.byte	22
	.byte	22
	.byte	23
	.byte	22
	.byte	27
	.byte	21
	.byte	33
	.byte	20
	.byte	26
	.byte	28
	.byte	30
	.byte	24
	.byte	27
	.byte	34
	.byte	18
	.byte	42
	.byte	25
	.byte	39
	.byte	18
	.byte	50
	.byte	12
	.byte	70
	.byte	21
	.byte	54
	.byte	14
	.byte	71
	.byte	11
	.byte	83
	.byte	25
	.byte	32
	.byte	21
	.byte	49
	.byte	21
	.byte	54
	.byte	-5
	.byte	85
	.byte	-6
	.byte	81
	.byte	-10
	.byte	77
	.byte	-7
	.byte	81
	.byte	-17
	.byte	80
	.byte	-18
	.byte	73
	.byte	-4
	.byte	74
	.byte	-10
	.byte	83
	.byte	-9
	.byte	71
	.byte	-9
	.byte	67
	.byte	-1
	.byte	61
	.byte	-8
	.byte	66
	.byte	-14
	.byte	66
	.byte	0
	.byte	59
	.byte	2
	.byte	59
	.byte	17
	.byte	-10
	.byte	32
	.byte	-13
	.byte	42
	.byte	-9
	.byte	49
	.byte	-5
	.byte	53
	.byte	0
	.byte	64
	.byte	3
	.byte	68
	.byte	10
	.byte	66
	.byte	27
	.byte	47
	.byte	57
	.byte	-5
	.byte	71
	.byte	0
	.byte	24
	.byte	-1
	.byte	36
	.byte	-2
	.byte	42
	.byte	-2
	.byte	52
	.byte	-9
	.byte	57
	.byte	-6
	.byte	63
	.byte	-4
	.byte	65
	.byte	-4
	.byte	67
	.byte	-7
	.byte	82
	.byte	-3
	.byte	81
	.byte	-3
	.byte	76
	.byte	-7
	.byte	72
	.byte	-6
	.byte	78
	.byte	-12
	.byte	72
	.byte	-14
	.byte	68
	.byte	-3
	.byte	70
	.byte	-6
	.byte	76
	.byte	-5
	.byte	66
	.byte	-5
	.byte	62
	.byte	0
	.byte	57
	.byte	-4
	.byte	61
	.byte	-9
	.byte	60
	.byte	1
	.byte	54
	.byte	2
	.byte	58
	.byte	17
	.byte	-10
	.byte	32
	.byte	-13
	.byte	42
	.byte	-9
	.byte	49
	.byte	-5
	.byte	53
	.byte	0
	.byte	64
	.byte	3
	.byte	68
	.byte	10
	.byte	66
	.byte	27
	.byte	47
	.byte	57
	.byte	20
	.byte	-15
	.byte	2
	.byte	54
	.byte	3
	.byte	74
	.byte	20
	.byte	-15
	.byte	2
	.byte	54
	.byte	3
	.byte	74
	.byte	-28
	.byte	127
	.byte	-23
	.byte	104
	.byte	-6
	.byte	53
	.byte	-1
	.byte	54
	.byte	7
	.byte	51
	.byte	29
	.byte	16
	.byte	25
	.byte	0
	.byte	14
	.byte	0
	.byte	-10
	.byte	51
	.byte	-3
	.byte	62
	.byte	-27
	.byte	99
	.byte	26
	.byte	16
	.byte	-4
	.byte	85
	.byte	-24
	.byte	102
	.byte	5
	.byte	57
	.byte	6
	.byte	57
	.byte	-17
	.byte	73
	.byte	14
	.byte	57
	.byte	20
	.byte	40
	.byte	20
	.byte	10
	.byte	29
	.byte	0
	.byte	54
	.byte	0
	.byte	37
	.byte	42
	.byte	12
	.byte	97
	.byte	-32
	.byte	127
	.byte	-22
	.byte	117
	.byte	-2
	.byte	74
	.byte	-4
	.byte	85
	.byte	-24
	.byte	102
	.byte	5
	.byte	57
	.byte	-6
	.byte	93
	.byte	-14
	.byte	88
	.byte	-6
	.byte	44
	.byte	4
	.byte	55
	.byte	-11
	.byte	89
	.byte	-15
	.byte	103
	.byte	-21
	.byte	116
	.byte	19
	.byte	57
	.byte	20
	.byte	58
	.byte	4
	.byte	84
	.byte	6
	.byte	96
	.byte	1
	.byte	63
	.byte	-5
	.byte	85
	.byte	-13
	.byte	106
	.byte	5
	.byte	63
	.byte	6
	.byte	75
	.byte	-3
	.byte	90
	.byte	-1
	.byte	101
	.byte	3
	.byte	55
	.byte	-4
	.byte	79
	.byte	-2
	.byte	75
	.byte	-12
	.byte	97
	.byte	-7
	.byte	50
	.byte	1
	.byte	60
	.byte	0
	.byte	41
	.byte	0
	.byte	63
	.byte	0
	.byte	63
	.byte	0
	.byte	63
	.byte	-9
	.byte	83
	.byte	4
	.byte	86
	.byte	0
	.byte	97
	.byte	-7
	.byte	72
	.byte	13
	.byte	41
	.byte	3
	.byte	62
	.byte	7
	.byte	34
	.byte	-9
	.byte	88
	.byte	-20
	.byte	127
	.byte	-36
	.byte	127
	.byte	-17
	.byte	91
	.byte	-14
	.byte	95
	.byte	-25
	.byte	84
	.byte	-25
	.byte	86
	.byte	-12
	.byte	89
	.byte	-17
	.byte	91
	.byte	-31
	.byte	127
	.byte	-14
	.byte	76
	.byte	-18
	.byte	103
	.byte	-13
	.byte	90
	.byte	-37
	.byte	127
	.byte	11
	.byte	80
	.byte	5
	.byte	76
	.byte	2
	.byte	84
	.byte	5
	.byte	78
	.byte	-6
	.byte	55
	.byte	4
	.byte	61
	.byte	-14
	.byte	83
	.byte	-37
	.byte	127
	.byte	-5
	.byte	79
	.byte	-11
	.byte	104
	.byte	-11
	.byte	91
	.byte	-30
	.byte	127
	.byte	0
	.byte	65
	.byte	-2
	.byte	79
	.byte	0
	.byte	72
	.byte	-4
	.byte	92
	.byte	-6
	.byte	56
	.byte	3
	.byte	68
	.byte	-8
	.byte	71
	.byte	-13
	.byte	98
	.byte	-4
	.byte	86
	.byte	-12
	.byte	88
	.byte	-5
	.byte	82
	.byte	-3
	.byte	72
	.byte	-4
	.byte	67
	.byte	-8
	.byte	72
	.byte	-16
	.byte	89
	.byte	-9
	.byte	69
	.byte	-1
	.byte	59
	.byte	5
	.byte	66
	.byte	4
	.byte	57
	.byte	-4
	.byte	71
	.byte	-2
	.byte	71
	.byte	2
	.byte	58
	.byte	-1
	.byte	74
	.byte	-4
	.byte	44
	.byte	-1
	.byte	69
	.byte	0
	.byte	62
	.byte	-7
	.byte	51
	.byte	-4
	.byte	47
	.byte	-6
	.byte	42
	.byte	-3
	.byte	41
	.byte	-6
	.byte	53
	.byte	8
	.byte	76
	.byte	-9
	.byte	78
	.byte	-11
	.byte	83
	.byte	9
	.byte	52
	.byte	0
	.byte	67
	.byte	-5
	.byte	90
	.byte	1
	.byte	67
	.byte	-15
	.byte	72
	.byte	-5
	.byte	75
	.byte	-8
	.byte	80
	.byte	-21
	.byte	83
	.byte	-21
	.byte	64
	.byte	-13
	.byte	31
	.byte	-25
	.byte	64
	.byte	-29
	.byte	94
	.byte	9
	.byte	75
	.byte	17
	.byte	63
	.byte	-8
	.byte	74
	.byte	-5
	.byte	35
	.byte	-2
	.byte	27
	.byte	13
	.byte	91
	.byte	3
	.byte	65
	.byte	-7
	.byte	69
	.byte	8
	.byte	77
	.byte	-10
	.byte	66
	.byte	3
	.byte	62
	.byte	-3
	.byte	68
	.byte	-20
	.byte	81
	.byte	0
	.byte	30
	.byte	1
	.byte	7
	.byte	-3
	.byte	23
	.byte	-21
	.byte	74
	.byte	16
	.byte	66
	.byte	-23
	.byte	124
	.byte	17
	.byte	37
	.byte	44
	.byte	-18
	.byte	50
	.byte	-34
	.byte	-22
	.byte	127
	.byte	4
	.byte	39
	.byte	0
	.byte	42
	.byte	7
	.byte	34
	.byte	11
	.byte	29
	.byte	8
	.byte	31
	.byte	6
	.byte	37
	.byte	7
	.byte	42
	.byte	3
	.byte	40
	.byte	8
	.byte	33
	.byte	13
	.byte	43
	.byte	13
	.byte	36
	.byte	4
	.byte	47
	.byte	3
	.byte	55
	.byte	2
	.byte	58
	.byte	6
	.byte	60
	.byte	8
	.byte	44
	.byte	11
	.byte	44
	.byte	14
	.byte	42
	.byte	7
	.byte	48
	.byte	4
	.byte	56
	.byte	4
	.byte	52
	.byte	13
	.byte	37
	.byte	9
	.byte	49
	.byte	19
	.byte	58
	.byte	10
	.byte	48
	.byte	12
	.byte	45
	.byte	0
	.byte	69
	.byte	20
	.byte	33
	.byte	8
	.byte	63
	.byte	35
	.byte	-18
	.byte	33
	.byte	-25
	.byte	28
	.byte	-3
	.byte	24
	.byte	10
	.byte	27
	.byte	0
	.byte	34
	.byte	-14
	.byte	52
	.byte	-44
	.byte	39
	.byte	-24
	.byte	19
	.byte	17
	.byte	31
	.byte	25
	.byte	36
	.byte	29
	.byte	24
	.byte	33
	.byte	34
	.byte	15
	.byte	30
	.byte	20
	.byte	22
	.byte	73
	.byte	20
	.byte	34
	.byte	19
	.byte	31
	.byte	27
	.byte	44
	.byte	19
	.byte	16
	.byte	15
	.byte	36
	.byte	15
	.byte	36
	.byte	21
	.byte	28
	.byte	25
	.byte	21
	.byte	30
	.byte	20
	.byte	31
	.byte	12
	.byte	27
	.byte	16
	.byte	24
	.byte	42
	.byte	0
	.byte	93
	.byte	14
	.byte	56
	.byte	15
	.byte	57
	.byte	26
	.byte	38
	.byte	-24
	.byte	127
	.byte	-24
	.byte	115
	.byte	-22
	.byte	82
	.byte	-9
	.byte	62
	.byte	0
	.byte	53
	.byte	0
	.byte	59
	.byte	-14
	.byte	85
	.byte	-13
	.byte	89
	.byte	-13
	.byte	94
	.byte	-11
	.byte	92
	.byte	-29
	.byte	127
	.byte	-21
	.byte	100
	.byte	-14
	.byte	57
	.byte	-12
	.byte	67
	.byte	-11
	.byte	71
	.byte	-10
	.byte	77
	.byte	-21
	.byte	85
	.byte	-16
	.byte	88
	.byte	-23
	.byte	104
	.byte	-15
	.byte	98
	.byte	-37
	.byte	127
	.byte	-10
	.byte	82
	.byte	-8
	.byte	48
	.byte	-8
	.byte	61
	.byte	-8
	.byte	66
	.byte	-7
	.byte	70
	.byte	-14
	.byte	75
	.byte	-10
	.byte	79
	.byte	-9
	.byte	83
	.byte	-12
	.byte	92
	.byte	-18
	.byte	108
	.byte	-4
	.byte	79
	.byte	-22
	.byte	69
	.byte	-16
	.byte	75
	.byte	-2
	.byte	58
	.byte	1
	.byte	58
	.byte	-13
	.byte	78
	.byte	-9
	.byte	83
	.byte	-4
	.byte	81
	.byte	-13
	.byte	99
	.byte	-13
	.byte	81
	.byte	-6
	.byte	38
	.byte	-13
	.byte	62
	.byte	-6
	.byte	58
	.byte	-2
	.byte	59
	.byte	-16
	.byte	73
	.byte	-10
	.byte	76
	.byte	-13
	.byte	86
	.byte	-9
	.byte	83
	.byte	-10
	.byte	87
	.byte	0
	.byte	0
	.byte	-22
	.byte	127
	.byte	-25
	.byte	127
	.byte	-25
	.byte	120
	.byte	-27
	.byte	127
	.byte	-19
	.byte	114
	.byte	-23
	.byte	117
	.byte	-25
	.byte	118
	.byte	-26
	.byte	117
	.byte	-24
	.byte	113
	.byte	-28
	.byte	118
	.byte	-31
	.byte	120
	.byte	-37
	.byte	124
	.byte	-10
	.byte	94
	.byte	-15
	.byte	102
	.byte	-10
	.byte	99
	.byte	-13
	.byte	106
	.byte	-50
	.byte	127
	.byte	-5
	.byte	92
	.byte	17
	.byte	57
	.byte	-5
	.byte	86
	.byte	-13
	.byte	94
	.byte	-12
	.byte	91
	.byte	-2
	.byte	77
	.byte	0
	.byte	71
	.byte	-1
	.byte	73
	.byte	4
	.byte	64
	.byte	-7
	.byte	81
	.byte	5
	.byte	64
	.byte	15
	.byte	57
	.byte	1
	.byte	67
	.byte	0
	.byte	68
	.byte	-10
	.byte	67
	.byte	1
	.byte	68
	.byte	0
	.byte	77
	.byte	2
	.byte	64
	.byte	0
	.byte	68
	.byte	-5
	.byte	78
	.byte	7
	.byte	55
	.byte	5
	.byte	59
	.byte	2
	.byte	65
	.byte	14
	.byte	54
	.byte	15
	.byte	44
	.byte	5
	.byte	60
	.byte	2
	.byte	70
	.byte	-2
	.byte	76
	.byte	-18
	.byte	86
	.byte	12
	.byte	70
	.byte	5
	.byte	64
	.byte	-12
	.byte	70
	.byte	11
	.byte	55
	.byte	5
	.byte	56
	.byte	0
	.byte	69
	.byte	2
	.byte	65
	.byte	-6
	.byte	74
	.byte	5
	.byte	54
	.byte	7
	.byte	54
	.byte	-6
	.byte	76
	.byte	-11
	.byte	82
	.byte	-2
	.byte	77
	.byte	-2
	.byte	77
	.byte	25
	.byte	42
	.byte	17
	.byte	-13
	.byte	16
	.byte	-9
	.byte	17
	.byte	-12
	.byte	27
	.byte	-21
	.byte	37
	.byte	-30
	.byte	41
	.byte	-40
	.byte	42
	.byte	-41
	.byte	48
	.byte	-47
	.byte	39
	.byte	-32
	.byte	46
	.byte	-40
	.byte	52
	.byte	-51
	.byte	46
	.byte	-41
	.byte	52
	.byte	-39
	.byte	43
	.byte	-19
	.byte	32
	.byte	11
	.byte	61
	.byte	-55
	.byte	56
	.byte	-46
	.byte	62
	.byte	-50
	.byte	81
	.byte	-67
	.byte	45
	.byte	-20
	.byte	35
	.byte	-2
	.byte	28
	.byte	15
	.byte	34
	.byte	1
	.byte	39
	.byte	1
	.byte	30
	.byte	17
	.byte	20
	.byte	38
	.byte	18
	.byte	45
	.byte	15
	.byte	54
	.byte	0
	.byte	79
	.byte	36
	.byte	-16
	.byte	37
	.byte	-14
	.byte	37
	.byte	-17
	.byte	32
	.byte	1
	.byte	34
	.byte	15
	.byte	29
	.byte	15
	.byte	24
	.byte	25
	.byte	34
	.byte	22
	.byte	31
	.byte	16
	.byte	35
	.byte	18
	.byte	31
	.byte	28
	.byte	33
	.byte	41
	.byte	36
	.byte	28
	.byte	27
	.byte	47
	.byte	21
	.byte	62
	.byte	18
	.byte	31
	.byte	19
	.byte	26
	.byte	36
	.byte	24
	.byte	24
	.byte	23
	.byte	27
	.byte	16
	.byte	24
	.byte	30
	.byte	31
	.byte	29
	.byte	22
	.byte	41
	.byte	22
	.byte	42
	.byte	16
	.byte	60
	.byte	15
	.byte	52
	.byte	14
	.byte	60
	.byte	3
	.byte	78
	.byte	-16
	.byte	123
	.byte	21
	.byte	53
	.byte	22
	.byte	56
	.byte	25
	.byte	61
	.byte	21
	.byte	33
	.byte	19
	.byte	50
	.byte	17
	.byte	61
	.byte	-3
	.byte	78
	.byte	-8
	.byte	74
	.byte	-9
	.byte	72
	.byte	-10
	.byte	72
	.byte	-18
	.byte	75
	.byte	-12
	.byte	71
	.byte	-11
	.byte	63
	.byte	-5
	.byte	70
	.byte	-17
	.byte	75
	.byte	-14
	.byte	72
	.byte	-16
	.byte	67
	.byte	-8
	.byte	53
	.byte	-14
	.byte	59
	.byte	-9
	.byte	52
	.byte	-11
	.byte	68
	.byte	9
	.byte	-2
	.byte	30
	.byte	-10
	.byte	31
	.byte	-4
	.byte	33
	.byte	-1
	.byte	33
	.byte	7
	.byte	31
	.byte	12
	.byte	37
	.byte	23
	.byte	31
	.byte	38
	.byte	20
	.byte	64
	.byte	-9
	.byte	71
	.byte	-7
	.byte	37
	.byte	-8
	.byte	44
	.byte	-11
	.byte	49
	.byte	-10
	.byte	56
	.byte	-12
	.byte	59
	.byte	-8
	.byte	63
	.byte	-9
	.byte	67
	.byte	-6
	.byte	68
	.byte	-10
	.byte	79
	.byte	-3
	.byte	78
	.byte	-8
	.byte	74
	.byte	-9
	.byte	72
	.byte	-10
	.byte	72
	.byte	-18
	.byte	75
	.byte	-12
	.byte	71
	.byte	-11
	.byte	63
	.byte	-5
	.byte	70
	.byte	-17
	.byte	75
	.byte	-14
	.byte	72
	.byte	-16
	.byte	67
	.byte	-8
	.byte	53
	.byte	-14
	.byte	59
	.byte	-9
	.byte	52
	.byte	-11
	.byte	68
	.byte	9
	.byte	-2
	.byte	30
	.byte	-10
	.byte	31
	.byte	-4
	.byte	33
	.byte	-1
	.byte	33
	.byte	7
	.byte	31
	.byte	12
	.byte	37
	.byte	23
	.byte	31
	.byte	38
	.byte	20
	.byte	64
	.align	2
	.type	b_mb_type_info, @object
	.size	b_mb_type_info, 92
b_mb_type_info:
	.half	256
	.byte	1
	.space	1
	.half	4104
	.byte	1
	.space	1
	.half	16392
	.byte	1
	.space	1
	.half	20488
	.byte	1
	.space	1
	.half	12304
	.byte	2
	.space	1
	.half	12320
	.byte	2
	.space	1
	.half	-16368
	.byte	2
	.space	1
	.half	-16352
	.byte	2
	.space	1
	.half	-28656
	.byte	2
	.space	1
	.half	-28640
	.byte	2
	.space	1
	.half	24592
	.byte	2
	.space	1
	.half	24608
	.byte	2
	.space	1
	.half	-20464
	.byte	2
	.space	1
	.half	-20448
	.byte	2
	.space	1
	.half	-8176
	.byte	2
	.space	1
	.half	-8160
	.byte	2
	.space	1
	.half	28688
	.byte	2
	.space	1
	.half	28704
	.byte	2
	.space	1
	.half	-12272
	.byte	2
	.space	1
	.half	-12256
	.byte	2
	.space	1
	.half	-4080
	.byte	2
	.space	1
	.half	-4064
	.byte	2
	.space	1
	.half	-4032
	.byte	4
	.space	1
	.align	2
	.type	p_mb_type_info, @object
	.size	p_mb_type_info, 20
p_mb_type_info:
	.half	4104
	.byte	1
	.space	1
	.half	12304
	.byte	2
	.space	1
	.half	12320
	.byte	2
	.space	1
	.half	12352
	.byte	4
	.space	1
	.half	12864
	.byte	4
	.space	1
	.align	2
	.type	b_sub_mb_type_info, @object
	.size	b_sub_mb_type_info, 52
b_sub_mb_type_info:
	.half	256
	.byte	1
	.space	1
	.half	4104
	.byte	1
	.space	1
	.half	16392
	.byte	1
	.space	1
	.half	20488
	.byte	1
	.space	1
	.half	12304
	.byte	2
	.space	1
	.half	12320
	.byte	2
	.space	1
	.half	-16368
	.byte	2
	.space	1
	.half	-16352
	.byte	2
	.space	1
	.half	-4080
	.byte	2
	.space	1
	.half	-4064
	.byte	2
	.space	1
	.half	12352
	.byte	4
	.space	1
	.half	-16320
	.byte	4
	.space	1
	.half	-4032
	.byte	4
	.space	1
	.align	2
	.type	p_sub_mb_type_info, @object
	.size	p_sub_mb_type_info, 16
p_sub_mb_type_info:
	.half	4104
	.byte	1
	.space	1
	.half	4112
	.byte	2
	.space	1
	.half	4128
	.byte	2
	.space	1
	.half	4160
	.byte	4
	.space	1
	.align	2
	.type	luma_dc_field_scan, @object
	.size	luma_dc_field_scan, 16
luma_dc_field_scan:
	.byte	0
	.byte	32
	.byte	16
	.byte	-128
	.byte	-96
	.byte	48
	.byte	-112
	.byte	-80
	.byte	64
	.byte	96
	.byte	-64
	.byte	-32
	.byte	80
	.byte	112
	.byte	-48
	.byte	-16
	.align	2
	.type	significant_coeff_flag_offset_8x8.14557, @object
	.size	significant_coeff_flag_offset_8x8.14557, 126
significant_coeff_flag_offset_8x8.14557:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	6
	.byte	7
	.byte	7
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	9
	.byte	8
	.byte	7
	.byte	7
	.byte	6
	.byte	11
	.byte	12
	.byte	13
	.byte	11
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	14
	.byte	10
	.byte	9
	.byte	8
	.byte	6
	.byte	11
	.byte	12
	.byte	13
	.byte	11
	.byte	6
	.byte	9
	.byte	14
	.byte	10
	.byte	9
	.byte	11
	.byte	12
	.byte	13
	.byte	11
	.byte	14
	.byte	10
	.byte	12
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	7
	.byte	7
	.byte	8
	.byte	4
	.byte	5
	.byte	6
	.byte	9
	.byte	10
	.byte	10
	.byte	8
	.byte	11
	.byte	12
	.byte	11
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	8
	.byte	11
	.byte	12
	.byte	11
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	8
	.byte	11
	.byte	12
	.byte	11
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	8
	.byte	13
	.byte	13
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	8
	.byte	13
	.byte	13
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.align	2
	.type	coeff_abs_level_m1_offset.14556, @object
	.size	coeff_abs_level_m1_offset.14556, 24
coeff_abs_level_m1_offset.14556:
	.word	227
	.word	237
	.word	247
	.word	257
	.word	266
	.word	426
	.align	2
	.type	last_coeff_flag_offset.14555, @object
	.size	last_coeff_flag_offset.14555, 48
last_coeff_flag_offset.14555:
	.word	166
	.word	181
	.word	195
	.word	210
	.word	213
	.word	417
	.word	338
	.word	353
	.word	367
	.word	382
	.word	385
	.word	451
	.align	2
	.type	significant_coeff_flag_offset.14554, @object
	.size	significant_coeff_flag_offset.14554, 48
significant_coeff_flag_offset.14554:
	.word	105
	.word	120
	.word	134
	.word	149
	.word	152
	.word	402
	.word	277
	.word	292
	.word	306
	.word	321
	.word	324
	.word	436
	.align	2
	.type	suffix_limit.13244, @object
	.size	suffix_limit.13244, 28
suffix_limit.13244:
	.word	0
	.word	5
	.word	11
	.word	23
	.word	47
	.word	95
	.word	2147483647
	.align	2
	.type	coeff_token_table_index.13227, @object
	.size	coeff_token_table_index.13227, 68
coeff_token_table_index.13227:
	.word	0
	.word	0
	.word	1
	.word	1
	.word	2
	.word	2
	.word	2
	.word	2
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.align	2
	.type	chroma_dc_coeff_token_len, @object
	.size	chroma_dc_coeff_token_len, 20
chroma_dc_coeff_token_len:
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	1
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	3
	.byte	0
	.byte	6
	.byte	7
	.byte	7
	.byte	6
	.byte	6
	.byte	8
	.byte	8
	.byte	7
	.align	2
	.type	chroma_dc_coeff_token_bits, @object
	.size	chroma_dc_coeff_token_bits, 20
chroma_dc_coeff_token_bits:
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	7
	.byte	1
	.byte	0
	.byte	0
	.byte	4
	.byte	6
	.byte	1
	.byte	0
	.byte	3
	.byte	3
	.byte	2
	.byte	5
	.byte	2
	.byte	3
	.byte	2
	.byte	0
	.align	2
	.type	coeff_token_len, @object
	.size	coeff_token_len, 272
coeff_token_len:
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	2
	.byte	0
	.byte	0
	.byte	8
	.byte	6
	.byte	3
	.byte	0
	.byte	9
	.byte	8
	.byte	7
	.byte	5
	.byte	10
	.byte	9
	.byte	8
	.byte	6
	.byte	11
	.byte	10
	.byte	9
	.byte	7
	.byte	13
	.byte	11
	.byte	10
	.byte	8
	.byte	13
	.byte	13
	.byte	11
	.byte	9
	.byte	13
	.byte	13
	.byte	13
	.byte	10
	.byte	14
	.byte	14
	.byte	13
	.byte	11
	.byte	14
	.byte	14
	.byte	14
	.byte	13
	.byte	15
	.byte	15
	.byte	14
	.byte	14
	.byte	15
	.byte	15
	.byte	15
	.byte	14
	.byte	16
	.byte	15
	.byte	15
	.byte	15
	.byte	16
	.byte	16
	.byte	16
	.byte	15
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	2
	.byte	0
	.byte	0
	.byte	6
	.byte	5
	.byte	3
	.byte	0
	.byte	7
	.byte	6
	.byte	6
	.byte	4
	.byte	8
	.byte	6
	.byte	6
	.byte	4
	.byte	8
	.byte	7
	.byte	7
	.byte	5
	.byte	9
	.byte	8
	.byte	8
	.byte	6
	.byte	11
	.byte	9
	.byte	9
	.byte	6
	.byte	11
	.byte	11
	.byte	11
	.byte	7
	.byte	12
	.byte	11
	.byte	11
	.byte	9
	.byte	12
	.byte	12
	.byte	12
	.byte	11
	.byte	12
	.byte	12
	.byte	12
	.byte	11
	.byte	13
	.byte	13
	.byte	13
	.byte	12
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	14
	.byte	13
	.byte	13
	.byte	14
	.byte	14
	.byte	14
	.byte	13
	.byte	14
	.byte	14
	.byte	14
	.byte	14
	.byte	4
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	4
	.byte	0
	.byte	0
	.byte	6
	.byte	5
	.byte	4
	.byte	0
	.byte	6
	.byte	5
	.byte	5
	.byte	4
	.byte	7
	.byte	5
	.byte	5
	.byte	4
	.byte	7
	.byte	5
	.byte	5
	.byte	4
	.byte	7
	.byte	6
	.byte	6
	.byte	4
	.byte	7
	.byte	6
	.byte	6
	.byte	4
	.byte	8
	.byte	7
	.byte	7
	.byte	5
	.byte	8
	.byte	8
	.byte	7
	.byte	6
	.byte	9
	.byte	8
	.byte	8
	.byte	7
	.byte	9
	.byte	9
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	9
	.byte	8
	.byte	10
	.byte	9
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	10
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	0
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	0
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.align	2
	.type	coeff_token_bits, @object
	.size	coeff_token_bits, 272
coeff_token_bits:
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	5
	.byte	1
	.byte	0
	.byte	0
	.byte	7
	.byte	4
	.byte	1
	.byte	0
	.byte	7
	.byte	6
	.byte	5
	.byte	3
	.byte	7
	.byte	6
	.byte	5
	.byte	3
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	15
	.byte	6
	.byte	5
	.byte	4
	.byte	11
	.byte	14
	.byte	5
	.byte	4
	.byte	8
	.byte	10
	.byte	13
	.byte	4
	.byte	15
	.byte	14
	.byte	9
	.byte	4
	.byte	11
	.byte	10
	.byte	13
	.byte	12
	.byte	15
	.byte	14
	.byte	9
	.byte	12
	.byte	11
	.byte	10
	.byte	13
	.byte	8
	.byte	15
	.byte	1
	.byte	9
	.byte	12
	.byte	11
	.byte	14
	.byte	13
	.byte	8
	.byte	7
	.byte	10
	.byte	9
	.byte	12
	.byte	4
	.byte	6
	.byte	5
	.byte	8
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	2
	.byte	0
	.byte	0
	.byte	7
	.byte	7
	.byte	3
	.byte	0
	.byte	7
	.byte	10
	.byte	9
	.byte	5
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	4
	.byte	6
	.byte	5
	.byte	6
	.byte	7
	.byte	6
	.byte	5
	.byte	8
	.byte	15
	.byte	6
	.byte	5
	.byte	4
	.byte	11
	.byte	14
	.byte	13
	.byte	4
	.byte	15
	.byte	10
	.byte	9
	.byte	4
	.byte	11
	.byte	14
	.byte	13
	.byte	12
	.byte	8
	.byte	10
	.byte	9
	.byte	8
	.byte	15
	.byte	14
	.byte	13
	.byte	12
	.byte	11
	.byte	10
	.byte	9
	.byte	12
	.byte	7
	.byte	11
	.byte	6
	.byte	8
	.byte	9
	.byte	8
	.byte	10
	.byte	1
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	15
	.byte	0
	.byte	0
	.byte	0
	.byte	15
	.byte	14
	.byte	0
	.byte	0
	.byte	11
	.byte	15
	.byte	13
	.byte	0
	.byte	8
	.byte	12
	.byte	14
	.byte	12
	.byte	15
	.byte	10
	.byte	11
	.byte	11
	.byte	11
	.byte	8
	.byte	9
	.byte	10
	.byte	9
	.byte	14
	.byte	13
	.byte	9
	.byte	8
	.byte	10
	.byte	9
	.byte	8
	.byte	15
	.byte	14
	.byte	13
	.byte	13
	.byte	11
	.byte	14
	.byte	10
	.byte	12
	.byte	15
	.byte	10
	.byte	13
	.byte	12
	.byte	11
	.byte	14
	.byte	9
	.byte	12
	.byte	8
	.byte	10
	.byte	13
	.byte	8
	.byte	13
	.byte	7
	.byte	9
	.byte	12
	.byte	9
	.byte	12
	.byte	11
	.byte	10
	.byte	5
	.byte	8
	.byte	7
	.byte	6
	.byte	1
	.byte	4
	.byte	3
	.byte	2
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	4
	.byte	5
	.byte	6
	.byte	0
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	43
	.byte	44
	.byte	45
	.byte	46
	.byte	47
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	58
	.byte	59
	.byte	60
	.byte	61
	.byte	62
	.byte	63
	.align	2
	.type	chroma_dc_total_zeros_len, @object
	.size	chroma_dc_total_zeros_len, 12
chroma_dc_total_zeros_len:
	.byte	1
	.byte	2
	.byte	3
	.byte	3
	.byte	1
	.byte	2
	.byte	2
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.align	2
	.type	chroma_dc_total_zeros_bits, @object
	.size	chroma_dc_total_zeros_bits, 12
chroma_dc_total_zeros_bits:
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.align	2
	.type	total_zeros_len, @object
	.size	total_zeros_len, 256
total_zeros_len:
	.byte	1
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	9
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.space	1
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	5
	.byte	6
	.space	2
	.byte	5
	.byte	3
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.space	3
	.byte	4
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.space	4
	.byte	6
	.byte	5
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	6
	.space	5
	.byte	6
	.byte	5
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	3
	.byte	4
	.byte	3
	.byte	6
	.space	6
	.byte	6
	.byte	4
	.byte	5
	.byte	3
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	6
	.space	7
	.byte	6
	.byte	6
	.byte	4
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	5
	.space	8
	.byte	5
	.byte	5
	.byte	3
	.byte	2
	.byte	2
	.byte	2
	.byte	4
	.space	9
	.byte	4
	.byte	4
	.byte	3
	.byte	3
	.byte	1
	.byte	3
	.space	10
	.byte	4
	.byte	4
	.byte	2
	.byte	1
	.byte	3
	.space	11
	.byte	3
	.byte	3
	.byte	1
	.byte	2
	.space	12
	.byte	2
	.byte	2
	.byte	1
	.space	13
	.byte	1
	.byte	1
	.space	14
	.space	16
	.align	2
	.type	total_zeros_bits, @object
	.size	total_zeros_bits, 256
total_zeros_bits:
	.byte	1
	.byte	3
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	2
	.byte	1
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.space	1
	.byte	5
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	4
	.byte	3
	.byte	2
	.byte	3
	.byte	2
	.byte	1
	.byte	1
	.byte	0
	.space	2
	.byte	3
	.byte	7
	.byte	5
	.byte	4
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	0
	.space	3
	.byte	5
	.byte	4
	.byte	3
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	1
	.byte	0
	.space	4
	.byte	1
	.byte	1
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	1
	.byte	0
	.space	5
	.byte	1
	.byte	1
	.byte	5
	.byte	4
	.byte	3
	.byte	3
	.byte	2
	.byte	1
	.byte	1
	.byte	0
	.space	6
	.byte	1
	.byte	1
	.byte	1
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	0
	.space	7
	.byte	1
	.byte	0
	.byte	1
	.byte	3
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.space	8
	.byte	1
	.byte	0
	.byte	1
	.byte	3
	.byte	2
	.byte	1
	.byte	1
	.space	9
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	3
	.space	10
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.space	11
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.space	12
	.byte	0
	.byte	1
	.byte	1
	.space	13
	.byte	0
	.byte	1
	.space	14
	.space	16
	.align	2
	.type	run_len, @object
	.size	run_len, 112
run_len:
	.byte	1
	.byte	1
	.space	14
	.byte	1
	.byte	2
	.byte	2
	.space	13
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.space	12
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.space	11
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.space	10
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.space	9
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.space	1
	.align	2
	.type	run_bits, @object
	.size	run_bits, 112
run_bits:
	.byte	1
	.byte	0
	.space	14
	.byte	1
	.byte	1
	.byte	0
	.space	13
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.space	12
	.byte	3
	.byte	2
	.byte	1
	.byte	1
	.byte	0
	.space	11
	.byte	3
	.byte	2
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.space	10
	.byte	3
	.byte	0
	.byte	1
	.byte	3
	.byte	2
	.byte	5
	.byte	4
	.space	9
	.byte	7
	.byte	6
	.byte	5
	.byte	4
	.byte	3
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.space	1
	.local	done.10759
	.comm	done.10759,4,4
	.local	coeff_token_vlc
	.comm	coeff_token_vlc,64,4
	.local	chroma_dc_coeff_token_vlc
	.comm	chroma_dc_coeff_token_vlc,16,4
	.local	total_zeros_vlc
	.comm	total_zeros_vlc,240,4
	.local	chroma_dc_total_zeros_vlc
	.comm	chroma_dc_total_zeros_vlc,48,4
	.local	run_vlc
	.comm	run_vlc,96,4
	.local	run7_vlc
	.comm	run7_vlc,16,4
	.align	2
	.type	svq3_scan, @object
	.size	svq3_scan, 16
svq3_scan:
	.byte	0
	.byte	1
	.byte	2
	.byte	6
	.byte	10
	.byte	3
	.byte	7
	.byte	11
	.byte	4
	.byte	8
	.byte	5
	.byte	9
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.ident	"GCC: (GNU) 4.3.3"
