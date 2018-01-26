AppvarPointers:
	.dl	0
	.dl	0
	.dl	0
	.dl	0
	.dl	0
	.dl	0

TilePointersEnd:
	.dl	grass_offset + 256 - 1 \ .r2
	.dl	tree_stump_1_offset + 256 - 1 \ .r2
	.dl	tree_stump_2_offset + 256 - 1 \ .r2
	.dl	tree_cut_1_offset + 256 - 1 \ .r2
	.dl	tree_cut_2_offset + 256 - 1 \ .r2
	.dl	bush_1_offset + 256 - 1 \ .r2
	.dl	bush_2_offset + 256 - 1 \ .r2
	.dl	gold_1_offset + 256 - 1 \ .r2
	.dl	gold_2_offset + 256 - 1 \ .r2
	.dl	stone_1_offset + 256 - 1 \ .r2
	.dl	stone_2_offset + 256 - 1 \ .r2
	.dl	tree_1_offset \ .r2
	.dl	tree_2_offset \ .r2
	.dl	tree_3_offset \ .r2
	.dl	tree_4_offset \ .r2
	
TilePointersStart:
	.dl	grass_offset \.r2
	.dl	tree_stump_1_offset \ .r2
	.dl	tree_stump_2_offset \ .r2
	.dl	tree_cut_1_offset \ .r2
	.dl	tree_cut_2_offset \ .r2
	.dl	bush_1_offset \ .r2
	.dl	bush_2_offset \ .r2
	.dl	gold_1_offset \ .r2
	.dl	gold_2_offset \ .r2
	.dl	stone_1_offset \ .r2
	.dl	stone_2_offset \ .r2
	.dl	tree_1_offset \ .r2
	.dl	tree_2_offset \ .r2
	.dl	tree_3_offset \ .r2
	.dl	tree_4_offset \ .r2
	
FieldRowActionTable:
	.dl	StopDisplayTiles
	.dl	DisplayEachRowLoopExx
	.dl	DisplayEachRowLoopExx
	.dl	DisplayEachRowLoopExx
	.dl	DisplayEachRowLoopExx
	.dl	DisplayEachRowLoopExx
	.dl	SetOnlyTreesRoutine
	.dl	SetClippedRoutine2
	.dl	SetClippedRoutine
	
BuildingsAge1:
	.dl	farm_1_offset \ .r3		; 0
	.dl	lumbercamp_1_offset \ .r3	; 1
	.dl	miningcamp_1_offset \ .r3	; 2
	.dl	outpost_1_offset \ .r3		; 3
	.dl	barracks_1_offset \ .r3		; 4
	.dl	house_1_offset \ .r3		; 5
	.dl	mill_1_offset \ .r3		; 6
	.dl	towncenter_1_offset \ .r3	; 7
	
BuildingsAge2:
	.dl	farm_1_offset \ .r3		; 0
	.dl	lumbercamp_1_offset \ .r3	; 1
	.dl	miningcamp_1_offset \ .r3	; 2
	.dl	outpost_1_offset \ .r3		; 3
	.dl	barracks_2_offset \ .r4		; 4
	.dl	house_2_offset \ .r4		; 5
	.dl	mill_2_offset \ .r4		; 6
	.dl	towncenter_2_offset \ .r4	; 7
	.dl	archery_2_offset \ .r4		; 8
	.dl	blacksmith_2_offset \ .r4	; 9
	.dl	market_2_offset \ .r4		; 10
	.dl	stable_2_offset \ .r4		; 11
	.dl	tower_2_offset \ .r4		; 12
	
BuildingsAge3:
	.dl	farm_1_offset \ .r3		; 0
	.dl	lumbercamp_1_offset \ .r3	; 1
	.dl	miningcamp_1_offset \ .r3	; 2
	.dl	outpost_1_offset \ .r3		; 3
	.dl	barracks_3_offset \ .r5		; 4
	.dl	house_3_offset \ .r5		; 5
	.dl	mill_3_offset \ .r5		; 6
	.dl	towncenter_3_offset \ .r5	; 7
	.dl	archery_3_offset \ .r5		; 8
	.dl	blacksmith_3_offset \ .r5	; 9
	.dl	market_3_offset \ .r5		; 10
	.dl	stable_3_offset \ .r5		; 11
	.dl	tower_3_offset \ .r5		; 12
	.dl	castle_3_offset \ .r5		; 13
	.dl	monastery_3_offset \ .r5	; 14
	.dl	siegeworkshop_3_offset \ .r5	; 15
	.dl	university_3_offset \ .r5	; 16
	
BuildingsAge4:
	.dl	farm_1_offset \ .r3		; 0
	.dl	lumbercamp_1_offset \ .r3	; 1
	.dl	miningcamp_1_offset \ .r3	; 2
	.dl	outpost_1_offset \ .r3		; 3
	.dl	barracks_3_offset \ .r5		; 4
	.dl	house_3_offset \ .r5		; 5
	.dl	mill_3_offset \ .r5		; 6
	.dl	towncenter_4_offset \ .r6	; 7
	.dl	archery_3_offset \ .r5		; 8
	.dl	blacksmith_3_offset \ .r5	; 9
	.dl	market_4_offset \ .r6		; 10
	.dl	stable_3_offset \ .r5		; 11
	.dl	tower_4_offset \ .r6		; 12
	.dl	castle_3_offset \ .r5		; 13
	.dl	monastery_3_offset \ .r5	; 14
	.dl	siegeworkshop_3_offset \ .r5	; 15
	.dl	university_4_offset \ .r6	; 16
	.dl	btower_4_offset \ .r6		; 17