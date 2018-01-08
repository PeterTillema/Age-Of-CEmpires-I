GetKeyFast:
	ld	hl, 0F50200h
	ld	(hl), h
	xor	a, a
_:	cp	a, (hl)
	jr	nz, -_
	ret
    
GetKeyAnyFast:
	call	GetKeyFast
	ld	l, 012h
	ld	a, (hl)
	inc	l
	inc	l
	or	a, (hl)
	inc	l
	inc	l
	or	a, (hl)
	inc	l
	inc	l
	or	a, (hl)
	inc	l
	inc	l
	or	a, (hl)
	inc	l
	inc	l
	or	a, (hl)
	inc	l
	inc	l
	or	a, (hl)
	jr	z, GetKeyAnyFast
	ld	a, 20
	jp	_DelayTenTimesAms
    
fadeIn:
	ld	hl, fadeInSub
	jr	fadeLcd
fadeInSub:
	dec	c
	ret

fadeOut:
	ld	hl, fadeOutSub
	jr	fadeLcd
fadeOutSub:
	ld	a, 32
	sub	a, c
	ld	c, a
	ret

fadeLcd:
	ld	(__flSubCalc), hl
	ld	c, 32
flOuter:
	ld	b, 0			; B = number of colours in palette
	ld	iy, mpLcdPalette
	ld	ix, pal_sprites		; IX => palette being used
flInner:
	push	bc
__flSubCalc = $+1
	call	0000000h
	ld	hl, 0
        ; red
	ld	a,(ix+1)
	rrca
	rrca
	and	a, %00011111
	sub	a, c
	jr	nc,flSkipR
	xor	a, a
flSkipR:
	rlca
	rlca
	ld	l,a
        ; green
	ld	e,(ix+1)
	ld	d,(ix)
	sla	d
	rl	e
	sla	d
	rl	e
	sla	d
	rl	e
	ld	a, e
	and	a, %00011111
	sub	a, c
	jr	nc,flSkipG
	xor	a, a
flSkipG:
	ld	d,0
	ld	e,a
	srl	e
	rr	d
	srl	e
	rr	d
	srl	e
	rr	d
	ld	a, l
	or	a, e
	ld	l, a
	ld	a, h
	or	a, d
	ld	h, a
        ; blue
	ld	a,(ix)
	and	a, %00011111
	sub	a, c
	jr	nc,flSkipB
	xor	a, a
flSkipB:
	or	a, h
	ld	h, a
	ld	(iy), h
	ld	(iy+1), l
	inc	ix
	inc	ix
	inc	iy
	inc	iy
	pop	bc
	djnz	flInner
	ld	b, 4
Wait0Loop:
	ld	d, b
	ld	b, 0
Wait1Loop:
	ld	e, b
	ld	b, 0
Wait2Loop:
	djnz	Wait2Loop
	ld	b, e
	djnz	Wait1Loop
	ld	b, d
	djnz	Wait0Loop
	dec	c
	jr	nz,flOuter
	ret

dzx7_Turbo:
        ld      a, 128
dzx7t_copy_byte_loop:
        ldi
dzx7t_main_loop:
        add     a, a
        call    z, dzx7t_load_bits
        jr      nc, dzx7t_copy_byte_loop
        push    de
        ld      de, 0
        ld      bc, 1
dzx7t_len_size_loop:
        inc     d
        add     a, a
        call    z, dzx7t_load_bits
        jr      nc, dzx7t_len_size_loop
        jr      dzx7t_len_value_start
dzx7t_len_value_loop:
        add     a, a
        call    z, dzx7t_load_bits
        rl      c
        rl      b
        jr      c, dzx7t_exit
dzx7t_len_value_start:
        dec     d
        jr      nz, dzx7t_len_value_loop
        inc     bc
        ld      e, (hl)
        inc     hl
        sla	e
        inc	e
        jr      nc, dzx7t_offset_end
        add     a, a
        call    z, dzx7t_load_bits
        rl      d
        add     a, a
        call    z, dzx7t_load_bits
        rl      d
        add     a, a
        call    z, dzx7t_load_bits
        rl      d
        add     a, a
        call    z, dzx7t_load_bits
        ccf
        jr      c, dzx7t_offset_end
        inc     d
dzx7t_offset_end:
        rr      e
        ex      (sp), hl
        push    hl
        sbc     hl, de
        pop     de
        ldir
dzx7t_exit:
        pop     hl
        jp      nc, dzx7t_main_loop
dzx7t_load_bits:
        ld      a, (hl)
        inc     hl
        rla
        ret
	
srand:
	xor	a, a
	jr	__setstate
	
srandom:
	pop	bc
	pop	de
	ex	(sp), hl
	push	de
	push	bc
	ex	de, hl
	ld	a, e
__setstate:
	ld	(__state), hl
	ld	hl, __state+3
	ld	(hl), a
	ld	b, 12
__setstateloop:
	inc	hl
	ld	(hl), b
	djnz	__setstateloop
	ret
	
; ==================== This routine is a modified version of the routine from the GRAPHX lib ====================
; Changes:
;   Use the screen bounds directly
;   Shuffle the arguments

_RLETSprite:
; Draws a sprite with RLE transparency with clipping.
; Arguments:
;  arg0 : x-coordinate
;  arg1 : y-coordinate
;  arg2 : pointer to sprite structure
; Returns:
;  None
	ld	iy, 0
	lea	bc, iy			; bc = 0
	add	iy, sp			; iy = frame
; Clip bottom
	ld	hl, (iy+9)		; hl = sprite struct
	inc	hl
	ld	c, (hl)			; bc = height
	ld	hl, lcdHeight		; hl = ymax
	ld	de, (iy+6)		; de = y
	sbc	hl, de			; hl = ymax-y
	ret	m			; m ==> ymax < y || y ~ int_min ==> fully off-screen
	ret	z			; z ==> ymax == y ==> fully off-screen
	sbc	hl, bc			; hl = ymax-y-height = -(height off-screen)
	jr	nc, _RLETSprite_SkipClipBottom ; nc ==> height-off-screen <= 0 ==> fully on-screen
	add	hl, bc			; hl = ymax-y = height on-screen
	ld	c, l			; bc = height on-screen
_RLETSprite_SkipClipBottom:
; ymax-y did not overflow ==> y-ymin will not overflow
; Clip top
	ld	hl, 28			; hl = ymin
	ex	de, hl			; de = ymin
					; hl = y
	xor	a, a
	sbc	hl, de			; hl = y-ymin
	jp	p, _RLETSprite_SkipClipTop ; p ==> y >= ymin ==> fully on-screen
	add	hl, bc			; hl = y-ymin+height = height on-screen
	ret	nc			; nc ==> height on-screen < 0 ==> fully off-screen
	ld	a, l			; a = height on-screen
	or	a, a
	ret	z			; z ==> height on-screen == 0 ==> fully off-screen
	ld	a, c
	sub	a, l			; a = height off-screen
	ld	b, a			; b = height off-screen
	ld	c, l			; c = height on-screen
	sbc	hl, hl			; y = ymin (after add hl, de)
_RLETSprite_SkipClipTop:
	ld	(_RLETSprite_Heights_SMC), bc
	add	hl, de			; hl = y (clipped)
	ld	(iy+6), l		; write back clipped y
; de = ymin => d = deu = 0
; Clip left
	ld	hl, (iy+9)		; hl = sprite struct
	ld	e, (hl)			; de = width
	ld	hl, (iy+3)		; hl = x
	ld	bc, 33			; bc = xmin
	sbc	hl, bc			; hl = x-xmin
	ret	pe			; v ==> x ~ int_min ==> fully off-screen
	jp	p, _RLETSprite_SkipClipLeft ; p ==> x >= xmin ==> fully on-screen
	add	hl, de			; hl = x-xmin+width = width on-screen
	ret	nc			; nc ==> width on-screen < 0 ==> fully off-screen
	ld	a, l			; a = width on-screen
	or	a, a
	ret	z			; z ==> width on-screen == 0 ==> fully off-screen
	ld	h, a			; h = width on-screen
	ld	a, e			; a = width
	ld	e, h			; de = width on-screen
	sub	a, l			; a = width - width on-screen = width off-screen
	ld	(_RLETSprite_ClipLeft_Width_SMC), a
	inc	d			; d[0] = 1
	sbc	hl, hl			; x = xmin (after add hl, bc)
_RLETSprite_SkipClipLeft:
; x >= xmin ==> x >= 0
; Clip right
	add	hl, bc			; hl = x (clipped)
	ld	(iy+3), hl		; write back clipped x
	ld	bc, lcdWidth - 33	; bc = xmax
	sbc	hl, bc			; hl = x-xmax
	ret	nc			; nc ==> x >= xmax ==> fully off-screen
	ld	a, d			; a[0] = clip left?
	ld	d, 0			; de = width
	add	hl, de			; hl = x-xmax+width = width off-screen
	ld	d, a			; d[0] = clip left?
	jr	nc, _RLETSprite_SkipClipRight ; nc ==> width off-screen < 0 ==> fully on-screen
	ld	a, l			; a = width off-screen
	or	a, a
	jr	z, _RLETSprite_SkipClipRight ; z ==> width off-screen == 0 ==> fully on-screen
	ld	(_RLETSprite_ExitRight_Opaque_Width_SMC), a
	ld	(_RLETSprite_ExitRight_Trans_Width_SMC), a
	ld	a, e			; a = width
	sub	a, l			; a = width - width off-screen = width on-screen
	ld	e, a			; e = width on-screen
	set	1, d			; d[1] = 1
_RLETSprite_SkipClipRight:
; Calculate the pointer to the top-left corner of the sprite in the buffer
	ld	hl, (currDrawingBuffer)
	ld	bc, (iy+3)		; bc = x (clipped)
	add	hl, bc
	ld	c, (iy+6)		; c = y (clipped)
	ld	b, lcdWidth/2
	mlt	bc			; bc = y*160
	add	hl, bc
	add	hl, bc
; Get the pointer to the start of the sprite data, clipping the top if necessary
	push	hl			; (sp) = top-left corner of sprite in buffer
	push	de			;   (sp) = (x clip bits)<<8|(width on-screen)
	ld	bc, 0			; b = height off-screen (top), c = height on-screen
_RLETSprite_Heights_SMC = $-3
	ld	d, c
	push	de			;     (sp) = (height on-screen)<<8|(width on-screen)
	ld	hl, (iy+9)		; hl = sprite struct
	ld	c, (hl)			; c = width
	inc	hl
	inc	hl			; hl = start of sprite data
	xor	a, a			; a = 0
	ld	d, a			; d = deu = 0
	or	a, b			; a = height off-screen
	jr	z, _RLETSprite_ClipTop_End ; z => height off-screen == 0
_RLETSprite_ClipTop_Row:
	ld	a, c			; a = width
_RLETSprite_ClipTop_Trans:
	sub	a, (hl)			; a = width remaining after trans run
	inc	hl
	jr	z, _RLETSprite_ClipTop_RowEnd ; z ==> width remaining == 0
_RLETSprite_ClipTop_Opaque:
	ld	e, (hl)			; de = opaque run length
	inc	hl
	sub	a, e			; a = width remaining after opaque run
	add	hl, de			; skip opaque run
	jr	nz, _RLETSprite_ClipTop_Trans ; nz ==> width remaining != 0
_RLETSprite_ClipTop_RowEnd:
	djnz	_RLETSprite_ClipTop_Row	; decrement height remaining off-screen, 
					; nz => still off-screen
_RLETSprite_ClipTop_End:		; a = 0, hl = start of (clipped) sprite data
; Do stuff
	pop	iy			;     iyh = height on-screen, iyl = width on-screen
	pop	bc			;   bcu = 0, b = x clip bits
	pop	de			; de = buffer
	dec	de			; decrement buffer pointer (negate inc)
	or	a, b
	ld	a, iyl			; a = width on-screen
	jp	z, _RLETSprite_NoClip_Begin
	cpl				; a = 255-(width on-screen)
	add	a, lcdWidth-255		; a = (lcdWidth-(width on-screen))&0FFh
	rra				; a = (lcdWidth-(width on-screen))/2
	dec	b
	jr	z, _RLETSprite_ClipLeftMiddle
	ld	(_RLETSprite_ClipRight_HalfRowDelta_SMC), a
	sbc	a, a
	djnz	_RLETSprite_ClipLeftMiddleClipRight
_RLETSprite_MiddleClipRight:
	sub	a, s8(_RLETSprite_ClipRight_LoopJr_SMC+1-_RLETSprite_Middle_Row_WidthEven)
	ld	(_RLETSprite_ClipRight_LoopJr_SMC), a
_RLETSprite_Middle_Row_WidthOdd:
	inc	de			; increment buffer pointer
_RLETSprite_Middle_Row_WidthEven:
	ld	a, iyl			; a = width on-screen
	jr	_RLETSprite_Middle_Trans
_RLETSprite_Middle_OpaqueCopy_:
	inc	hl
_RLETSprite_Middle_OpaqueCopy:
	ldir				; copy opaque run
_RLETSprite_Middle_Trans:
	ld	c, (hl)			; bc = trans run length
	sub	a, c			; a = width remaining on-screen after trans run
	ex	de, hl			; de = sprite, hl = buffer
	jr	c, _RLETSprite_ExitRight_Trans ; c ==> width remaining on-screen < 0
	inc	de
_RLETSprite_Middle_TransSkip:
	add	hl, bc			; skip trans run
	ex	de, hl			; de = buffer, hl = sprite
_RLETSprite_Middle_Opaque:
	ld	c, (hl)			; bc = opaque run length
	sub	a, c			; a = width remaining on-screen after opqaue run
	jr	nc, _RLETSprite_Middle_OpaqueCopy_ ; nc ==> width remaining on-screen >= 0
_RLETSprite_ExitRight_Opaque:
	add	a, c			; a = width remaining on-screen before opaque run
	ld	c, a			; bc = width remaining on-screen before opaque run
	ld	a, (hl)			; a = opaque run length
	inc	hl
	jr	z, _RLETSprite_ExitRight_Opaque_SkipCopy ; z ==> width remaining on-screen == 0
	sub	c			; a = opaque run length off-screen
	ldir				; copy on-screen part of opaque run
_RLETSprite_ExitRight_Opaque_SkipCopy:
	ld	c, a			; bc = opaque run length off-screen
	ld	a, 0			; a = width off-screen
_RLETSprite_ExitRight_Opaque_Width_SMC = $-1
	jr	_RLETSprite_ClipRight_OpaqueSkip

_RLETSprite_ExitRight_Trans:
	add	a, c			; a = width remaining on-screen before trans run
	ld	c, a			; bc = width remaining on-screen before trans run
	add	hl, bc			; skip on-screen part of trans run
	ex	de, hl			; de = buffer, hl = sprite
	add	a, 0			; a = width remaining on-screen before trans run + width off-screen
_RLETSprite_ExitRight_Trans_Width_SMC = $-1
_RLETSprite_ClipRight_Trans:
	sub	a, (hl)			; a = width remaining off-screen after trans run
	inc	hl
	jr	z, _RLETSprite_ClipRight_RowEnd ; z ==> width remaining off-screen == 0
_RLETSprite_ClipRight_Opaque:
	ld	c, (hl)			; bc = opaque run length
	inc	hl
_RLETSprite_ClipRight_OpaqueSkip:
	sub	a, c			; a = width remaining off-screen after opaque run
	add	hl, bc			; skip opaque run
	jr	nz, _RLETSprite_ClipRight_Trans ; nz ==> width remaining off-screen != 0
_RLETSprite_ClipRight_RowEnd:
	ex	de, hl			; de = sprite, hl = buffer
	ld	c, 0			; c = (lcdWidth-(width on-screen))/2
_RLETSprite_ClipRight_HalfRowDelta_SMC = $-1
	add	hl, bc			; advance buffer to next row
	add	hl, bc
	ex	de, hl			; de = buffer, hl = sprite
	dec	iyh			; decrement height remaining
	jr	nz, _RLETSprite_Middle_Trans ; nz ==> height remaining != 0
_RLETSprite_ClipRight_LoopJr_SMC = $-1
	ret

_RLETSprite_ClipLeftMiddleClipRight:
	dec	b			; b = 0
	sub	a, s8(_RLETSprite_ClipRight_LoopJr_SMC+1-_RLETSprite_ClipLeft_Row_WidthEven)
	ld	(_RLETSprite_ClipRight_LoopJr_SMC), a
	ld	a, s8(_RLETSprite_Middle_OpaqueCopy-(_RLETSprite_EnterLeft_Opaque_Jr_SMC+1))
	ld	c, s8(_RLETSprite_Middle_TransSkip-(_RLETSprite_EnterLeft_Trans_Jr_SMC+1))
	jr	_RLETSprite_ClipLeftMiddle_DoSMC

_RLETSprite_ClipLeftMiddle:
	ld	(_RLETSprite_NoClip_HalfRowDelta_SMC), a
	sbc	a, a
	sub	a, s8(_RLETSprite_NoClip_LoopJr_SMC+1-_RLETSprite_ClipLeft_Row_WidthEven)
	ld	(_RLETSprite_NoClip_LoopJr_SMC), a
	ld	a, s8(_RLETSprite_NoClip_OpaqueCopy-(_RLETSprite_EnterLeft_Opaque_Jr_SMC+1))
	ld	c, s8(_RLETSprite_NoClip_TransSkip-(_RLETSprite_EnterLeft_Trans_Jr_SMC+1))
_RLETSprite_ClipLeftMiddle_DoSMC:
	ld	(_RLETSprite_EnterLeft_Opaque_Jr_SMC), a
	ld	a, c
	ld	(_RLETSprite_EnterLeft_Trans_Jr_SMC), a
_RLETSprite_ClipLeft_Row_WidthOdd:
	inc	de			; increment buffer pointer
_RLETSprite_ClipLeft_Row_WidthEven:
	ld	a, 0			; a = width off-screen
_RLETSprite_ClipLeft_Width_SMC = $-1
	jr	_RLETSprite_ClipLeft_Trans
_RLETSprite_ClipLeft_OpaqueSkip:
	ld	c, (hl)			; bc = opaque run length
	inc	hl
	add	hl, bc			; skip opaque run
_RLETSprite_ClipLeft_Trans:
	sub	a, (hl)			; a = width remaining off-screen after trans run
	inc	hl
	jr	c, _RLETSprite_EnterLeft_Trans ; c ==> partially on-screen
_RLETSprite_ClipLeft_Opaque:
	ld	c, a			; bc = width remaining off-screen before opaque run
	sub	a, (hl)			; a = width remaining off-screen after opaque run
	jr	nc, _RLETSprite_ClipLeft_OpaqueSkip ; nc ==> still off-screen
_RLETSprite_EnterLeft_Opaque:
	inc	hl
	add	hl, bc			; skip off-screen part of opaque run
	neg				; a = opaque run length on-screen
	ld	c, a			; bc = opaque run length on-screen
	ld	a, iyl			; a = width on-screen
	sub	a, c			; a = width remaining on-screen after opaque run
	jr	_RLETSprite_NoClip_OpaqueCopy
_RLETSprite_EnterLeft_Opaque_Jr_SMC = $-1

_RLETSprite_EnterLeft_Trans:
	neg				; a = trans run length on-screen
	ld	c, a			; bc = trans run length on-screen
	ld	a, iyl			; a = width on-screen
	sub	a, c			; a = width remaining on-screen after trans run
	ex	de, hl			; de = sprite, hl = buffer
	jr	_RLETSprite_NoClip_TransSkip
_RLETSprite_EnterLeft_Trans_Jr_SMC = $-1

;-------------------------------------------------------------------------------
_RLETSprite_NoClip:
; Draws a sprite with RLE transparency without clipping.
; Arguments:
;  arg0 : x-coordinate
;  arg1 : y-coordinate
;  arg2 : pointer to sprite structure
; Returns:
;  None
	ld	iy, 0
	add	iy, sp
; Calculate the pointer to the top-left corner of the sprite in the buffer.
	ld	hl, (currDrawingBuffer)
	ld	bc, (iy+3)		; bc = x
	add	hl, bc
	ld	c, (iy+6)		; c = y
	ld	b, lcdWidth/2
	mlt	bc			; bc = y*160
	add	hl, bc
	add	hl, bc
	ex	de, hl			; de = top-left corner of sprite in buffer
; Read the sprite width and height.
	ld	hl, (iy+9)		; hl = sprite struct
	ld	iy, (hl)		; iyh = height, iyl = width
	ld	a, (hl)			; a = width
	inc	hl
	inc	hl			; hl = sprite data
; Initialize values for looping.
	ld	b, 0			; b = 0
	dec	de			; decrement buffer pointer (negate inc)
_RLETSprite_NoClip_Begin:
; Generate the code to advance the buffer pointer to the start of the next row.
	cpl				; a = 255-width
	add	a, lcdWidth-255		; a = (lcdWidth-width)&0FFh
	rra				; a = (lcdWidth-width)/2
	ld	(_RLETSprite_NoClip_HalfRowDelta_SMC), a
	sbc	a, a
	sub	a, s8(_RLETSprite_NoClip_LoopJr_SMC+1-_RLETSprite_NoClip_Row_WidthEven)
	ld	(_RLETSprite_NoClip_LoopJr_SMC), a
; Row loop (if sprite width is odd)
_RLETSprite_NoClip_Row_WidthOdd:
	inc	de			; increment buffer pointer
; Row loop (if sprite width is even) {
_RLETSprite_NoClip_Row_WidthEven:
	ld	a, iyl			; a = width
;; Data loop {
_RLETSprite_NoClip_Trans:
;;; Read the length of a transparent run and skip that many bytes in the buffer.
	ld	c, (hl)			; bc = trans run length
	inc	hl
	sub	a, c			; a = width remaining after trans run
	ex	de, hl			; de = sprite, hl = buffer
_RLETSprite_NoClip_TransSkip:
	add	hl, bc			; skip trans run
;;; Break out of data loop if width remaining == 0.
	jr	z, _RLETSprite_NoClip_RowEnd ; z ==> width remaining == 0
	ex	de, hl			; de = buffer, hl = sprite
_RLETSprite_NoClip_Opaque:
;;; Read the length of an opaque run and copy it to the buffer.
	ld	c, (hl)			; bc = opaque run length
	inc	hl
	sub	a, c			; a = width remaining after opqaue run
_RLETSprite_NoClip_OpaqueCopy:
	ldir				; copy opaque run
;;; Continue data loop while width remaining != 0.
	jr	nz, _RLETSprite_NoClip_Trans ; nz ==> width remaining != 0
	ex	de, hl			; de = sprite, hl = buffer
;; }
_RLETSprite_NoClip_RowEnd:
;; Advance buffer pointer to the next row (minus one if width is odd).
	ld	c, 0			; c = (lcdWidth-width)/2
_RLETSprite_NoClip_HalfRowDelta_SMC = $-1
	add	hl, bc			; advance buffer to next row
	add	hl, bc
	ex	de, hl			; de = buffer, hl = sprite
;; Decrement height remaining. Continue row loop while not zero.
	dec	iyh			; decrement height remaining
	jr	nz, _RLETSprite_NoClip_Row_WidthEven ; nz ==> height remaining != 0
_RLETSprite_NoClip_LoopJr_SMC = $-1
; }
; Done.
	ret
	
LoadAgeGraphicsAppvar:
	push	hl
	inc	c
	ld	b, 3
	mlt	bc
	ld	hl, 0D00002h
	add	hl, bc
	ld	hl, (hl)
	inc	hl
	inc	hl
	ld	de, (FixedBuildingsPtr)
	push	de
	call	dzx7_Turbo
	pop	hl
	push	hl
	ld	bc, 0
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	add	hl, bc
	ld	(FixedBuildingsPtr), hl
	pop	bc
	pop	hl
ModifyRelocationTable:
	push	hl
	ld	hl, (hl)
	ld	a, h
	and	a, l
	inc	a
	jr	z, +_
	push	hl
	ld	hl, (hl)
	add	hl, bc
	ex	de, hl
	pop	hl
	ld	(hl), de
	pop	hl
	inc	hl
	inc	hl
	inc	hl
	jr	ModifyRelocationTable
_:	pop	hl
	ret