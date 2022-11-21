.global _start

.section .text
_start:
    movb $0x0, %bl   
    mov num, %rax
    sal $6, %rax
    movw $0x1, %dx
    test %al, %al
    cmove %dx, %bx
    movb %bl, Bool
