# Milica Sladakovic INDEX SV 18/2020
# postavljanje maske
# ----------------------------------

.section .text
.global maska
# unsigned int maska(unsigned int n, unsigned int v)

maska:

	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp # polje za 32 bit masku

	movl 8(%ebp), %eax		# n
	movl 12(%ebp), %ecx		# v

	movl $0, -4(%ebp)

	cmpl $1, %ecx
	ja kraj
	cmpl $0, %ecx
	jl kraj

	cmpl $32, %eax
	jae kraj
	cmpl $0, %ecx
	jl kraj

	incl -4(%ebp)

maska_nula:

	cmpl $0, %eax
	je provjeri

	roll $1, -4(%ebp)
	decl %eax

	jmp maska_nula

provjeri:

	cmpl $1, %ecx
	je kraj
	
	notl -4(%ebp)

kraj:

	movl -4(%ebp), %eax
	movl %ebp, %esp

	popl %ebp
	ret
	


	
