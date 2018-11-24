DrawGUI:
	ld	de, 0
	ld	b, 240
	ld	hl, (currDrawingBuffer)
	ld	sp, lcdWidth * lcdHeight
	add	hl, sp
	ld	sp, hl
.fill:
	db	100 dup 0D5h				; push de
	djnz	.fill					; 240*100*3 = lcdWidth * (lcdHeight - resources_height)
	
TempSP6 = $+1
	ld	sp, 0					; Yay, we are finally done!
	jp	MainGameContinue