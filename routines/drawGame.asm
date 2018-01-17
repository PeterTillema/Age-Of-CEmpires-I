DrawGame:
	ld	de, 17
	ld	a, 4
	call	_SetTextXY
	ld	hl, (AmountOfWood)
	call	_PrintUInt_5
	ld	hl, 78
	ld	(TextXPos_SMC), hl
	ld	hl, (AmountOfFood)
	call	_PrintUInt_5
	ld	hl, 144
	ld	(TextXPos_SMC), hl
	ld	hl, (AmountOfGold)
	call	_PrintUInt_5
	ld	hl, 200
	ld	(TextXPos_SMC), hl
	ld	hl, (AmountOfStone)
	call	_PrintUInt_5
	ld	hl, 261
	ld	(TextXPos_SMC), hl
	ld	a, (AmountOfPeople)
	or	a, a
	sbc	hl, hl
	ld	l, a
	call	_PrintUInt_3
	ld	a, '/'
	call	_PrintChar
	ld	hl, MAX_AMOUNT_PEOPLE
	jp	_PrintUInt_3