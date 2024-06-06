.text
.global main

collatz:
    mov %rdi, %rax
    mov %rdi, %rbx
    and $1, %rbx
    jz Even
    # * 3 + 1
    add %rax, %rax
    add %rdi, %rax
    add $1, %rax
    ret
Even:
    # / 2
    shr $1, %rax
    ret

main:
    mov $25, %rdi
    call collatz
    mov %rax, %rdi
    call collatz
    mov %rax, %rdi
    call collatz
    mov %rax, %rdi
    call collatz
    mov %rax, %rdi
    call collatz
    mov %rax, %rdi
    call collatz
    call finish
