# sabiranje elemenata niza _ indirektno
# Mica

.section .data
NELEM = 10
niz: .long 1,2,3,4,5,6,7,8,9,10
suma: .long 0

.section .text
.globl main

main:

   movl $niz, %esi # adresa prvog u nizu
   movl suma, %eax

petlja:

   addl (%esi), %eax
   addl $4, %esi
   cmpl $niz+NELEM*4, %esi
   jl petlja

kraj:

   movl %eax, suma
   movl $1, %eaxf
   movl $0, %ebx
   int $0x80

