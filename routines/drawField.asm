drawfield_loc = $
relocate(cursorImage)

DrawField:
	ld	de, DrawIsometricTile
	ld	hl, drawisometrictile_loc
	ld	bc, DrawIsometricTileEnd - DrawIsometricTile
	ldir
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
	
	ld	hl, DrawIsometricTile
	ld	(TileDrawingRoutinePtr1), hl
	ld	(TileDrawingRoutinePtr2), hl
	ld	hl, TilePointersEnd - 3
	ld	(TilePointersSMC), hl
	ld	hl, 0ED39FDh		; add iy, sp \ lea de, iy + X
	ld	(DrawTile_Clipped_Stop1), hl
	ld	(DrawTile_Clipped_Stop2), hl
	ld	(DrawTile_Clipped_Stop3), hl
	ld	(DrawTile_Clipped_Stop4), hl

	ld	e, (ix + OFFSET_Y)
	xor	a, a
	bit	3, e
	jr	z, +_
	ld	a, 00Dh
_:	ld	(TileWhichAction), a	; Write "dec c" or "nop"
	ld	a, e
	and	a, 4
	exx
	ld	hl, DrawTile_Clipped_Stop4
	ld	de, DrawTile_Clipped_Stop2
	ld	c, StopDrawingTile - DrawTile_Clipped_Stop4 - 2
	ld	b, StopDrawingTile - DrawTile_Clipped_Stop2 - 2
	jr	z, +_
	ld	hl, DrawTile_Clipped_Stop3
	ld	de, DrawTile_Clipped_Stop1
	ld	c, StopDrawingTile - DrawTile_Clipped_Stop3 - 2
	ld	b, StopDrawingTile - DrawTile_Clipped_Stop1 - 2
_:	ld	(hl), 018h		; Write "jr"
	inc	hl
	ld	(hl), c
	ld	(DrawTile_Clipped_SetJRSMC), de
	ld	hl, DrawTile_Clipped_SetJRStop
	ld	(hl), 018h		; Write "jr"
	inc	hl
	ld	(hl), b
	exx
	ld	a, 7
	cp	a, e
	adc	a, 3
	ld	(TileHowManyRowsClipped), a
	
	ld	a, e
	add	a, 16			; Point to the row of the bottom right pixel
	ld	e, a
	ld	d, 160
	mlt	de
	ld	hl, (currDrawingBuffer)
	add	hl, de
	add	hl, de
	ld	d, 0
	ld	a, b
	add	a, 17			; We start at column 17 (bottom right pixel)
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
	ld	bc, (MapDataPtr)
	add	hl, bc
	ld	ix, (_IYOffsets + TopLeftYTile)
	ld	a, 35			; 35 rows, but last 6 rows only trees
	ld	(TempSP2), sp
	ld	(TempSP3), sp
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
_:	ex	af, af'
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
	or	a, (hl)			; Get the tile index
	jp	z, SkipDrawingOfTile
	exx				; Here are the main registers active
	ld	c, a
	ld	b, 3
	mlt	bc
TilePointersSMC = $+1
	ld	hl, TilePointersEnd - 3
	add	hl, bc
	ld	hl, (hl)		; Pointer to the tile/tree/building
	cp	a, TILE_BUILDING
TileDrawingRoutinePtr1 = $+1
	jp	c, DrawIsometricTile	; This will be modified to the clipped version after X rows
	jp	z, DisplayBuilding
	jp	DisplayTileWithTree
	
TileIsOutOfField:
	exx
	ld	hl, blackBuffer
TileDrawingRoutinePtr2 = $+1
	jp	DrawIsometricTile	; This will be modified to the clipped version after X rows

DrawIsometricTileSecondPart:
	lddr
	ld	c, 30
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 34
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	sp, -318
	ld	c, 30
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 26
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 22
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 18
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 14
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 10
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 6
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 2
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
SkipDrawingOfTileExx:
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
IncrementRowXOrNot1 = $
	jr	nz, +_			; The zero flag is still set/reset from the "bit 0, a"
	inc	de
	add	hl, bc
	dec	ix
_:	ex	de, hl
	ld	c, -9
	add	hl, bc
	ex	de, hl
	ld	bc, (MAP_SIZE * 10 - 9) * 2
	add	hl, bc
	lea	ix, ix+9+1
TileHowManyRowsClipped = $+1
	cp	a, 0
	dec	a
	jp	nc, DisplayEachRowLoop
	exx
	ld	c, a
TileWhichAction = $
	nop				; Can be SMC'd into a "dec c"
	ld	b, 3
	mlt	bc
	ld	hl, FieldRowActionTable
	add	hl, bc
	ld	hl, (hl)
	jp	(hl)
	
SetClippedRoutine:
	ld	sp, lcdWidth
	ld	hl, DrawTile_Clipped
	ld	(TileDrawingRoutinePtr1), hl
	ld	(TileDrawingRoutinePtr2), hl
	ld	hl, (startingPosition)
	ld	bc, -lcdWidth * 16
	add	hl, bc
	ld	(startingPosition), hl
	ld	hl, TilePointersStart - 3
	ld	(TilePointersSMC), hl
	exx
	jp	DisplayEachRowLoop
	
SetClippedRoutine2:
DrawTile_Clipped_SetJRStop = $+1
	ld	hl, 0
DrawTile_Clipped_SetJRSMC = $+1
	ld	(0), hl
	exx
	jp	DisplayEachRowLoop
	
SetOnlyTreesRoutine:
	ld	hl, SkipDrawingOfTileExx
	ld	(TileDrawingRoutinePtr1), hl
	ld	(TileDrawingRoutinePtr2), hl
DoNothing:
	exx
	jp	DisplayEachRowLoop
	
StopDisplayTiles:
	ld	de, mpShaData
	ld	hl, DrawScreenBorderStart
	ld	bc, DrawScreenBorderEnd - DrawScreenBorderStart
	ldir
	ld	de, (currDrawingBuffer)
	ld	hl, _resources \ .r2
	ld	bc, _resources_size
	ldir
	ld	hl, blackBuffer
	ld	bc, lcdWidth * 13 + 32
	jp	mpShaData
	
DrawScreenBorderStart:
	ldir
	or	a, a			; Fill the edges with black; 21 pushes = 21*3=63+1 = 64 bytes, so 32 bytes on each side
	sbc	hl, hl
	ex	de, hl
	ld	a, lcdHeight - 15 - 13 - 1
	ld	bc, 320
	dec	hl
_:	add	hl, bc
	ld	(hl), e
	ld	sp, hl
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	dec	a
	jr	nz, -_
	ld	bc, lcdWidth - 32 + 2
	add	hl, bc			; Clear the last row of the right edge
	ld	sp, hl
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
	push	de
TempSP2 = $+1
	ld	sp, 0
	ret
DrawScreenBorderEnd:
	
.echo "mpShaData size (2): ", $ - DrawScreenBorderStart
#if $ - DrawScreenBorderStart > 64
.error "mpShaData too large!"
#endif
	
DrawTile_Clipped:
	ld	(BackupIY), iy
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
DrawTile_Clipped_Stop1 = $
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
DrawTile_Clipped_Stop2 = $
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
DrawTile_Clipped_Stop3 = $
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
DrawTile_Clipped_Stop4 = $
	add	iy, sp
	lea	de, iy-0
	ldi
	ldi
StopDrawingTile:
.echo $ - DrawTile_Clipped_Stop1 - 2
_:	ld	iy, 0
BackupIY = $-3
	exx
	jp	SkipDrawingOfTile
	
DisplayTileWithTree:
; Inputs:
;   A' = row index
;   B' = column index
;   HL = pointer to tree sprite

; Y coordinate: A' * 8 + 17 - tree_height
; X coordinate: B' * 32 + !(A' & 0) && ((B' & 1 << 4) ? -16 : 16)

	ld	(BackupIY2), iy
	ld	iy, saveSScreen+21000
TempSP3 = $+1
	ld	sp, 0
	push	hl			; Sprite struct
	ex	af, af'
	ld	c, a			; C = row index
	ex	af, af'
	ld	a, 36
	sub	a, c
	ld	e, a
	ld	d, 8
	mlt	de
	inc	hl
	ld	a, (hl)
	ld	hl, 17
	add	hl, de
	ld	e, (iy + OFFSET_Y)
	ld	d, 0
	add	hl, de
	ld	e, a
	sbc	hl, de
	push	hl			; Y coordinate
	ld	a, 9
	exx
	sub	a, b
	exx
	ld	l, a
	ld	h, 32
	mlt	hl
	ld	e, (iy + OFFSET_X)
	ld	d, 0
	add.s	hl, de
	bit	0, c
	jr	nz, ++_
	bit	4, e
	ld	bc, 16
	jr	z, +_
	ld	bc, -16
_:	or	a, a
	adc	hl, bc
	jr	z, DontDisplayTree
_:	push	hl			; X coordinate
	call	_RLETSprite
DontDisplayTree:
	ld	sp, 320			; No need to pop
BackupIY2 = $+2
	ld	iy, 0
	
DisplayBuilding:
	exx
	jp	SkipDrawingOfTile
	
DrawFieldEnd:

.echo "cursorImage size: ", $ - DrawField

#if $ - DrawField > 1024
.error "cursorImage data too large: ", $ - DrawField, " bytes!"
#endif
    
endrelocate()

drawisometrictile_loc = $

relocate(mpShaData)

DrawIsometricTile:
	ld	sp, -322
	lea	de, iy
	ld	bc, 2
	lddr
	ld	c, 6
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 10
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 14
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 18
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 22
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	ld	c, 26
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	jp	DrawIsometricTileSecondPart
DrawIsometricTileEnd:

.echo "mpShaData size (1): ", $ - DrawIsometricTile
#if $ - DrawIsometricTile > 64
.error "mpShaData too large!"
#endif

endrelocate()
