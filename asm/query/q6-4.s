        .text
        .globl f
        .globl main
f:
        mov %rsi, %rax
        add %rdi, %rax
        shl %cl, %rax
        ret
main:
        mov $2, %rdi
        mov $4, %rsi
        mov $8, %cl
        call f
        mov %rax, %rbx
        mov $3, %rdi
        mov $5, %rsi
        mov $16, %cl
        call f
        call finish
