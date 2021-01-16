# Milica Sladakovic SV 18/2020
# horizontalni paritet
# ----------------------------
# int SetParity(unsigned short int* v)

.section .text
.global SetParity

SetParity:

	pushl %ebp
	movl %esp, %ebp

	pushl %ebx
	xorl %ebx, %ebx	# brojac

	movl 8(%ebp), %ecx  # vrijednost
	andw $0x7fff, (%ecx)
	
	movw $1, %dx		# maska

testiraj:

	testw %dx, (%ecx)
	jz nula_je

	incl %ebx	

nula_je:
	
	shlw %dx
	jnc testiraj

zavrsi:

	andl $1, %ebx

	movl %ebx, %eax

	shlw $1, (%ecx)
	shrl $1, %ebx
	rcrw $1, (%ecx)

	popl %ebx

	movl %ebp, %esp
	popl %ebp

	ret
	
	
