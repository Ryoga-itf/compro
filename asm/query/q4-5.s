        .data
X: .quad 123456
        .text
        .globl main
main: 
        mov $X, %rbx
        mov (%rbx), %rcx
        test $1, %rcx
        jz Leven
Lodd:
        mov $1, %rax
        jmp Lf
Leven:
        mov $0, %rax
Lf:
        call finish
