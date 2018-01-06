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
	.dl	0
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
	.dl	0
	.dl	_tree_1 \ .r2
	.dl	_tree_2 \ .r2
	.dl	_tree_3 \ .r2
	.dl	_tree_4 \ .r2
	
FieldRowActionTable:
	.dl	StopDisplayTiles
	.dl	DoNothing
	.dl	DoNothing
	.dl	DoNothing
	.dl	DoNothing
	.dl	DoNothing
	.dl	SetOnlyTreesRoutine
	.dl	SetClippedRoutine2
	.dl	SetClippedRoutine
	
BuildingsAge1Pointers:
	.dl	_farm_1_compressed
	.dl	_lumbercamp_1_compressed
	.dl	_miningcamp_1_compressed
	.dl	_outpost_1_compressed
	.dl	_barracks_1_compressed
	.dl	_house_1_compressed
	.dl	_mill_1_compressed
	.dl	_towncenter_1_compressed