include 'includes/ez80.inc'
include 'includes/ti84pceg.inc'
include 'includes/tiformat.inc'
include 'includes/defines.asm'
include 'includes/macros.inc'
include 'includes/symbol_table.inc'
include 'gfx/bin/AOCEGFX1.inc'
include 'gfx/bin/AOCEGFX2.inc'
include 'gfx/bin/AOCEAGE1.inc'
include 'gfx/bin/AOCEAGE2.inc'
include 'gfx/bin/AOCEAGE3.inc'
include 'gfx/bin/AOCEAGE4.inc'
include 'gfx/bin/AOCEUNI1.inc'
include 'gfx/bin/AOCEUNI2.inc'
format ti executable 'AOCE'
include 'includes/app.inc'

start:
	app_create
	
	ret	nz
	call	_ChkFindSym
	jp	_DelVarArc		; delete installer code
	
	app_start 'AoCE', '(C) 2017 Peter Tillema', '0.0.0.1', 1

	call	_HomeUp
	call	_ClrLCDFull
	call	_RunIndicOff
	ld	hl, LoadingMessage
	call	_PutS
	push	ix
	
; Check if all the appvars exists
	ld	hl, GraphicsAppvar1_
	ld	iyh, 8
CheckGraphicsAppvarsLoop:
	call	_Mov9ToOP1
	inc	hl
	push	hl
	call	_ChkFindSym
	jp	c, AppvarNotFound
	pop	hl
	push	hl
	call	_ChkInRAM
	call	nc, _Arc_Unarc
	call	_ChkFindSym
	ex	de, hl
	ld	de, 9
	add	hl, de
	ld	e, (hl)
	add	hl, de
	inc	hl
	ex	de, hl
	ld	a, 8
	sub	a, iyh
	ld	c, a
	ld	b, 3
	mlt	bc
	ld	hl, cursorImage		; aka AppvarsPointersTable
	add	hl, bc
	ld	(hl), de
	pop	hl
	dec	iyh
	jr	nz, CheckGraphicsAppvarsLoop
	
; Remove AoCE from UserMem to prevent memory leak, even when crashing
	ld	hl, NewStartAddr1
	ld	de, NewStartAddr2
	ld	bc, AoCEEnd - NewStartAddr4 + NewStartAddr3 - NewStartAddr2
	ldir
	jp	NewStartAddr2
	
AppvarNotFound:
	call	_HomeUp
	call	_ClrLCDFull
	ld	hl, GraphicsAppvarNotFound_
	call	_PutS
	call	_NewLine
	pop	hl
	ld	de, -9
	add	hl, de
	call	_PutS
WaitKeyLoop:
	call	_GetCSC
	or	a, a
	jr	z, WaitKeyLoop
	pop	ix
	ld	iy, flags
	jp	_JForceCmdNoChar
	
GraphicsAppvar1_:
	db	AppVarObj, "AOCEGFX1", 0
	db	AppVarObj, "AOCEGFX2", 0
	db	AppVarObj, "AOCEAGE1", 0
	db	AppVarObj, "AOCEAGE2", 0
	db	AppVarObj, "AOCEAGE3", 0
	db	AppVarObj, "AOCEAGE4", 0
	db	AppVarObj, "AOCEUNI1", 0
	db	AppVarObj, "AOCEUNI2", 0
GraphicsAppvarNotFound_:
	db	"Can't find appvar:", 0
MissingAppVar:
	db	"Need"
LibLoadAppVar:
	db	" LibLoad", 0
	db	"tiny.cc/clibs", 0
LoadingMessage:
	db	"Loading...", 0
	
NewStartAddr1:
org plotSScreen
NewStartAddr2:
; Backup RAM
	ld	de, (asm_prgm_size)
	ld	hl, UserMem
	call	_DelMem
	or	a, a
	sbc	hl, hl
	ld	(asm_prgm_size), hl
	di
	ld.sis	sp, stackBot and 0FFFFh
	call.lis fUnlockFlash and 0FFFFh
	call	BackupRAM
	ld	hl, NewStartAddr3
	ld	de, NewStartAddr4 + RAM_SIZE	; Mirror of RAM
	ld	bc, AoCEEnd - NewStartAddr4
	ldir
	ld	(MapDataPtr), de
	jp	NewStartAddr4
	
#include "routines/flash.asm"
	
NewStartAddr3:
org AOCE_RAM_START + 24
NewStartAddr4:
; Copy AppvarsPointersTable to AOCE_RAM_START
	ld	de, AOCE_RAM_START
	ld	hl, cursorImage
	ld	bc, 24
	ldir
	
; Backup stack
	ld	hl, heapBot
	ld	de, vRAM - (stackTop - heapBot)
	ld	bc, stackTop - heapBot
	ldir
	
; Use the moved stack
	or	a, a
	sbc	hl, hl
	add	hl, sp
	ld	(backupSP), hl
	ld	de, vRAM - stackTop
	add	hl, de
	ld	sp, hl
	
; Copy to cursorImage
	DrawField.copy
	
; Set some pointers
	ld	hl, (MapDataPtr)
	ld	de, MAP_SIZE * MAP_SIZE * 2
	add	hl, de
	push	hl
	ex	de, hl
	ld	hl, (AOCE_RAM_START + 3)
	ld	bc, 0
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ldir
	ld	(FixedBuildingsPtr), de
	pop	bc
	ld	hl, RelocationTable2
	call	ModifyRelocationTable
	
; Get the sprites of the homescreen
	ld	hl, RelocationTable1
	ld	bc, (AOCE_RAM_START + 0)
	inc	bc			; Skip size bytes
	inc	bc
	call	ModifyRelocationTable
	
; Setup some variables and start the game!
	xor	a, a
	ld	(_FillColor), a
	inc	a
	ld	(_FGColor), a
	call	_Begin
	;call	MainMenu
	call	GenerateMap
	
; Of course, we start with age 1
	ld	c, 1
	ld	hl, RelocationTable3
	ld	de, barracks_1_offset
	call	LoadAgeGraphicsAppvar
	
	ld	iy, iy_base
	xor	a, a
	ld	(OFFSET_X), a
	ld	(OFFSET_Y), a
	
; Set some variables and palette
	ld	hl, vRAM + (lcdWidth * lcdHeight)
	ld	(currDrawingBuffer), hl
	ld	(mpLcdBase), hl
	ld	de, mpLcdPalette
	ld	hl, _pal_gfx_pal
	ld	bc, _pal_gfx_pal_size
	ldir
	
; Needs to be removed before final release :P
	ld	hl, screenBuffer
	ld	(hl), 255
	push	hl
	pop	de
	inc	de
	ld	bc, lcdWidth * lcdHeight - 1
	ldir

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
	ld	hl, vRAM + (lcdWidth * lcdHeight)
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
CheckKeys28:				; Check [2], [8]
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
	jp	nz, ForceStopProgram
	bit	kpEnter, (hl)
	jr	z, CheckReleaseEnterKey
	bit	holdDownEnterKey, (AoCEFlags1)
	set	holdDownEnterKey, (AoCEFlags1)
	jr	nz, CheckStop
CreateNewSelectedArea:
	ld	hl, (CursorX)
	ld	(SelectedAreaStartX), hl
	ld	l, (CursorY)
	ld	(SelectedAreaStartY), l
	jr	CheckStop
CheckReleaseEnterKey:
	bit	holdDownEnterKey, (AoCEFlags1)
	res	holdDownEnterKey, (AoCEFlags1)
	jr	z, CheckStop
ParseSelectedArea:
; Yay #not :P
CheckStop:
	ld	hl, mpLcdRis
WaitLCDInterrupt:
	bit	2, (hl)
	jr	z, WaitLCDInterrupt
	jp	MainGameLoop
	
ForceStopProgramFadeOut:
	call	fadeOut
ForceStopProgram:
CleanupCode:
	ld	de, cursorImage
	ld	hl, CleanupCode
	ld	bc, CleanupCodeEnd - CleanupCode
	ldir
	jp	cursorImage + $ + 4 - CleanupCode
	call	_End
	ld	de, RAM_MIRROR
	ld	hl, RAM_BACKUP
	ld	bc, (vRAM - ramStart) - (stackTop - heapBot)
	ldir
	ld	de, heapBot + RAM_SIZE			; Prevent crashing because memory protector
	ld	hl, vRAM - (stackTop - heapBot)
	push	hl
	ld	bc, stackTop - heapBot
	ldir
	call.lis fLockFlash and 0FFFFh
	pop	de
backupSP = $+1
	ld	sp, 0
	pop	ix
	ld	hl, RAM_BACKUP + (vRAM - ramStart) - (stackTop - heapBot)
	ld	bc, stackTop - heapBot
	ldir
	ld	iy, flags
	call	_DrawStatusBar
	jp	_JForceCmdNoChar	; Return to TI-OS
CleanupCodeEnd:
    
include "gfx/bin/pal_gfx.asm"
include "routines/map.asm"
include "routines/mainmenu.asm"
include "routines/drawGame.asm"
;#include "routines/pathfinding.asm"
include "routines/routines.asm"
include "routines/drawField.asm"
include "data/tables.asm"
include "data/data.asm"

repeat 6
RelocationTable#%:
	irpv relocation, relocation_table#%
		dl relocation
	end irpv
	dw $FFFF
end repeat

AoCEEnd:

	app_data			; Nope, we don't need have any bytes for you sadly :(