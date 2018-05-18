relocate DrawField, cursorImage, 1024

DrawField:
	DrawIsometricTile.copy
	ld	b, (OFFSET_X)
	bit	4, b
	ld	a, TILE_WIDTH / 2
	ld	c, jr_z
	jr	z, .jump1
	neg
	ld	c, jr_nz
.jump1:	ld	(TopRowLeftOrRight), a
	ld	a, c
	ld	(IncrementRowXOrNot1), a
	
	ld	hl, DrawIsometricTile
	ld	(TileDrawingRoutinePtr1), hl
	ld	(TileDrawingRoutinePtr2), hl
	ld	hl, TilePointersEnd - 3
	ld	(TilePointersSMC), hl
	ld	hl, add_iy_sp_lea_de_iy
	ld	(DrawTile_Clipped_Stop1), hl
	ld	(DrawTile_Clipped_Stop2), hl
	ld	(DrawTile_Clipped_Stop3), hl

	ld	e, (OFFSET_Y)
	ld	hl, FieldRowActionTable
	ld	d, 10
	bit	3, e
	jr	z, .jump2
	inc	d
	dec	hl
	dec	hl
	dec	hl
.jump2:	ld	(TileRoutinesTable), hl
	ld	a, d
	ld	(TileHowManyRowsClipped), a
	bit	2, e
	ld	hl, DrawTile_Clipped_Stop2
	ld	d, StopDrawingTile - DrawTile_Clipped_Stop2 - 2
	jr	z, .jump3
	ld	hl, DrawTile_Clipped_Stop3
	ld	(hl), jr_
	inc	hl
	ld	(hl), StopDrawingTile - DrawTile_Clipped_Stop3 - 2
	ld	hl, DrawTile_Clipped_Stop1
	ld	d, StopDrawingTile - DrawTile_Clipped_Stop1 - 2
.jump3:	ld	(DrawTile_Clipped_SetJRSMC), hl
	ld	hl, DrawTile_Clipped_SetJRStop
	ld	(hl), jr_
	inc	hl
	ld	(hl), d
	
	set	4, e					; Point to the row of the bottom right pixel
	ld	d, lcdWidth / 2
	mlt	de
	ld	a, b
	sub	a, TILE_WIDTH * 2 - (TILE_WIDTH / 2 - 1)	; We start at column 17 (bottom right pixel), but 2 tiles to the left
	sbc	hl, hl
	ld	l, a
	add	hl, de
	add	hl, de
	ld	de, (currDrawingBuffer)
	add	hl, de
	ld	(startingPosition), hl
	ld	ix, (TopLeftYTile)
	lea	ix, ix + 2				; Remember the 2 columns at the left
	lea	hl, ix					; Y * MAP_SIZE + X, point to the map data
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (TopLeftXTile)
	dec	de					; Remember the 2 columns at the left
	dec	de
	add	hl, de
	add	hl, hl					; Each tile is 2 bytes worth
	ld	bc, (MapDataPtr)
	add	hl, bc
	ld	a, AMOUNT_OF_ROWS			; Last X rows only trees/buildings
	exx
DisplayEachRowLoopExx:
	exx
DisplayEachRowLoop:					; Display X rows
; Registers usage:
;   BC  = length of row tile
;   DE  = pointer to output
;   HL  = pointer to (black) tile
;   A'  = row index
;   B'  = column index
;   BC' = amount of tiles to be added when changing rows
;   DE' = x index tile
;   HL' = pointer to map data
;   IX  = y index tile
;   IY  = pointer to output
;   SPL = -SCREEN_WIDTH + offset

startingPosition = $+2					; Here are the shadow registers active
	ld	iy, 0					; Advance to the next row
	ld	bc, (TILE_HEIGHT / 2) * lcdWidth
	add	iy, bc
	ld	(startingPosition), iy
	bit	0, a					; Check if we need to add half a tile to it
	jr	nz, NoOffsetAtStart
TopRowLeftOrRight = $+2
	lea	iy, iy + 0
NoOffsetAtStart:
	ex	af, af'
	ld	a, AMOUNT_OF_COLUMNS
	ld	bc, (-MAP_SIZE + 1) * 2			; How much to advance to the next row in the map
DisplayTile:						; Display X tiles in a row
	ld	b, a					; Check if we only need to display buildings (at the left/right)
	cp	a, AMOUNT_OF_COLUMNS - 1
	jr	nc, TileOnlyDisplayBuilding
	cp	a, 3
	jr	c, TileOnlyDisplayBuilding
	ld	a, e					; Check out of field: DE and IX < MAP_SIZE
	or	a, ixl
	add	a, a
	sbc	a, a
	or	a, d
	or	a, ixh
	jr	nz, TileIsOutOfField
	or	a, (hl)					; Tile index
	jp	z, SkipDrawingOfTile			; Tile is part of a building, which will be overwritten later
	exx						; Here are the main registers active
	ld	c, a					; Get the pointer to the tile
	ld	b, 3
	mlt	bc
TilePointersSMC = $+1
	ld	hl, TilePointersEnd - 3			; The clipped tiles needs different pointers, so this pointer will be modified after X rows
	add	hl, bc
	ld	hl, (hl)
	cp	a, TILE_TREE				; Check if it's a tile (with unit)
TileDrawingRoutinePtr1 = $+1
	jp	c, DrawIsometricTile			; This will be modified to the clipped version after X rows
	sub	a, TILE_BUILDING
	jr	c, DisplayTileWithTree			; It's a tree
	jr	DisplayBuildingExx			; It's a building
	
TileIsOutOfField:
	xor	a, a					; Reset A otherwise it might think that it was a tile with unit(s)
	exx
	ld	bc, 0
	ld	hl, blackBuffer
TileDrawingRoutinePtr2 = $+1
	jp	DrawIsometricTile			; This will be modified to the clipped version after X rows
	
TileOnlyDisplayBuilding:
	ld	a, e					; Check if out of field
	or	a, ixl
	add	a, a
	sbc	a, a
	or	a, d
	or	a, ixh
	jp	nz, SkipDrawingOfTile
	ld	a, (hl)
	sub	a, TILE_BUILDING			; Check if it's a building
	jp	c, SkipDrawingOfTile
	jr	DisplayBuilding
	
DisplayTileWithTree:
; Inputs:
;   A' = row index
;   B' = column index
;   HL = pointer to tree sprite

; Y coordinate: A' * 8 + 17 - tree_height
; X coordinate: B' * 32 + !(A' & 0) && ((B' & 1 << 4) ? -16 : 16)

	ld	(BackupIY2), iy				; Backup IY, it's quite useful
TempSP3 = $+1
	ld	sp, 0
	push	hl					; Sprite struct
	ex	af, af'
	ld	c, a					; C = row index
	ex	af, af'
	ld	a, AMOUNT_OF_ROWS + 1
	sub	a, c
	ld	e, a
	ld	d, TILE_HEIGHT / 2 / 2
	mlt	de
	inc	hl
	ld	a, (hl)
OffsetY_SMC1 = $+1
	ld	hl, 17
	add	hl, de
	add	hl, de
	ld	e, a
	sbc	hl, de
	push	hl					; Y coordinate
	ld	a, AMOUNT_OF_COLUMNS - 2
	exx
	sub	a, b					; B' = column index
	exx
	ld	l, a
	ld	h, TILE_WIDTH
	mlt	hl
OffsetX_SMC1 = $+1
	ld	e, 0
	add	hl, de
	bit	0, c
	jr	nz, .jump
	bit	4, e
	ld	e, TILE_WIDTH / 2
	add	hl, de
	jr	z, .jump
	sla	e
	sbc	hl, de
	jr	z, DontDisplayTree			; If X offset 0, the tree is at the most left column, so fully offscreen
.jump:	push	hl					; X coordinate
	call	_RLETSprite				; No need to pop
DontDisplayTree:
	ld	iy, 0
BackupIY2 = $-3
	jp	SkipDrawingOfTileExx
	
DisplayBuildingExx:
	exx
DisplayBuilding:
	inc	hl
	ld	a, (hl)					; Building index
	dec	hl
	exx
	
; Inputs:
;   A' = row index
;   B' = column index
;   A  = index in buildings stack

; Y coordinate: A' * 8 + 17 - building_height
; X coordinate: B' * 32 + !(A' & 0) && ((B' & 1 << 4) ? -16 : 16) - (building_width - 30) / 2

TempSP4 = $+1
	ld	sp, 0
	ld	(BackupIY3), iy
	ld	hl, (BuildingsStackPtr)
	ld	c, a
	ld	b, SIZEOF_BUILDING_STRUCT_2
	mlt	bc
	add	hl, bc
	ld	c, (hl)					; C = building index
	ld	b, SIZEOF_BUILDING_STRUCT_1
	mlt	bc
	inc	hl
	ld	a, (hl)					; A = which team to load
	ld	iy, BuildingsLoaded
	add	iy, bc					; IY = pointer to general building struct
	
; Loaded | Team | Action
; 0        0      Nothing
; 0        1      Inc
; 1        0      Dec
; 1        1      Nothing

	cp	a, (iy + BuildingTeamLoaded)		; Eventually swap teamcolors
	jr	z, NoBuildingTeamColorsSwap
	ld	a, iyh
	ld	(IYH_SMC1), a
	jr	nc, .inc
.dec:	dec	(iy + BuildingTeamLoaded)
	call	TeamColorsToDec
	jr	.ins
.inc:	inc	(iy + BuildingTeamLoaded)
	call	TeamColorsToInc
.ins:	ld	hl, (iy + BuildingRAMPtr)
	ld	de, (iy + BuildingTCPPtr)
	call	IncTeamColors
IYH_SMC1 = $+2
	ld	iyh, 3
NoBuildingTeamColorsSwap:
	ld	hl, (iy + BuildingRAMPtr)
	ld	b, (hl)					; B = building width
	push	hl					; Sprite struct
	ex	af, af'
	ld	c, a					; C = row_index start at bottom
	ex	af, af'
	ld	a, AMOUNT_OF_ROWS + 1
	sub	a, c					; A = row_index start at top
	ld	e, a
	ld	d, TILE_HEIGHT / 2 / 2
	mlt	de					; DE = pointer to row / 2
	inc	hl
	ld	a, (hl)					; A = building_height
OffsetY_SMC2 = $+1
	ld	hl, 17
	add	hl, de
	add	hl, de					; HL = pointer to row + offset + y_offset
	ld	e, a
	sbc	hl, de					; HL = pointer to row + offset + y_offset - building_height
	push	hl					; Y coordinate
	ld	a, AMOUNT_OF_COLUMNS - 2
	exx
	sub	a, b
	exx
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
OffsetX_SMC2 = $+1
	ld	e, 0
	add	hl, de
	ld	a, b
	bit	0, c
	jr	nz, .jump
	bit	4, e
	ld	e, TILE_WIDTH / 2
	add	hl, de
	jr	z, .jump
	sla	e
	sbc	hl, de
.jump:	sub	a, 30
	srl	a
	ld	e, a
	sbc	hl, de
	push	hl					; X coordinate
	call	_RLETSprite				; No need to pop
BackupIY3 = $+2
	ld	iy, 0
	jp	SkipDrawingOfTileExx

DrawIsometricTileSecondPart:
	ld	c, 30
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	inc	sp
	inc	sp
	ld	c, 30
	ex	de, hl
	add	hl, sp
	add	hl, bc
	ex	de, hl
	lddr
	inc	sp
	inc	sp
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
SkipDrawingOfTileCheckUnit:
	cp	a, TILE_UNIT_GRASS
	jp	nc, DisplayUnits
SkipDrawingOfTileExx:
	exx
SkipDrawingOfTile:
	lea	iy, iy + TILE_WIDTH			; Advance to next tile
	inc	de					; Next X index in map
	dec	ix					; Previous Y index in map
	ld	a, b
	ld	b, 255					; BCU and C still holds (-MAP_SIZE + 1) * 2)
	add	hl, bc					; Advance to the next tile in the map data
	dec	a
	jp	nz, DisplayTile				; Display all the tiles in the row
	ex	af, af'
IncrementRowXOrNot1 = $
	jr	nz, NoExtraColumnChange			; The zero flag is still set/reset from the "bit 0, a"
	inc	de					; Advance an extra diagonal tile
	dec	ix
	add	hl, bc
NoExtraColumnChange:
	ex	de, hl
	ld	c, -AMOUNT_OF_COLUMNS			; Advance to the next row tiles
	add	hl, bc
	ex	de, hl
	ld	bc, (MAP_SIZE * (AMOUNT_OF_COLUMNS + 1) - AMOUNT_OF_COLUMNS) * 2
	add	hl, bc
	lea	ix, ix + AMOUNT_OF_COLUMNS + 1
TileHowManyRowsClipped = $+1				; Check if we need an extra routine to set the clipped tiles
	cp	a, 0
	dec	a
	jp	nc, DisplayEachRowLoop
	exx
	ld	c, a					; Get the routine
	ld	b, 3
	mlt	bc
TileRoutinesTable = $+1
	ld	hl, FieldRowActionTable
	add	hl, bc
	ld	hl, (hl)
	jp	(hl)					; And jump to it
	
SetClippedRoutine:
	ld	hl, DrawTile_Clipped			; Set the clipped routine
	ld	(TileDrawingRoutinePtr1), hl
	ld	(TileDrawingRoutinePtr2), hl
	ld	hl, (startingPosition)			; The starting position is now different
	ld	de, -lcdWidth * (TILE_HEIGHT - 1) - 1	; -1 because we start at the left pixel of the top row, not the right one
	add	hl, de
	ld	(startingPosition), hl
	ld	hl, TilePointersStart - 3		; Also use different pointers for displaying tiles
	ld	(TilePointersSMC), hl
	jp	DisplayEachRowLoopExx
	
SetClippedRoutine2:
DrawTile_Clipped_SetJRStop = $+1
	ld	hl, 0					; Insert a JR X in the clipped tile routine
DrawTile_Clipped_SetJRSMC = $+1
	ld	(0), hl
	jp	DisplayEachRowLoopExx
	
SetOnlyTreesRoutine:
	ld	hl, SkipDrawingOfTileExx		; Normal tiles shouldn't be displayed anymore
	ld	(TileDrawingRoutinePtr1), hl
	ld	(TileDrawingRoutinePtr2), hl
	jp	DisplayEachRowLoopExx
	
StopDisplayTiles:
	ld	de, mpShaData				; Copy routine to mpShaData
	ld	hl, DrawScreenBorderStart
	ld	bc, DrawScreenBorderEnd - DrawScreenBorderStart
	ldir
	ld	de, (currDrawingBuffer)			; Display food, wood, stone etc placeholder
	ld	hl, resources_offset
	ld	bc, resources_width * resources_height
	ldir
	ld	hl, blackBuffer				; Display the right and left black edge
	ld	b, (lcdWidth * 13 + TILE_WIDTH) shr 8
	jp	mpShaData
	
DrawScreenBorderStart:
	ld	c, (lcdWidth * 13 + TILE_WIDTH) and 255
	ldir
	ex	de, hl					; Fill the edges with black; 21 pushes = 21*3=63+1 = 64 bytes, so 32 bytes on each side
	ld	a, lcdHeight - 15 - 13 - 1
	ld	de, lcdWidth				; Used to advance to the next 'half-row'
	dec	hl
FillBorderLoop:
	add	hl, de
	ld	(hl), c
	ld	sp, hl
	push	bc					; Fill with black using pushes (bc = 0, writes 3 bytes at the same time)
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	dec	a
	jr	nz, FillBorderLoop
	ld	de, lcdWidth - TILE_WIDTH + 2
	add	hl, de					; Clear the last row of the right edge
	ld	sp, hl
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
	push	bc
TempSP2 = $+1
	ld	sp, 0					; Yay, we are finally done!
	ret
DrawScreenBorderEnd:
	
DrawTile_Clipped:
	ld	(BackupIY), iy
	ld	sp, lcdWidth
	lea	de, iy
	ld	c, 2
	ldir
	add	iy, sp
	lea	de, iy-2
	ld	c, 6
	ldir
	add	iy, sp
	lea	de, iy-4
	ld	c, 10
	ldir
DrawTile_Clipped_Stop1 = $
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
DrawTile_Clipped_Stop2 = $
	add	iy, sp
	lea	de, iy-14
	ld	c, 30
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
StopDrawingTile:
	ld	iy, 0
BackupIY = $-3
	jp	SkipDrawingOfTileCheckUnit
end relocate

relocate DrawIsometricTile, mpShaData, 64

DrawIsometricTile:
	ld	sp, -lcdWidth - 2
	lea	de, iy
	ld	c, 2
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
	lddr
	jp	DrawIsometricTileSecondPart
end relocate
	
DisplayUnits:
	ld	(BackupIY4), iy
TempSP5 = $+1
	ld	sp, 0
	push	ix
	ld	b, 5					; Amount of units at the tile
	exx
	inc	hl
	ld	a, (hl)					; Unit index
	dec	hl
	exx
	ld	hl, UnitsPerTile
FindNextUnit:
	ld	e, a
	ld	d, SIZEOF_UNIT_STRUCT_2
	mlt	de
	ld	iy, (UnitsStackPtr)
	add	iy, de
	ld	de, (iy + UnitNext)
	ld	c, e					; C is next unit
	ld	e, a
	ld	(hl), de
	inc	hl
	inc	hl
	inc	hl
	inc	c
	jr	z, SortUnits
	dec	c
	ld	a, c
	djnz	FindNextUnit
SortUnits:
	ld	a, 5
	sub	a, b
	ld	b, a					; B = 5 - unit index
	ld	a, 1					; A = unit index [1,X]
	jr	z, DisplayAllUnits			; Only 1 unit, no need to sort
	ld	c, a					; C = unit index [1,X]
	ld	iy, UnitsPerTile + 3			; IY = pointer to current element
.loop1:	ld	hl, (iy)				; HL = current element
	lea	ix, iy-3				; IX = pointer to test element
	ld	c, a
.loop2:	ld	de, (ix)				; DE = test element
	or	a, a					; Compare elements
	sbc	hl, de
	add	hl, de
	jr	nc, .ins				; HL > DE, so stop with swapping
	ld	(ix+3), de				; Move the test element to the previous position
	lea	ix, ix-3				; Decrease test pointer
	dec	c					; Loop through all the remaining units
	jr	nz, .loop2
.ins:	ld	(ix+3), hl				; Insert the current element in the right position
	lea	iy, iy+3				; Increment current element pointer
	inc	a					; Loop through all the units
	djnz	.loop1
DisplayAllUnits:
	
; Inputs:
;   A  = amount of units
;   A' = row index
;   B' = column index

; screen.x = (map.x - map.y) * TILE_WIDTH_HALF;
; screen.y = (map.x + map.y) * TILE_HEIGHT_HALF;

; Y coordinate: (A' + sprite_x + sprite_y) * 8 + 17 + offset_y - sprite_y
; X coordinate: B' * 32 + !(A' & 0) && ((B' & 1 << 4) ? -16 : 16) + offset_x + (sprite_x - sprite_y) * 16

	ld	b, a
	ld	hl, UnitsPerTile
DisplayUnitLoop:
	push	bc
	push	hl
	ld	c, (hl)					; Unit index
	ld	b, SIZEOF_UNIT_STRUCT_2
	mlt	bc
	ld	iy, (UnitsStackPtr)
	add	iy, bc					; Pointer to unit struct in game
	ld	a, (iy + UnitTeam)
	ld	c, (iy + UnitIndex)
	ld	b, SIZEOF_UNIT_STRUCT_1
	mlt	bc
	ld	ix, UnitsLoaded
	add	ix, bc					; Pointer to unit struct in RAM
	
; Loaded | Team | Action
; 0        0      Nothing
; 0        1      Inc
; 1        0      Dec
; 1        1      Nothing

	cp	a, (ix + UnitTeamLoaded)
	jr	z, NoUnitTeamColorsSwap
	ld	a, iyh
	ld	(IYH_SMC2), a
	jr	c, .inc
.dec:	dec	(ix + UnitTeamLoaded)
	call	TeamColorsToDec
	jr	.ins
.inc:	inc	(ix + UnitTeamLoaded)
	call	TeamColorsToInc
.ins:	ld	hl, (ix + UnitRAMPtr)
	ld	de, (ix + BuildingTCPPtr)
	call	IncTeamColors
	ld	b, 0
IYH_SMC2 = $+2
	ld	iyh, 3
NoUnitTeamColorsSwap:
	ld	c, (ix + UnitType)
	ld	hl, UnitsSpritesPointersTable
	add	hl, bc
	add	hl, bc
	add	hl, bc
	ld	hl, (hl)				; Pointer to table with sprites per unit
	ld	c, (iy + UnitEvent)
	add	hl, bc
	add	hl, bc
	add	hl, bc
	ld	hl, (hl)				; Sprite offset
	ld	bc, (ix + UnitRAMPtr)
	add	hl, bc					; Pointer to sprite
	push	hl
	inc	hl
	ld	b, (hl)
	ex	af, af'
	ld	c, a
	ex	af, af'
	ld	a, AMOUNT_OF_ROWS - 1
	sub	a, c
	;ld	b, (iy + UnitOffsetX)
	;add	a, b
	;add	a, (iy + UnitOffsetX)
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
OffsetY_SMC3 = $+1
	ld	de, 17
	add	hl, de
	ld	e, b
	or	a, a
	sbc	hl, de
	push	hl
	;ld	a, b
	;sub	a, (iy + UnitOffsetY)
	;sbc	hl, hl
	;ld	l, a
	;add	hl, hl
	;add	hl, hl
	;add	hl, hl
	;add	hl, hl
	ld	a, AMOUNT_OF_COLUMNS - 2
	exx
	sub	a, b
	exx
	;ld	e, a
	;ld	d, TILE_WIDTH / 2
	;mlt	de
	;add	hl, de
	;add	hl, de
		ld	l, a
		ld	h, TILE_WIDTH
		mlt	hl
	ld	e, TILE_WIDTH / 2
	add	hl, de
OffsetX_SMC3 = $+1
	ld	e, 0
	add	hl, de
	bit	0, c
	jr	nz, .jump
	bit	4, e
	ld	e, TILE_WIDTH / 2
	add	hl, de
	jr	z, .jump
	sla	e
	sbc	hl, de
.jump:	push	hl
	call	_RLETSprite
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	bc
	inc	hl
	inc	hl
	inc	hl
	dec	b
	jp	nz, DisplayUnitLoop
	pop	ix
BackupIY4 = $+2
	ld	iy, 0
	jp	SkipDrawingOfTileExx
