# poredjenje brojeva u dvostrukoj preciznosti
# Milica Sladakovic SV 18/2020
# --------------------------------------------

.section .data
a: .quad 0x1234123412341234
b: .quad 0x1234123412341233

.section .text
.global main

main:

	movl a+4, %eax
    cmpl b+4, %eax

	jg a_vece
    jl b_vece

    movl a, %eax
    cmpl b, %eax
  
    ja a_vece
    jb b_vece

	movl $0, %eax
	jmp kraj

a_vece:

    movl $1, %eax
    jmp kraj

b_vece:

    movl $-1, %eax

kraj:

    movl $1, %eax
    int $0x80

