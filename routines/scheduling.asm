;-------------------------------------------------------------------------------
RegisterEvent:
; Registers an event
; Inputs:
;   A   = unit
;   BC  = pointer
;   UHL = time offset
	exx
	ld	hl, AmountOfEvents
	ld	e, (hl)
	ld	d, EVENT.size
	mlt	de
	inc	(hl)
	ld	iy, SchedulingEvents
	add	iy, de
	lea	hl, iy + EVENT.size
	exx
	ld	(iy + EVENT.POINTER), bc
	ld	(iy + EVENT.UNIT), a
	ld	bc, (mpTmr1Counter)			; Add offset to current time
	ld	a, (mpTmr1Counter + 3)
	add	hl, bc
	adc	a, 0
	ld	(iy + EVENT.TIME), hl
	ld	(iy + EVENT.TIME + 3), a
	exx
	ld	(SchedulingEvents), hl
	ret

CheckAllEvents:
	ld	a, (AmountOfEvents)
	or	a, a
	ret	z
	ld	d, a
	ld	iy, SchedulingEvents
	ld	hl, (mpTmr1Counter)
	ld	a, (mpTmr1Counter + 3)
	ld	e, a
CheckEventLoop:
	ld	bc, (iy + EVENT.TIME)			; EUHL = current time
	ld	a, (iy + EVENT.TIME + 3)		; AUBC = event time
	cp	a, e					; If AUBC <= EUHL, do event, so    A<E or (A=E and BC<=HL)
	jr	z, CheckBCHL				; A=E -> check BC >= HL
	jr	c, DoEvent				; A<E -> do event
	jr	CheckNextEvent				; A>E -> no event
CheckBCHL:
	sbc	hl, bc
	add	hl, bc
	jr	c, CheckNextEvent			; BC>=HL -> no event
DoEvent:
	exx						; D' = event index
	ld	hl, (iy + EVENT.POINTER)
	ld	a, (iy + EVENT.UNIT)
	call	JumpHL
	ld	a, (AmountOfEvents)
	dec	a
	ld	(AmountOfEvents), a
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
	ld	hl, SchedulingEvents
	add	hl, bc
	ex	de, hl
	ld	hl, SchedulingEvents
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