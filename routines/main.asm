relocate AoCE_RAM, AOCE_RAM_START + RAM_SIZE + AppDataEnd - AppDataStart, 100000

MainGameLoop:
MainGameLoopPtr = $+1
	jp	DrawField
MainGameContinue:
	call	DrawGame
	
; Swap buffers
	ld	hl, vRAM
	ld	de, (mpLcdBase)
	or	a, a
	sbc	hl, de
	add	hl, de
	jr	nz, .jump
	ld	hl, screenBuffer
.jump:
	ld	(currDrawingBuffer), de
	ld	(mpLcdBase), hl
	
; Set the bit to wait for the LCD to be updated; meanwhile we do all the calculations, maybe then it already has been swapped and we don't need to wait anymore
	ld	hl, mpLcdIcr
	set	2, (hl)
	
; Check all the events of the units
	ld	a, (AmountOfPeople)
	ld	b, a
	ld	iy, UnitsStack
DoUnitEventLoop:
	push	bc
	ld	c, (iy + UNIT_ENTRY.EVENT)
	ld	b, 3
	mlt	bc
	ld	hl, UnitsEventsTable
	add	hl, bc
	ld	hl, (hl)
	call	JumpHL
	pop	bc
	lea	iy, iy + UNIT_ENTRY.size
	djnz	DoUnitEventLoop
	
; Scheduling
	call	CheckAllEvents
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld	hl, (AmountOfWood)
	inc	hl
	ld	(AmountOfWood), hl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	call	GetKeyFast
	ld	iy, iy_base
CheckKeys369:				; Check [3], [6], [9]
	ld	l, 01Ah
	ld	a, (hl)
	and	a, (1 shl kp3) or (1 shl kp6) or (1 shl kp9)
	jp	z, CheckKeys28
	call	ScrollFieldRight
CheckKey3:
	bit	kp3, (hl)
	jr	z, CheckKey9
	call	ScrollFieldRight
	call	ScrollFieldDown
CheckKey9:
	bit	kp9, (hl)
	jr	z, CheckKeys28
	call	ScrollFieldRight
	call	ScrollFieldUp
CheckKeys28:				; Check [2], [8] (5 does nothing)
	ld	l, 018h
	ld	a, (hl)
	and	a, (1 shl kp2) or (1 shl kp8)
	jr	z, CheckKeys147
; Check key 2
	bit	kp2, a
	call	nz, ScrollFieldDown
; Check key 8
	bit	kp8, (hl)
	call	nz, ScrollFieldUp
CheckKeys147:				; Check [1], [4], [7]
	ld	l, 016h
	ld	a, (hl)
	and	a, (1 shl kp1) or (1 shl kp4) or (1 shl kp7)
	jr	z, CheckClearEnter
	call	ScrollFieldLeft
; Check key 1
	bit	kp1, (hl)
	jr	z, CheckKey7
	call	ScrollFieldLeft
	call	ScrollFieldDown
CheckKey7:
	bit	kp7, (hl)
	jr	z, CheckClearEnter
	call	ScrollFieldLeft
	call	ScrollFieldUp
CheckClearEnter:
	ld	l, 01Ch
	bit	kpClear, (hl)
	ret	nz
; Check [MODE] switch
	ld	l, 012h
	bit	kpMode, (hl)
	jr	z, CheckStop
	ld	de, DrawField
	ld	hl, (MainGameLoopPtr)
	or	a, a
	sbc	hl, de
	add	hl, de
	jr	nz, .jump
	ld	de, DrawGUI
.jump:
	ld	(MainGameLoopPtr), de
	;bit	kpEnter, (hl)
	;jr	z, CheckReleaseEnterKey
	;bit	holdDownEnterKey, (AoCEFlags1)
	;set	holdDownEnterKey, (AoCEFlags1)
	;jr	nz, CheckStop
;CreateNewSelectedArea:
	;ld	hl, (CursorX)
	;ld	(SelectedAreaStartX), hl
	;ld	l, (CursorY)
	;ld	(SelectedAreaStartY), l
	;jr	CheckStop
;CheckReleaseEnterKey:
	;bit	holdDownEnterKey, (AoCEFlags1)
	;res	holdDownEnterKey, (AoCEFlags1)
	;jr	z, CheckStop
;ParseSelectedArea:
CheckStop:
	ld	hl, mpLcdRis
.wait:
	bit	2, (hl)
	jr	z, .wait
	jp	MainGameLoop
	
JumpHL:
	jp	(hl)

ScrollFieldRight:
	ld	a, (OFFSET_X)
	or	a, a
	jr	nz, .jump
	ld	de, (TopLeftXTile)
	inc	de
	ld	(TopLeftXTile), de
	ld	de, (TopLeftYTile)
	dec	de
	ld	(TopLeftYTile), de
.jump:
	sub	a, SCROLL_SPEED
	and	a, TILE_WIDTH - 1
	jr	ScrollFieldLeftRightRoutine

ScrollFieldLeft:
	ld	a, (OFFSET_X)
	add	a, SCROLL_SPEED
	and	a, TILE_WIDTH - 1
	jr	nz, ScrollFieldLeftRightRoutine
	ld	de, (TopLeftXTile)
	dec	de
	ld	(TopLeftXTile), de
	ld	de, (TopLeftYTile)
	inc	de
	ld	(TopLeftYTile), de
ScrollFieldLeftRightRoutine:
	ld	(OFFSET_X), a
	ld	(OffsetX_SMC1), a
	ld	(OffsetX_SMC2), a
	ld	(OffsetX_SMC3), a
	bit	4, a
	ld	a, TILE_WIDTH / 2
	ld	c, jr_z
	jr	z, .jump
	neg
	ld	c, jr_nz
.jump:
	ld	(TopRowLeftOrRight), a
	ld	a, c
	ld	(IncrementRowXOrNot1), a
	ret

ScrollFieldUp:
	ld	a, (OFFSET_Y)
	add	a, SCROLL_SPEED
	and	a, TILE_HEIGHT - 1
	jr	nz, ScrollFieldUpDownRoutine
	ld	de, (TopLeftXTile)
	dec	de
	ld	(TopLeftXTile), de
	ld	de, (TopLeftYTile)
	dec	de
	ld	(TopLeftYTile), de
	jr	ScrollFieldUpDownRoutine

ScrollFieldDown:
	ld	a, (OFFSET_Y)
	or	a, a
	jr	nz, .jump
	ld	de, (TopLeftXTile)
	inc	de
	ld	(TopLeftXTile), de
	ld	de, (TopLeftYTile)
	inc	de
	ld	(TopLeftYTile), de
.jump:
	sub	a, SCROLL_SPEED
	and	a, TILE_HEIGHT - 1
ScrollFieldUpDownRoutine:
	ld	(OFFSET_Y), a
	ld	e, a
	add	a, TILE_HEIGHT_HALF + 2
	ld	(OffsetY_SMC2), a
	add	a, TILE_HEIGHT_HALF - 1
	ld	(OffsetY_SMC1), a
	ld	(OffsetY_SMC3), a
	xor	a, a
	ld	d, 10
	bit	3, e
	jr	z, .jump1
	inc	d
	ld	a, dec_a
.jump1:
	ld	(TileWhichAction), a			; Write nop/dec a to tile action
	ld	a, d
	ld	(TileHowManyRowsClipped), a
	ld	hl, add_iy_sp_lea_de_iy
	ld	(DrawTile_Clipped_Stop3), hl
	bit	2, e
	jr	z, .jump2
	ld	hl, DrawTile_Clipped_Stop3
	ld	(hl), jr_
	inc	hl
	ld	(hl), StopDrawingTile - DrawTile_Clipped_Stop3 - 2
.jump2:
	ld	hl, mpKeyRange
	ret
	
include 'routines/mainmenu.asm'
include 'routines/drawGame.asm'
include 'routines/gui.asm'
;include 'routines/pathfinding.asm'
include 'routines/routines.asm'
include 'routines/drawField.asm'
include 'routines/unitEvents.asm'
include 'routines/scheduling.asm'
include 'data/tables.asm'
include 'data/data.asm'

end relocate