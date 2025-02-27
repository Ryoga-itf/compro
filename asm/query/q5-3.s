        .data
x1:     .quad 0xaaaaaaaaaaaaaaaa
x2:     .quad 0x3333333333333333
y1:     .quad 0xbbbbbbbbbbbbbbbb
y2:     .quad 0x2222222222222222
        .text
        .globl main
main:
        mov x1, %rax
        mov y1, %rbx
        mov x2, %rcx
        mov y2, %rdx
        # add lo64 parts
        add %rbx, %rax
        # add hi64 parts
        adc %rdx, %rcx
        #
        mov $1, %r8
        mov $0, %r9
        mov $5, %r10
        mov $8, %r11
        # sub lo64 parts
        sub %r8, %r9
        # sub hi64 parts
        sbb %r10, %r11
        #
        call finish
