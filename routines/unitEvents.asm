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
;       X   : Set map data to unit X and 255 as UnitPrev of unit X
;   X   :
;     UnitNext : 
;       255 : Set 255 as UnitNext of unit X
;       Y   : Set UnitPrev of unit Y to X, set UnitNext of unit X to unit Y

	ld	a, (ix + UnitPrev)
	cp	a, 255
	jr	nz, ChangeUnitNext
; UnitPrev = 255
	ld	c, (ix + UnitNext)
	inc	c
	jr	z, RemoveUnitFromMap
; UnitNext = X
	dec	c					; Set mapa data to unit X
	inc	hl
	ld	(hl), c
	ld	b, SIZEOF_UNIT_STRUCT_2			; Set 255 as UnitPrev of unit X
	mlt	bc
	ld	ix, (UnitsStackPtr)
	add	ix, bc
	ld	(ix + UnitPrev), 255
	ret
RemoveUnitFromMap:
; UnitNext = 255
	ld	a, (hl)					; Remove unit from map data
	sub	a, TILE_UNIT_GRASS - TILE_GRASS
	ld	(hl), a
	ret
ChangeUnitNext:						; A = UnitPrev
; UnitPrev = X
	ld	e, (ix + UnitNext)
	ld	c, a
	ld	b, SIZEOF_UNIT_STRUCT_2
	mlt	bc
	ld	ix, (UnitsStackPtr)
	lea	hl, ix + UnitNext
	add	hl, bc
	ld	(hl), e
	inc	e
	ret	z
; UnitNext = Y
	dec	e
	ld	d, SIZEOF_UNIT_STRUCT_2
	mlt	de
	ld	ix, (UnitsStackPtr)
	add	ix, de
	ld	(ix + UnitPrev), a
	ret
	