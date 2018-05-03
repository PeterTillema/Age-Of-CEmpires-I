struc concat? strings*&
	local result
	result = ''
	iterate each, strings
		result = string result or each shl (8 * lengthof result)
	end iterate
	. equ result
end struc

macro appvars appvars*&
	local index
	index = 1
	iterate <type, count*>, appvars
		repeat count
			varname concat 'AOCE', `type, `%
			filename concat 'gfx/bin/', varname, '.inc'
			if index <= 2
				repeat 1, index: index
					element appvar#index
					appvar equ appvar#index
				end repeat
				struc (name) equ? value*&
					if `name shr (8 * (lengthof `name - 7)) = '_offset'
						name := appvar + value
					else
						name := value
					end if
				end struc
				include filename
				restruc equ?
				index = index + 1
			else
				include filename
			end if
		end repeat
	end iterate
end macro

macro @ez80.word @value*
	local value, address
	value = @value
	address = $
	if elementsof value
		irpv each, appvar
			if value relativeto each
				each#_relocation_table equ address
				value = value - each
				break
			end if
		end irpv
	end if
	@ez80.word value
end macro

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

macro debugger?
	ld	a, 2
	ld	(-1), a
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
	ld	(OffsetX_SMC1), a
	ld	(OffsetX_SMC2), a
end macro

macro ScrollFieldLeft
	ld	a, (OFFSET_X)
	add	a, 4
	and	a, 000011111b
	ld	(OFFSET_X), a
	ld	(OffsetX_SMC1), a
	ld	(OffsetX_SMC2), a
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
	add	a, 17
	ld	(OffsetY_SMC1), a
	ld	(OffsetY_SMC2), a
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
	add	a, 17
	ld	(OffsetY_SMC1), a
	ld	(OffsetY_SMC2), a
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
	ld	hl, sprite
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