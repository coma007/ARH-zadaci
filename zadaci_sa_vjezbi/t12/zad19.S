# sortiranje niza uh
# Mica

.section .data
NELEM = 12
niz: .long -3, 7, -1, -4, 21, 88, 6, 753, -11, 9, 0, -3

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
   
   movl (%edx,%esi,4), %eax # trenutni krajnji -> eax

ostali:

   decl %ebx
   cmpl $0, %ebx
   jl krajnji
 
   movl (%edx,%ebx, 4), %ecx # clan niza koji se poredi -> ecx
  
   cmpl %ecx, %eax
   jle zamjena

   jmp ostali

zamjena:

   xchgl %eax, %ecx
   movl %eax, (%edx,%esi,4)
   movl %ecx, (%edx,%ebx,4)
   jmp ostali


kraj:

   movl $1, %eax
   movl $0, %ebx
   int $0x80
