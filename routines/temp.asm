SetBufferToScreen:
	ld	hl, screenBuffer
	ld	(currDrawingBuffer), hl
	ld	(mpLcdBase), hl
	ret

FillScreenPink:
	ld	hl, screenBuffer
	ld	(hl), 255
	push	hl
	pop	de
	inc	de
	ld	bc, lcdWidth * lcdHeight - 1
	ldir
	ret
	
PlaceTempBuildings:
	ld	a, 5
	ld	e, 2
	ld	hl, 0
	call	LoadBuildingDynamically
	ld	hl, (BuildingsStackPtr)
	ld	(hl), 5
	inc	hl
	ld	(hl), 0
	ld	de, SIZEOF_BUILDING_STRUCT_2 - 1
	add	hl, de
	ld	(hl), 5
	inc	hl
	ld	(hl), 1
	ld	hl, (MapDataPtr)
	ld	de, 4*2
	add	hl, de
	ld	(hl), TILE_BUILDING
	inc	hl
	ld	(hl), 0
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), TILE_BUILDING
	inc	hl
	ld	(hl), 1
	ret
	
PlaceTempUnits:
	ld	de, (UnitsStackPtr)
	ld	hl, TempUnitsData
	ld	bc, SIZEOF_UNIT_STRUCT_2 * 3
	ldir
	ld	hl, (MapDataPtr)
	ld	(hl), TILE_UNIT_GRASS
	inc	hl
	ld	(hl), 0
	ld	bc, arbalest_gfx
	ld	a, 0
	ld	e, 6
	call	LoadUnitDynamically
	ret
	
RegisterUnitDieEvent:
	ld	hl, UNIT_DIE_TIMEOUT
	ld	e, 0
	ld	bc, RemoveUnitFromTile
	ld	a, 0
	call	RegisterEvent
	ret
	
TempUnitsData:
	db	0, 1, 1, 100, 5
	dl	0
	db	1, 0, 0, 255, 0, 0
	
	db	0, 0, 9, 100, 5
	dl	0
	db	255, 12, 0, 0, 0, 0
	
	db	0, 0, 3, 100, 5
	dl	0
	db	255, 8, 8, 1, 0, 0
