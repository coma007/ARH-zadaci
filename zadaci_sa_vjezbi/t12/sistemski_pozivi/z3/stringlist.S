# Smjena stringova
# Mica

.section .data

str_unos:   .ascii "Unesite string:\0"
duzina1 = .- str_unos

str_ispis:  .ascii "\nObrnuti redosled:\n\0"
duzina2 = .- str_ispis

str_len = 21    # dužina jednog stringa (20 znakova + Enter)
str_num = 10    # broj stringova
strings: .fill str_len*str_num,1,42

brojac : .long 0 # indeks trenutnog stringa
adresa : .long 0 # adresa tekuceg stringa
duzina : .fill str_num, 4, 0 # duzina jednog stringa

.section .text
.globl main

main:

    movl $0, brojac     # brojac
    movl $strings, %eax
    movl %eax, adresa   # adresa prvog stringa

petlja:
    
	movl $4, %eax
    movl $1, %ebx
    leal str_unos, %ecx
    movl $duzina1, %edx
    int $0x80

	movl $3, %eax
    movl $0, %ebx
    leal strings, %ecx
    movl $str_len, %edx
    int $0x80


    incl brojac
    movl $brojac, %esi
    cmpl $str_num, %esi
    je kraj

    jmp petlja

    
kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80

