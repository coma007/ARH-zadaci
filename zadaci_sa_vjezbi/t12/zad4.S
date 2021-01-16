# neko premjestanje
# mica

.section .data
a: .long 0x12345678 # 0x78 0x56 0x34 0x12
.section .text
.globl main

main:
	movb a, %al #najnizi 8bit reg u eax (0x12)
	movb a+1, %ah
	movb a+2, %bl
	movb a+3, %bh

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
