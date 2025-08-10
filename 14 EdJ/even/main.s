.intel_syntax noprefix
.global is_even
is_even:
    test rdi, 1
    jz even
    mov rax, 0
    ret
even:
    mov rax, 1
    ret
.section .note.GNU-stack,"",@progbits

