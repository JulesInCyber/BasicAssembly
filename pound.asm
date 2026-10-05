LENGTH      equ 10

section .bss
    rowBuff     resb LENGTH + 1

section .text
    global _start

_start:
    mov rcx, LENGTH

fillRowBuff:
    mov byte [rowBuff + rcx - 1], 35
    dec rcx
    jnz fillRowBuff

    mov byte [rowBuff + LENGTH], 10     ; newline

termOut:
    mov rax, 1
    mov rdi, 1
    mov rsi, rowBuff
    mov rdx, LENGTH + 1
    syscall

endProgram:
    mov rax, 60
    mov rdi, 0
    syscall
