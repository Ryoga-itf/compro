        .data
x: .quad 0x8877665544332211
        .text
        .globl main
main:
        mov $0, %rax
        mov $0, %rbx
        mov $x, %r14
        movb (%r14), %al
        movl (%r14), %ebx
        call finish
