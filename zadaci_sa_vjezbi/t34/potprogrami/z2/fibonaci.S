# Milica Sladakovic SV 18/2020
# Fibonaci sa rekurzijom
# ----------------------------

.section .text
.global fibonaci
#(int n, int *g)

fibonaci:
    pushl %ebp
    movl %esp, %ebp
    subl $4, %esp
    movl $0, -4(%ebp)   

    movl $1, %eax # f1
    movl $1, %ecx # f2

prvi:

	addl %eax
