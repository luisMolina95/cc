.define SCREEN_ADD $05e0
.define HELLO_LENGTH $c
.export	_main
	

.segment	"RODATA" ; RODATA_ADD $109E
HELLO: ; HELLO_ADD $109E
	.ASCIIZ	"Hello World!"

.segment	"CODE"

_main:
    ldx #$0
loop:
    lda HELLO,x
    sta SCREEN_ADD,x
    inx
    cpx #HELLO_LENGTH
    bne loop
    rts

