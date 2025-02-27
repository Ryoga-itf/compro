        .data
x: .quad 0xdeadbeefcafebabe
y: .quad 0xff00ff00ff00ff00
z: .quad 0x0000000000008888
        .text
        .globl main
main:
        mov x, %rax
        and y, %rax
        #
        mov x, %rbx
        mov y, %rsi
        sar $32, %rsi
        or %rsi, %rbx
        #
        mov x, %rcx
        xor z, %rcx
        #
        mov x, %rdx
        not %rdx
        shr $56, %rdx
        call finish
