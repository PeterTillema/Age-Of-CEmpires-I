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
;       X   : Move unit X to curr unit
;   X   :
;     UnitNext : 
;       255 : Set 255 as UnitNext of unit X
;       Y   : Move unit Y to curr unit

	ld	a, (ix + UnitNext)
	inc	a
	jr	nz, CopyNextUnitToCurr
	; Things
CopyNextUnitToCurr:
	dec	a					; A = next unit index
	ld	hl, (UnitsStackPtr)
	ld	d, SIZEOF_UNIT_STRUCT_2
	mlt	de
	add	hl, de
	ex	de, hl					; DE = destination
	ld	hl, (UnitsStackPtr)
	ld	c, a
	ld	b, SIZEOF_UNIT_STRUCT_2
	mlt	bc
	add	hl, bc					; HL = source
	ld	c, SIZEOF_UNIT_STRUCT_2
	ld	b, 0
	ldir
	ret
