        .text
        .globl main
main:
        mov $0xc, %rax
        shl $60, %rax
        mov $0x9, %rbx
        shl $60, %rbx
        mov %rax, %rcx
        adc %rbx, %rcx
        mov $0, %rdx
        adc $0, %rdx
        shr $60, %rcx
        call finish
