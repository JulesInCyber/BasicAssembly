triangleDepth   equ 5

section .bss
    buffer  resb triangleDepth + 1      ; Including a newline Character

section .text
    global _start

_start:
    mov rbx, triangleDepth; 5

mainLoop:
    call newLine
    dec rbx
    jnz mainLoop
    jmp endProgram

;   ---------
;   Fills Buffer with '#'
;   Input:  rbx = Number of Symbols
;   Output: None
;   Altered: rcx, rax, rdi, rsi, rdx, r11
;   ---------

newLine:
    mov rcx, rbx

toBuffer:
    mov byte [buffer + rcx - 1], 35
    dec rcx
    jnz toBuffer
    mov byte [buffer + rbx], 10
    call toTerminal
    mov byte [buffer + rbx], 0
    ret

;   ----------
;   Prints contents of the buffer to stdout
;   Input: rbx = Number of returned Bytes
;   Output: none
;   Altered: rax, rdi, rsi, rdx, rcx, r11
;   ----------

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
