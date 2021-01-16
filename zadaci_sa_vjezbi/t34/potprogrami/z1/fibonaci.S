.section .text
.globl fibonaci
# int fibonaci(int n, int* rez)

fibonaci:
    pushl %ebp
    movl %esp, %ebp
    subl $4, %esp
    movl $0, -4(%ebp)   

    movl $1, %eax # f1
    movl $1, %ecx # f2

fib_petlja:

	cmpl $2, 8(%ebp)
    jbe fib_kraj
    addl %eax, %ecx
    jc fib_greska # ako se desi greska
    xchgl %eax, %ecx
    decl 8(%ebp)
    jmp fib_petlja

fib_greska:

    incl -4(%ebp)

fib_kraj:

    movl 12(%ebp), %edx # premjesti adresu rez u registar
    movl %eax, (%edx)   # stavi vrijednost rez na fn
    movl -4(%ebp), %eax # u eax greskas

    movl %ebp, %esp     # brisi sve lokalne promjenljive

    popl %ebp
    ret  
