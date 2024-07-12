.data
X: .quad 0x88771234cdef6b01 # 1+1+3+3+1+1+2+1+2+3+3+4+2+3+0+1 = 31 = 0x1f

.text
.global main
main:
    mov X(%rip), %rbx # safe version of mov x, %rbx
    mov $0, %rax
L1:
    cmp $0, %rbx
    je Lfinish
    mov %rbx, %rsi
    and $1, %rsi
    jz L2
    add $1, %rax
L2:
    shr $1, %rbx
    jmp L1
Lfinish:
    call finish
