assume ADL=0

FlashMbaseStart equ $ shr 16
fUnlockFlash:
	ld	a, 08Ch
	out0	(024h), a
	ld	c, 4
	in0	a, (006h)
	or	a, c
	out0	(006h), a
	out0	(028h), c
; Disable stack protector
	xor	a, a
	out0	(03Ah), a
	out0	(03Bh), a
	out0	(03Ch), a
	ret.l
	
fLockFlash:
	xor	a, a
	out0	(028h), a
	in0	a, (006h)
	res	2, a
	out0	(006h), a
	ld	a, 088h
	out0	(024h), a
; Restore stack protector
	ld	a, 081h
	out0	(03Ah), a
	ld	a, 098h
	out0	(03Bh), a
	ld	a, 0D1h
	out0	(03Ch), a
	ret.l

assume ADL=1

BackupRAM:
	ld	a, 03Fh
	call	EraseSector
	ld	a, 03Eh
	call	EraseSector
	ld	a, 03Dh
	call	EraseSector
	ld	a, 03Ch
	call	EraseSector
	ld	hl, ramStart + 1
	ld	(hl), 0A5h		; Magic bytes <3
	dec	hl
	ld	(hl), 05Ah
	ld	de, RAM_BACKUP
	ld	bc, 0040000h
	jp	_WriteFlash
	
EraseSector:				; Loooooool
	ld	bc, 00000F8h
	push	bc
	jp	_EraseFlashSector