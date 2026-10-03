section .data
    firstWord       db  72, 101, 108, 108, 111, 32
    firstLen        equ $ - firstWord
    secondWord      db 87, 111, 114, 108, 100, 10
    secondLen       equ $ - secondWord

section .text
    global _start

_start:
    mov rsi, firstWord
    mov rdx, firstLen
    call sub_print
    mov rsi, secondWord
    mov rdx, secondLen
    call sub_print
    call sub_exit

sub_print:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

sub_exit:
    mov rax, 60
    mov rdi, 0
    syscall

