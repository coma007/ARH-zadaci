# Milica Sladakovic INDEX SV 18/2020
# postavljanje maske 64bit
# ----------------------------------

.section .text
.global maska64
# unsigned long long maska(unsigned int n, unsigned int v)

maska64:

	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp # polje za 32 bit masku

	movl 8(%ebp), %eax		# n
	movl 12(%ebp), %ecx		# v

	movl $0, -4(%ebp)		# visi
	movl $0, -8(%ebp)		# nizi

	cmpl $1, %ecx
	ja kraj
	cmpl $0, %ecx
	jl kraj

	cmpl $32, %eax
	jae kraj
	cmpl $0, %ecx
	jl kraj

	incl -8(%ebp)

maska_nula:

	cmpl $0, %eax
	je provjeri

	shll $1, -8(%ebp)
	rcll $1, -4(%ebp)
	rcrl $1, -8(%ebp)
	roll $1, -8(%ebp)		

	decl %eax

	jmp maska_nula

provjeri:

	cmpl $1, %ecx
	je kraj
	
	notl -8(%ebp)
	notl -4(%ebp)

kraj:

	movl -8(%ebp), %eax
	movl -4(%ebp), %edx
	movl %ebp, %esp

	popl %ebp
	ret
	


	
