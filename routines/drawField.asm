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
	ld	hl, (DrawTile_Unclipped - TileDrawingRoutinePtr1 - 2) & 0FFh << 8 + 18h		; Write JR <offset>
	ld	(TileDrawingRoutinePtr1), hl
	ld	hl, (DrawTile_Unclipped - TileDrawingRoutinePtr2 - 2) & 0FFh << 8 + 18h		; Write JR <offset>
	ld	(TileDrawingRoutinePtr2), hl

	ld	a, (ix + OFFSET_Y)
	cpl
	and	a, 4
	add	a, 12 + 8
	ld	(DrawTile_Clipped_Height), a
	ld	a, 7
	cp	a, (ix + OFFSET_Y)
	adc	a, -3
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
	cp	a, TILE_STONE_2 + 1
	jr	c, +_
	cp	a, TILE_TREE
	jp	nc, DisplayTileWithTree
	jp	DisplayBuilding
_:	ld	c, a
	ld	b, 3
	mlt	bc
	ld	hl, TilePointers - 3
	add	hl, bc
	ld	hl, (hl)		; Pointer to the tile
TileDrawingRoutinePtr1 = $
	jr	DrawTile_Unclipped	; This will be modified to the clipped version after X rows
	.db	0
	.db	DrawTile_Clipped >> 16
	
TileIsOutOfField:
	exx
	ld	hl, blackBuffer
TileDrawingRoutinePtr2 = $
	jr	DrawTile_Unclipped	; This will be modified to the clipped version after X rows
	.db	0
	.db	DrawTile_Clipped >> 16
	
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
IncrementRowXOrNot1:
	jr	nz, +_
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
	jr	nc, +_
	ld	bc, DrawTile_Clipped & 0FFFFh << 8 + 0C3h
	ld	(TileDrawingRoutinePtr1), bc
	ld	(TileDrawingRoutinePtr2), bc
	ld	c, a
	ld	a, (DrawTile_Clipped_Height)
	sub	a, 9
	jr	c, StopDisplayTiles
	inc	a
	ld	(DrawTile_Clipped_Height), a
	ld	a, c
_:	dec	a
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
	jp	z, StopDrawingTile
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
	jr	z, StopDrawingTile
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
	jr	z, StopDrawingTile
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
	jr	z, StopDrawingTile
	add	iy, sp
	lea	de, iy-0
	ldi
	ldi
StopDrawingTile:
_:	ld	iy, 0
BackupIY = $-3
	exx
	jp	SkipDrawingOfTile
	
DisplayTileWithTree:
	ld	hl, TreePointers
	sub	a, TILE_TREE
	ld	c, a
	ld	b, 3
	mlt	bc
	add	hl, bc
	ld	hl, (hl)
	exx
	jp	SkipDrawingOfTile
	
DisplayBuilding:
	exx
	jp	SkipDrawingOfTile
DrawFieldEnd:

#if $ - DrawField > 1024
.error "cursorImage data too large: ",$-DrawField," bytes!"
#endif
    
endrelocate()
