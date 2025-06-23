section .data
EXIT_SUCCESS equ 0
SYS_exit     equ 60

bVar1 db 17
bVar2 db 9
bResult db 0

section .text
global _start
_start:
    mov al, byte[bVar1]
    add al, byte[bVar2]
    mov byte[bResult], al

last:
    mov rax, SYS_exit
    movzx rdi, byte[bResult]
    syscall