; All the unit events
; Inputs:
;   A  = event type
;   IY = pointer to unit stract

UnitAttack1:
UnitAttack2:
UnitAttack3:
UnitAttack4:
UnitAttack5:
UnitAttack6:
UnitAttack7:
UnitAttack8:
UnitDie1:
UnitDie2:
UnitWalk11:
UnitWalk12:
UnitWalk13:
UnitWalk21:
UnitWalk22:
UnitWalk23:
UnitWalk31:
UnitWalk32:
UnitWalk33:
UnitWalk41:
UnitWalk42:
UnitWalk43:
UnitWalk51:
UnitWalk52:
UnitWalk53:
UnitWalk61:
UnitWalk62:
UnitWalk63:
UnitWalk71:
UnitWalk72:
UnitWalk73:
UnitWalk81:
UnitWalk82:
UnitWalk83:
	ret
	
RemoveUnitFromTile:
; Inputs: A - doesn't really work yet lol
	scf
	sbc	hl, hl
	ld	(hl), 2
	ld	ix, (UnitsStackPtr)
	ld	c, a
	ld	b, SIZEOF_UNIT_STRUCT_2
	mlt	bc
	add	ix, bc
	ld	a, (ix + UnitNext)			; A = next unit
	ld	c, (ix + UnitPrev)			; C = prev unit
	cp	a, c
	jr	nz, RemoveUnitFromChain
	ld	c, (ix + UnitY)
	ld	b, MAP_SIZE
	mlt	bc
	ld	hl, (MapDataPtr)
	add	hl, bc
	ld	c, (ix + UnitX)
	ld	b, 0
	add	hl, bc
	ld	a, (hl)
	sub	a, TILE_UNIT_GRASS - TILE_GRASS
	ld	(hl), a
	ret
RemoveUnitFromChain:
	ld	e, c					; E = prev unit
	inc	e
	jr	z, .jump
	dec	e
	ld	b, SIZEOF_UNIT_STRUCT_2
	mlt	bc
	ld	ix, (MapDataPtr)
	add	ix, bc
	ld	(ix + UnitNext), a
.jump:	inc	a
	ret	z
	dec	a
	ld	c, a					; C = next unit
	ld	b, SIZEOF_UNIT_STRUCT_2
	mlt	bc
	ld	ix, (MapDataPtr)
	add	ix, bc
	ld	(ix + UnitPrev), e
	ret
	
	