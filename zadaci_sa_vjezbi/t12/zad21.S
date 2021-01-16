# sortiranje niza uh
# Mica

.section .data
NELEM = 12
niz: .word -3, 7, -1, -4, 21, 88, 6, 753, -11, 9, 0, -3

.section .text
.globl main

main:

    movl $NELEM, %esi # veliki brojac
    movl $niz, %edx # baza


krajnji:

   decl %esi
   cmpl $0, %esi
   jl kraj

   movl %esi, %ebx # mali brojac
   
   movw (%edx,%esi,2), %ax # trenutni krajnji -> eax

ostali:

   decl %ebx
   cmpl $0, %ebx
   jl krajnji
 
   movw (%edx,%ebx, 2), %cx # clan niza koji se poredi -> ecx
  
   cmpw %cx, %ax
   jle zamjena

   jmp ostali

zamjena:

   xchgw %ax, %cx
   movw %ax, (%edx,%esi,2)
   movw %cx, (%edx,%ebx,2)
   jmp ostali


kraj:

   movl $1, %eax
   movl $0, %ebx
   int $0x80
