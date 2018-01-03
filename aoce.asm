#include "includes/ti84pce.inc"
#include "includes/defines.asm"
#include "includes/macros.inc"
#include "bin/AOCEGFX1.lab"
#include "bin/AOCEGFX2.lab"
#include "includes/relocation.inc"

.db tExtTok, tAsm84CECmp
.org UserMem

start:
	jp	AoCEStart
	.db	1
	.db	16,16				; Cesium icon, made by Pieman7373
	.db	000h,000h,000h,000h,020h,061h,081h,0A1h,0A1h,0A0h,0A0h,040h,001h,000h,000h,000h
	.db	000h,000h,000h,020h,061h,0A2h,0C2h,0C1h,0C0h,0A0h,0C0h,061h,021h,021h,021h,000h
	.db	000h,000h,020h,061h,0A1h,0C1h,0A1h,0A0h,061h,0A1h,0C1h,062h,029h,029h,021h,021h
	.db	000h,000h,061h,0A1h,0A1h,0A0h,061h,081h,061h,061h,082h,08Ch,04Ah,04Ah,029h,021h
	.db	000h,020h,060h,0C1h,0A0h,060h,040h,069h,06Ah,06Ah,08Bh,094h,094h,04Ah,049h,021h
	.db	000h,020h,0A0h,0C2h,081h,040h,021h,06Bh,06Bh,094h,0D6h,0B5h,0B5h,06Bh,049h,021h
	.db	000h,020h,081h,0C1h,081h,040h,04Ah,04Bh,04Bh,094h,0DEh,0DEh,094h,06Bh,04Ah,021h
	.db	000h,020h,060h,0A1h,081h,020h,04Bh,04Ah,04Ah,06Bh,0B6h,0DEh,0B5h,06Bh,04Ah,021h
	.db	000h,020h,040h,060h,060h,041h,06Bh,02Ah,02Ah,04Bh,0B4h,0B5h,0B5h,0B5h,06Ch,029h
	.db	000h,020h,060h,0A0h,080h,041h,094h,06Bh,04Ah,029h,049h,06Ch,094h,06Bh,04Ah,06Bh
	.db	000h,0FFh,0FFh,0FFh,0A0h,040h,04Ah,04Ah,04Bh,06Bh,029h,021h,001h,000h,029h,06Bh
	.db	020h,080h,0FFh,0C0h,0A0h,040h,021h,04Ah,04Ah,06Bh,06Bh,08Ch,06Bh,06Ch,08Ch,029h
	.db	040h,0A0h,0FFh,0A0h,080h,020h,000h,04Ah,04Ah,04Bh,04Ah,06Bh,06Bh,08Ch,06Bh,000h
	.db	061h,0A1h,0FFh,060h,040h,000h,000h,021h,04Ah,04Ah,06Bh,08Ch,08Ch,0B4h,06Bh,000h
	.db	081h,0FFh,0FFh,0FFh,020h,000h,000h,021h,04Ah,04Ah,04Bh,094h,0B5h,0D6h,06Bh,000h
	.db	081h,081h,040h,040h,000h,000h,000h,000h,021h,029h,04Ah,04Ah,04Ah,06Bh,029h,000h
	.db	"Age of CEmpires I - By Peter \"PT_\" Tillema", 0
AoCEStart:
	ld	hl, LibLoadAppVar
	call	_Mov9ToOP1
	ld	a, AppVarObj
	ld	(OP1), a
_:	call	_ChkFindSym
	jr	c, NotFound
	call	_ChkInRAM
	jr	nz, InArc
	call	_PushOP1
	call	_Arc_UnArc
	call	_PopOP1
	jr	-_
InArc:
	ex	de, hl
	ld	de, 9
	add	hl, de
	ld	e, (hl)
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	de, RelocationStart
	jp	(hl)
NotFound:
	call	_ClrScrn
	call	_HomeUp
	ld	hl, MissingAppVar
	call	_PutS
	call	_NewLine
	jp	_PutS
RelocationStart:
    .db 0C0h, "GRAPHX", 0, 4
gfx_Begin:
	jp	0
gfx_End:
	jp	3
gfx_SetColor:
	jp	6
gfx_SetDraw:
	jp	27
gfx_SwapDraw:
	jp	30
gfx_PrintChar:
	jp	42
gfx_PrintUInt:
	jp	48
gfx_PrintStringXY:
	jp	54
gfx_SetTextXY:
	jp	57
gfx_SetTextFGColor:
	jp	63
gfx_Rectangle_NoClip:
	jp	123
gfx_FillRectangle_NoClip:
	jp	126
gfx_Sprite_NoClip:
	jp	177
gfx_TransparentSprite_NoClip:
	jp	180
gfx_SetTransparentColor:
	jp	225
    
Main:
	call	_HomeUp
	call	_ClrLCDFull
	call	_RunIndicOff
	push	ix
	ld	(backupSP), sp
	jr	RunProgram
ForceStopProgramWithFadeOut:
	call	fadeOut
ForceStopProgram:
backupSP = $+1
	ld	sp, 0
	pop	ix
	di
	call.lis fLockFlash & 0FFFFh
	ld	a, 0D0h
	ld	mb, a
	call	gfx_End
	ld	iy, flags
	jp	_DrawStatusBar
RunProgram:
	di
	ld.sis	sp, stackBot & 0FFFFh
	ld	a, FlashMbaseStart
	ld	mb, a
	call.lis fUnlockFlash & 0FFFFh
	
	ld	hl, AoCEMapAppvar
	call	_Mov9ToOP1
	call	_ChkFindSym
	call	nc, _DelVarArc
	ld	hl, GraphicsAppvar1
	ld	de, RelocationTable1
	call	LoadGraphicsAppvar
	call	gfx_Begin
	ld	l, 254
	push	hl
	call	gfx_SetTextFGColor
	ld	l, 255
	ex	(sp), hl
	call	gfx_SetTransparentColor
	pop	hl
	;call	MainMenu
	call	GenerateMap
	ld	hl, GraphicsAppvar2
	ld	de, RelocationTable2
	call	LoadGraphicsAppvar
	ld	l, 0F8h
	push	hl
	call	gfx_SetTransparentColor
	ld	l, 0FFh
	ex	(sp), hl
	call	gfx_SetColor
	pop	hl
    
	ld	ix, saveSScreen+21000
	xor	a, a
	ld	(ix+OFFSET_X), a
	ld	(ix+OFFSET_Y), 8
	ld	hl, drawfield_loc
	ld	de, DrawField
	ld	bc, DrawFieldEnd - DrawField
	ldir
	ld	hl, vRAM+(320*240)
	ld	(currDrawingBuffer), hl
	ld	(mpLcdBase), hl
	ld	de, mpLcdPalette
	ld	hl, _age_1_pal
	ld	bc, 256*2
	ldir
	
#if 1 == 1				; Easier debugging if you have a full pink background
	ld	hl, screenBuffer
	ld	(hl), 255
	push	hl
	pop	de
	inc	de
	ld	bc, 320*240-1
	ldir
#endif
	scf
	sbc	hl, hl
	ld	(hl), 2
    
MainGameLoop:
	call	DrawField
	call	GetKeyFast
	ld	ix, variables
	ld	iy, _IYOffsets
CheckKeys369:				; Check [3], [6], [9]
	ld	l, 01Ah
	ld	a, (hl)
	and	a, (1 << kp3) | (1 << kp6) | (1 << kp9)
	jr	z, CheckKeys28
	ScrollFieldRight()
CheckKey3:
	bit	kp3, (hl)
	jr	z, CheckKey9
	ScrollFieldDown()
CheckKey9:
	bit	kp9, (hl)
	jr	z, CheckKeys28
	ScrollFieldUp()
CheckKeys28:				; Check [2], [8]
	ld	l, 018h
	ld	a, (hl)
	and	a, (1 << kp2) | (1 << kp8)
	jr	z, CheckKeys147
CheckKey2:
	bit	kp2, (hl)
	jr	z, CheckKey8
	ScrollFieldDown()
CheckKey8:
	bit	kp8, (hl)
	jr	z, CheckKeys147
	ScrollFieldUp()
CheckKeys147:				; Check [1], [4], [7]
	ld	l, 016h
	ld	a, (hl)
	and	a, (1 << kp1) | (1 << kp4) | (1 << kp7)
	jr	z, CheckClearEnter
	ScrollFieldLeft()
CheckKey1:
	bit	kp1, (hl)
	jr	z, CheckKey7
	ScrollFieldDown()
CheckKey7:
	bit	kp7, (hl)
	jr	z, CheckClearEnter
	ScrollFieldUp()
CheckClearEnter:
	ld	l, 01Ch
	bit	kpClear, (hl)
	jp	nz, ForceStopProgram
	bit	kpEnter, (hl)
	jr	z, CheckReleaseEnterKey
	bit	holdDownEnterKey, (iy+AoCEFlags1)
	set	holdDownEnterKey, (iy+AoCEFlags1)
	jr	nz, CheckStop
CreateNewSelectedArea:
	ld	hl, (iy+CursorX)
	ld	(iy+SelectedAreaStartX), hl
	ld	l, (iy+CursorY)
	ld	(iy+SelectedAreaStartY), l
	jr	CheckStop
CheckReleaseEnterKey:
	bit	holdDownEnterKey, (iy+AoCEFlags1)
	res	holdDownEnterKey, (iy+AoCEFlags1)
	jr	z, CheckStop
ParseSelectedArea:
; Yay #not :P
CheckStop:
; Swap buffers
	ld	hl, vRAM
	ld	de, (mpLcdBase)
	or	a, a
	sbc	hl, de
	add	hl, de
	jr	nz, +_
	ld	hl, vRAM+(320*240)
_:	ld	(currDrawingBuffer), de
	ld	(mpLcdBase), hl
	jp	MainGameLoop
    
#include "gfx/bin/age_1.asm"
#include "data/tables.asm"
#include "data/data.asm"
#include "routines/map.asm"
#include "routines/mainmenu.asm"
#include "routines/pathfinding.asm"
#include "routines/routines.asm"
#include "routines/drawField.asm"
#include "routines/flash.asm"
#include "relocation_table1.asm"
	.dw	0FFFFh
#include "relocation_table2.asm"
	.dw	0FFFFh