.data
P: .quad 72, 0, -91, -63, 54, 0, 0, 22, 8, -30
S: .quad 999, 999, 999, 999, 999, 999, 999, 999, 999, 999

.text
.global main
main:
    mov $P, %rax
    mov $S, %rbx
    mov $0, %rcx
Lloop:
    cmp $10, %rcx
    jge Lfin
    cmp $0, (%rax, %rcx, 8)
    jg Lposi
    jl Lnega
Lzero:
    movq $0, (%rbx, %rcx, 8)
    jmp Ljoin
Lposi:
    movq $1, (%rbx, %rcx, 8)
    jmp Ljoin
Lnega:
    movq $-1, (%rbx, %rcx, 8)
Ljoin:
    add $1, %rcx
    jmp Lloop
Lfin:
    call finish
