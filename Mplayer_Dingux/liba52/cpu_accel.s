	.file	1 "cpu_accel.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 3
	.abicalls
	.text
	.align	2
	.globl	a52_detect_accel
	.ent	a52_detect_accel
	.type	a52_detect_accel, @function
a52_detect_accel:
	.set	nomips16
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	j	$31
	move	$2,$4

	.set	macro
	.set	reorder
	.end	a52_detect_accel
	.ident	"GCC: (GNU) 4.3.3"
