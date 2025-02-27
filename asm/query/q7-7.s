        .data
N:      .quad 6
        .text
        .globl main
main:
        mov N, %rcx
        mov $1, %rax
L1:
        mul %rcx
        loop L1
        call finish
