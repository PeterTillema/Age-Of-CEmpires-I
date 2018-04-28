AmountOfWood:
	dl	0
AmountOfFood:
	dl	0
AmountOfGold:
	dl	0
AmountOfStone:
	dl	0
AmountOfPeople:
	db	1
AmountOfMaxPeople:
	db	10
AmountOfBuildings:
	db	0
MapDataPtr:
	dl	0
	
BuildingsStackPtr:
	dl	0
BuildingsSpritesBase:
	dl	0
BuildingsSpritesPtr:
	dl	0
BuildingsLoaded:
	rb	SIZEOF_BUILDING_STRUCT_1 * 18
	
UnitsStackPtr:
	dl	0
UnitsSpritesBase:
	dl	0
UnitsSpritesPtr:
	dl	0
UnitsLoaded:
	rb	SIZEOF_UNIT_STRUCT_1 * 22
	
UnitsPerTile:
	rb	5 * 3
TempData1:
	rb	8
PathFindingData:
	rb	20
	
virtual at iy
	TopLeftXTile:			dl -10
	TopLeftYTile:			dl -3
	CursorX:			dl 160-12
	CursorY:			db 120-16
	SelectedAreaStartX:		dl 0
	SelectedAreaStartY:		db 0
	TempData2:			rb 12
	AoCEFlags1:			db 0
	OFFSET_X:			db 0
	OFFSET_Y:			db 0
	load iy_data: $ - $$ from $$
end virtual
iy_base db iy_data

TempUnits:
	db	1, 0, 100, 5
	dl	0
	db	1
	db	1, 3
	db	255
	
	db	1, 0, 100, 5
	dl	0
	db	2
	db	1, 2
	db	0
	
	db	1, 0, 100, 5
	dl	0
	db	255
	db	1, 1
	db	1

ResourcesType1:
	db	0, 1, 0
	db	0, 1, 1
	db	1, 1, 1
ResourcesType2:
	db	1, 0, 0
	db	0, 1, 0
	db	0, 1, 1
ResourcesType3:
	db	0, 0, 0
	db	1, 1, 0
	db	0, 0, 0
ResourcesType4:
	db	1, 1, 1
	db	0, 1, 0
	db	0, 0, 0
ResourcesType5:
	db	0, 0, 0
	db	0, 0, 1
	db	1, 1, 1
ResourcesType6:
	db	0, 0, 0
	db	0, 1, 0
	db	0, 0, 0
ResourcesType7:
	db	0, 0, 0
	db	0, 0, 1
	db	0, 1, 1
	
pal_sprites:				; Don't worry, it's just the xLIBC palette
	dw $0000, $0081, $0102, $0183, $0204, $0285, $0306, $0387
	dw $0408, $0489, $050A, $058B, $060C, $068D, $070E, $078F
	dw $0810, $0891, $0912, $0993, $0A14, $0A95, $0B16, $0B97
	dw $0C18, $0C99, $0D1A, $0D9B, $0E1C, $0E9D, $0F1E, $0F9F
	dw $1000, $1081, $1102, $1183, $1204, $1285, $1306, $1387
	dw $1408, $1489, $150A, $158B, $160C, $168D, $170E, $178F
	dw $1810, $1891, $1912, $1993, $1A14, $1A95, $1B16, $1B97
	dw $1C18, $1C99, $1D1A, $1D9B, $1E1C, $1E9D, $1F1E, $1F9F
	dw $2020, $20A1, $2122, $21A3, $2224, $22A5, $2326, $23A7
	dw $2428, $24A9, $252A, $25AB, $262C, $26AD, $272E, $27AF
	dw $2830, $28B1, $2932, $29B3, $2A34, $2AB5, $2B36, $2BB7
	dw $2C38, $2CB9, $2D3A, $2DBB, $2E3C, $2EBD, $2F3E, $2FBF
	dw $3020, $30A1, $3122, $31A3, $3224, $32A5, $3326, $33A7
	dw $3428, $34A9, $352A, $35AB, $362C, $36AD, $372E, $37AF
	dw $3830, $38B1, $3932, $39B3, $3A34, $3AB5, $3B36, $3BB7
	dw $3C38, $3CB9, $3D3A, $3DBB, $3E3C, $3EBD, $3F3E, $3FBF
	dw $4040, $40C1, $4142, $41C3, $4244, $42C5, $4346, $43C7
	dw $4448, $44C9, $454A, $45CB, $464C, $46CD, $474E, $47CF
	dw $4850, $48D1, $4952, $49D3, $4A54, $4AD5, $4B56, $4BD7
	dw $4C58, $4CD9, $4D5A, $4DDB, $4E5C, $4EDD, $4F5E, $4FDF
	dw $5040, $50C1, $5142, $51C3, $5244, $52C5, $5346, $53C7
	dw $5448, $54C9, $554A, $55CB, $564C, $56CD, $574E, $57CF
	dw $5850, $58D1, $5952, $59D3, $5A54, $5AD5, $5B56, $5BD7
	dw $5C58, $5CD9, $5D5A, $5DDB, $5E5C, $5EDD, $5F5E, $5FDF
	dw $6060, $60E1, $6162, $61E3, $6264, $62E5, $6366, $63E7
	dw $6468, $64E9, $656A, $65EB, $666C, $66ED, $676E, $67EF
	dw $6870, $68F1, $6972, $69F3, $6A74, $6AF5, $6B76, $6BF7
	dw $6C78, $6CF9, $6D7A, $6DFB, $6E7C, $6EFD, $6F7E, $6FFF
	dw $7060, $70E1, $7162, $71E3, $7264, $72E5, $7366, $73E7
	dw $7468, $74E9, $756A, $75EB, $766C, $76ED, $776E, $77EF
	dw $7870, $78F1, $7972, $79F3, $7A74, $7AF5, $7B76, $7BF7
	dw $7C78, $7CF9, $7D7A, $7DFB, $7E7C, $7EFD, $7F7E, $FFFF
	
DefaultCharSpacing_ASM:
	;   0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F
	db 8,8,8,8,8,8,8,8,8,8,8,8,8,2,8,8
	db 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
	db 3,4,6,8,8,8,8,5,5,5,8,7,4,7,3,8
	db 8,7,8,8,8,8,8,8,8,8,3,4,6,7,6,7
	db 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
	db 8,8,8,8,8,8,8,8,8,8,8,5,8,5,8,8
	db 4,8,8,8,8,8,8,8,8,5,8,8,5,8,8,8
	db 8,8,8,8,7,8,8,8,8,8,8,7,3,7,8,8
	db 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
	db 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8

;-------------------------------------------------------------------------------
DefaultTextData_ASM:
Char000: db $00,$00,$00,$00,$00,$00,$00,$00 ; .
Char001: db $7E,$81,$A5,$81,$BD,$BD,$81,$7E ; .
Char002: db $7E,$FF,$DB,$FF,$C3,$C3,$FF,$7E ; .
Char003: db $6C,$FE,$FE,$FE,$7C,$38,$10,$00 ; .
Char004: db $10,$38,$7C,$FE,$7C,$38,$10,$00 ; .
Char005: db $38,$7C,$38,$FE,$FE,$10,$10,$7C ; .
Char006: db $00,$18,$3C,$7E,$FF,$7E,$18,$7E ; .
Char007: db $00,$00,$18,$3C,$3C,$18,$00,$00 ; .
Char008: db $FF,$FF,$E7,$C3,$C3,$E7,$FF,$FF ; .
Char009: db $00,$3C,$66,$42,$42,$66,$3C,$00 ; .
Char010: db $FF,$C3,$99,$BD,$BD,$99,$C3,$FF ; .
Char011: db $0F,$07,$0F,$7D,$CC,$CC,$CC,$78 ; .
Char012: db $3C,$66,$66,$66,$3C,$18,$7E,$18 ; .
Char013: db $3F,$33,$3F,$30,$30,$70,$F0,$E0 ; .
Char014: db $7F,$63,$7F,$63,$63,$67,$E6,$C0 ; .
Char015: db $99,$5A,$3C,$E7,$E7,$3C,$5A,$99 ; .
Char016: db $80,$E0,$F8,$FE,$F8,$E0,$80,$00 ; .
Char017: db $02,$0E,$3E,$FE,$3E,$0E,$02,$00 ; .
Char018: db $18,$3C,$7E,$18,$18,$7E,$3C,$18 ; .
Char019: db $66,$66,$66,$66,$66,$00,$66,$00 ; .
Char020: db $7F,$DB,$DB,$7B,$1B,$1B,$1B,$00 ; .
Char021: db $3F,$60,$7C,$66,$66,$3E,$06,$FC ; .
Char022: db $00,$00,$00,$00,$7E,$7E,$7E,$00 ; .
Char023: db $18,$3C,$7E,$18,$7E,$3C,$18,$FF ; .
Char024: db $18,$3C,$7E,$18,$18,$18,$18,$00 ; .
Char025: db $18,$18,$18,$18,$7E,$3C,$18,$00 ; .
Char026: db $00,$18,$0C,$FE,$0C,$18,$00,$00 ; .
Char027: db $00,$30,$60,$FE,$60,$30,$00,$00 ; .
Char028: db $00,$00,$C0,$C0,$C0,$FE,$00,$00 ; .
Char029: db $00,$24,$66,$FF,$66,$24,$00,$00 ; .
Char030: db $00,$18,$3C,$7E,$FF,$FF,$00,$00 ; .
Char031: db $00,$FF,$FF,$7E,$3C,$18,$00,$00 ; .
Char032: db $00,$00,$00,$00,$00,$00,$00,$00 ;
Char033: db $C0,$C0,$C0,$C0,$C0,$00,$C0,$00 ; !
Char034: db $D8,$D8,$D8,$00,$00,$00,$00,$00 ; "
Char035: db $6C,$6C,$FE,$6C,$FE,$6C,$6C,$00 ; #
Char036: db $18,$7E,$C0,$7C,$06,$FC,$18,$00 ; $
Char037: db $00,$C6,$CC,$18,$30,$66,$C6,$00 ; %
Char038: db $38,$6C,$38,$76,$DC,$CC,$76,$00 ; &
Char039: db $30,$30,$60,$00,$00,$00,$00,$00 ; '
Char040: db $30,$60,$C0,$C0,$C0,$60,$30,$00 ; (
Char041: db $C0,$60,$30,$30,$30,$60,$C0,$00 ; )
Char042: db $00,$66,$3C,$FF,$3C,$66,$00,$00 ; *
Char043: db $00,$30,$30,$FC,$FC,$30,$30,$00 ; +
Char044: db $00,$00,$00,$00,$00,$60,$60,$C0 ; ,
Char045: db $00,$00,$00,$FC,$00,$00,$00,$00 ; -
Char046: db $00,$00,$00,$00,$00,$C0,$C0,$00 ; .
Char047: db $06,$0C,$18,$30,$60,$C0,$80,$00 ; /
Char048: db $7C,$CE,$DE,$F6,$E6,$C6,$7C,$00 ; 0
Char049: db $30,$70,$30,$30,$30,$30,$FC,$00 ; 1
Char050: db $7C,$C6,$06,$7C,$C0,$C0,$FE,$00 ; 2
Char051: db $FC,$06,$06,$3C,$06,$06,$FC,$00 ; 3
Char052: db $0C,$CC,$CC,$CC,$FE,$0C,$0C,$00 ; 4
Char053: db $FE,$C0,$FC,$06,$06,$C6,$7C,$00 ; 5
Char054: db $7C,$C0,$C0,$FC,$C6,$C6,$7C,$00 ; 6
Char055: db $FE,$06,$06,$0C,$18,$30,$30,$00 ; 7
Char056: db $7C,$C6,$C6,$7C,$C6,$C6,$7C,$00 ; 8
Char057: db $7C,$C6,$C6,$7E,$06,$06,$7C,$00 ; 9
Char058: db $00,$C0,$C0,$00,$00,$C0,$C0,$00 ; :
Char059: db $00,$60,$60,$00,$00,$60,$60,$C0 ; ;
Char060: db $18,$30,$60,$C0,$60,$30,$18,$00 ; <
Char061: db $00,$00,$FC,$00,$FC,$00,$00,$00 ; =
Char062: db $C0,$60,$30,$18,$30,$60,$C0,$00 ; >
Char063: db $78,$CC,$18,$30,$30,$00,$30,$00 ; ?
Char064: db $7C,$C6,$DE,$DE,$DE,$C0,$7E,$00 ; @
Char065: db $38,$6C,$C6,$C6,$FE,$C6,$C6,$00 ; A
Char066: db $FC,$C6,$C6,$FC,$C6,$C6,$FC,$00 ; B
Char067: db $7C,$C6,$C0,$C0,$C0,$C6,$7C,$00 ; C
Char068: db $F8,$CC,$C6,$C6,$C6,$CC,$F8,$00 ; D
Char069: db $FE,$C0,$C0,$F8,$C0,$C0,$FE,$00 ; E
Char070: db $FE,$C0,$C0,$F8,$C0,$C0,$C0,$00 ; F
Char071: db $7C,$C6,$C0,$C0,$CE,$C6,$7C,$00 ; G
Char072: db $C6,$C6,$C6,$FE,$C6,$C6,$C6,$00 ; H
Char073: db $7E,$18,$18,$18,$18,$18,$7E,$00 ; I
Char074: db $06,$06,$06,$06,$06,$C6,$7C,$00 ; J
Char075: db $C6,$CC,$D8,$F0,$D8,$CC,$C6,$00 ; K
Char076: db $C0,$C0,$C0,$C0,$C0,$C0,$FE,$00 ; L
Char077: db $C6,$EE,$FE,$FE,$D6,$C6,$C6,$00 ; M
Char078: db $C6,$E6,$F6,$DE,$CE,$C6,$C6,$00 ; N
Char079: db $7C,$C6,$C6,$C6,$C6,$C6,$7C,$00 ; O
Char080: db $FC,$C6,$C6,$FC,$C0,$C0,$C0,$00 ; P
Char081: db $7C,$C6,$C6,$C6,$D6,$DE,$7C,$06 ; Q
Char082: db $FC,$C6,$C6,$FC,$D8,$CC,$C6,$00 ; R
Char083: db $7C,$C6,$C0,$7C,$06,$C6,$7C,$00 ; S
Char084: db $FF,$18,$18,$18,$18,$18,$18,$00 ; T
Char085: db $C6,$C6,$C6,$C6,$C6,$C6,$FE,$00 ; U
Char086: db $C6,$C6,$C6,$C6,$C6,$7C,$38,$00 ; V
Char087: db $C6,$C6,$C6,$C6,$D6,$FE,$6C,$00 ; W
Char088: db $C6,$C6,$6C,$38,$6C,$C6,$C6,$00 ; X
Char089: db $C6,$C6,$C6,$7C,$18,$30,$E0,$00 ; Y
Char090: db $FE,$06,$0C,$18,$30,$60,$FE,$00 ; Z
Char091: db $F0,$C0,$C0,$C0,$C0,$C0,$F0,$00 ; [
Char092: db $C0,$60,$30,$18,$0C,$06,$02,$00 ; \
Char093: db $F0,$30,$30,$30,$30,$30,$F0,$00 ; ]
Char094: db $10,$38,$6C,$C6,$00,$00,$00,$00 ; ^
Char095: db $00,$00,$00,$00,$00,$00,$00,$FF ; _
Char096: db $C0,$C0,$60,$00,$00,$00,$00,$00 ; `
Char097: db $00,$00,$7C,$06,$7E,$C6,$7E,$00 ; a
Char098: db $C0,$C0,$C0,$FC,$C6,$C6,$FC,$00 ; b
Char099: db $00,$00,$7C,$C6,$C0,$C6,$7C,$00 ; c
Char100: db $06,$06,$06,$7E,$C6,$C6,$7E,$00 ; d
Char101: db $00,$00,$7C,$C6,$FE,$C0,$7C,$00 ; e
Char102: db $1C,$36,$30,$78,$30,$30,$78,$00 ; f
Char103: db $00,$00,$7E,$C6,$C6,$7E,$06,$FC ; g
Char104: db $C0,$C0,$FC,$C6,$C6,$C6,$C6,$00 ; h
Char105: db $60,$00,$E0,$60,$60,$60,$F0,$00 ; i
Char106: db $06,$00,$06,$06,$06,$06,$C6,$7C ; j
Char107: db $C0,$C0,$CC,$D8,$F8,$CC,$C6,$00 ; k
Char108: db $E0,$60,$60,$60,$60,$60,$F0,$00 ; l
Char109: db $00,$00,$CC,$FE,$FE,$D6,$D6,$00 ; m
Char110: db $00,$00,$FC,$C6,$C6,$C6,$C6,$00 ; n
Char111: db $00,$00,$7C,$C6,$C6,$C6,$7C,$00 ; o
Char112: db $00,$00,$FC,$C6,$C6,$FC,$C0,$C0 ; p
Char113: db $00,$00,$7E,$C6,$C6,$7E,$06,$06 ; q
Char114: db $00,$00,$FC,$C6,$C0,$C0,$C0,$00 ; r
Char115: db $00,$00,$7E,$C0,$7C,$06,$FC,$00 ; s
Char116: db $30,$30,$FC,$30,$30,$30,$1C,$00 ; t
Char117: db $00,$00,$C6,$C6,$C6,$C6,$7E,$00 ; u
Char118: db $00,$00,$C6,$C6,$C6,$7C,$38,$00 ; v
Char119: db $00,$00,$C6,$C6,$D6,$FE,$6C,$00 ; w
Char120: db $00,$00,$C6,$6C,$38,$6C,$C6,$00 ; x
Char121: db $00,$00,$C6,$C6,$C6,$7E,$06,$FC ; y
Char122: db $00,$00,$FE,$0C,$38,$60,$FE,$00 ; z
Char123: db $1C,$30,$30,$E0,$30,$30,$1C,$00 ; {
Char124: db $C0,$C0,$C0,$00,$C0,$C0,$C0,$00 ; |
Char125: db $E0,$30,$30,$1C,$30,$30,$E0,$00 ; }
Char126: db $76,$DC,$00,$00,$00,$00,$00,$00 ; ~
Char127: db $00,$10,$38,$6C,$C6,$C6,$FE,$00 ; .