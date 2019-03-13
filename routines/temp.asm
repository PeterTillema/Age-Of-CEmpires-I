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
	ld	hl, buildings_loaded + (BUILDING_SPRITE.size * 5) + BUILDING_SPRITE.RAMPTR
	inc	(hl)				; Set nonzero
	ld	hl, buildings_stack
	ld	(hl), 5
	inc	hl
	ld	(hl), 0
	ld	hl, (map_data_ptr)
	ld	(hl), TILE_BUILDING
	inc	hl
	ld	(hl), 0
	ret
	
PlaceTempUnits:
	ld	de, units_stack
	ld	hl, TempUnitsData
	ld	bc, UNIT_ENTRY.size * 3
	ldir
	ld	hl, (map_data_ptr)
	ld	(hl), TILE_UNIT_GRASS
	inc	hl
	ld	(hl), 0
	ld	bc, arbalest_gfx
	ld	a, 0
	ld	e, 6
	jp	LoadUnitDynamically
	
RegisterUnitDieEvent:
	ld	hl, UNIT_DIE_TIMEOUT
	ld	bc, RemoveUnitFromTile
	ld	a, 0
	call	RegisterEvent
	ld	hl, UNIT_DIE_TIMEOUT * 2
	ld	bc, RemoveUnitFromTile
	ld	a, 1
	jp	RegisterEvent
	
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
