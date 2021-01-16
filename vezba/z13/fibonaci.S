.section .text

.global fibonaci
#unsigned int fibonaci(int n, int *g);

f_n:

	pushl %ebx
	
	xorl %ebx, %ebx
	addl %ecx, %ebx
	addl %edx, %ebx
	movl %ebx, %edx

	popl %ebx
	ret

fibonaci:

	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp # polje za gresku

	movl $1, %ecx
	movl $1, %edx

petljica:

	cmpl $2, 12(%ebp)
	jl greska
	je kraj

	pushl %ecx
	pushl %edx
	call f_n


	

greska:

	incl -4(%esp)

kraj:

	movl -4(%esp), 8(%ebp)

	movl %ebp, %esp
	popl %ebp
	ret
