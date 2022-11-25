.global _start

.section .text
_start:
    movq %rsp, %rbp #for correct debugging
    xor %rax, %rax # index1
    xor %rbx, %rbx # index2
    xor %ecx, %ecx # last added number
    xor %rdx, %rdx # Index of merged array
    xor %r8d, %r8d
    xor %r9d, %r9d
    
    lea array1, %rax
    lea array2, %rbx
    lea mergedArray, %rdx

LOOP_HW1: 
    mov (%rax), %r8d
    mov (%rbx),%r9d
    
    test %r8d, %r8d
    jnz CONTINUE_HW1
    test %r9d, %r9d
    jz END_HW1

CONTINUE_HW1:
    cmp %r8d, %r9d
    ja A2_GREAT_HW1	# array1(index1) < array2(index2)

A1_GREAT_EQUAL_HW1:
    add $4, %rax
    cmp %r8d, %ecx # check if current value and last value are equal
    je LOOP_HW1
    mov %r8d, %ecx
    mov %r8d, (%rdx)
    add $4, %rdx
    jmp LOOP_HW1
A2_GREAT_HW1:
    add $4, %rbx
    cmp %r9d, %ecx #check if current value and last value are equal
    je LOOP_HW1
    mov %r9d, %ecx
    mov %r9d, (%rdx)
    add $4, %rdx
    jmp LOOP_HW1

END_HW1:
    movl $0x0, (%rdx)
