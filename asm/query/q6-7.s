        .data
X:      .byte 0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef
Y:      .quad 0x9988776655443322
        .text
        .globl main
main:
        movq X, %rax
        movq $Y, %rbx
        movq $3, %rcx
        movq $0, %rdx
        movb (%rbx, %rcx, 1), %dl # dl is the lowest 8 bits of rdx
        call finish
