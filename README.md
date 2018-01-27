# Age of CEmpires I
![Age of CEmpires logo](https://i.imgur.com/655vywO.png)
![Age of CEmpires main screen](https://i.imgur.com/1Pe3326.png)

This is a TI-84 Plus CE clone of the popular game Age of Empires 2, written in Assembly.

## Build
To build AoCE, grab [ConvPNG](https://github.com/mateoconlechuga/convpng/releases), [ConvHEX](https://github.com/mateoconlechuga/convhex/releases) and [spasm](https://github.com/alberthdev/spasm-ng/releases). Put `ConvHEX` and `spasm` in the main folder and `convpng` in the `gfx/` folder. After that, run `make gfx` from the command line to build the graphics, and then `make` to build AoCE.

## Run
To run AoCE, copy `AGE1.8xv`, `AGE2.8xv`, `AGE3.8xv`, `AGE4.8xv`, `AOCE.8xp`, `AOCEGFX1.8xv` and `AOCEGFX2.8xv` to either CEmu or drag them into TI-Connect CE. In both cases, be sure to put them all in archive! The appvars are quite large, so they don't fix all in RAM. From the homescreen, run `Asm(prgmAOCE)` to run AoCE.

## Bugs
If you found a bug in the latest AoCE from the master branch, be sure to create an issue [here](https://github.com/PeterTillema/Age-Of-CEmpires-I/issues). Note that other branches might not be stable!

## To-Do-List
- [x] Homescreen
- [x] Generate map
- [x] Display tiles/resources
- [x] Display trees
- [x] Display buildings
- [ ] Display units
- [ ] Gameplay GUI (minimap etc.)
- [ ] Move units
- [ ] Create units
- [ ] Units actions (gathering resources, walking, building)
- [ ] Fighting
- [ ] AI
- [ ] Multiplayer?
