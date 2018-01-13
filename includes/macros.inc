#macro ScrollLeft()
	ld	de, (iy+TopLeftXTile)
	dec	de
	ld	(iy+TopLeftXTile), de
#endmacro

#macro ScrollRight()
	ld	de, (iy+TopLeftXTile)
	inc	de
	ld	(iy+TopLeftXTile), de
#endmacro

#macro ScrollUp()
	ld	de, (iy+TopLeftYTile)
	dec	de
	ld	(iy+TopLeftYTile), de
#endmacro

#macro ScrollDown()
	ld	de, (iy+TopLeftYTile)
	inc	de
	ld	(iy+TopLeftYTile), de
#endmacro

#macro ScrollFieldRight()
	ld	a, (iy+OFFSET_X)
	or	a, a
	jr	nz, +_
	ScrollRight()
	ScrollUp()
_:	sub	a, 4
	and	a, %00011111
	ld	(iy+OFFSET_X), a
#endmacro

#macro ScrollFieldLeft()
	ld	a, (iy+OFFSET_X)
	add	a, 4
	and	a, %00011111
	ld	(iy+OFFSET_X), a
	jr	nz, +_
	ScrollLeft()
	ScrollDown()
_:
#endmacro

#macro ScrollFieldUp()
	ld	a, (iy+OFFSET_Y)
	add	a, 4
	and	a, %00001111
	ld	(iy+OFFSET_Y), a
	jr	nz, +_
	ScrollLeft()
	ScrollUp()
_:
#endmacro

#macro ScrollFieldDown()
	ld	a, (iy+OFFSET_Y)
	or	a, a
	jr	nz, +_
	ScrollRight()
	ScrollDown()
_:	sub	a, 4
	and	a, %00001111
	ld	(iy+OFFSET_Y), a
#endmacro

#macro printString(message, x, y)
	ld	l, y
	push	hl
	ld	hl, x
	push	hl
	ld	hl, message
	push	hl
	call	gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
#endmacro

#macro dispCompressedImage(sprite, x, y)
#IF x==y
	ld	hl, x
	push	hl
	push	hl
#ELSE
	ld	l, y
	push	hl
	ld	hl, x
	push	hl
#ENDIF
	ld	de, 0D20000h
	push	de
	ld	hl, sprite \.r1
	call	dzx7_Turbo
	call	gfx_Sprite_NoClip
	pop	de
	pop	hl
	pop	hl
#endmacro

#macro randInt(x)
	call	_rand
	ld	bc, x			; 7 types of resources group
	call	__idvrmu
#endmacro