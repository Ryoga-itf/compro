.data
X: .quad 590, -600, 78, -408
Y: .quad 10, 8, -3, -24

.text
.global main
main:
    # i = 1
    mov X, %rax
    cqto
    idivq Y
    movq %rax, %r8

    # i = 2
    mov X+8, %rax
    cqto
    idivq Y+8
    movq %rax, %r9

    # i = 3
    mov X+16, %rax
    cqto
    idivq Y+16
    movq %rax, %r10
    
    # i = 4
    mov X+24, %rax
    cqto
    idivq Y+24
    movq %rax, %r11

    call  finish
