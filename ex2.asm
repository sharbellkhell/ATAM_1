
.text
.global main
main:
    movq %rsp, %rbp #for correct debugging
    mov source, %rax
    mov dest, %rbx
    xor %rdx, %rdx
    xor %rcx, %rcx
    movl num, %edx
    test %edx,%edx
    jz END
    cmp %ecx, %edx  # 0 <= num
    jle NEGATIVE_START
    lea (%rbx,%rdx, 1), %rbx #to be edited
    dec %rbx #to be edited
POSITIVE_PUSH:
    movb (%rax), %cl
    pushq %rcx
    add $1, %rax
    dec %rdx
    jnz POSITIVE_PUSH
    movl num, %edx
POSITIVE_POP:
    popq %rcx
    movb %cl, (%rbx)
    dec %rbx
    dec %rdx
    jnz POSITIVE_POP
    jmp END
NEGATIVE_START:
    neg %edx
NEGATIVE_PUSH:
    movb (%rax), %cl
    pushq %rcx
    add $1, %rax
    dec %rdx
    jnz NEGATIVE_PUSH
    movl num, %edx
    neg %edx
NEGATIVE_POP:
    popq %rcx
    movb %cl, (%rbx)
    add $1, %rbx
    dec %rdx
    jnz NEGATIVE_POP
    
END:
