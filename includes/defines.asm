;;; Variables
MAP_SIZE                    .equ 128
OFFSET_X                    .equ 0
OFFSET_Y                    .equ 1

;;; Pointers
currDrawingBuffer           .equ 0E30014h
screenBuffer                .equ vRAM+(320*240)
mapAddress                  .equ pixelShadow
puppetStack                 .equ pixelShadow+(MAP_SIZE*MAP_SIZE*2)
blackBuffer                 .equ 0E40000h
variables                   .equ saveSScreen+21000

;;; Keypresses
kp1                         .equ 1
kp2                         .equ 1
kp3                         .equ 1
kp4                         .equ 2
kp5                         .equ 2
kp6                         .equ 2
kp7                         .equ 3
kp8                         .equ 3
kp9                         .equ 3
kpUp                        .equ 3
kpLeft                      .equ 1
kpRight                     .equ 2
kpDown                      .equ 0
kpClear                     .equ 6
kpEnter                     .equ 0

;;; Tiles
TILE_EMPTY                  .equ 0
TILE_GRASS                  .equ 1
TILE_FOOD_1                 .equ 2
TILE_FOOD_2                 .equ 3
TILE_GOLD_1                 .equ 4
TILE_GOLD_2                 .equ 5
TILE_STONE_1                .equ 6
TILE_STONE_2                .equ 7
TILE_TREE                   .equ 8

;;; Puppet struct
puppetType                  .equ 0
puppetEvent                 .equ 1
puppetX                     .equ 2
puppetY                     .equ 3
puppetHealth                .equ 4
puppetHitpoints             .equ 5
puppetPath                  .equ 6

;;; Flags
holdDownEnterKey            .equ 0

;;; Pathfinding data and equates
PFOpenedList                .equ pixelShadow
PFClosedList                .equ pixelShadow + (9*8*4)
PFStartX                    .equ 0
PFStartY                    .equ 1
PFCurY                      .equ 2
PFCurX                      .equ 3
PFCurTileDepth              .equ 4
PFEndY                      .equ 5
PFEndX                      .equ 6
PFAmountOfOpenTiles         .equ 7
PFAmountOfClosedTiles       .equ 8
PFIndexOfCurInOpenList      .equ 9