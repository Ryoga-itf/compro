.data
x: .quad 3

.text
.globl main
main:
        # prologue, boilerplate
        push %rbp
        mov %rsp, %rbp

        mov $0, %rax
        mov $1, %rbx
        mov $2, %rcx

        # mov x, %rdx # does not work on some platforms
        mov x(%rip), %rdx # replacement

        mov $-1, %rdi
        mov $-2, %rsi
        call finish

        # not reached

        # epilogue, boilerplate
        leave
        ret
