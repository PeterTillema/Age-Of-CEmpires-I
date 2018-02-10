macro ScrollLeft
	ld	de, (iy+TopLeftXTile)
	dec	de
	ld	(iy+TopLeftXTile), de
end macro

macro ScrollRight
	ld	de, (iy+TopLeftXTile)
	inc	de
	ld	(iy+TopLeftXTile), de
end macro

macro ScrollUp
	ld	de, (iy+TopLeftYTile)
	dec	de
	ld	(iy+TopLeftYTile), de
end macro

macro ScrollDown
	ld	de, (iy+TopLeftYTile)
	inc	de
	ld	(iy+TopLeftYTile), de
end macro

macro ScrollFieldRight
end macro

macro ScrollFieldLeft
end macro

macro ScrollFieldUp
end macro

macro ScrollFieldDown
end macro

macro printString message, x, y
	ld	l, y
	push	hl
	ld	hl, x
	push	hl
	ld	hl, message
	push	hl
	call	_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
end macro

macro dispCompressedImage sprite, x, y
if x = y
	ld	hl, x
	push	hl
	push	hl
else
	ld	l, y
	push	hl
	ld	hl, x
	push	hl
end if
	ld	de, 0D20000h
	push	de
	r1 ld	hl, sprite
	call	dzx7_Turbo
	call	_Sprite_NoClip
	pop	de
	pop	hl
	pop	hl
end macro

macro randInt x
	call	_rand
	ld	bc, x			; 7 types of resources group
	call	__idvrmu
end macro