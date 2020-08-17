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
	value := @value
	address := $
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

virtual
	jr	z, $
	load	jr_z: byte from $$
end virtual

virtual
	jr	nz, $
	load	jr_nz: byte from $$
end virtual

virtual
	dec	a
	load	dec_a: byte from $$
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

virtual
	dec	(hl)
	load	dec_hl: byte from $$
end virtual

virtual
	inc	(hl)
	load	inc_hl: byte from $$
end virtual

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

macro unit? base_x*, base_y*, name*
	db	base_x
	db	base_y
	dl	name
end macro

macro building_costs? offset*, appvar*, wood*, gold*, stone*
	dl	offset
	db	appvar
	dw	wood
	dw	gold
	dw	stone
end macro

macro unit_costs? offset*, appvar*, wood*, gold*, food*
	dl	offset
	db	appvar
	dw	wood
	dw	gold
	dw	food
end macro
