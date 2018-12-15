DrawGame:
	ld	de, (currDrawingBuffer)			; Display food, wood, stone etc placeholder
	ld	hl, resources_offset
	ld	bc, resources_width * resources_height
	ldir
	ld	c, 17
	ld	a, 4
	call	_SetTextXY
	ld	hl, (amount_of_wood)
	call	_PrintUInt_5
	ld	hl, 78
	ld	(TextXPos_SMC), hl
	ld	hl, (amount_of_food)
	call	_PrintUInt_5
	ld	hl, 142
	ld	(TextXPos_SMC), hl
	ld	hl, (amount_of_gold)
	call	_PrintUInt_5
	ld	hl, 200
	ld	(TextXPos_SMC), hl
	ld	hl, (amount_of_stone)
	call	_PrintUInt_5
	ld	hl, 261
	ld	(TextXPos_SMC), hl
	ld	hl, (amount_of_people)
	call	_PrintUInt_3
	ld	a, '/'
	call	_PrintChar
	ld	hl, (amount_of_max_people)
	jp	_PrintUInt_3