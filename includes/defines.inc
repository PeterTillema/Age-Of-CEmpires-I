RAM_SIZE                    = 0080000h
RAM_MIRROR                  = ramStart + RAM_SIZE
AOCE_RAM_START              = ramStart + 4
RAM_BACKUP                  = 03C0000h
AMOUNT_OF_COLUMNS           = 13
AMOUNT_OF_COLUMNS_LEFT      = 4
AMOUNT_OF_ROWS              = 35
TILE_WIDTH                  = 32
TILE_HEIGHT                 = 16
TILE_HEIGHT_HALF            = TILE_HEIGHT / 2
SCROLL_SPEED                = 4

;;; Variables
MAP_SIZE                    = 128
RESOURCE_MAX                = 200
MAX_AMOUNT_PEOPLE           = 100
AMOUNT_OF_TREES             = 4
AMOUNT_OF_UNITS             = 1
MAX_AMOUNT_BUILDINGS        = 100
UNIT_DIE_TIMEOUT            = 3000 * 32768 / 1000

;;; Pointers
currDrawingBuffer           = 0E30014h
screenBuffer                = vRAM + (lcdWidth * lcdHeight)
blackBuffer                 = 0E50000h

;;; Keypresses
kp1                         = 1
kp2                         = 1
kp3                         = 1
kp4                         = 2
kp5                         = 2
kp6                         = 2
kp7                         = 3
kp8                         = 3
kp9                         = 3
kpUp                        = 3
kpLeft                      = 1
kpRight                     = 2
kpDown                      = 0
kpClear                     = 6
kpEnter                     = 0

;;; Tiles
TILE_EMPTY                  = 0
TILE_GRASS                  = 1
TILE_STUMP_1                = 2
TILE_STUMP_2                = 3
TILE_CUT_1                  = 4
TILE_CUT_2                  = 5
TILE_FOOD_1                 = 6
TILE_FOOD_2                 = 7
TILE_GOLD_1                 = 8
TILE_GOLD_2                 = 9
TILE_STONE_1                = 10
TILE_STONE_2                = 11
TILE_UNIT_GRASS             = 12
TILE_UNIT_STUMP_1           = 13
TILE_UNIT_STUMP_2           = 14
TILE_TREE                   = 15
TILE_BUILDING               = TILE_TREE + AMOUNT_OF_TREES

;;; Unit struct 1
SIZEOF_UNIT_STRUCT_1        = 8
UnitTeamLoaded              = 0
UnitTCPPtr                  = 1
UnitRAMPtr                  = 4
UnitType                    = 7

;;; Unit struct 2
SIZEOF_UNIT_STRUCT_2        = 14
UnitIndex                   = 0
UnitTeam                    = 1
UnitEvent                   = 2
UnitHealth                  = 3
UnitHitpoints               = 4
UnitPath                    = 5
UnitNext                    = 8
UnitOffsetX                 = 9
UnitOffsetY                 = 10
UnitPrev                    = 11
UnitX                       = 12
UnitY                       = 13

;;; Building struct 1
SIZEOF_BUILDING_STRUCT_1    = 8
BuildingTeamLoaded          = 0
BuildingRAMPtr              = 1
BuildingTCPPtr              = 4
BuildingType                = 7

;;; Building struct 2
SIZEOF_BUILDING_STRUCT_2    = 6
BuildingIndex               = 0
BuildingTeam                = 1
BuildingHealth              = 2
BuildingHitpoints           = 3       ; Useful for towers and castle
BuildingX                   = 4
BuildingY                   = 5

;;; Schedule event struct
SIZEOF_SCHEDULING_EVENT     = 8
SchedulingEventPointer      = 0
SchedulingEventUnit         = 3
SchedulingEventTime         = 4

;;; Flags
holdDownEnterKey            = 0

;;; Pathfinding data and equates
PFOpenedList                = pixelShadow
PFClosedList                = pixelShadow + (9*8*4)
PFStartX                    = 0
PFStartY                    = 1
PFCurY                      = 2
PFCurX                      = 3
PFCurTileDepth              = 4
PFEndY                      = 5
PFEndX                      = 6
PFAmountOfOpenTiles         = 7
PFAmountOfClosedTiles       = 8
PFIndexOfCurInOpenList      = 9