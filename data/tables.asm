TilePointersEnd:
	dl	grass_offset + 256 - 1
	dl	tree_stump_1_offset + 256 - 1
	dl	tree_stump_2_offset + 256 - 1
	dl	tree_cut_1_offset + 256 - 1
	dl	tree_cut_2_offset + 256 - 1
	dl	bush_1_offset + 256 - 1
	dl	bush_2_offset + 256 - 1
	dl	gold_1_offset + 256 - 1
	dl	gold_2_offset + 256 - 1
	dl	stone_1_offset + 256 - 1
	dl	stone_2_offset + 256 - 1
	dl	grass_offset + 256 - 1
	dl	tree_stump_1_offset + 256 - 1
	dl	tree_stump_2_offset + 256 - 1
	dl	tree_1_offset
	dl	tree_2_offset
	dl	tree_3_offset
	dl	tree_4_offset
	
TilePointersStart:
	dl	grass_offset
	dl	tree_stump_1_offset
	dl	tree_stump_2_offset
	dl	tree_cut_1_offset
	dl	tree_cut_2_offset
	dl	bush_1_offset
	dl	bush_2_offset
	dl	gold_1_offset
	dl	gold_2_offset
	dl	stone_1_offset
	dl	stone_2_offset
	dl	grass_offset
	dl	tree_stump_1_offset
	dl	tree_stump_2_offset
	dl	tree_1_offset
	dl	tree_2_offset
	dl	tree_3_offset
	dl	tree_4_offset
	
BuildingsAgesPointers:
	dl	BuildingsAge1
	dl	BuildingsAge2
	dl	BuildingsAge3
	dl	BuildingsAge4
	
BuildingsAge1:
	;	pointer                            wood food gold stone
	costs	farm_1_compressed_offset,          2, 60, 0, 0, 0		; 0
	costs	lumbercamp_1_compressed_offset,    2, 100, 0, 0, 0		; 1
	costs	miningcamp_1_compressed_offset,    2, 100, 0, 0, 0		; 2
	costs	outpost_1_compressed_offset,       2, 25, 0, 0, 10		; 3
	costs	barracks_1_compressed_offset,      2, 175, 0, 0, 0		; 4
	costs	house_1_compressed_offset,         2, 30, 0, 0, 0		; 5
	costs	mill_1_compressed_offset,          2, 100, 0, 0, 0		; 6
	costs	towncenter_1_compressed_offset,    2, 275, 0, 0, 100	; 7
	
BuildingsAge2:
	costs	farm_1_compressed_offset,          2, 60, 0, 0, 0		; 0
	costs	lumbercamp_1_compressed_offset,    2, 100, 0, 0, 0		; 1
	costs	miningcamp_1_compressed_offset,    2, 100, 0, 0, 0		; 2
	costs	outpost_1_compressed_offset,       2, 25, 0, 0, 10		; 3
	costs	barracks_2_compressed_offset,      3, 175, 0, 0, 0		; 4
	costs	house_2_compressed_offset,         3, 30, 0, 0, 0		; 5
	costs	mill_2_compressed_offset,          3, 100, 0, 0, 0		; 6
	costs	towncenter_2_compressed_offset,    3, 275, 0, 0, 100		; 7
	costs	archery_2_compressed_offset,       3, 175, 0, 0, 0		; 8
	costs	blacksmith_2_compressed_offset,    3, 150, 0, 0, 0		; 9
	costs	market_2_compressed_offset,        3, 175, 0, 0, 0		; 10
	costs	tower_2_compressed_offset,         3, 25, 0, 0, 125		; 11
	
BuildingsAge3:
	costs	farm_1_compressed_offset,          2, 60, 0, 0, 0		; 0
	costs	lumbercamp_1_compressed_offset,    2, 100, 0, 0, 0		; 1
	costs	miningcamp_1_compressed_offset,    2, 100, 0, 0, 0		; 2
	costs	outpost_1_compressed_offset,       2, 25, 0, 0, 10		; 3
	costs	barracks_3_compressed_offset,      4, 175, 0, 0, 0		; 4
	costs	house_3_compressed_offset,         4, 30, 0, 0, 0		; 5
	costs	mill_3_compressed_offset,          4, 100, 0, 0, 0		; 6
	costs	towncenter_3_compressed_offset,    4, 275, 0, 0, 100		; 7
	costs	archery_3_compressed_offset,       4, 175, 0, 0, 0		; 8
	costs	blacksmith_3_compressed_offset,    4, 150, 0, 0, 0		; 9
	costs	market_3_compressed_offset,        4, 175, 0, 0, 0		; 10
	costs	tower_3_compressed_offset,         4, 25, 0, 0, 125		; 11
	costs	castle_3_compressed_offset,        4, 0, 0, 0, 650		; 12
	costs	monastery_3_compressed_offset,     4, 175, 0, 0, 0		; 13
	costs	siegeworkshop_3_compressed_offset, 4, 200, 0, 0, 0		; 14
	costs	university_3_compressed_offset,    4, 200, 0, 0, 0		; 15
	
BuildingsAge4:
	costs	farm_1_compressed_offset,          2, 60, 0, 0, 0		; 0
	costs	lumbercamp_1_compressed_offset,    2, 100, 0, 0, 0		; 1
	costs	miningcamp_1_compressed_offset,    2, 100, 0, 0, 0		; 2
	costs	outpost_1_compressed_offset,       2, 25, 0, 0, 10		; 3
	costs	barracks_3_compressed_offset,      4, 175, 0, 0, 0		; 4
	costs	house_3_compressed_offset,         4, 30, 0, 0, 0		; 5
	costs	mill_3_compressed_offset,          4, 100, 0, 0, 0		; 6
	costs	towncenter_4_compressed_offset,    5, 275, 0, 0, 100		; 7
	costs	archery_3_compressed_offset,       4, 175, 0, 0, 0		; 8
	costs	blacksmith_3_compressed_offset,    4, 150, 0, 0, 0		; 9
	costs	market_4_compressed_offset,        5, 175, 0, 0, 0		; 10
	costs	tower_4_compressed_offset,         5, 25, 0, 0, 125		; 11
	costs	castle_3_compressed_offset,        4, 0, 0, 0, 650		; 12
	costs	monastery_3_compressed_offset,     4, 175, 0, 0, 0		; 13
	costs	siegeworkshop_3_compressed_offset, 4, 200, 0, 0, 0		; 14
	costs	university_4_compressed_offset,    5, 200, 0, 0, 0		; 15
	costs	btower_4_compressed_offset,        5, 0, 0, 100, 125		; 16
	
IconsTable1:
	dl	icon_house_offset
	dl	icon_mill_offset
	dl	icon_farm_offset
	dl	icon_miningcamp_offset
	dl	icon_lumbercamp_offset
	dl	icon_blacksmith_offset
	dl	icon_monastery_offset
	dl	icon_siege_offset
	dl	icon_market_offset
	dl	icon_university_offset
	dl	icon_towncenter_offset
	
IconsTable2:
	dl	icon_outpost_offset
	dl	icon_barracks_offset
	dl	icon_archery_offset
	dl	icon_tower_offset
	dl	icon_castle_offset
	dl	icon_btower_offset
	
IconsTableAges:
	db	5, 2
	db	7, 4
	db	10, 5
	db	11, 6
	
UnitsSpritesPointersTable:
	dl	UnitArbalest
	dl	UnitArcher
	dl	UnitChampion
	dl	UnitCrossbowman
	dl	UnitHalbadier
	dl	UnitLongbowman
	dl	UnitLongswordman
	dl	UnitManAtArms
	dl	UnitMilitia
	dl	UnitMonk
	dl	UnitPikeman
	dl	UnitSheep
	dl	UnitSkirmisher
	dl	UnitESkirmisher
	dl	UnitSpearman
	dl	UnitSwordman
	dl	UnitVillager
	
UnitsEventsTable:
	dl	UnitAttack1
	dl	UnitAttack2
	dl	UnitAttack3
	dl	UnitAttack4
	dl	UnitAttack5
	dl	UnitAttack6
	dl	UnitAttack7
	dl	UnitAttack8
	dl	UnitDie1
	dl	UnitDie2
	dl	UnitWalk11
	dl	UnitWalk12
	dl	UnitWalk13
	dl	UnitWalk21
	dl	UnitWalk22
	dl	UnitWalk23
	dl	UnitWalk31
	dl	UnitWalk32
	dl	UnitWalk33
	dl	UnitWalk41
	dl	UnitWalk42
	dl	UnitWalk43
	dl	UnitWalk51
	dl	UnitWalk52
	dl	UnitWalk53
	dl	UnitWalk61
	dl	UnitWalk62
	dl	UnitWalk63
	dl	UnitWalk71
	dl	UnitWalk72
	dl	UnitWalk73
	dl	UnitWalk81
	dl	UnitWalk82
	dl	UnitWalk83
	
UnitArbalest:
	unit	TILE_WIDTH / 2 - 7, 19, arbalest_a_1_compressed_offset		; 0
	unit	TILE_WIDTH / 2 - 10, 19, arbalest_a_2_compressed_offset		; 1
	unit	TILE_WIDTH / 2 - 10, 19, arbalest_a_3_compressed_offset		; 2
	unit	TILE_WIDTH / 2 - 8, 17, arbalest_a_4_compressed_offset		; 3
	unit	TILE_WIDTH / 2 - 5, 16, arbalest_a_5_compressed_offset		; 4
	unit	TILE_WIDTH / 2 - 3, 17, arbalest_a_6_compressed_offset		; 5
	unit	TILE_WIDTH / 2 - 3, 17, arbalest_a_7_compressed_offset		; 6
	unit	TILE_WIDTH / 2 - 5, 19, arbalest_a_8_compressed_offset		; 7
	unit	TILE_WIDTH / 2 - 10, 7, arbalest_d_1_compressed_offset		; 8
	unit	TILE_WIDTH / 2 - 11, 5, arbalest_d_2_compressed_offset		; 9
	unit	TILE_WIDTH / 2 - 9, 18, arbalest_w_1_1_compressed_offset	; 10
	unit	TILE_WIDTH / 2 - 8, 18, arbalest_w_1_2_compressed_offset	; 11
	unit	TILE_WIDTH / 2 - 8, 18, arbalest_w_1_3_compressed_offset	; 12
	unit	TILE_WIDTH / 2 - 12, 17, arbalest_w_2_1_compressed_offset	; 13
	unit	TILE_WIDTH / 2 - 11, 17, arbalest_w_2_2_compressed_offset	; 14
	unit	TILE_WIDTH / 2 - 9, 18, arbalest_w_2_3_compressed_offset	; 15
	unit	TILE_WIDTH / 2 - 9, 18, arbalest_w_3_1_compressed_offset	; 16
	unit	TILE_WIDTH / 2 - 9, 18, arbalest_w_3_2_compressed_offset	; 17
	unit	TILE_WIDTH / 2 - 10, 17, arbalest_w_3_3_compressed_offset	; 18
	unit	TILE_WIDTH / 2 - 6, 20, arbalest_w_4_1_compressed_offset	; 19
	unit	TILE_WIDTH / 2 - 5, 19, arbalest_w_4_2_compressed_offset	; 20
	unit	TILE_WIDTH / 2 - 5, 20, arbalest_w_4_3_compressed_offset	; 21
	unit	TILE_WIDTH / 2 - 7, 19, arbalest_w_5_1_compressed_offset	; 22
	unit	TILE_WIDTH / 2 - 6, 19, arbalest_w_5_2_compressed_offset	; 23
	unit	TILE_WIDTH / 2 - 6, 19, arbalest_w_5_3_compressed_offset	; 24
	unit	TILE_WIDTH / 2 - 6, 20, arbalest_w_6_1_compressed_offset	; 25
	unit	TILE_WIDTH / 2 - 5, 19, arbalest_w_6_2_compressed_offset	; 26
	unit	TILE_WIDTH / 2 - 5, 20, arbalest_w_6_3_compressed_offset	; 27
	unit	TILE_WIDTH / 2 - 6, 18, arbalest_w_7_1_compressed_offset	; 28
	unit	TILE_WIDTH / 2 - 4, 18, arbalest_w_7_2_compressed_offset	; 29
	unit	TILE_WIDTH / 2 - 5, 17, arbalest_w_7_3_compressed_offset	; 30
	unit	TILE_WIDTH / 2 - 5, 17, arbalest_w_8_1_compressed_offset	; 31
	unit	TILE_WIDTH / 2 - 5, 17, arbalest_w_8_2_compressed_offset	; 32
	unit	TILE_WIDTH / 2 - 5, 18, arbalest_w_8_3_compressed_offset	; 33
	
UnitArcher:
	unit	TILE_WIDTH / 2 - 0, 0, archer_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, archer_w_8_3_compressed_offset
		
UnitChampion:
	unit	TILE_WIDTH / 2 - 0, 0, champion_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, champion_w_8_3_compressed_offset
	
UnitCrossbowman:
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, crossbowman_w_8_3_compressed_offset
	
UnitHalbadier:
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, halbadier_w_8_3_compressed_offset
		
UnitLongbowman:
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longbowman_w_8_3_compressed_offset
	
UnitLongswordman:
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, longswordman_w_8_3_compressed_offset
	
UnitManAtArms:
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, manatarms_w_8_3_compressed_offset
	
UnitMilitia:
	unit	TILE_WIDTH / 2 - 0, 0, militia_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, militia_w_8_3_compressed_offset
	
UnitMonk:
	unit	TILE_WIDTH / 2 - 0, 0, monk_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_w_8_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_wol_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_wol_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_wol_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_wol_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_wol_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_wol_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_wol_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, monk_wol_8_compressed_offset
		
UnitPikeman:
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, pikeman_w_8_3_compressed_offset
	
UnitSheep:
	unit	TILE_WIDTH / 2 - 0, 0, sheep_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, sheep_w_8_3_compressed_offset

UnitSkirmisher:
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, skirmisher_w_8_3_compressed_offset
	
UnitESkirmisher:
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, eskirmisher_w_8_3_compressed_offset
	
UnitSpearman:
	unit	TILE_WIDTH / 2 - 0, 0, spearman_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, spearman_w_8_3_compressed_offset
	
UnitSwordman:
	unit	TILE_WIDTH / 2 - 0, 0, swordman_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, swordman_w_8_3_compressed_offset
	
UnitVillager:
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_b_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_b_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_b_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_b_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_b_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_b_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_b_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_b_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fa_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fa_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fa_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fa_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fa_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fa_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fa_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fa_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fo_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fo_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fo_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fo_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fo_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fo_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fo_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_fo_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_a_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_a_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_a_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_a_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_a_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_a_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_a_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_a_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_act_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_act_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_act_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_act_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_act_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_act_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_act_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_h_act_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_m_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_m_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_m_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_m_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_m_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_m_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_m_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_m_8_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_d_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_d_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_1_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_1_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_1_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_2_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_2_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_2_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_3_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_3_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_3_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_4_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_4_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_4_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_5_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_5_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_5_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_6_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_6_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_6_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_7_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_7_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_7_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_8_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_8_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_8_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_1_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_2_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_3_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_4_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_5_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_6_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_7_compressed_offset
	unit	TILE_WIDTH / 2 - 0, 0, villager_f_w_8_compressed_offset
