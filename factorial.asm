section .text
    global _start

_start:
    mov rcx, 5
    mov rbx, 1

looping:
    imul rbx, rcx
    dec rcx
    jnz looping

end:
    mov rax, 60
    mov rdi, rbx
    syscall
