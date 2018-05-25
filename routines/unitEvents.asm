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
	ld	ix, (UnitsStackPtr)
	ld	c, a					; C = unit index
	ld	e, a					; E = unit index
	ld	b, SIZEOF_UNIT_STRUCT_2
	mlt	bc
	add	ix, bc
	ld	hl, UnitsActive				; Set unit inactive
	ld	c, e
	ld	b, 0
	add	hl, bc
	dec	(hl)
	ld	c, (ix + UnitY)
	ld	b, MAP_SIZE
	mlt	bc
	ld	hl, (MapDataPtr)
	add	hl, bc
	ld	c, (ix + UnitX)
	ld	b, 0
	add	hl, bc
	
; UnitPrev : 
;   255 : 
;     UnitNext : 
;       255 : Remove unit from map data
;       X   : Set map data to unit X
;   X   :
;     UnitNext : 
;       Set UnitNext as UnitNext of unit X

	ld	a, (ix + UnitPrev)
	cp	a, 255
	jr	nz, ChangeUnitNext
	ld	c, (ix + UnitY)
	ld	b, MAP_SIZE
	mlt	bc
	ld	hl, (MapDataPtr)
	add	hl, bc
	ld	c, (ix + UnitX)
	ld	b, 0
	add	hl, bc
	ld	c, (ix + UnitNext)
	inc	c
	jr	z, RemoveUnitFromMap
	dec	c
	inc	hl
	ld	(hl), c
	ret
RemoveUnitFromMap:
	ld	a, (hl)
	sub	a, TILE_UNIT_GRASS - TILE_GRASS
	ld	(hl), a
	ret
ChangeUnitNext:
	ld	e, (ix + UnitNext)			; E = next unit index
	ld	c, a
	ld	b, SIZEOF_UNIT_STRUCT_2
	mlt	bc
	ld	ix, (UnitsStackPtr)
	add	ix, bc
	ld	(ix + UnitNext), e
	ret