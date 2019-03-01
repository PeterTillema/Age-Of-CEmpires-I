DrawGUI:
	scf
	sbc	hl, hl
	ld	(hl), 2
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
	ld	hl, IconsTableAges
	ld	b, (hl)
DrawIcons:
	ld	hl, IconsTable1
.loop:
	ld	hl, (hl)
	call	_Sprite_NoClip
	
	jp	MainGameContinue