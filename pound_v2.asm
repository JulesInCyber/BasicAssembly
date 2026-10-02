section .data
    pound   db  35
    newline db  10

section .bss
    buff    resb 10     ; reserving 11 Bytes

section .text
    global _start

_start:
    mov rcx, 10

toBuffer:
    mov al, [pound]
    mov byte [buff + rcx - 1], al
    dec rcx
    jnz toBuffer

toTerminal:
    mov rax, 1
    mov rdi, 1
    mov rsi, buff
    mov rdx, 10
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

exitCode:
    mov rax, 60
    mov rdi, 0
    syscall
