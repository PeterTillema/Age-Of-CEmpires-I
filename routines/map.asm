GenerateMap:
	call	EraseArea
	ld	de, screenBuffer
	ld	hl, blackBuffer
	ld	bc, lcdWidth * lcdHeight
	ldir
	printString(GeneratingMapMessage, 5, 112)
	ld	hl, (0F30044h)
	call	srand
	ld	ixh, 0
PlaceTreesLoop:
	randInt(MAP_SIZE)
	push	hl
	randInt(MAP_SIZE)
	ld	h, 160
	mlt	hl
	add	hl, hl
	pop	de
	add	hl, de
	ld	de, screenBuffer
	add	hl, de
	push	hl
	randInt(4)
	ld	a, l
	add	a, TILE_TREE_1
	pop	hl
	ld	(hl), a
	dec	ixh
	jr	nz, PlaceTreesLoop
	ld	ixh, 3			; Food, stone, gold
PlaceAllResourceTypesLoop:
	ld	b, 15			; Place 15 resources of each
PlaceResourceTypeLoop:
	ld	ixl, b
	randInt(7)			; 7 types of different groups for resources
	push	hl
	pop	de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, ResourcesType1
	add	hl, de
	push	hl
	randInt(MAP_SIZE - 10 - 10)	; X
	ld	a, l
	add	a, 10
	ld	l, a
	ld	h, 160
	mlt	hl
	add	hl, hl
	push	hl
	randInt(MAP_SIZE - 10 - 10)	; Y
	ld	a, l
	add	a, 10
	ld	l, a
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
	jr	z, +_
	ld	a, r
	and	a, 1
ResourceType = $+1
	add	a, TILE_FOOD_1
	ld	(hl), a
_:	inc	hl
	inc	de
	djnz	PlaceResourceRowLoop
	ld	a, c
	inc	b
	ld	c, lcdWidth - 256 - 3
	add	hl, bc
	ld	b, a
	djnz	PlaceResource
DontDrawResource:
	ld	b, ixl
	dec	b
	jp	nz, PlaceResourceTypeLoop
	ld	hl, ResourceType
	inc	(hl)			; Next resource type
	inc	(hl)
	dec	ixh
	jp	nz, PlaceAllResourceTypesLoop
; All the resources are now placed, so copy them to the map appvar
	ld	hl, AoCEMapAppvar
	call	_Mov9ToOP1
	ld	hl, MAP_SIZE*MAP_SIZE*2
	call	_EnoughMem
	jp	c, ForceStopProgram
	ex	de, hl
	call	_CreateAppvar
	ld	hl, screenBuffer
	inc	de
	inc	de
	ld	ixh, MAP_SIZE
CopyMapToNewAppvarLoop:
	ld	b, MAP_SIZE
CopyRowLoop:
	ld	a, (hl)
	or	a, a
	jr	nz, +_
	inc	a
_:	ld	(de), a
	inc	de
	dec	a
	jr	z, +_
	ld	a, 200			; Each resource has 200 in it
_:	ld	(de), a
	inc	hl
	inc	de
	djnz	CopyRowLoop
	ld	bc, 320 - MAP_SIZE
	add	hl, bc
	dec	ixh
	jr	nz, CopyMapToNewAppvarLoop
	call	_OP4ToOP1
LoadMap:
	call	EraseArea
	printString(LoadingMapMessage, 5, 112)
	ld	hl, AoCEMapAppvar
	call	_Mov9ToOP1
	call	_ChkFindSym
	call	_ChkInRAM
	call	c, _Arc_Unarc
	ld	hl, mapAddress
	push	hl ;
	inc	hl
	ex	de, hl
	inc	hl
	inc	hl
	inc	hl
	ld	bc, MAP_SIZE * MAP_SIZE * 2 - 1
	ldir
	pop	hl ;
	inc	hl
	inc	hl
	ld	(hl), TILE_TREE_1
	ret
        
prng24:
	ld	iy, __state
	ld	hl, (iy+0*4+0)
	push	hl
	ld	hl, (iy+0*4+2)
	push	hl
	lea	hl, iy+1*4
	lea	de, iy+0*4
	ld	bc, 3*4
	ldir
	pop	bc
	pop	de
	ld	h, d
	ld	l, e
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, b
	xor	a, h
	ld	h, a
	xor	a, (iy+3*4+2)
	ld	(iy+3*4+3), a
	ld	b, a
	ld	a, c
	xor	a, l
	ld	l, a
	xor	a, (iy+3*4+1)
	ld	(iy+3*4+2), a
	xor	a, a
	add.s	hl, hl
	adc	a, a
	add.s	hl, hl
	adc	a, a
	add.s	hl, hl
	adc	a, a
	xor	a, d
	xor	a, (iy+3*4+0)
	ld	(iy+3*4+1), a
	ld	a, e
	xor	a, h
	ld	(iy+3*4+0), a
	ld	hl, (iy+3*4)
	ld	de, (iy+2*4)
	add	hl, de
	ret
	
__state:
	.db	10h, 0Fh, 0Eh, 0Dh
	.db	0Ch, 0Bh, 0Ah, 09h
	.db	08h, 07h, 06h, 05h
	.db	04h, 03h, 02h, 01h