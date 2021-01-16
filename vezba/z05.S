# Milica Sladakovic SV 18/2020
# pronalazenje minimuma i maksimuma niza
# --------------------------------------

.section .data

NELEM = 10
niz: .quad 1, 2, 5, -1, 3, 15, 22, -888, 1259, 0

min: .quad 0
max: .quad 0

.section .text
.global main 

main:

	xorl %esi, %esi
	movl $niz, %eax

novi:

	cmpl $NELEM-1, %esi
	je kraj

	movl (%eax,%esi,8), %ecx # donji
	movl 4(%eax,%esi,8), %edx # gornji

	incl %esi

trazi_min:

	cmpl %edx, min+4
	jl trazi_max
	
	cmpl %ecx, min
	jl trazi_max

	movl %ecx, min
	movl %edx, min+4	

trazi_max:

	cmpl %edx, max+4
	jg novi
	
	cmpl %ecx, max
	jg novi

	movl %ecx, max
	movl %edx, max+4

	jmp novi

kraj:

	movl $1, %eax
	movl $0, %ebx

