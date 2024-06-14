.data
X:  .quad  31

.text
.global main

cube:
    mov %rdi, %rax
    # x^3 = (x * x) * x
    mul %rdi
    mul %rdi
    ret

div32:
    mov %rdi, %rax
    # floor(x / 32) = (x << 5)
    shr $5, %rax
    ret

main:
    mov X, %rdi
    call cube
    mov %rax, %rdi
    call div32
    mov %rax, %rdi
    call cube
    mov %rax, %rdi
    call div32
    call finish
