        .text
        .globl main
main:
        mov $5, %rax
        inc %rax
        inc %rax
        inc %rax
        dec %rax
        neg %rax
        inc %rax
        inc %rax
        neg %rax
        dec %rax
        call finish
