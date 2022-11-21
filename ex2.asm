.global _start

.section .text
_start:
    mov source, %rax
    mov dest, %rbx
    xor %rcx, %rcx
    movl num, %edx
    test %rdx,%rdx
    jz END
    cmp %rcx, %rdx  # 0 <= num
    jge POSITIVE
    lea (%rbx,%rdx, 8), %rbx
NEGATIVE:
    movb (%rax), %cl
    movb %cl, (%rbx)
    add $8, %rax
    sub $8, %rbx
    dec %rdx
    jnz NEGATIVE
    jmp END
POSITIVE:
    movb (%rax), %cl
    movb %cl, (%rbx)
    add $8, %rax
    add $8, %rbx
    dec %rdx
    jnz POSITIVE

END: nop
