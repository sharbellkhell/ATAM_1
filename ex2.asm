.global _start

.section .text
_start:
    movq %rsp, %rbp #for correct debugging
    mov source, %rax
    mov destination, %rbx
    xor %rdx, %rdx
    xor %rcx, %rcx
    movl num, %edx
    test %edx,%edx
    jz END_HW1
    cmp %ecx, %edx  # 0 <= num
    jle NEGATIVE_START_HW1
    lea (%rbx,%rdx, 1), %rbx #to be edited
    dec %rbx #to be edited
POSITIVE_PUSH_HW1:
    movb (%rax), %cl
    pushq %rcx
    add $1, %rax
    dec %rdx
    jnz POSITIVE_PUSH_HW1
    movl num, %edx
POSITIVE_POP_HW1:
    popq %rcx
    movb %cl, (%rbx)
    dec %rbx
    dec %rdx
    jnz POSITIVE_POP_HW1
    jmp END_HW1
NEGATIVE_START_HW1:
    neg %edx
NEGATIVE_PUSH_HW1:
    movb (%rax), %cl
    pushq %rcx
    add $1, %rax
    dec %rdx
    jnz NEGATIVE_PUSH_HW1
    movl num, %edx
    neg %edx
NEGATIVE_POP_HW1:
    popq %rcx
    movb %cl, (%rbx)
    add $1, %rbx
    dec %rdx
    jnz NEGATIVE_POP_HW1
    
END_HW1:
