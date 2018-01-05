MissingAppVar:
    .db "Need"
LibLoadAppVar:
    .db " LibLoad", 0
    .db "tiny.cc/clibs", 0
GetHelp1:
    .db "Check http://tiny.cc/aoce", 0
GetHelp2:
    .db "for help, controls, AI's", 0
GetHelp3:
    .db "and much more!", 0
MadeByMessage:
    .db "Made by Peter \"PT_\" Tillema", 0
NoMultiplayer1:
    .db "Multiplayer is not", 0
NoMultiplayer2:
    .db "supported yet!", 0
GeneratingMapMessage:
    .db "Generating map...", 0
LoadingMapMessage:
    .db "Loading map...", 0
GraphicsAppvar1:
    .db AppVarObj, "AOCEGFX1", 0
GraphicsAppvar2:
    .db AppVarObj, "AOCEGFX2", 0
AoCEMapAppvar:
    .db AppVarObj, "AOCEMAP", 0
GraphicsAppvarNotFound:
    .db "Can't find appvar:", 0
LoadingMessage:
    .db "Loading...", 0
    
AmountOfWood:
    .dl 0
AmountOfFood:
    .dl 0
AmountOfGold:
    .dl 0
AmountOfStone:
    .dl 0
AmountOfPeople:
    .db 1
AmountOfMaxPeople:
    .db 10
AmountOfBuildings:
    .db 0
TempData1:
    .block 8
PathFindingData:
    .block 20
    
_IYOffsets:
#define prevAddr eval($)
.org 0

TopLeftXTile:            .dl -10
TopLeftYTile:            .dl -3
CursorX:                 .dl 160-12
CursorY:                 .db 120-16
SelectedAreaStartX:      .dl 0
SelectedAreaStartY:      .db 0
TempData2:               .block 12
AoCEFlags1:              .db 0

.org $+prevAddr