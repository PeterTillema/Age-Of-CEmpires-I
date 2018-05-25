;-------------------------------------------------------------------------------
RegisterEvent:
; Registers an event
; Inputs:
;   A    = unit
;   BC   = pointer
;   EUHL = time offset
	exx
	ld	a, (AmountOfEvents)
	ld	c, a
	inc	a
	ld	(AmountOfEvents), a
	ld	b, 3
	mlt	bc
	ld	iy, (SchedulingEventsPtr)
	add	iy, bc
	exx
	ld	(iy + SchedulingEventPointer), bc
	ld	(iy + SchedulingEventUnit), a
	ld	bc, (mpTmr1Counter)			; Add offset to current time
	ld	a, (mpTmr1Counter + 3)
	add	hl, bc
	adc	a, e
	ld	(iy + SchedulingEventTime), hl
	ld	(iy + SchedulingEventTime + 3), a
	lea	hl, iy + SIZEOF_SCHEDULING_EVENT
	ld	(SchedulingEventsPtr), hl
	ret

CheckAllEvents:
	ld	a, (AmountOfEvents)
	or	a, a
	ret	z
	ld	d, a
	ld	iy, (SchedulingEventsBase)
	ld	hl, (mpTmr1Counter)
	ld	a, (mpTmr1Counter + 3)
	ld	e, a
CheckEventLoop:
	ld	bc, (iy + SchedulingEventTime)		; EUHL = current time
	ld	a, (iy + SchedulingEventTime + 3)	; AUBC = event time
	cp	a, e					; If AUBC <= EUHL, do event, so A<E or (A=E and BC<=HL)
	jr	z, CheckBCHL				; A=E -> check BC >= HL
	jr	c, DoEvent				; A<E -> do event
	jr	CheckNextEvent				; A>E -> no event
CheckBCHL:
	sbc	hl, bc
	add	hl, bc
	jr	c, CheckNextEvent			; BC>=HL -> no event
DoEvent:
	exx
	ld	hl, (iy + SchedulingEventPointer)
	ld	a, (iy + SchedulingEventUnit)
	call	JumpHL
	exx
	ld	a, (AmountOfEvents)
	dec	a
	ld	(AmountOfEvents), a
	; Remove event from struct list
CheckNextEvent:
	lea	iy, iy + SIZEOF_SCHEDULING_EVENT
	dec	d
	jr	nz, CheckEventLoop
	ret