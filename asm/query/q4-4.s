        .data
A: .quad 0, 0, 0, 0, 0, 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
        .text
        .globl main
main:
        mov $3, %rcx
        mov $A, %rsi
        lea 48(%rsi,%rcx,8), %rdx
        mov (%rdx), %rax
        call finish
