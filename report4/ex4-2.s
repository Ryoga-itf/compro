.data
N:  .int  56789

.text
.global main
main:
    mov   N, %rax
    mov   $1, %rbx
    mov   $10, %rcx
Lbegin:
    mov   $0, %rdx
    div   %rcx

    cmp   $0, %rax
    je    Lend

    add   $1, %rbx
    jmp   Lbegin
Lend:
    mov   %rbx, %rax
    call  finish
