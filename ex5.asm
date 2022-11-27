.global _start

.section .text
_start:
    movq %rsp, %rbp #for correct debugging
    
xor %rdx, %rdx
movq (head), %rbx	# rbx is pointer to next location
leaq (head), %rdx
test %rbx, %rbx
jz END_HW1
movl (Value), %eax
cltq
xor %r10, %r10	# Counter - Num of nodes with value
xor %r11, %r11	# Pointer - First appearance of value
xor %r12, %r12	# Pointer - Second appearance of value

xor %r13, %r13
xor %r14, %r14	

xor %r8, %r8
xor %r9, %r9

xor %rdi, %rdi #flag to know if we are using the head ptr or not

xor %rcx, %rcx	# Value of the node

LOOP_HW1:
cmp $0x2, %r10	# 2 < Counter
jg END_HW1
test %rbx, %rbx          #if we got to the end of the list
jz SWAP_HW1

movq (%rbx), %rcx     #put the value of the current node inside a register

cmp %rax, %rcx         #compare values
jne CONTINUE_HW1
cmp $0, %r10		# First appearance?
jne SECOND_APP_HW1
movq %rdx, %r11	# First appearance case

jmp COUNTER_INCREASE_HW1

SECOND_APP_HW1:
movq %rdx, %r12	# Second appearance case

COUNTER_INCREASE_HW1:
inc %r10

CONTINUE_HW1:
movq %rbx, %rdx
addq $8, %rdx
movq 8(%rbx), %rbx

jmp LOOP_HW1


SWAP_HW1:
cmp $0x2, %r10	# counter < 2
jl END_HW1

#swap pointers before the node
movq (%r11), %r8
movq (%r12), %r9

movq %r9, (%r11)
movq %r8, (%r12)

#swap next pointers
movq 8(%r8), %r13  
movq 8(%r9), %r14

movq %r13, 8(%r9)
movq %r14, 8(%r8)




END_HW1:
