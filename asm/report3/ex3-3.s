.data
P: .quad 32, 78, 41, -20, 63, 98, 14, 5, -76, 88, 11, 49, 0

.text
.global main
main:
    mov   $0, %rax
    mov   $P, %rdi

LOOP1:
    add   (%rdi), %rax

    add   $8, %rdi
    cmpq  $0, (%rdi)
    je    LOOP2

    jmp   LOOP1
LOOP2:

    call  finish
