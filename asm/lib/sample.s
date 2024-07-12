#
# Sample
#

.include "lib.s"

.globl  main
main:
        # initial values
        mov     $3, %rax
        mov     $2, %rbx

        # sum
        mov     %rax, %rcx
        add     %rbx, %rcx

        # difference
        mov     %rax, %rdx
        sub     %rbx, %rdx

        # product
        mov     %rax, %rsi
        imul    %rbx, %rsi

        # print and exit
        call    print_regs
        call    silent_finish
        # call    finish

        # not reached

        ret
