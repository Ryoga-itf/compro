        .text
        .globl main
main:
        mov $1234, %rax
        mov $1234, %rbx
        cmp %rbx, %rax
        je L3
L1:
        jl L2
        add %rax, %rax
        jmp Lf
L2:
        add %rbx, %rbx
        jmp Lf
L3:
        add %rax, %rax
        add %rbx, %rbx
Lf:
        call finish
