pyramidHeight   equ 10

section .bss
    maxLen  resb pyramidHeight + 1

section .text
    global _start

_start:
    mov rbx, 0
    mov rbp, pyramidHeight * 2 - 1

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

mainLoop:
    pop rbx
    call initPyramid
    dec rbp
    jnz mainLoop
    jmp endProgram

;   ------------
;   Input:  rbx = Number of Symbols
;   Output: None
;   Altered: rcx, rax, rdi, rsi, rdx
;   ------------
initPyramid:
    mov rcx, rbx

buildPyramid:
    mov byte [maxLen + rcx - 1], 35
    dec rcx
    jnz buildPyramid
    mov byte [maxLen + rbx], 10
    call stdOut
    ret

stdOut:
    mov rax, 1
    mov rdi, 1
    mov rsi, maxLen
    mov rdx, rbx
    add rdx, 1
    syscall
    ret

endProgram:
    mov rax, 60
    mov rdi, 1
    syscall
