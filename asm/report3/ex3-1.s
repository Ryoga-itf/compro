.text

.global main
main:
    mov   $1, %rax
    mov   $2, %rbx
    mov   $3, %rcx
    mov   $4, %rdx

    mov   $0, %rsi
    add   %rax, %rsi
    add   %rbx, %rsi
    add   %rcx, %rsi
    add   %rdx, %rsi

    mov   $1000, %rdi
    sub   %rsi, %rdi

    call  finish
