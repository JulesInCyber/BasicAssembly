pyramidHeight   equ 5

section .bss
    maxLen  resb pyramidHeight + 1

section .text
    global _start

_start:
    mov rbx, 0

firstStack:
    add rbx, 1
    push rbx
    cmp rbx, pyramidHeight
    jne firstStack
    dec rbx

secondStack:
    push rbx
    dec rbx
    jnz secondStack


endProgram:
    pop rdi
    mov rax, 60

    syscall
