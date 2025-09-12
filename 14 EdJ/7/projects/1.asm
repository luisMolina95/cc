; Create a program to compute the following expressions using unsigned byte
; variables and unsigned operations.
; Note, the first letter of the variable name denotes the size
; (b → byte and w → word).
;   1. bAns1 = bNum1 + bNum2
;   2. bAns2 = bNum1 + bNum3
;   3. bAns3 = bNum3 + bNum4
;   4. bAns6 = bNum1 – bNum2
;   5. bAns7 = bNum1 – bNum3
;   6. bAns8 = bNum2 – bNum4
;   7. wAns11 = bNum1 * bNum3
;   8. wAns12 = bNum2 * bNum2
;   9. wAns13 = bNum2 * bNum4
;   10. bAns16 = bNum1 / bNum2
;   11. bAns17 = bNum3 / bNum4
;   12. bAns18 = wNum1 / bNum4
;   13. bRem18 = wNum1 % bNum4
; Use the debugger to execute the program and display the final results.
; Create a debugger input file to show the results in both decimal and hexadecimal.
section .data
bAns1 db 0
bNum1 db 1
bNum2 db 2
EXIT_SUCCESS equ 0
SYS_exit     equ 60
section .text
global _start
_start:
;   1. bAns1 = bNum1 + bNum2
    mov al, byte [bNum1]
    add al, byte [bNum2]
    mov byte [bAns1], al
last:
    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall