        .text
        .globl main
main:
        mov $100, %rax
        mov $0, %rdx
        mov $17, %r12
        div %r12
        test %rdx, %rdx
        jz L1
        mov $1, %r8
        jmp L2
L1:
        mov $0, %r8
L2:
        call finish
