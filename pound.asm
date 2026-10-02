section .data
    pound   db  35  ; Single '#'
    newline db  10  ; Newline

section .text
    global _start

_start:
    mov rbx, 10

termOut:
    mov rax, 1
    mov rdi, 1
    mov rsi, pound
    mov rdx, 1
    syscall
    dec rbx
    jnz termOut

newLine:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

end:
    mov rax, 60
    mov rdi, 0
    syscall
