.file	1 "cpu_state.c"
.section .mdebug.abi32
.previous
.gnu_attribute 4, 3
.abicalls
.text
.align	2
.globl	a52_cpu_state_init
.ent	a52_cpu_state_init
.type	a52_cpu_state_init, @function
a52_cpu_state_init:
.set	nomips16
.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
.mask	0x00000000,0
.fmask	0x00000000,0
.set	noreorder
.set	nomacro

j	$31
nop

.set	macro
.set	reorder
.end	a52_cpu_state_init
.globl	a52_cpu_state_save
.section	.bss,"aw",@nobits
.align	2
.type	a52_cpu_state_save, @object
.size	a52_cpu_state_save, 4
a52_cpu_state_save:
.space	4
.globl	a52_cpu_state_restore
.align	2
.type	a52_cpu_state_restore, @object
.size	a52_cpu_state_restore, 4
a52_cpu_state_restore:
.space	4
.ident	"GCC: (GNU) 4.3.3"
