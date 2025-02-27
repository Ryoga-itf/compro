         .text
        .globl mul5
        .globl main
mul5:
        mov %rdi, %rax
        mov $0, %rdx
        mov $5, %rbx
        mul %rbx
        ret
main:
        mov $4, %rbx
        mov $7, %rdx
        mov $9, %rdi
        push %rbx
        push %rdx
        call mul5
        pop %rdx
        pop %rbx
        add %rdx, %rax
        add %rbx, %rax
        call finish
