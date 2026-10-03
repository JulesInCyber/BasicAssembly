section .text
    global _start

_start:
    push 1
    push 2
    push 0
    pop rdi     ; Exit-Code 0
    pop rsi
    pop rdx
    mov rax, 60
    syscall
