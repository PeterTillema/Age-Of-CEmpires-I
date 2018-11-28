RAM_SIZE                    = 0080000h
RAM_MIRROR                  = ramStart + RAM_SIZE
AOCE_RAM_START              = ramStart + 4
RAM_BACKUP                  = 03C0000h
AMOUNT_OF_COLUMNS           = 13
AMOUNT_OF_COLUMNS_LEFT      = 4
AMOUNT_OF_ROWS              = 35
TILE_WIDTH                  = 32
TILE_HEIGHT                 = 16
TILE_WIDTH_HALF             = TILE_WIDTH / 2
TILE_HEIGHT_HALF            = TILE_HEIGHT / 2
SCROLL_SPEED                = 4

;;; Variables
MAP_SIZE                    = 128
RESOURCE_MAX                = 200
AMOUNT_OF_TREES             = 4
AMOUNT_OF_UNITS             = 1
MAX_AMOUNT_PEOPLE           = 100
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
kpMode                      = 6

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
virtual at 0
UNIT_SPRITE:
.TEAM_LOADED                rb 1
.TCPPTR                     rl 1
.RAMPTR                     rl 1
.TYPE                       rb 1
.size := $-.
end virtual

;;; Unit struct 2
virtual at 0
UNIT_ENTRY:
.INDEX                      rb 1
.TEAM                       rb 1
.EVENT                      rb 1
.HEALTH                     rb 1
.HITPOINTS                  rb 1
.PATH                       rl 1
.NEXT                       rb 1
.OFFSET_X                   rb 1
.OFFSET_Y                   rb 1
.PREV                       rb 1
.X                          rb 1
.Y                          rb 1
.size := $-.
end virtual


virtual at 0
BUILDING_SPRITE:
.TEAM_LOADED                rb 1
.TCPPTR                     rl 1
.RAMPTR                     rl 1
.TYPE                       rb 1
.size := $-.
end virtual

;;; Building struct 2
virtual at 0
BUILDING_ENTRY:
.INDEX                      rb 1
.TEAM                       rb 1
.HEALTH                     rb 1
.HITPOINTS                  rb 1
.X                          rb 1
.Y                          rb 1
.size := $-.
end virtual

;;; Schedule event struct
virtual at 0
EVENT:
.POINTER                    dl 0
.UNIT                       db 0
.TIME                       rb 4
.size := $-.
end virtual

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
