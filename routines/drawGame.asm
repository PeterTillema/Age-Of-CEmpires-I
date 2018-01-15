DrawGame:
	ld	hl, 4
	push	hl
	ld	l, 17
	push	hl
	call	_SetTextXY
	ld	l, 5
	push	hl
	ld	hl, (AmountOfWood)
	push	hl
	call	_PrintUInt
	pop	hl
	pop	hl
	pop	hl
	ld	l, 78
	push	hl
	call	_SetTextXY
	ld	l, 5
	push	hl
	ld	hl, (AmountOfFood)
	push	hl
	call	_PrintUInt
	pop	hl
	pop	hl
	pop	hl
	ld	l, 144
	push	hl
	call	_SetTextXY
	ld	l, 5
	push	hl
	ld	hl, (AmountOfGold)
	push	hl
	call	_PrintUInt
	pop	hl
	pop	hl
	pop	hl
	ld	l, 200
	push	hl
	call	_SetTextXY
	ld	l, 5
	push	hl
	ld	hl, (AmountOfGold)
	push	hl
	call	_PrintUInt
	pop	hl
	pop	hl
	pop	hl
	inc	h
	ld	l, 5
	push	hl
	call	_SetTextXY
	ld	l, 3
	push	hl
	ld	a, (AmountOfPeople)
	sbc	hl, hl
	ld	l, a
	push	hl
	call	_PrintUInt
	pop	hl
	pop	hl
	ld	l, '/'
	push	hl
	call	_PrintChar
	pop	hl
	ld	l, 3
	push	hl
	ld	a, (AmountOfMaxPeople)
	or	a, a
	sbc	hl, hl
	ld	l, a
	push	hl
	call	_PrintUInt
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ret