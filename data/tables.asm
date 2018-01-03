TilePointersEnd:
	.dl	_grass + _grass_size - 1 \ .r2
	.dl	_tree_stump_1 + _tree_stump_1_size - 1 \ .r2
	.dl	_tree_stump_2 + _tree_stump_2_size - 1 \ .r2
	.dl	_tree_cut_1 + _tree_cut_1_size - 1 \ .r2
	.dl	_tree_cut_2 + _tree_cut_2_size - 1 \ .r2
	.dl	_bush_1 + _bush_1_size - 1 \ .r2
	.dl	_bush_2 + _bush_2_size - 1 \ .r2
	.dl	_gold_1 + _gold_1_size - 1 \ .r2
	.dl	_gold_2 + _gold_2_size - 1 \ .r2
	.dl	_stone_1 + _stone_1_size - 1 \ .r2
	.dl	_stone_2 + _stone_2_size - 1 \ .r2
	.dl	0
	.dl	0
	.dl	0
	.dl	0
	
TilePointersStart:
	.dl	_grass \.r2
	.dl	_tree_stump_1 \ .r2
	.dl	_tree_stump_2 \ .r2
	.dl	_tree_cut_1 \ .r2
	.dl	_tree_cut_2 \ .r2
	.dl	_bush_1 \ .r2
	.dl	_bush_2 \ .r2
	.dl	_gold_1 \ .r2
	.dl	_gold_2 \ .r2
	.dl	_stone_1 \ .r2
	.dl	_stone_2 \ .r2
	.dl	0
	.dl	0
	.dl	0
	.dl	0
	
TreePointers:
	.dl	_tree_1 \ .r2
	.dl	_tree_2 \ .r2
	.dl	_tree_3 \ .r2
	.dl	_tree_4 \ .r2
	.dl	_tree_cut_1 \ .r2
	.dl	_tree_cut_2 \ .r2
	.dl	_tree_stump_1 \ .r2
	.dl	_tree_stump_2 \ .r2
	
ResourcesType1:
	.db	0, 1, 0
	.db	0, 1, 1
	.db	1, 1, 1
ResourcesType2:
	.db	1, 0, 0
	.db	0, 1, 0
	.db	0, 1, 1
ResourcesType3:
	.db	0, 0, 0
	.db	1, 1, 0
	.db	0, 0, 0
ResourcesType4:
	.db	1, 1, 1
	.db	0, 1, 0
	.db	0, 0, 0
ResourcesType5:
	.db	0, 0, 0
	.db	0, 0, 1
	.db	1, 1, 1
ResourcesType6:
	.db	0, 0, 0
	.db	0, 1, 0
	.db	0, 0, 0
ResourcesType7:
	.db	0, 0, 0
	.db	0, 0, 1
	.db	0, 1, 1
	
pal_sprites:				; Don't worry, it's just the xLIBC palette
	.dw $0000, $0081, $0102, $0183, $0204, $0285, $0306, $0387
	.dw $0408, $0489, $050A, $058B, $060C, $068D, $070E, $078F
	.dw $0810, $0891, $0912, $0993, $0A14, $0A95, $0B16, $0B97
	.dw $0C18, $0C99, $0D1A, $0D9B, $0E1C, $0E9D, $0F1E, $0F9F
	.dw $1000, $1081, $1102, $1183, $1204, $1285, $1306, $1387
	.dw $1408, $1489, $150A, $158B, $160C, $168D, $170E, $178F
	.dw $1810, $1891, $1912, $1993, $1A14, $1A95, $1B16, $1B97
	.dw $1C18, $1C99, $1D1A, $1D9B, $1E1C, $1E9D, $1F1E, $1F9F
	.dw $2020, $20A1, $2122, $21A3, $2224, $22A5, $2326, $23A7
	.dw $2428, $24A9, $252A, $25AB, $262C, $26AD, $272E, $27AF
	.dw $2830, $28B1, $2932, $29B3, $2A34, $2AB5, $2B36, $2BB7
	.dw $2C38, $2CB9, $2D3A, $2DBB, $2E3C, $2EBD, $2F3E, $2FBF
	.dw $3020, $30A1, $3122, $31A3, $3224, $32A5, $3326, $33A7
	.dw $3428, $34A9, $352A, $35AB, $362C, $36AD, $372E, $37AF
	.dw $3830, $38B1, $3932, $39B3, $3A34, $3AB5, $3B36, $3BB7
	.dw $3C38, $3CB9, $3D3A, $3DBB, $3E3C, $3EBD, $3F3E, $3FBF
	.dw $4040, $40C1, $4142, $41C3, $4244, $42C5, $4346, $43C7
	.dw $4448, $44C9, $454A, $45CB, $464C, $46CD, $474E, $47CF
	.dw $4850, $48D1, $4952, $49D3, $4A54, $4AD5, $4B56, $4BD7
	.dw $4C58, $4CD9, $4D5A, $4DDB, $4E5C, $4EDD, $4F5E, $4FDF
	.dw $5040, $50C1, $5142, $51C3, $5244, $52C5, $5346, $53C7
	.dw $5448, $54C9, $554A, $55CB, $564C, $56CD, $574E, $57CF
	.dw $5850, $58D1, $5952, $59D3, $5A54, $5AD5, $5B56, $5BD7
	.dw $5C58, $5CD9, $5D5A, $5DDB, $5E5C, $5EDD, $5F5E, $5FDF
	.dw $6060, $60E1, $6162, $61E3, $6264, $62E5, $6366, $63E7
	.dw $6468, $64E9, $656A, $65EB, $666C, $66ED, $676E, $67EF
	.dw $6870, $68F1, $6972, $69F3, $6A74, $6AF5, $6B76, $6BF7
	.dw $6C78, $6CF9, $6D7A, $6DFB, $6E7C, $6EFD, $6F7E, $6FFF
	.dw $7060, $70E1, $7162, $71E3, $7264, $72E5, $7366, $73E7
	.dw $7468, $74E9, $756A, $75EB, $766C, $76ED, $776E, $77EF
	.dw $7870, $78F1, $7972, $79F3, $7A74, $7AF5, $7B76, $7BF7
	.dw $7C78, $7CF9, $7D7A, $7DFB, $7E7C, $7EFD, $7F7E, $FFFF