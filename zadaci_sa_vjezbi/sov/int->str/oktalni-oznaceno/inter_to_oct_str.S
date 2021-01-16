# milica

.section .text
.global inter_to_oct_str
# unsigned int inter_to_oct_str(unsigned int broj, char* str, unsigned int duzina);

inter_to_oct_str:

	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp    
	
	movl $0, -4(%ebp) # za gresku

	pushl %ebx
	pushl %esi
	
	movl 8(%ebp), %eax # broj
	movl 12(%ebp), %ecx # adresa stringa

	movl $8, %ebx

	andl %eax, %eax
	jns pretvori

	negl %eax
	movb $'-', (%ecx)
	incl %ecx
	decl 16(%ebp)

pretvori:

	decl 16(%ebp) # ako nema mjesta za ENTER
	cmpl $1, 16(%ebp)
	jl greska

	xorl %edx, %edx
	divl %ebx
	addb $'0', %dl
	movb %dl, (%ecx)
	incl %ecx # next adresa
	andl %eax, %eax
	jnz pretvori

	movb $0, (%ecx)

	decl %ecx
	movl 12(%ebp), %esi # adresa stringa 

	cmpb $'-', (%esi)
	jne obrni

	incl %esi

obrni:

	cmpl %ecx, %esi
	jae kraj

	movb (%ecx), %al
	movb (%esi), %ah
	movb %al, (%esi)
	movb %ah, (%ecx)

 	decl %ecx
	incl %esi

	jmp obrni

greska:
	
	incl -4(%ebp)

kraj:

	movl -4(%ebp), %eax

	popl %esi
	popl %ebx

	movl %ebp, %esp
	popl %ebp

	ret
