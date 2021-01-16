# milica

.section .text
.global inter_to_oct_str_float
# unsigned int inter_to_oct_str_float(unsigned int broj, char* str, unsigned int duzina);

inter_to_oct_str_float:

	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp    
	
	movl $0, -4(%ebp) # za gresku

	pushl %ebx
	pushl %esi
	pushl %edi
	
	movl 8(%ebp), %eax # broj
	movl 12(%ebp), %ecx # adresa stringa

	movl $8, %ebx
	movl $100000000, %edi

	andl %eax, %eax
	jns pocetak

	negl %eax
	movb $'-', (%ecx)
	incl %ecx
	decl 16(%ebp)

pocetak:

	cmpl $3, 16(%ebp)
	jle greska

	movb $'0', (%ecx)
	incl %ecx
	movb $'.', (%ecx)
	incl %ecx

	decl 16(%ebp)


pretvori:

	decl 16(%ebp) # ako nema mjesta za ENTER
	cmpl $1, 16(%ebp)
	je ok

	xorl %edx, %edx
	mull %ebx
	divl %edi
	addb $'0', %al
	movb %al, (%ecx)
	incl %ecx # next adresa
	movl %edx, %eax
	andl %eax, %eax
	jnz pretvori

ok:

	movb $0, (%ecx)

	jmp kraj

greska:
	
	incl -4(%ebp)

kraj:

	movl -4(%ebp), %eax

	popl %edi
	popl %esi
	popl %ebx

	movl %ebp, %esp
	popl %ebp

	ret
