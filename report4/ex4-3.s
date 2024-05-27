.data
X: .quad 24, -72, -95, -79, -91, 84, -63, -11, 59, 76, -18, 0
Y: .quad 73, -16, 93, -88, 73, 4, -26, -62, 35, -91, 76, 60, 0

.text
.global main
main:
    mov   $0, %rcx
    mov   $X, %rdi

    mov   (%rdi), %rax

LXbegin:
    add   $8, %rdi

    cmpq  $0, (%rdi)
    je    LXend

    cmpq  %rax, (%rdi)
    jg    Xupdate

    jmp   LXbegin

Xupdate:
    mov   (%rdi), %rax
    jmp   LXbegin
LXend:

    mov   $0, %rcx
    mov   $Y, %rdi

    mov   (%rdi), %rbx

LYbegin:
    add   $8, %rdi

    cmpq  $0, (%rdi)
    je    LYend

    cmpq  %rbx, (%rdi)
    jl    Yupdate

    jmp   LYbegin

Yupdate:
    mov   (%rdi), %rbx
    jmp   LYbegin
LYend:

    call  finish
