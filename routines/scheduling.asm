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
	ld	b, a
	ld	iy, (SchedulingEventsBase)
	ld	hl, (mpTmr1Counter)
	ld	a, (mpTmr1Counter + 3)
	ld	e, a
CheckEventLoop:
	push	bc					; EUHL = current time
	ld	bc, (iy + SchedulingEventTime)		; AUBC = event time
	ld	a, (iy + SchedulingEventTime + 3)	; If AUBC >= EUHL, do event, so A>E or (A=E and BC>=HL)
	cp	a, e
	jr	z, CheckBCHL				; A=E -> check BC >= HL
	jr	nc, DoEvent				; A>E -> do event
	jr	CheckNextEvent				; A<E -> no event
CheckBCHL:
	sbc	hl, bc
	add	hl, bc
	jr	nc, CheckNextEvent			; BC<=HL -> no event
DoEvent:
	exx
	ld	hl, (iy + SchedulingEventPointer)
	ld	a, (iy + SchedulingEventUnit)
	call	JumpHL
	exx
CheckNextEvent:
	pop	bc
	lea	iy, iy + SIZEOF_SCHEDULING_EVENT
	djnz	CheckEventLoop