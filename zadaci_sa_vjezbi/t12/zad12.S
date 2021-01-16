# konstanta i greska _ yt primjer
# Mica

.section .data

    a: .long 0x1234abcd
    b = 15

.section .text
.global main

main:

    movl a, %eax
    movl $a, %eax
    movl $b, %eax
    movl b, %eax

kraj:
    movl $1, %eax
    int $0x80
