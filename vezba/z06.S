# Milica Sladakovic SV 18/2020
# sumirnaje podniza
# -----------------------------

.section .data

NELEM = 11
niz: .quad 1124, 3325, 5124, 6123, 123, 9128, 23948, 17236, 39248, 923874, 192738

prvi = 3
posljednji = 7
suma: .quad 0

greska: .byte 0

.section .text
.global main

main:

	xorl %esi, %esi
	movl $niz, %eax

	cmpl $posljednji, %esi
	jg ne_valja

dodji_do_prvog:

	cmpl $prvi, %esi
	je dalje

	incl %esi
	jmp dodji_do_prvog

dalje:

	cmpl $posljednji, %esi
	jg kraj

	movl (%eax, %esi, 8), %ecx
	movl 4(%eax, %esi, 8), %edx

	addl %ecx, suma
	addl %edx, suma+4

	incl %esi
	jmp dalje

ne_valja:
	
	incb greska

kraj:

	movl $1, %eax
	movl $0, %ebx
	int $0x80
