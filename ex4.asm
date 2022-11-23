.global _start

.section .text
_start:
    movq %rsp, %rbp #for correct debugging

leaq (new_node), %rax
movq (%rax), %rbx	# %rbx = new_node.DATA

leaq (root), %r8	# Pointer to root 
movq (%r8), %r9	# first node

LOOP_HW1:
test %r9, %r9
jz ADD_NODE
mov (%r9), %r10 	# r10 = current.DATA         # maybe try lea later
add $8, %r9
mov (%r9), %r11 	# r11 = current.LEFT
add $8, %r9
mov (%r9), %r12 	# r12 = current.RIGHT

cmp %rbx, %r10
je END
jg LEFT	# new_node.DATA < current.DATA 

RIGHT:
test %r12, %r12
jz CHANGE_RIGHT
movq (%r12) ,%r14
test %r14, %r14
jz CHANGE_RIGHT
mov %r12, %r9
jmp LOOP_HW1

LEFT:
test %r11, %r11
jz CHANGE_LEFT
movq (%r11) ,%r14
test %r14, %r14
jz CHANGE_LEFT
mov %r11, %r9
jmp LOOP_HW1

CHANGE_LEFT:
leaq new_node, %r13  #change to move if doesnt work
movq %r13, -8(%r9)
jmp END

CHANGE_RIGHT:
leaq new_node, %r13  #change to move if doesnt work
movq %r13, (%r9)
jmp END

ADD_NODE:
    leaq (new_node), %r13
    mov %r13, (%r9)

END:
