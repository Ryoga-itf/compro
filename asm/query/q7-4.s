        .text
        .globl fact
        .globl main
fact:
        cmp $1, %rdi
        jle L1
        push %rdi
        sub $1, %rdi
        call fact
        pop %rdi
        mul %rdi
        ret
L1:
        mov %rdi, %rax
        ret
main:
        mov $10, %rdi
        call fact
        call finish
