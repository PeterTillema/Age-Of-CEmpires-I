AppvarPointers:
	.dl	0
	.dl	0
	.dl	0
	.dl	0
	.dl	0
	.dl	0

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
	.dl	_tree_1 \ .r2
	.dl	_tree_2 \ .r2
	.dl	_tree_3 \ .r2
	.dl	_tree_4 \ .r2
	
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
	.dl	_tree_1 \ .r2
	.dl	_tree_2 \ .r2
	.dl	_tree_3 \ .r2
	.dl	_tree_4 \ .r2
	
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
	.dl	_farm_1 \ .r3			; 0
	.dl	_lumbercamp_1 \ .r3		; 1
	.dl	_miningcamp_1 \ .r3		; 2
	.dl	_outpost_1 \ .r3		; 3
	.dl	_barracks_1 \ .r3		; 4
	.dl	_house_1 \ .r3			; 5
	.dl	_mill_1 \ .r3			; 6
	.dl	_towncenter_1 \ .r3		; 7
	
BuildingsAge2:
	.dl	_farm_1 \ .r3			; 0
	.dl	_lumbercamp_1 \ .r3		; 1
	.dl	_miningcamp_1 \ .r3		; 2
	.dl	_outpost_1 \ .r3		; 3
	.dl	_barracks_2 \ .r4		; 4
	.dl	_house_2 \ .r4			; 5
	.dl	_mill_2 \ .r4			; 6
	.dl	_towncenter_2 \ .r4		; 7
	.dl	_archery_2 \ .r4		; 8
	.dl	_blacksmith_2 \ .r4		; 9
	.dl	_market_2 \ .r4			; 10
	.dl	_stable_2 \ .r4			; 11
	.dl	_tower_2 \ .r4			; 12
	
BuildingsAge3:
	.dl	_farm_1 \ .r3			; 0
	.dl	_lumbercamp_1 \ .r3		; 1
	.dl	_miningcamp_1 \ .r3		; 2
	.dl	_outpost_1 \ .r3		; 3
	.dl	_barracks_3 \ .r5		; 4
	.dl	_house_3 \ .r5			; 5
	.dl	_mill_3 \ .r5			; 6
	.dl	_towncenter_3 \ .r5		; 7
	.dl	_archery_3 \ .r5		; 8
	.dl	_blacksmith_3 \ .r5		; 9
	.dl	_market_3 \ .r5			; 10
	.dl	_stable_3 \ .r5			; 11
	.dl	_tower_3 \ .r5			; 12
	.dl	_castle_3 \ .r5			; 13
	.dl	_monastery_3 \ .r5		; 14
	.dl	_siegeworkshop_3 \ .r5		; 15
	.dl	_university_3 \ .r5		; 16
	
BuildingsAge4:
	.dl	_farm_1 \ .r3			; 0
	.dl	_lumbercamp_1 \ .r3		; 1
	.dl	_miningcamp_1 \ .r3		; 2
	.dl	_outpost_1 \ .r3		; 3
	.dl	_barracks_3 \ .r5		; 4
	.dl	_house_3 \ .r5			; 5
	.dl	_mill_3 \ .r5			; 6
	.dl	_towncenter_4 \ .r6		; 7
	.dl	_archery_3 \ .r5		; 8
	.dl	_blacksmith_3 \ .r5		; 9
	.dl	_market_4 \ .r6			; 10
	.dl	_stable_3 \ .r5			; 11
	.dl	_tower_4 \ .r6			; 12
	.dl	_castle_3 \ .r5			; 13
	.dl	_monastery_3 \ .r5		; 14
	.dl	_siegeworkshop_3 \ .r5		; 15
	.dl	_university_4 \ .r6		; 16
	.dl	_btower_4 \ .r6			; 17