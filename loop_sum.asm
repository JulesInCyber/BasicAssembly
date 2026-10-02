section .text
    global _start

_start:
    mov rcx, 10
    mov rbx, 0

looping:
    add rbx, rcx
    dec rcx
    jnz looping

end:
    mov rax, 60
    mov rdi, rbx
    syscall
