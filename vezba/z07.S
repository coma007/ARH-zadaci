# Milica Sladakovic SV 18/2020
# uklanjanje razmaka sa pocetka i kraja stringa
# ---------------------------------------------

.section .data
string: .ascii "      milica    \0"

.section .text
.global main

main:

	movl $string, %eax
	xorl %esi, %esi

nadji_kraj:
	
	movb (%eax, %esi, 1), %bl
	cmpb $0, %bl
	je kraj_stringa
	incl %esi

	jmp nadji_kraj

kraj_stringa:


	decl %esi
	cmpb $' ', (%eax,%esi,1)
	je kraj_stringa

	movb $0, 1(%eax, %esi, 1)

vrati_pocetak:

	xorl %esi, %esi

provjeri_pocetak:

	cmpb $' ', (%eax, %esi,1)
	jne kraj

	incl %esi

	cmpb $' ', (%eax, %esi, 1)
	jne pomjeri

	jmp provjeri_pocetak

pomjeri:

	movb (%eax, %esi, 1), %bl
	movb %bl, -1(%eax, %esi, 1)

	cmpb $0, %bl
	je vrati_pocetak

	incl %esi

	jmp pomjeri
	

kraj:

	movl $1, %eax
	movl $0, %ebx
	int $0x80
