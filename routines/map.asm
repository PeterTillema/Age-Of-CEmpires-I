; Map structure:
;  Field size: 128x128
;  Each tile is 2 bytes worth:
;   - If it's grass or a stump, the first byte is the type; the second byte is not used
;   - If it's a tree or resource, the first byte is the type; the second byte is how full the tree/resource is
;   - If it's a building, the first byte is the type; the second byte is the index in the buildings array, with more information like health etc
;   - If it's a unit or more units, the first byte is the type from the ground, like grass, with the highest bit set; the second byte is the index in the units array, with a linked list to eventually other units at the same tile

GenerateMap:
	call	EraseArea
	ld	de, screenBuffer
	ld	hl, blackBuffer
	ld	bc, lcdWidth * lcdHeight
	ldir
	printString GeneratingMapMessage, 5, 112
	ld	hl, (0F30044h)
	call	_srand
	ld	ixh, 0
PlaceTreesLoop:
	randInt MAP_SIZE
	push	hl
	randInt MAP_SIZE
	ld	h, lcdWidth / 2
	mlt	hl
	add	hl, hl
	pop	de
	add	hl, de
	ld	de, screenBuffer
	add	hl, de
	push	hl
	randInt AMOUNT_OF_TREES
	ld	a, l
	add	a, TILE_TREE - 1
	pop	hl
	ld	(hl), a
	dec	ixh
	jr	nz, PlaceTreesLoop
	ld	ixh, 3			; Food, stone, gold
PlaceAllResourceTypesLoop:
	ld	ixl, 20			; Place max 20 resources of each
PlaceResourceTypeLoop:
	randInt 7			; 7 types of different groups for resources
	push	hl
	pop	de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, ResourcesType1
	add	hl, de
	push	hl
	randInt MAP_SIZE - 2 - 2	; X
	inc	hl
	inc	hl
	ld	h, lcdWidth / 2
	mlt	hl
	add	hl, hl
	push	hl
	randInt MAP_SIZE - 2 - 2	; Y
	inc	hl
	inc	hl
	pop	de
	add	hl, de
	ld	de, screenBuffer
	add	hl, de
	push	hl
	pop	iy
	ld	de, lcdWidth - 2
	ld	a, (hl)			; Check if one of the 9 blocks is already a tree/part of resource
	inc	hl
	or	a, (hl)
	inc	hl
	or	a, (hl)
	add	hl, de
	or	a, (hl)
	inc	hl
	or	a, (hl)
	inc	hl
	or	a, (hl)
	add	hl, de
	or	a, (hl)
	inc	hl
	or	a, (hl)
	inc	hl
	or	a, (hl)
	pop	de
	jr	nz, DontDrawResource
	lea	hl, iy
	ld	b, 3
PlaceResource:
	ld	c, b
	ld	b, 3
PlaceResourceRowLoop:
	ld	a, (de)
	or	a, a
	jr	z, DontDisplayResource
	ld	a, r			; I like it
	and	a, 1
ResourceType = $+1
	add	a, TILE_FOOD_1 - 1
	ld	(hl), a
DontDisplayResource:
	inc	hl
	inc	de
	djnz	PlaceResourceRowLoop
	ld	a, c
	inc	b
	ld	c, (lcdWidth and 0FFh) - 3
	add	hl, bc
	ld	b, a
	djnz	PlaceResource
DontDrawResource:
	dec	ixl
	jp	nz, PlaceResourceTypeLoop
	ld	hl, ResourceType
	inc	(hl)			; Next resource type
	inc	(hl)
	dec	ixh
	jp	nz, PlaceAllResourceTypesLoop
	
; All the resources are now placed, so copy them to the map data
	ld	de, (MapDataPtr)
	ld	hl, screenBuffer
	ld	ixh, MAP_SIZE
CopyMapToNewAppvarLoop:
	ld	b, MAP_SIZE
CopyRowLoop:
	ld	a, (hl)
	or	a, a
	jr	nz, TileIsNonEmpty
	inc	a
TileIsNonEmpty:
	ld	(de), a
	inc	de
	dec	a
	jr	z, TileIsResource
	ld	a, RESOURCE_MAX
TileIsResource:
	ld	(de), a
	inc	hl
	inc	de
	djnz	CopyRowLoop
	ld	bc, lcdWidth - MAP_SIZE
	add	hl, bc
	dec	ixh
	jr	nz, CopyMapToNewAppvarLoop
	
LoadMap:
	call	EraseArea
	printString LoadingMapMessage, 5, 112
	ld	hl, (MapDataPtr)
	ld	(hl), TILE_UNIT
	inc	hl
	ld	(hl), 0
	ret