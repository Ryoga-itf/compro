#
# Sample program to test libraries
#

.data
.Lmessage_hello:   .string "Hello\n"
.Lmessage_world:   .string "world!\n"
.Lmessage_goodbye: .string "Goodbye\n"
x: .quad 0x123456789abcdef0

.text
.globl main
main:
        # prologue, boilerplate
        push %rbp
        mov %rsp, %rbp

        mov $1, %rax
        call print_regs
        call print_newline

        # mov $.Lhello_message1, %rdi # does not work on some platforms
        lea .Lmessage_hello(%rip), %rdi # replacement

        call print_message
        call print_newline

        # mov $x, %rdi # does not work on some platforms
        lea x(%rip), %rdi # replacement

        call print_memory
        call print_newline

        mov $2, %rbx
        call print_regs
        call print_newline

        # mov $.Lhello_message2, %rdi # does not work on some platforms
        lea .Lmessage_world(%rip), %rdi # replacement

        call print_message
        call print_newline

        inc %rax
        dec %rbx
        call print_regs
        call print_newline

        # mov $.Lgoodbye_message, %rdi # does not work on some platforms
        lea .Lmessage_goodbye(%rip), %rdi # replacement

        call print_message
        call print_newline

        call silent_finish

        # not reached

        # epilogue, boilerplate
        leave
        ret
