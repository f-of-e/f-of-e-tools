.globl _start
.align	2

_start:

init:
	nop
	li		sp, 35348	# 34324 (== 0x8614) for the code section plus another 1k for the data section
	j		main
