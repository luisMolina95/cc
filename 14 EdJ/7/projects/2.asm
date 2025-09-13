; Repeat the previous program using signed values and signed operations. 
; Use the debugger to execute the program and display the final results. 
; Create a debugger input file to show the results in both decimal and hexadecimal
section .data
; Answers:
bAns1 db 0
bAns2 db 0
bAns3 db 0
bAns6 db 0
bAns7 db 0
bAns8 db 0
wAns11 dw 0
wAns12 dw 0
wAns13 dw 0
bAns16 db 0
bAns17 db 0
bAns18 db 0
bRem18 db 0
; Numbers:
bNum1 db -7
bNum2 db -5
bNum3 db -4
bNum4 db -6
wNum1 dw -303
EXIT_SUCCESS equ 0
SYS_exit     equ 60
section .text
global _start
_start:
;   1. bAns1 = bNum1 + bNum2
    mov al, byte [bNum1]
    add al, byte [bNum2]
    mov byte [bAns1], al
;   2. bAns2 = bNum1 + bNum3
    mov al, byte [bNum1]
    add al, byte [bNum3]
    mov byte [bAns2], al
;   3. bAns3 = bNum3 + bNum4
    mov al, byte [bNum3]
    add al, byte [bNum4]
    mov byte [bAns3], al
;   4. bAns6 = bNum1 - bNum2
    mov al, byte [bNum1]
    sub al, byte [bNum2]
    mov byte [bAns6], al
;   5. bAns7 = bNum1 - bNum3
    mov al, byte [bNum1]
    sub al, byte [bNum3]
    mov byte [bAns7], al
;   6. bAns8 = bNum2 - bNum4
    mov al, byte [bNum2]
    sub al, byte [bNum4]
    mov byte [bAns8], al
;   7. wAns11 = bNum1 * bNum3
    mov al, byte [bNum1]
    imul byte [bNum3]
    mov byte [wAns11], al
    mov byte [wAns11 + 1], ah
;   8. wAns12 = bNum2 * bNum2
    mov al, byte [bNum2]
    imul al
    mov byte [wAns12], al
    mov byte [wAns12 + 1], ah
;   9. wAns13 = bNum2 * bNum4
    mov al, byte [bNum2]
    imul byte [bNum4]
    mov byte [wAns13], al
    mov byte [wAns13 + 1], ah
;   10. bAns16 = bNum1 / bNum2
    mov al, byte [bNum1]
    cbw
    idiv byte [bNum2]
    mov byte [bAns16], al
    mov ax, 0
;   11. bAns17 = bNum3 / bNum4
    mov al, byte [bNum3]
    cbw
    idiv byte [bNum4]
    mov byte [bAns17], al
    mov ax, 0
;   12. bAns18 = wNum1 / bNum4
    ; mov al, byte [wNum1]
    ; mov ah, byte [wNum1 + 1]
    mov ax, word [wNum1]
    idiv byte [bNum4]
    mov byte [bAns18], al
;   13. bRem18 = wNum1 % bNum4
    mov byte [bRem18], ah
    mov ax, 0
last:
    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall