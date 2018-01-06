.assume ADL=0

#define FlashMbaseStart ($ & $FF0000) >> 16
fUnlockFlash:
	ld	a, 08Ch
	out0	(024h), a
	ld	c, 4
	in0	a, (6)
	or	a, c
	out0	(6), a
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
	in0	a, (6)
	res	2, a
	out0	(6), a
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
.assume ADL=1

#if ($ & $FF0000) >> 16 != FlashMbaseStart
.error "Warning: flash routines should be at same page!"
#endif

BackupRAM:
	ld	a, 03Fh
	call	EraseSector
	ld	a, 03Eh
	call	EraseSector
	ld	a, 03Dh
	call	EraseSector
	ld	a, 03Ch
	call	EraseSector
	ld	hl, 0D00001h
	ld	(hl), 0A5h
	dec	hl
	ld	(hl), 05Ah
	ld	de, 03C0000h
	ld	bc, 0040000h
	jp	_WriteFlash
	
EraseSector:				; Loooooool
	ld	bc, 00000F8h
	push	bc
	jp	_EraseFlashSector