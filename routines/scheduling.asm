;-------------------------------------------------------------------------------
RegisterEvent:
; Registers an event
; Inputs:
;   A   = unit
;   BC  = pointer
;   HL = time offset
	exx
	ld	hl, amount_of_events
	ld	e, (hl)
	ld	d, EVENT.size
	mlt	de
	inc	(hl)
	ld	iy, scheduling_events
	add	iy, de
	exx
	ld	(iy + EVENT.POINTER), bc
	ld	(iy + EVENT.UNIT), a
	ld	bc, (mpTmr1Counter)			; Add offset to current time
	ld	a, (mpTmr1Counter + 3)
	add	hl, bc
	adc	a, 0
	ld	(iy + EVENT.TIME), hl
	ld	(iy + EVENT.TIME + 3), a
	ret

CheckAllEvents:
	ld	a, (amount_of_events)
	or	a, a
	ret	z
	ld	d, a
	ld	iy, scheduling_events
	ld	hl, (mpTmr1Counter)
	ld	a, (mpTmr1Counter + 3)
	ld	e, a
CheckEventLoop:
	ld	bc, (iy + EVENT.TIME)			; EUHL = current time
	ld	a, (iy + EVENT.TIME + 3)		; AUBC = event time
	cp	a, e					; If AUBC <= EUHL, do event, so A<E or (A=E and BC<=HL)
	jr	c, DoEvent				; A<E -> do event
	jr	nz, CheckNextEvent			; A=E -> check BC <= HL
CheckBCHL:
	sbc	hl, bc
	add	hl, bc
	jr	c, CheckNextEvent			; BC>=HL -> no event
DoEvent:
	exx						; D' = event index
	ld	hl, (iy + EVENT.POINTER)
	ld	a, (iy + EVENT.UNIT)
	call	JumpHL
	ld	a, (amount_of_events)
	dec	a
	ld	(amount_of_events), a
	ret	z					; No events left, so return
	exx						; D = event index
	dec	d					; D = amount - current event index
	jr	z, .noremove
	sub	a, d					; A = current event index
	ld	ixl, d
	exx
	ld	c, a
	ld	b, EVENT.size
	mlt	bc
	ld	hl, scheduling_events
	add	hl, bc
	ex	de, hl
	ld	hl, scheduling_events
	add	hl, bc
	ld	bc, EVENT.size
	add	hl, bc
	ld	b, ixl
	mlt	bc
	ldir
	exx
.noremove:
	inc	d
CheckNextEvent:
	lea	iy, iy + EVENT.size
	dec	d
	jr	nz, CheckEventLoop
	ret