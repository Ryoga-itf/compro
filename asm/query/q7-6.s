        .text
        .globl h
        .globl g
        .globl main
h:
        cmp $1, %rdi
        jl L1
        push %rdi
        sub $1, %rdi
        call h
        pop %rdi
        add %rdi, %rax
        ret
L1:
        mov $0, %rax
        ret
g:
        mov $0, %rax
        call h
        ret
main:
        mov $100, %rdi
        call g
        call finish
