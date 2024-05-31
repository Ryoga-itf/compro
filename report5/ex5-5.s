.text
.global main
main:
    # r8, r9 = -17 / 5
    mov $-17, %rax
    cqto
    mov $5, %rbx
    idiv %rbx
    mov %rax, %r8
    mov %rdx, %r9

    # r10, r11 = -17 / -5
    mov $-17, %rax
    cqto
    mov $-5, %rbx
    idiv %rbx
    mov %rax, %r10
    mov %rdx, %r11

    # r12, r13 = 17 / -5
    mov $17, %rax
    cqto
    mov $-5, %rbx
    idiv %rbx
    mov %rax, %r12
    mov %rdx, %r13

    call finish
