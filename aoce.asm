AOCE_VERSION := "1.0.0"

; Include files for fasmg
include 'includes/ez80.inc'
include 'includes/ti84pceg.inc'
include 'includes/tiformat.inc'
include 'includes/defines.inc'
include 'includes/macros.inc'
include 'includes/symbol_table.inc'

; Make AoCE an app
format ti executable 'AOCE'
include 'includes/app.inc'

; Include all the gfx .inc files
appvars GFX,2, AGE,4, UNI,3

	app_create
	
	jr	z, DeleteAoCEProg
	call	_HomeUp
	call	_ClrLCDFull
	ld	hl, AlreadyInstalled
	call	_PutS
	call	_GetKey
	jp	_ClrLCDFull
DeleteAoCEProg:
	call	_ChkFindSym
	jp	_DelVarArc		; delete installer code
	
AlreadyInstalled:
	db	"AoCE already installed,   please delete app to      reinstall", 0
	
	app_start "AoCE", "(C) 2018 Peter Tillema", AOCE_VERSION, 1

	call	_HomeUp
	call	_ClrLCDFull
	call	_RunIndicOff
	push	ix
	
; Check if all the appvars exists
	ld	hl, GraphicsAppvars
	ld	iyh, 9
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
	ld	a, e
	add	hl, de
	ld	e, (hl)
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ex	de, hl
	sub	a, iyh
	ld	c, a
	ld	b, 3
	mlt	bc
	ld	hl, AppvarsPointersTable
	add	hl, bc
	ld	(hl), de
	pop	hl
	dec	iyh
	jr	nz, CheckGraphicsAppvarsLoop
	
; Display loading message
	ld	hl, LoadingMessage
	call	_PutS
	
; Backup RAM
	di
	ld	a, 0D1h
	ld	mb, a
	ld.sis	sp, AOCE_RAM_START and 0FFFFh
	call.lis fUnlockFlash and 0FFFFh
	ld	(BackupSP), sp
	call	BackupRAM
	AoCE_RAM.copy
	ld	(MapDataPtr), de
	
; Use the moved stack
	ld	hl, vRAM - stackTop
	add	hl, sp
	ld	sp, hl
	
; Backup stack
	ld	de, vRAM - (stackTop - stackBot)
	ld	hl, stackBot
	ld	bc, stackTop - stackBot
	ldir
	
; Copy app data to AOCE_RAM_START
	ld	de, AOCE_RAM_START
	ld	hl, AppDataStart
	ld	bc, AppDataEnd - AppDataStart
	ldir
	
	DrawField.copy
	
; Copy the game sprites to RAM and set some pointers
	ld	hl, (MapDataPtr)
	ld	de, MAP_SIZE * MAP_SIZE * 2
	add	hl, de
	push	hl
	ex	de, hl
	ld	hl, (AOCE_RAM_START + 3)
	ld	bc, foundation_11_offset
	ldir
	ld	(BuildingsStackPtr), de
	ld	hl, MAX_AMOUNT_BUILDINGS * 2 * SIZEOF_BUILDING_STRUCT_2
	add	hl, de
	ld	(UnitsStackPtr), hl
	ld	de, MAX_AMOUNT_PEOPLE * 2 * SIZEOF_UNIT_STRUCT_2
	add	hl, de
	ld	(SchedulingEventsBase), hl
	ld	(SchedulingEventsPtr), hl
	ld	de, MAX_AMOUNT_PEOPLE * 2 * SIZEOF_SCHEDULING_EVENT
	add	hl, de
	ld	(BuildingsSpritesBase), hl
	ld	(BuildingsSpritesPtr), hl
	ld	hl, vRAM - (stackTop - stackBot)
	ld	(UnitsSpritesBase), hl
	ld	(UnitsSpritesPtr), hl
	pop	bc
	ld	hl, RelocationTable2 + 3	; Note that "ld	bc, foundation_11_offset" adds another entry to the relocation table
	call	ModifyRelocationTable
	
; Relocate main menu sprites
	ld	hl, RelocationTable1
	ld	bc, (AOCE_RAM_START)
	call	ModifyRelocationTable
	
; Setup some variables and start the game!
	xor	a, a
	ld	(_FillColor), a
	dec	a
	ld	(_FGColor), a
	ld	hl, _menu_gfx_pal
	ld	(Palette_Pointer2), hl
	call	_Begin
	;call	MainMenu
	;jp	z, ForceStopProgramFadeOut
	call	GenerateMap
	ld	a, 1
	ld	(_FGColor), a
	
; Set the palette
	ld	de, mpLcdPalette
	ld	hl, _pal_gfx_pal
	ld	bc, _pal_gfx_pal_size
	ldir
	
; Since the stack is always the same, hardcode the sp backup pointers
	ld	hl, -6
	add	hl, sp
	ld	(TempSP2), hl
	ld	(TempSP3), hl
	ld	(TempSP4), hl
	ld	(TempSP5), hl
	
; TODO: load villager and sheep sprites, place towncenter from you and enemy

; Set timer for scheduling events
	ld	hl, mpTmrCtrl
	ld	(hl), tmr1Crystal or tmr1Overflow
	inc	hl
	ld	(hl), tmr1CountUp shr 8
	ld	de, 0
	ld	l, e
	ld	(hl), de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), de
	inc	hl
	inc	hl
	ld	(hl), de
	ld	l, tmrCtrl
	set	bTmr1Enable, (hl)
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call	SetBufferToScreen
	call	FillScreenPink
	call	PlaceTempBuildings
	;call	PlaceTempUnits
	;call	RegisterUnitDieEvent
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
; Call the main loop
	ld	iy, iy_base
	call	MainGameLoop
	
ForceStopProgramFadeOut:
	call	z, fadeOut
	call	_End
	
; Restore stack and RAM
	ld	de, RAM_MIRROR
	ld	hl, RAM_BACKUP
	ld	bc, (vRAM - ramStart) - (stackTop - stackBot)
	ldir
	ld	de, stackBot + RAM_SIZE			; Prevent crashing because memory protector
	ld	hl, vRAM - (stackTop - stackBot)
	push	hl
	ld	bc, stackTop - stackBot
	ldir
	
; Yeah... let's lock flash again :P
	call.lis fLockFlash and 0FFFFh
	ld	a, 0D0h
	ld	mb, a
	pop	de
	ld	sp, (BackupSP)
	pop	ix
	ld	hl, RAM_BACKUP + (vRAM - ramStart) - (stackTop - stackBot)
	ld	bc, stackTop - stackBot
	ldir
	
; Return to TI-OS
	ld	iy, flags
	call	_DrawStatusBar
	jp	_JForceCmdNoChar
	
AppvarNotFound:
	call	_HomeUp
	call	_ClrLCDFull
	ld	hl, GraphicsAppvarNotFound
	call	_PutS
	call	_NewLine
	pop	hl
	ld	de, -9
	add	hl, de
	call	_PutS
.loop:	call	_GetCSC
	or	a, a
	jr	z, .loop
	pop	ix
	ld	iy, flags
	jp	_JForceCmdNoChar
	
_Begin:
	ld	hl, vRAM
	ld	(hl), 255
	ld	de, vRAM + 1
	ld	bc, lcdWidth * lcdHeight * 2 - 1
	ldir
	ld	a, lcdBpp8
	ld	hl, currDrawingBuffer
SetPointersAndPalette:
	ld	de, vRAM
	ld	(hl), de
	ld	(mpLcdCtrl), a
	ld	l, mpLcdIcr and 0FFh
	ld	(hl), 4
	ld	hl, _menu_gfx_pal
	ld	de, mpLcdPalette
	ld	bc, 256 * 2
	ldir
	ret
	
_End:
	ld	hl, vRAM
	ld	(hl), 255
	ld	de, vRAM + 1
	ld	bc, lcdWidth * lcdHeight * 2 - 1
	ldir
	ld	hl, mpLcdBase
	ld	a, lcdBpp16
	jr	SetPointersAndPalette
	
include 'gfx/bin/menu_gfx.asm'
include 'gfx/bin/pal_gfx.asm'
include 'routines/main.asm'
include 'routines/map.asm'
include 'routines/temp.asm'
	
GraphicsAppvars:
irpv name, varname
	db	AppVarObj, name, 0
end irpv

irpv each, appvar
RelocationTable#%:
	irpv relocation, each#_relocation_table
		dl	relocation
	end irpv
	dl	0
end irpv

GraphicsAppvarNotFound:
	db	"Can't find appvar:", 0
MissingAppVar:
	db	"Need"
LibLoadAppVar:
	db	" LibLoad", 0
	db	"tiny.cc/clibs", 0
LoadingMessage:
	db	"One second, we're going   back to the Middle Ages...", 0

	app_data
	
; Data that will be stored to and then copied to a fixed RAM address
AppDataStart:

AppvarsPointersTable:
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
BackupSP:
	dl	0
	
include 'routines/flash.asm'

AppDataEnd:
