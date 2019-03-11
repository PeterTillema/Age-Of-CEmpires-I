DrawGUI:
	ld	de, 0					; Black
	ld	b, 225
	ld	hl, (currDrawingBuffer)
	ld	sp, lcdWidth * lcdHeight
	add	hl, sp
	ld	sp, hl
	ld	hl, 0010101h				; White
.fill:							; (53 * 3) + 3 - 1 + (53 * 3) = lcdWidth
	db	53 dup 0D5h				; push de
	push	hl
	inc	sp
	db	53 dup 0D5h				; push de
	djnz	.fill
	
TempSP6 = $+1
	ld	sp, 0
AgeIconsTable = $+2
	ld	ix, (IconsTableAges)
	ld	b, 2
	ld	hl, IconsTable1
	ld	de, 204
DisplayIconsRowLoop:
	push	de
	ld	de, 0
.loop:
	push	de
	ld	de, (hl)
	push	de
	exx
	call	_Sprite_NoClip
	pop	hl
	exx
	inc	hl
	inc	hl
	inc	hl
	pop	de
	ld	a, 20
	add	a, e
	ld	e, a
;	adc	a, d
;	sub	a, e
;	ld	d, a
CurrentRow = $+1
	dec	ixl
	jr	nz, .loop
	ld	hl, CurrentRow
	ld	a, (hl)
	xor	a, 0x25 xor 0x2D			; Swap between "dec ixl" and "dec ixh"
	ld	(hl), a
	pop	de
	ld	hl, IconsTable2
	ld	de, 222
	djnz	DisplayIconsRowLoop
	
	jp	MainGameContinue