relocate AoCE_RAM, AOCE_RAM_START + RAM_SIZE + AppDataEnd - AppDataStart, 100000

MainGameLoop:
	call	DrawField
	call	DrawGame
; Swap buffers
	ld	hl, vRAM
	ld	de, (mpLcdBase)
	or	a, a
	sbc	hl, de
	add	hl, de
	jr	nz, .jump
	ld	hl, screenBuffer
.jump:	ld	(currDrawingBuffer), de
	ld	(mpLcdBase), hl
	ld	hl, mpLcdIcr
	set	2, (hl)
	ld	hl, (AmountOfWood)
	inc	hl
	ld	(AmountOfWood), hl
	call	GetKeyFast
	ld	iy, iy_base
CheckKeys369:				; Check [3], [6], [9]
	ld	l, 01Ah
	ld	a, (hl)
	and	a, (1 shl kp3) or (1 shl kp6) or (1 shl kp9)
	jp	z, CheckKeys28
	ScrollFieldRight
CheckKey3:
	bit	kp3, (hl)
	jr	z, CheckKey9
	ScrollFieldRight
	ScrollFieldDown
CheckKey9:
	bit	kp9, (hl)
	jr	z, CheckKeys28
	ScrollFieldRight
	ScrollFieldUp
CheckKeys28:				; Check [2], [8] (5 does nothing)
	ld	l, 018h
	ld	a, (hl)
	and	a, (1 shl kp2) or (1 shl kp8)
	jr	z, CheckKeys147
CheckKey2:
	bit	kp2, (hl)
	jr	z, CheckKey8
	ScrollFieldDown
CheckKey8:
	bit	kp8, (hl)
	jr	z, CheckKeys147
	ScrollFieldUp
CheckKeys147:				; Check [1], [4], [7]
	ld	l, 016h
	ld	a, (hl)
	and	a, (1 shl kp1) or (1 shl kp4) or (1 shl kp7)
	jp	z, CheckClearEnter
	ScrollFieldLeft
CheckKey1:
	bit	kp1, (hl)
	jr	z, CheckKey7
	ScrollFieldLeft
	ScrollFieldDown
CheckKey7:
	bit	kp7, (hl)
	jr	z, CheckClearEnter
	ScrollFieldLeft
	ScrollFieldUp
CheckClearEnter:
	ld	l, 01Ch
	bit	kpClear, (hl)
	ret	nz
	;bit	kpEnter, (hl)
	;jr	z, CheckReleaseEnterKey
	;bit	holdDownEnterKey, (AoCEFlags1)
	;set	holdDownEnterKey, (AoCEFlags1)
	;jr	nz, CheckStop
;CreateNewSelectedArea:
	;ld	hl, (CursorX)
	;ld	(SelectedAreaStartX), hl
	;ld	l, (CursorY)
	;ld	(SelectedAreaStartY), l
	;jr	CheckStop
;CheckReleaseEnterKey:
	;bit	holdDownEnterKey, (AoCEFlags1)
	;res	holdDownEnterKey, (AoCEFlags1)
	;jr	z, CheckStop
;ParseSelectedArea:
;CheckStop:
	ld	hl, mpLcdRis
WaitLCDInterrupt:
	bit	2, (hl)
	jr	z, WaitLCDInterrupt
	jp	MainGameLoop
	
include "routines/mainmenu.asm"
include "routines/drawGame.asm"
;include "routines/pathfinding.asm"
include "routines/routines.asm"
include "routines/drawField.asm"
include "data/tables.asm"
include "data/data.asm"

irpv each, appvar
RelocationTable#%:
	irpv relocation, each#_relocation_table
		dl relocation
	end irpv
	dw $FFFF
end irpv

end relocate