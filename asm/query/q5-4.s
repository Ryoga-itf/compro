        .text
        .globl main
main:
        mov $9, %rax
        mov $3, %rbx
        mov $2, %rsi
        mov $6, %rdi
        sub %rax, %rbx
        sbb %rsi, %rdi
        imul $-4, %rbx
        call finish
