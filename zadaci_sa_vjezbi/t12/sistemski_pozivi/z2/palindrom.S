# Palindromi
# Mica

.section .data

poruka: .ascii "Unesite string:\0"
len_poruka = . - poruka

nijep:  .ascii "String nije palindrom.\n\0"
len_nijep = . - nijep

jestep: .ascii "String je palindrom.\n\0"
len_jestep = . - jestep

unos:   .fill 50,1,42

.section .text
.globl main

main:

    movl $4, %eax
    movl $1, %ebx
    leal poruka, %ecx
    movl $len_poruka, %edx
    int $0x80

    movl $3, %eax
    movl $0, %ebx
    leal unos, %ecx
    movl $50, %edx
    int $0x80

    addl $unos-2, %eax
    movl $unos, %ebx

provjeraP:

    movb (%ebx), %cl    # s pocetka
    cmpb $'a', %cl
    jb promjenaP
    cmpb $'z', %cl
    ja promjenaP

provjeraK:

    movb (%ebx), %cl 
    movb (%eax), %dl    # s kraja
    cmpb $'a', %dl
    jb promjenaK 
    cmpb $'z', %cl
    ja promjenaK  

mozda:
    
    cmpb %dl, %cl
    jne nije
    
    decl %eax
    incl %ebx

    cmpl %eax, %ebx
    jg jeste

    jmp provjeraP
    
promjenaP:   # promjena pocetka stringa

    cmpb $65, %cl
    jb brojP
    cmpb $90, %cl
    ja znakP

    addb $'a'-'A', (%ebx)

    jmp provjeraK
    

promjenaK:   # promjena kraja stringa

    cmpb $65, %dl
    jb brojK
    cmpb $90, %dl
    ja znakK

    addb $'a'-'A', (%eax)

    jmp provjeraK

brojP:

    cmpb $48, %cl
    jb znakP
    cmpb $57, %cl
    ja znakP

    jmp provjeraK

brojK:

    cmpb $48, %dl
    jb znakK
    cmpb $57, %dl
    ja znakK

    jmp mozda

znakP:
    
    incl %ebx
    cmpl %eax, %ebx
    jg jeste

    jmp provjeraK


znakK:
    
    decl %eax
    cmpl %eax, %ebx
    jg jeste

    jmp provjeraK
    

jeste: 

    movl $4, %eax
    movl $1, %ebx
    leal jestep, %ecx
    movl $len_jestep, %edx
    int $0x80

    movl $0, %ebx

    jmp kraj

nije: 

    movl $4, %eax
    movl $1, %ebx
    leal nijep, %ecx
    movl $len_nijep, %edx
    int $0x80

    movl $1, %ebx

kraj:
    movl $1, %eax
    int $0x80
    

