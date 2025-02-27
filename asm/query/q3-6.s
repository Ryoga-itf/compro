        .text
        .globl main
main:
        mov $1, %rax
        mov $0, %rcx
.L1:
        cmp $10, %rax
        je .L2
        add %rax, %rcx
        add $1, %rax
        jmp .L1
.L2:
        call finish
