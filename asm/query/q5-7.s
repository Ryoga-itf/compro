        .text
        .globl main
main:
        movl $0x11111111, %eax
        addw $0x2222, %ax
        addb $0x33, %ah
        addb $0x44, %al
        mov %rax, %rbx
        ror $16, %rbx
        call finish
