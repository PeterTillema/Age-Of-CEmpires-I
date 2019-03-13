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
; Inputs:
;   A = unit index
	ld	ix, units_stack
	ld	c, a					; C = unit index
	ld	e, a					; E = unit index
	ld	b, UNIT_ENTRY.size
	mlt	bc
	add	ix, bc
	ld	c, (ix + UNIT_ENTRY.Y)
	ld	b, MAP_SIZE
	mlt	bc
	ld	hl, (map_data_ptr)
	add	hl, bc
	ld	c, (ix + UNIT_ENTRY.X)
	ld	b, 0
	add	hl, bc
	
; UnitPrev : 
;   255 : 
;     UnitNext : 
;       255 : Remove unit from map data
;       X   : Set map data to unit X and 255 as UnitPrev of unit X
;   X   :
;     UnitNext : 
;       255 : Set 255 as UnitNext of unit X
;       Y   : Set UnitPrev of unit Y to X, set UnitNext of unit X to unit Y

	ld	a, (ix + UNIT_ENTRY.PREV)
	cp	a, 255
	jr	nz, ChangeUnitNext
; UnitPrev = 255
	ld	c, (ix + UNIT_ENTRY.NEXT)
	inc	c
	jr	z, RemoveUnitFromMap
; UnitNext = X
	dec	c					; Set mapa data to unit X
	inc	hl
	ld	(hl), c
	ld	b, UNIT_ENTRY.size			; Set 255 as UnitPrev of unit X
	mlt	bc
	ld	ix, units_stack
	add	ix, bc
	ld	(ix + UNIT_ENTRY.PREV), 255
	ret
RemoveUnitFromMap:
; UnitNext = 255
	ld	a, (hl)					; Remove unit from map data
	sub	a, TILE_UNIT_GRASS - TILE_GRASS
	ld	(hl), a
	ret
ChangeUnitNext:						; A = UnitPrev
; UnitPrev = X
	ld	e, (ix + UNIT_ENTRY.NEXT)
	ld	c, a
	ld	b, UNIT_ENTRY.size
	mlt	bc
	ld	ix, units_stack
	lea	hl, ix + UNIT_ENTRY.NEXT
	add	hl, bc
	ld	(hl), e
	inc	e
	ret	z
; UnitNext = Y
	dec	e
	ld	d, UNIT_ENTRY.size
	mlt	de
	ld	ix, units_stack
	add	ix, de
	ld	(ix + UNIT_ENTRY.PREV), a
	ret
	