.section .text
.global fibonaci
# int fibonaci(int n, unsigned int* rez);

fibonaci:

	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp # lokalna promjenljiva za zbir -4 i za gresku -8

	movl $0, -8(%ebp)
	
	movl $1, %ecx   # f1
	movl $1, %edx	# f1
	movl %edx, -4(%ebp)

petljica:

	cmpl $2, 8(%ebp)	
	jl greska
	je kraj

	addl %ecx, -4(%ebp)
	jc greska
	movl %edx, %ecx
	movl -4(%ebp), %edx
	
	decl 8(%ebp)
	jmp petljica

greska:

	incl -8(%ebp)

kraj:

	movl 12(%ebp), %ecx
	movl %edx, (%ecx)
	movl -8(%ebp), %eax

	movl %ebp, %esp
	popl %ebp
	ret
	
