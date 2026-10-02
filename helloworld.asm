section .data
    firstWord   db 72, 101, 108, 108, 111, 32
    firstLen    equ $ - firstWord
    secondWord  db 87, 111, 114, 108, 100, 10
    secondLen   equ $ - secondWord

section .text
    global _start

_start:
    ; Printing first Word
    mov rax, 1
    mov rdi, 1
    mov rsi, firstWord
    mov rdx, firstLen
    syscall
    ; Printing second Word
    mov rax, 1
    mov rdi, 1
    mov rsi, secondWord
    mov rdx, secondLen
    syscall
    ; Exit with Code 0
    mov rax, 60
    mov rdi, 0
    syscall
