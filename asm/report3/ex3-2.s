.data
N:  .int  100

.text
.global main
main:
    mov   $0, %rax
    mov   $1, %rcx
LOOP1:
    add   %rcx, %rax

    cmp   N, %rcx
    je    LOOP2

    add   $1, %rcx
    jmp   LOOP1
LOOP2:

    call  finish
