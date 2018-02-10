AppvarPointers:
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0

TilePointersEnd:
	r2 dl	grass_offset + 256 - 1
	r2 dl	tree_stump_1_offset + 256 - 1
	r2 dl	tree_stump_2_offset + 256 - 1
	r2 dl	tree_cut_1_offset + 256 - 1
	r2 dl	tree_cut_2_offset + 256 - 1
	r2 dl	bush_1_offset + 256 - 1
	r2 dl	bush_2_offset + 256 - 1
	r2 dl	gold_1_offset + 256 - 1
	r2 dl	gold_2_offset + 256 - 1
	r2 dl	stone_1_offset + 256 - 1
	r2 dl	stone_2_offset + 256 - 1
	r2 dl	tree_1_offset
	r2 dl	tree_2_offset
	r2 dl	tree_3_offset
	r2 dl	tree_4_offset
	
TilePointersStart:
	r2 dl	grass_offset
	r2 dl	tree_stump_1_offset
	r2 dl	tree_stump_2_offset
	r2 dl	tree_cut_1_offset
	r2 dl	tree_cut_2_offset
	r2 dl	bush_1_offset
	r2 dl	bush_2_offset
	r2 dl	gold_1_offset
	r2 dl	gold_2_offset
	r2 dl	stone_1_offset
	r2 dl	stone_2_offset
	r2 dl	tree_1_offset
	r2 dl	tree_2_offset
	r2 dl	tree_3_offset
	r2 dl	tree_4_offset
	
FieldRowActionTable:
	dl	StopDisplayTiles
	dl	DisplayEachRowLoopExx
	dl	DisplayEachRowLoopExx
	dl	DisplayEachRowLoopExx
	dl	DisplayEachRowLoopExx
	dl	DisplayEachRowLoopExx
	dl	SetOnlyTreesRoutine
	dl	SetClippedRoutine2
	dl	SetClippedRoutine
	
BuildingsAge1:
	r3 dl	farm_1_offset			; 0
	r3 dl	lumbercamp_1_offset		; 1
	r3 dl	miningcamp_1_offset		; 2
	r3 dl	outpost_1_offset		; 3
	r3 dl	barracks_1_offset		; 4
	r3 dl	house_1_offset			; 5
	r3 dl	mill_1_offset			; 6
	r3 dl	towncenter_1_offset		; 7
	
BuildingsAge2:
	r3 dl	farm_1_offset			; 0
	r3 dl	lumbercamp_1_offset		; 1
	r3 dl	miningcamp_1_offset		; 2
	r3 dl	outpost_1_offset		; 3
	r4 dl	barracks_2_offset		; 4
	r4 dl	house_2_offset			; 5
	r4 dl	mill_2_offset			; 6
	r4 dl	towncenter_2_offset		; 7
	r4 dl	archery_2_offset		; 8
	r4 dl	blacksmith_2_offset		; 9
	r4 dl	market_2_offset			; 10
	r4 dl	stable_2_offset			; 11
	r4 dl	tower_2_offset			; 12
	
BuildingsAge3:
	r3 dl	farm_1_offset			; 0
	r3 dl	lumbercamp_1_offset		; 1
	r3 dl	miningcamp_1_offset		; 2
	r3 dl	outpost_1_offset		; 3
	r5 dl	barracks_3_offset		; 4
	r5 dl	house_3_offset			; 5
	r5 dl	mill_3_offset			; 6
	r5 dl	towncenter_3_offset		; 7
	r5 dl	archery_3_offset		; 8
	r5 dl	blacksmith_3_offset		; 9
	r5 dl	market_3_offset			; 10
	r5 dl	stable_3_offset			; 11
	r5 dl	tower_3_offset			; 12
	r5 dl	castle_3_offset			; 13
	r5 dl	monastery_3_offset		; 14
	r5 dl	siegeworkshop_3_offset		; 15
	r5 dl	university_3_offset		; 16
	
BuildingsAge4:
	r3 dl	farm_1_offset			; 0
	r3 dl	lumbercamp_1_offset		; 1
	r3 dl	miningcamp_1_offset		; 2
	r3 dl	outpost_1_offset		; 3
	r5 dl	barracks_3_offset		; 4
	r5 dl	house_3_offset			; 5
	r5 dl	mill_3_offset			; 6
	r6 dl	towncenter_4_offset		; 7
	r5 dl	archery_3_offset		; 8
	r5 dl	blacksmith_3_offset		; 9
	r6 dl	market_4_offset			; 10
	r5 dl	stable_3_offset			; 11
	r6 dl	tower_4_offset			; 12
	r5 dl	castle_3_offset			; 13
	r5 dl	monastery_3_offset		; 14
	r5 dl	siegeworkshop_3_offset		; 15
	r6 dl	university_4_offset		; 16
	r6 dl	btower_4_offset			; 17