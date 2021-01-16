.section .data

str_unos:   .ascii "Unesite string:\0"
unos_len = . - str_unos

str_ispis:  .ascii "\nObrnuti redosled:\n\0"
ispis_len = . - str_ispis

str_len = 21    # dužina jednog stringa (20 znakova + Enter)
str_num = 10    # broj stringova
strings: .fill str_len*str_num, 1, 42
adresa_zadnjeg: .long 0

str_lens:   .fill str_num,4,0 # niz duzina stringova
# adr_elementa = strings + indeks * str_len

.section .text
.global main

main:

	movl $0, %esi
	movl $strings, %ecx
	movl %ecx, adresa_zadnjeg

upis:

	cmpl $str_num, %esi
	je ispis

	movl $4, %eax
	movl $0, %ebx
	leal str_unos, %ecx
	movl $unos_len, %edx
	int $0x80

	movl $3, %eax
	movl $0, %ebx
	movl adresa_zadnjeg, %ecx
	movl $str_len, %edx
	int $0x80
	movl %eax, str_lens(,%esi,4) # premjesti duzinu na listu duzina
	addl $str_len, adresa_zadnjeg

	incl %esi
	
	jmp upis

ispis:

	movl $4, %eax
	movl $0, %ebx
	leal str_ispis, %ecx
	movl $ispis_len, %edx
	int $0x80

petlja_ispis:

	decl %esi
	subl $str_len, adresa_zadnjeg

	movl $4, %eax
	movl $0, %ebx
	movl adresa_zadnjeg, %ecx
	movl str_lens(,%esi,4), %edx
	int $0x80
	
	

	cmpl $0, %esi
	je kraj

	jmp petlja_ispis

	
kraj:

	movl $1, %eax
	movl $0, %ebx
	int $0x80
