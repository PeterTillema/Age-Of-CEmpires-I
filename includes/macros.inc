repeat 6
	macro r#% inst&
		inst
		local pc
		pc := $
		relocation_table#% equ pc - 3
	end macro
end repeat

macro relocate? name, address*, maxSize*
	name.source? := $
	name.destination? := address
	org name.destination?
	macro name.copy?
		ld	hl, name.source?
		ld	de, name.destination?
		ld	bc, name.length?
		ldir
	end macro
	macro end?.relocate?
		name.length? := $ - name.destination?
		if name.length? > maxSize
			repeat 1,x:name.length?
				err 'Too much bytes relocated: ', `x, ' bytes'
			end repeat
		else
			repeat 1,x:name.length?
				display 'Relocation used ', `x, ' bytes', 10
			end repeat
		end if
		org name.source? + name.length?
		purge end?.relocate?
	end macro
end macro

virtual
	jr	z, $
	load	jr_z: byte from $$
end virtual

virtual
	jr	nz, $
	load	jr_nz: byte from $$
end virtual

virtual
	dec	c
	load	dec_c: byte from $$
end virtual

virtual
	jr	$
	load	jr_: byte from $$
end virtual

virtual
	add	iy, sp
	lea	de, iy+0
	load	add_iy_sp_lea_de_iy: long from $$
end virtual

macro ScrollLeft
	ld	de, (TopLeftXTile)
	dec	de
	ld	(TopLeftXTile), de
end macro

macro ScrollRight
	ld	de, (TopLeftXTile)
	inc	de
	ld	(TopLeftXTile), de
end macro

macro ScrollUp
	ld	de, (TopLeftYTile)
	dec	de
	ld	(TopLeftYTile), de
end macro

macro ScrollDown
	ld	de, (TopLeftYTile)
	inc	de
	ld	(TopLeftYTile), de
end macro

macro ScrollFieldRight
	ld	a, (OFFSET_X)
	or	a, a
	jr	nz, .jump1
	ScrollRight
	ScrollUp
.jump1:
	sub	a, 4
	and	a, 000011111b
	ld	(OFFSET_X), a
end macro

macro ScrollFieldLeft
	ld	a, (OFFSET_X)
	add	a, 4
	and	a, 000011111b
	ld	(OFFSET_X), a
	jr	nz, .jump2
	ScrollLeft
	ScrollDown
.jump2:
end macro

macro ScrollFieldUp
	ld	a, (OFFSET_Y)
	add	a, 4
	and	a, 000001111b
	ld	(OFFSET_Y), a
	jr	nz, .jump3
	ScrollLeft
	ScrollUp
.jump3:
end macro

macro ScrollFieldDown
	ld	a, (OFFSET_Y)
	or	a, a
	jr	nz, .jump4
	ScrollRight
	ScrollDown
.jump4:
	sub	a, 4
	and	a, 000001111b
	ld	(OFFSET_Y), a
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
	push	hl, hl
else
	ld	l, y
	push	hl
	ld	hl, x
	push	hl
end if
	ld	de, 0D20000h
	push	de
	r1 ld	hl, sprite + 0
	call	dzx7_Turbo
	call	_Sprite_NoClip
	pop	de
	pop	hl
	pop	hl
end macro

macro randInt x
	call	_rand
	ld	bc, x
	call	__idvrmu
end macro