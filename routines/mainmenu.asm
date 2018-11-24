MainMenu:
	ld	de, mpLcdPalette
	ld	hl, blackBuffer
	ld	bc, 256*2
	ldir
	ld	hl, vRAM
	ld	(hl), 094h
	ld	de, vRAM + 1
	ld	bc, lcdWidth * lcdHeight - 1
	ldir
	dispCompressedImage logo_compressed_offset, 72, 32
	ld	hl, pal_sprites
	call	fadeIn
	ld	a, 200
	call	_DelayTenTimesAms
	call	fadeOut
	ld	de, vRAM
	ld	hl, blackBuffer
	ld	bc, lcdWidth * lcdHeight * 2
	ldir
	dispCompressedImage AoCEI_compressed_offset, 5, 5
	dispCompressedImage soldier_compressed_offset, 215, 5
	printString MadeByMessage, 18, 94
Palette_Pointer2 = $+1
	ld	hl, 0
	call	fadeIn
SelectLoopDrawPlayHelpQuit:
	call	EraseArea
	dispCompressedImage playhelpquit_compressed_offset, 50, 110
	ld	hl, SelectMenuMax
	ld	(hl), 2
	call	SelectMenu
	jr	c, .jump
	dec	c
	jr	z, DisplayHelp
	dec	c
	jr	nz, SelectedPlay
.jump:	cp	a, a				; Set Z
	ret
    
DisplayHelp:
	call	EraseArea
	printString GetHelp1, 5, 112
	printString GetHelp2, 5, 122
	printString GetHelp3, 5, 132
	call	GetKeyAnyFast
	jq	SelectLoopDrawPlayHelpQuit
	
SelectedPlay:
	call	EraseArea
	dispCompressedImage singlemultiplayer_compressed_offset, 50, 110
	ld	hl, SelectMenuMax
	ld	(hl), 1
	call	SelectMenu
	jq	c, SelectLoopDrawPlayHelpQuit
	dec	c
	jr	nz, SelectedSinglePlayer
	call	EraseArea
	printString NoMultiplayer1, 5, 112
	printString NoMultiplayer2, 5, 122
	call	GetKeyAnyFast
	jr	SelectedPlay
SelectedSinglePlayer:
	;ld	hl, AoCEMapAppvar
	;call	_Mov9ToOP1
	;call	_ChkFindSym
	;jr	c, +_
	;call	EraseArea
	;dispCompressedImage(_newloadgame_compressed, 50, 110)
	;call	SelectMenu
	;jp	c, SelectedPlay
	;dec	c
	;jp	z, LoadMap
	or	a, 1
	ret

EraseArea:
	ld	hl, 130
	push	hl
	ld	l, 210
	push	hl
	ld	l, 110
	push	hl
	ld	l, 0
	push	hl
	call	_FillRectangle_NoClip
	pop	hl, hl, hl, hl
	ret
    
SelectMenu:
	ld	c, 0
SelectLoop:
	push	bc
	ld	b, 40
	mlt	bc
	ld	hl, 110
	add	hl, bc
	push	hl
	ld	hl, 10
	push	hl
	ld	de, plotSScreen
	push	de
	ld	hl, pointer_compressed_offset
	call	dzx7_Turbo
	call	_Sprite_NoClip
	pop	hl, hl, hl, bc
	ld	b, c
KeyLoop:
	call	GetKeyAnyFast
	ld	l, 01Eh
	bit	kpDown, (hl)
	jr	z, .jump1
	ld	a, c
SelectMenuMax = $+1
	cp	a, 2
	jr	z, .jump1
	inc	c
	jr	EraseCursor
.jump1:	bit	kpUp, (hl)
	jr	z, .jump2
	ld	a, c
	or	a, a
	jr	z, .jump2
	dec	c
	jr	EraseCursor
.jump2:	ld	l, 01Ch
	bit	kpEnter, (hl)
	ret	nz
	bit	kpClear, (hl)
	jr	z, KeyLoop
	scf
	ret
    
EraseCursor:
	push	bc
	ld	l, 36
	push	hl
	ld	hl, 25
	push	hl
	ld	c, 40
	mlt	bc
	ld	hl, 110
	add	hl, bc
	push	hl
	ld	hl, 10
	push	hl
	call	_FillRectangle_NoClip
	pop	hl, hl, hl, hl, bc
	jr	SelectLoop
	
GetHelp1:
	db	"Check http://tiny.cc/aoce", 0
GetHelp2:
	db	"for help, controls, AI's", 0
GetHelp3:
	db	"and much more!", 0
MadeByMessage:
	db	'Made by Peter "PT_" Tillema', 0
NoMultiplayer1:
	db	"Multiplayer is not", 0
NoMultiplayer2:
	db	"supported yet!", 0