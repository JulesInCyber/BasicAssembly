triangleDepth   equ 10

section .bss
    buffer      resb triangleDepth + 1

section .text
    global _start

_start:
    mov rbx, triangleDepth  ; 5

setStack:
    push rbx
    dec rbx
    jnz setStack

depth:
    pop rbx
    call triangle
    cmp rbx, triangleDepth
    je endProgram
    jmp depth

;   ------------
;   Input:  rbx = Number of Symbols
;   Output: None
;   Altered: rcx, rax, rdi, rsi, rdx
;   ------------
triangle:
    mov rcx, rbx

fillRow:
    mov byte [buffer + rcx - 1], 35
    dec rcx
    jnz fillRow
    mov byte [buffer + rbx], 10
    call toTerminal
    ret

;   ---------
;   Prints buffer to terminal
;   Input: rbx = Number of returned Bytes + Newline
;   Output: None
;   Altered: rax, rdi, rsi, rdx, r11, rcx
;   ---------
toTerminal:
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, rbx
    add rdx, 1
    syscall
    ret

endProgram:
    mov rax, 60
    mov rdi, 0
    syscall

