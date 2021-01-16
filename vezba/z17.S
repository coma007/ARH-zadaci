# Milica Sladakovic SV 18/2020
# spajanje unesenih stringova
# ----------------------------

.section .data

ispis1: .ascii "Unesite prvi string: "
len1 = . - ispis1

ispis2: .ascii "Unesite drugi string: "
len2 = . - ispis2

ispis3: .ascii "Spojeni stringovi: "
len3 = . - ispis3

prvi_string: .fill 100,1,42
duzina1: .long 0

drugi_string: .fill 50,1,42
duzina2: .long 0

.section .text
.global main

main:

	movl $4, %eax
	movl $0, %ebx
	leal ispis1, %ecx
	movl $len1, %edx
	int $0x80

	movl $3, %eax
	movl $0, %ebx
	leal prvi_string, %ecx
	movl $50, %edx
	int $0x80
	movl %eax, duzina1				# duzina prvog stringa

	movl $4, %eax
	movl $0, %ebx
	leal ispis2, %ecx
	movl $len1, %edx
	int $0x80

	movl $3, %eax
	movl $0, %ebx
	leal drugi_string, %ecx
	movl $50, %edx
	int $0x80
	movl %eax, duzina2			# duzina drugog stringa

	xorl %edi, %edi

	movl $prvi_string, %eax	
	movl duzina1, %esi
	decl %esi			# pokazivac na kraj prvog stringa
	addl %esi, %eax

petlja:

	cmpl duzina2, %edi
	je kraj
		
	movb drugi_string(,%edi,1), %bh
	movb %bh, (%eax)
	incl duzina1

	incl %edi
	incl %eax

	jmp petlja

kraj:

	movl $4, %eax
	movl $0, %ebx
	leal ispis3, %ecx
	movl $len3, %edx
	int $0x80

	movl $4, %eax
	movl $0, %ebx
	leal prvi_string, %ecx
	movl duzina1, %edx
	int $0x80
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80








