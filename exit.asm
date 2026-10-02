section .text
    global _start

_start:
    mov rax, 60     ; Syscall exit
    mov rdi, 40     ; Exit-Code 50
    add rdi, 2      ; Adds 2 to `rdi`
    syscall         ; Program exits with code 42
