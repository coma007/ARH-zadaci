# milica

.section .text
.global oct_str_to_inter

# unsigned int oct_str_to_inter(char* str, unsigned int* greska);

oct_str_to_inter:

	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp

	pushl %ebx
	pushl %esi
	pushl %edi

	movl $1, -4(%ebp)   # oznaceni

	movl 8(%ebp), %ecx  # adresa stringa

	movl $8, %esi       # osnova sistema
	movl $0, %edi       # greska
			
	xorl %eax, %eax     # rezultat
	xorl %ebx, %ebx     # trenutni broj

	movb (%ecx), %bl
	cmpb $'+', %bl
	je znak

	cmpb $'-', %bl
	jne pretvori

	negl -4(%ebp)

znak:

	incl %ecx

pretvori:

	movb (%ecx), %bl
	andb %bl, %bl
	jz kraj_pr

	subb $'0', %bl
	
	cmpb $0, %bl
	jl greska1
	cmpb $7, %bl
	jg greska1

	mull %esi
	js greska2
	andl %edx, %edx
	jnz greska2

	addl %ebx, %eax

	incl %ecx

	jmp pretvori

kraj_pr:
	
	imull -4(%ebp)
	jo greska2

	cmpl 8(%ebp), %ecx
	jne kraj

greska1:
	
	incl %edi
	jmp kraj

greska2:

	addl $2, %edi

kraj:

	movl 12(%ebp), %ebx
	movl %edi, (%ebx)

	popl %edi
	popl %esi
	popl %ebx
	
	movl %ebp, %esp
	popl %ebp
	
	ret
