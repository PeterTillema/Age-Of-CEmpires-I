CheckAllAppvarsExists:
	ld	hl, GraphicsAppvar1_
	ld	iyh, 6
_:	call	_Mov9ToOP1
	push	hl
	call	_ChkFindSym
	jr	c, AppvarNotFound_
	pop	hl
	push	hl
	call	_ChkInRAM
	call	nc, _Arc_Unarc
	pop	hl
	dec	iyh
	jr	nz, -_
	ret
	
GraphicsAppvar1_:
	.db	AppVarObj, "AOCEGFX1"
	.db	AppVarObj, "AOCEGFX2"
	.db	AppVarObj, "AGE1", 0,0,0,0
	.db	AppVarObj, "AGE2", 0,0,0,0
	.db	AppVarObj, "AGE3", 0,0,0,0
	.db	AppVarObj, "AGE4", 0,0,0,0
GraphicsAppvarNotFound_:
	.db	"Can't find appvar:", 0
	
LoadGraphicsAppvar1:
	ld	de, (AppvarPointers + 0*3)
	ld	hl, RelocationTable1
LoadGraphicsAppvarRelocationTable:
	ld	(GraphicsAppvarStart), de
_:	push	hl
	ld	hl, (hl)
	ld	a, h
	and	a, l
	inc	a
	jr	z, +_
	push	hl
	ld	hl, (hl)
GraphicsAppvarStart = $+1
	ld	de, 0
	add	hl, de
	ex	de, hl
	pop	hl
	ld	(hl), de
	pop	hl
	inc	hl
	inc	hl
	inc	hl
	jr	-_
_:	pop	hl
	ret
	
LoadGraphicsAppvar2AndAge1:
LoadNewAgeAppvar:

AppvarNotFound:
	call	_HomeUp
	call	_ClrLCDFull
	ld	hl, GraphicsAppvar1
	call	_PutS
	call	_NewLine
	pop	hl
	inc	hl
	call	_PutS
_:	call	_GetCSC
	or	a, a
	jr	z, -_
	jp	ForceStopProgramNormalNoFadeOut