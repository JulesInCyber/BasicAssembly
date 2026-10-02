section .text
    global _start

_start:
    mov rbx, 5
    mov rcx, 6
    cmp rbx, rcx
    jge greater_equal
    mov rdi, rcx
    jmp end
greater_equal:
    mov rdi, rbx
end:
    mov rax, 60
    syscall
