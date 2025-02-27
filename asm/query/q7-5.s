        .data
funcs:  .quad 0, 0, 0, 0
        .text
        .globl main
func0:
        mov $0, %rax
        ret
func1:
        mov $10, %rax
        ret
func2:
        mov $20, %rax
        ret
func3:
        mov $30, %rax
        ret
main:
        # create function table
        mov $funcs, %rbx
        movq $func0, 0x00(%rbx)
        movq $func1, 0x08(%rbx)
        movq $func2, 0x10(%rbx)
        movq $func3, 0x18(%rbx)
        # extract function from table and call it
        mov $2, %rcx
        call *0x0(%rbx, %rcx, 8)
        call finish
