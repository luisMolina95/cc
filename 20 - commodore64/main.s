.define HELLO_ADD $109E
.define ZERO_PAGE_ADD $2
.import _printf
.export	_main
	

.segment	"RODATA" ; RODATA_ADD $109E
HELLO: ; HELLO_ADD $109E
	.ASCIIZ	"Hello World!"

.segment	"CODE"

_main:
	; Start printf set up
	lda #<HELLO_ADD 
	ldy #0
	sta ($2),Y
	iny
	lda #>HELLO_ADD
	sta ($2),Y
	ldy #2
	; End printf set up
	jsr _printf
	ldx #0
	lda #0
	ldy #0
	rts

