# Age of CEmpires I
![Age of CEmpires logo](https://i.imgur.com/655vywO.png)
![Age of CEmpires gameplay](https://i.imgur.com/Y50JwX2.png)

This is a TI-84 Plus CE clone of the popular game Age of Empires 2, written in Assembly.

## Build
To build AoCE, download and install the latest [C toolchain](https://github.com/ce-programming/toolchain/releases/latest). From the root project directory, run `make gfx` to build the graphics, and then `make` to build AoCE. If building doesn't succeed, be sure that you properly installed the C toolchain. If that still doesn't work, [ask me](http://chat.efnet.org:9090/?nick=AoCEuser&channels=%23aoce-dev&Login=Login) on the EFnet IRC channel #aoce-dev (or #cemetech).

## Run
To run AoCE, copy `AOCE.8xp`, and all the `AOCEXXXX.8xv` appvars to either CEmu or drag them into TI-Connect CE. In both cases, be sure to put them all in archive! The appvars are quite large, so they don't all fit in RAM. From the homescreen, run `Asm(prgmAOCE)` to install AoCE as an app. Now press [APPS] and select AoCE to run it.

### Bugs
If you found a bug in the latest AoCE from the master branch, be sure to create an issue [here](https://github.com/PeterTillema/Age-Of-CEmpires-I/issues). Note that other branches might not be stable!

## To-Do-List
- [x] Homescreen
- [x] Generate map
- [x] Display tiles/resources
- [x] Display trees
- [x] Display buildings
- [x] Display units
- [x] Team (colors)
- [ ] Gameplay GUI (minimap etc.)
- [ ] Move units
- [ ] Create units
- [ ] Units actions (gathering resources, walking, building)
- [ ] Fighting
- [ ] AI
- [ ] Multiplayer?
