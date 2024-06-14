.data
X:  .quad  5
Y:  .quad  11

.text
.global main

power:
    cmp $0, %rsi # q == 0 ?
    jle L1
    dec %rsi
    call power
    mul %rdi
    ret
L1:
    mov $1, %rax
    ret

main:
    mov X, %rdi
    mov Y, %rsi
    call power
    call finish
