.data
X: .quad 0x4444555566667777, 0x0000111122223333, 0xaaaa999988887777, 0x0088777766665555
Y: .quad 0xddddccccbbbbaaaa, 0xddddeeeeffff0000, 0x9999aaaabbbbcccc, 0x0044333322221111

.text
.global main
main:
    mov $X, %rax
    mov $Y, %rbx

    mov 24(%rax), %r13
    mov 16(%rax), %r12
    mov  8(%rax), %r11
    mov   (%rax), %r10

    add 24(%rbx), %r13
    adc 16(%rbx), %r12
    adc  8(%rbx), %r11
    adc   (%rbx), %r10

    call  finish
