drawfield_loc = $
relocate(cursorImage)

DrawField:
	ld	b, (ix + OFFSET_X)	; We start with the shadow registers active
	bit	4, b
	ld	a, 16
	ld	c, 028h
	jr	z, +_
	ld	a, -16
	ld	c, 020h
_:	ld	(TopRowLeftOrRight), a
	ld	a, c
	ld	(IncrementRowXOrNot1), a

	ld	a, 028h
	ld	(TileDrawingRoutinePtr1), a
	
	ld	a, (ix + OFFSET_Y)
	cpl
	and	a, 4
	add	a, 12 + 8
	ld	(DrawTile_Clipped_Height), a
	ld	a, (ix + OFFSET_Y)
 	rra
	rra
	rra
	and	a, 1
	add	a, 4 
	ld	(TileHowManyRowsClipped), a
	ld	a, (ix + OFFSET_Y)	; Point to the output
	ld	e, a
	ld	d, 160
	mlt	de
	ld	hl, (currDrawingBuffer)
	add	hl, de
	add	hl, de
	ld	d, 0
	ld	a, b
	add	a, 16			; We start at column 16
	ld	e, a
	add	hl, de
	ld	(startingPosition), hl
	ld	hl, (_IYOffsets + TopLeftYTile) ; Y*MAP_SIZE+X, point to the map data
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_IYOffsets + TopLeftXTile)
	add	hl, de
	add	hl, hl			; Each tile is 2 bytes worth
	ld	bc, mapAddress
	add	hl, bc
	ld	ix, (_IYOffsets + TopLeftYTile)
	ld	a, 29			; 29 rows
	ld	(TempSP2), sp
	ld	sp, lcdWidth
	jr	DisplayEachRowLoop
EnclosedDisplayJump:

TriggerCliping:
	jp	DrawTile_Clipped
TileIsOutOfField:
; z flag is correctly set for correct clip jump
	exx
	ld	hl, blackbuffer
	jr	TileDrawingRoutinePtr1

DisplayEachRowLoop:
; Registers:
;   BC  = length of row tile
;   DE  = pointer to output
;   HL  = pointer to tile/black tile
;   A'  = row index
;   B'  = column index
;   DE' = x index tile
;   HL' = pointer to map data
;   IX  = y index tile
;   IY  = pointer to output
;   SP  = SCREEN_WIDTH

startingPosition = $+2			; Here are the shadow registers active
	ld	iy, 0
	ld	bc, 8 * lcdWidth
	add	iy, bc
	ld	(startingPosition), iy
	bit	0, a
	jr	nz, +_
TopRowLeftOrRight = $+2
	lea	iy, iy+0
_:	
	ex	af, af'	; actually ex flag from bit 0,a
	ld	a, 9

DisplayTile:
	ld	b, a
	ld	a, e
	or	a, ixl
	add	a, a
	sbc	a, a
	or	a, d
	or	a, ixh
	jr	nz, TileIsOutOfField
; a is zero here, just or it
	or	a, (hl)			; Get the tile index
	jp	z, SkipDrawingOfTile
; z flag is NZ here
	exx				; Here are the main registers active
	ld	c, a
	ld	b, 3
	mlt	bc
	ld	hl, TilePointers - 3
	add	hl, bc
	ld	hl, (hl)		; Pointer to the tile
TileDrawingRoutinePtr1 = $
	jr	z, TriggerCliping	; z = never jump, nz=jump
; actually use the z flag as a general flag since we know his status at this point of execution
DrawTile_Unclipped:
	lea	de, iy
	ld	bc, 2
	ldir
	add	iy, sp
	lea	de, iy-2
	ld	c, 6
	ldir
	add	iy, sp
	lea	de, iy-4
	ld	c, 10
	ldir
	add	iy, sp
	lea	de, iy-6
	ld	c, 14
	ldir
	add	iy, sp
	lea	de, iy-8
	ld	c, 18
	ldir
	add	iy, sp
	lea	de, iy-10
	ld	c, 22
	ldir
	add	iy, sp
	lea	de, iy-12
	ld	c, 26
	ldir
	add	iy, sp
	lea	de, iy-14
	ld	c, 30
	ldir
	add	iy, sp
	lea	de, iy-16
	ld	c, 34
	ldir
	add	iy, sp
	lea	de, iy-14
	ld	c, 30
	ldir
	add	iy, sp
	lea	de, iy-12
	ld	c, 26
	ldir
	add	iy, sp
	lea	de, iy-10
	ld	c, 22
	ldir
	add	iy, sp
	lea	de, iy-8
	ld	c, 18
	ldir
	add	iy, sp
	lea	de, iy-6
	ld	c, 14
	ldir
	add	iy, sp
	lea	de, iy-4
	ld	c, 10
	ldir
	add	iy, sp
	lea	de, iy-2
	ld	c, 6
	ldir
	add	iy, sp
	lea	de, iy-0
	ldi
	ldi
	ld	de, -(lcdWidth * 16)
	add	iy, de
	exx
SkipDrawingOfTile:
	lea	iy, iy + 32		; Skip to next tile
	inc	de
	dec	ix
	ld	a, b
	ld	bc, (-MAP_SIZE + 1) * 2
	add	hl, bc
	dec	a
	jp	nz, DisplayTile

	ex	af, af'
; previous ex also saved flag
IncrementRowXOrNot1:
	jr	nz, +_
	inc	de
	add	hl, bc	; bc still hold the correct value to add :)
	dec	ix
_:
	ex	de, hl
	ld	c, -9		; bc was previously <0
	add	hl, bc
	ex	de, hl
	ld	bc, (MAP_SIZE * 10 - 9) * 2
	add	hl, bc
	lea	ix, ix+9+1

TileHowManyRowsClipped = $+1
	cp	a, 2
	jr	nc, +_
	ld	c, a
	ld	a, 020h
	ld	(TileDrawingRoutinePtr1), a
	ld	a, (DrawTile_Clipped_Height)
	sub	a, 9
	jr	c, StopDisplayTiles
	inc	a
	ld	(DrawTile_Clipped_Height), a
	ld	a, c
_:	
	dec	a
	jp	nz, DisplayEachRowLoop

StopDisplayTiles:
	ld	de, (currDrawingBuffer)
	ld	hl, _resources \.r2
	ld	bc, _resources_size
	ldir
	ld	hl, blackBuffer
	ld	bc, lcdWidth * 13 + 32
	ld	a, lcdHeight - 15 - 13 + 1
_:	ldir
	ex	de, hl
	inc	b
	add	hl, bc
	ex	de, hl
	ld	c, 32 + 32
	dec	b
	dec	a
	jr	nz, -_
TempSP2 = $+1
	ld	sp, 0
	ret
	
DrawTile_Clipped:
	ld	(BackupIY), iy
DrawTile_Clipped_Height = $+1
	ld	a, 0
	lea	de, iy
	ld	bc, 2
	ldir
	add	iy, sp
	lea	de, iy-2
	ld	c, 6
	ldir
	add	iy, sp
	lea	de, iy-4
	ld	c, 10
	ldir
	add	iy, sp
	lea	de, iy-6
	ld	c, 14
	ldir
	sub	a, 4
	jp	z, +_
	add	iy, sp
	lea	de, iy-8
	ld	c, 18
	ldir
	add	iy, sp
	lea	de, iy-10
	ld	c, 22
	ldir
	add	iy, sp
	lea	de, iy-12
	ld	c, 26
	ldir
	add	iy, sp
	lea	de, iy-14
	ld	c, 30
	ldir
	sub	a, 4
	jr	z, +_
	add	iy, sp
	lea	de, iy-16
	ld	c, 34
	ldir
	add	iy, sp
	lea	de, iy-14
	ld	c, 30
	ldir
	add	iy, sp
	lea	de, iy-12
	ld	c, 26
	ldir
	add	iy, sp
	lea	de, iy-10
	ld	c, 22
	ldir
	sub	a, 4
	jr	z, +_
	add	iy, sp
	lea	de, iy-8
	ld	c, 18
	ldir
	add	iy, sp
	lea	de, iy-6
	ld	c, 14
	ldir
	add	iy, sp
	lea	de, iy-4
	ld	c, 10
	ldir
	add	iy, sp
	lea	de, iy-2
	ld	c, 6
	ldir
	sub	a, 4
	jr	z, +_
	add	iy, sp
	lea	de, iy-0
	ldi
	ldi
_:	ld	iy, 0
BackupIY = $-3
	exx
	jp	SkipDrawingOfTile
DrawFieldEnd:

#if $ - DrawField > 1024
.error "cursorImage data too large: ",$-DrawField," bytes!"
#endif
    
endrelocate()
