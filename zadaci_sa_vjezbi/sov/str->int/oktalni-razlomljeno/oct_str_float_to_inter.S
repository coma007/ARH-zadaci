# milica

.section .text
.global oct_str_float_to_inter
# unsigned int oct_str_float_to_inter(char* str, unsigned int* greska)

oct_str_float_to_inter:

	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp

	movl $100000000, -4(%ebp)

	pushl %ebx
	pushl %esi
	pushl %edi

	movl 8(%ebp), %ecx  # adresa stringa

	movl $8, %esi       # osnova sistema
	movl $0, %edi       # greska
			
	xorl %eax, %eax     # trenutni broj
	xorl %ebx, %ebx     # rez

dodji_do_kraja:

	movb 1(%ecx), %al
	andb %al, %al
	jz pretvori

	incl %ecx
	jmp dodji_do_kraja

pretvori:

	movb (%ecx), %al
	cmpb $'.', %al
	je kraj

	subb $'0', %al
	
	cmpb $0, %al
	jl greska
	cmpb $7, %al
	jg greska

	mull -4(%ebp)

	addl %ebx, %eax
	divl %esi
	movl %eax, %ebx

	xorl %eax, %eax

	decl %ecx

	jmp pretvori

greska:
	
	incl %edi

kraj:

	movl %ebx, %eax

	movl 12(%ebp), %ebx
	movl %edi, (%ebx)

	popl %edi
	popl %esi
	popl %ebx
	
	movl %ebp, %esp
	popl %ebp
	
	ret
