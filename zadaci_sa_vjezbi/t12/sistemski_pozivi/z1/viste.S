.section .data

poruka1: .ascii "Unesite ime i prezime: \0"
duzina1 =  . - poruka1

poruka2: .ascii "Vi ste: \0"
duzina2 = . - poruka2

imeprez: .fill 50,1,42


.section .text
.globl main

main:
    movl $4, %eax
    movl $1, %ebx
    leal poruka1, %ecx
    movl $duzina1, %edx
    int $0x80

    movl $3, %eax
    movl $0, %ebx
    leal imeprez, %ecx
    movl $50, %edx
    int $0x80
    movl %eax, %esi

    leal imeprez, %eax

petlja:
    cmpb $'a', (%eax)
    jb dalje
    cmpb $'z', (%eax)
    ja dalje
    addb $'A'-'a', (%eax)

dalje:
    incl %eax
    cmpb $10, (%eax)
    jne petlja

    movl $4, %eax
    movl $1, %ebx
    leal poruka2, %ecx
    movl $duzina2, %edx
    int $0x80

    movl $4, %eax
    movl $1, %ebx
    leal imeprez, %ecx
    movl %esi, %edx
    int $0x80



kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80


    
