.data
N:  .quad 100000

.text
.global main
Mov0:
    mov N, %rcx
L1:
    mov $0, %rbx
    loop L1
    ret

Xor0:
    mov N, %rcx
L2:
    xor %rbx, %rbx
    loop L2
    ret

main:
    rdtsc
    mov %rax, %r8
    call Mov0
    rdtsc
    sub %r8, %rax
    mov %rax, %r8

    rdtsc
    mov %rax, %r9
    call Xor0
    rdtsc
    sub %r9, %rax
    mov %rax, %r9
    call finish
