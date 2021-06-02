.globl _start
.align	2

_start:

init:
	nop
	li		sp, 5120	# 38420 (== 0x9614) for the code section plus another 1k for the data section
	j		main
