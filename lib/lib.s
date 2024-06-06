/*
 * Tiny tiny standard libraries
 */

.data

.Lmessage_finished: .string "Finished.\n"
.Lstring_newline: .string "\n"
.Lformat_quadword: .string "0x%016llx (%lld)\n"
.Lformat_rax: .string "rax=0x%016llx (%lld)\n"
.Lformat_rbx: .string "rbx=0x%016llx (%lld)\n"
.Lformat_rcx: .string "rcx=0x%016llx (%lld)\n"
.Lformat_rdx: .string "rdx=0x%016llx (%lld)\n"
.Lformat_rsi: .string "rsi=0x%016llx (%lld)\n"
.Lformat_rdi: .string "rdi=0x%016llx (%lld)\n"
.Lformat_r8:  .string "r8 =0x%016llx (%lld)\n"
.Lformat_r9:  .string "r9 =0x%016llx (%lld)\n"
.Lformat_r10: .string "r10=0x%016llx (%lld)\n"
.Lformat_r11: .string "r11=0x%016llx (%lld)\n"
.Lformat_r12: .string "r12=0x%016llx (%lld)\n"
.Lformat_r13: .string "r13=0x%016llx (%lld)\n"
.Lformat_r14: .string "r14=0x%016llx (%lld)\n"
.Lformat_r15: .string "r15=0x%016llx (%lld)\n"
.Lformat_rflags: .string "rflags(eflags)=0x%08llx\n"
.Lformat_rsp: .string "rsp=0x%016llx\n"
.Lformat_rbp: .string "rbp=0x%016llx\n"
.Lformat_rip: .string "rip=0x%016llx\n"

.text

.globl myexit
myexit:
        push    %rbp
        mov     %rsp,%rbp
        sub     $8, %rsp /* for alignment */

        mov     $0x0, %rdi /* argument of exit */
        call    exit@plt
        /* not reached if succ */

        add     $8, %rsp /* for alignment */
        leave
        ret

.globl myprintf
myprintf:
        push    %rbp
        mov     %rsp,%rbp
        sub     $8, %rsp /* for alignment */

        call    printf@plt

        add     $8, %rsp /* for alignment */
        leave
        ret

.globl print_message
print_message:
        push    %rbp
        mov     %rsp,%rbp
        sub     $8, %rsp /* for alignment */

        push    %rax
        push    %rbx
        push    %rcx
        push    %rdx
        push    %rsi
        push    %rdi
        push    %r8
        push    %r9
        push    %r10
        push    %r11
        push    %r12
        push    %r13
        push    %r14
        push    %r15
        pushf

        /* message */
        mov     $0, %eax
        call    myprintf

        popf
        pop     %r15
        pop     %r14
        pop     %r13
        pop     %r12
        pop     %r11
        pop     %r10
        pop     %r9
        pop     %r8
        pop     %rdi
        pop     %rsi
        pop     %rdx
        pop     %rcx
        pop     %rbx
        pop     %rax

        add     $8, %rsp /* for alignment */
        leave
        ret

.globl print_newline
print_newline:
        push    %rbp
        mov     %rsp,%rbp

        push    %rdi
        sub     $8, %rsp /* for alignment */
        # mov     $.Lstring_newline, %rdi # does not work on some platforms
        lea     .Lstring_newline(%rip), %rdi # replacement
        call    print_message
        add     $8, %rsp /* for alignment */
        pop     %rdi

        leave
        ret

.globl print_memory
print_memory:
        push    %rbp
        mov     %rsp,%rbp
        sub     $8, %rsp /* for alignment */

        push    %rdi
        push    %rsi
        push    %rdx
        mov     (%rdi), %rsi
        mov     %rsi, %rdx
        # mov     $.Lformat_quadword, %rdi # does not work on some platforms
        lea     .Lformat_quadword(%rip), %rdi # replacement
        call    print_message
        pop     %rdx
        pop     %rsi
        pop     %rdi

        add     $8, %rsp /* for alignment */
        leave
        ret

.globl print_regs
print_regs:
        push    %rbp
        mov     %rsp,%rbp
        sub     $8, %rsp /* for alignment */

        push    %rax
        push    %rbx
        push    %rcx
        push    %rdx
        push    %rsi
        push    %rdi
        push    %r8
        push    %r9
        push    %r10
        push    %r11
        push    %r12
        push    %r13
        push    %r14
        push    %r15
        pushf

        /* rax */
        mov     -0x10(%rbp), %rdx
        mov     -0x10(%rbp), %rsi
        # mov     $.Lformat_rax, %rdi
        lea     .Lformat_rax(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* rbx */
        mov     -0x18(%rbp), %rdx
        mov     -0x18(%rbp), %rsi
        # mov     $.Lformat_rbx, %rdi
        lea     .Lformat_rbx(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* rcx */
        mov     -0x20(%rbp), %rdx
        mov     -0x20(%rbp), %rsi
        # mov     $.Lformat_rcx, %rdi
        lea     .Lformat_rcx(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* rdx */
        mov     -0x28(%rbp), %rdx
        mov     -0x28(%rbp), %rsi
        # mov     $.Lformat_rdx, %rdi
        lea     .Lformat_rdx(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* rsi */
        mov     -0x30(%rbp), %rdx
        mov     -0x30(%rbp), %rsi
        # mov     $.Lformat_rsi, %rdi
        lea     .Lformat_rsi(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* rdi */
        mov     -0x38(%rbp), %rdx
        mov     -0x38(%rbp), %rsi
        # mov     $.Lformat_rdi, %rdi
        lea     .Lformat_rdi(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* r8 */
        mov     -0x40(%rbp), %rdx
        mov     -0x40(%rbp), %rsi
        # mov     $.Lformat_r8, %rdi
        lea     .Lformat_r8(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* r9 */
        mov     -0x48(%rbp), %rdx
        mov     -0x48(%rbp), %rsi
        # mov     $.Lformat_r9, %rdi
        lea     .Lformat_r9(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* r10 */
        mov     -0x50(%rbp), %rdx
        mov     -0x50(%rbp), %rsi
        # mov     $.Lformat_r10, %rdi
        lea     .Lformat_r10(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* r11 */
        mov     -0x58(%rbp), %rdx
        mov     -0x58(%rbp), %rsi
        # mov     $.Lformat_r11, %rdi
        lea     .Lformat_r11(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* r12 */
        mov     -0x60(%rbp), %rdx
        mov     -0x60(%rbp), %rsi
        # mov     $.Lformat_r12, %rdi
        lea     .Lformat_r12(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* r13 */
        mov     -0x68(%rbp), %rdx
        mov     -0x68(%rbp), %rsi
        # mov     $.Lformat_r13, %rdi
        lea     .Lformat_r13(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* r14 */
        mov     -0x70(%rbp), %rdx
        mov     -0x70(%rbp), %rsi
        # mov     $.Lformat_r14, %rdi
        lea     .Lformat_r14(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* r15 */
        mov     -0x78(%rbp), %rdx
        mov     -0x78(%rbp), %rsi
        # mov     $.Lformat_r15, %rdi
        lea     .Lformat_r15(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* rflags (eflags) */
        mov     -0x80(%rbp), %rdx
        mov     -0x80(%rbp), %rsi
        # mov     $.Lformat_rflags, %rdi
        lea     .Lformat_rflags(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* rsp */
        lea     0x10(%rbp),%rsi
        # mov     $.Lformat_rsp, %rdi
        lea     .Lformat_rsp(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* rbp */
        mov     0x00(%rbp), %rsi
        # mov     $.Lformat_rbp, %rdi
        lea     .Lformat_rbp(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        /* rip */
        mov     0x08(%rbp), %rsi
        # mov     $.Lformat_rip, %rdi
        lea     .Lformat_rip(%rip), %rdi
        mov     $0, %eax
        call    myprintf

        popf
        pop     %r15
        pop     %r14
        pop     %r13
        pop     %r12
        pop     %r11
        pop     %r10
        pop     %r9
        pop     %r8
        pop     %rdi
        pop     %rsi
        pop     %rdx
        pop     %rcx
        pop     %rbx
        pop     %rax

        add     $8, %rsp /* for alignment */
        leave
        ret

.globl silent_finish
silent_finish:
        push    %rbp
        mov     %rsp,%rbp

        call    myexit

        leave
        ret

.globl finish
finish:
        push    %rbp
        mov     %rsp,%rbp
        sub     $8, %rsp /* for alignment */

        push    %rdi
        # mov     $.Lmessage_finished, %rdi # does not work on some platforms
        lea     .Lmessage_finished(%rip), %rdi # replacement
        call    print_message
        pop     %rdi

        sub     $8, %rsp /* for alignment */
        call    print_regs
        call    silent_finish
        add     $8, %rsp /* for alignment */

        /* not reached */

        add     $8, %rsp /* for alignment */
        leave
        ret
