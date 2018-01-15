DrawGame:
	ld	de, 17
	ld	a, 4
	call	_SetTextXY
	ld	a, (8 - 5) * 8
	ld	hl, (AmountOfWood)
	call	_PrintUInt
	ld	hl, 78
	ld	(TextXPos_SMC), hl
	ld	a, (8 - 5) * 8
	ld	hl, (AmountOfFood)
	call	_PrintUInt
	ld	hl, 144
	ld	(TextXPos_SMC), hl
	ld	a, (8 - 5) * 8
	ld	hl, (AmountOfGold)
	call	_PrintUInt
	ld	hl, 200
	ld	(TextXPos_SMC), hl
	ld	a, (8 - 5) * 8
	ld	hl, (AmountOfStone)
	call	_PrintUInt
	ld	hl, 261
	ld	(TextXPos_SMC), hl
	ld	a, (AmountOfPeople)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	a, (8 - 3) * 8
	call	_PrintUInt
	ld	a, '/'
	call	_PrintChar
	ld	a, (8 - 3) * 8
	ld	hl, MAX_AMOUNT_PEOPLE
	jp	_PrintUInt