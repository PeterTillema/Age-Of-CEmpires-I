# Age of CEmpires I
![Age of CEmpires logo](https://i.imgur.com/655vywO.png)
![Age of CEmpires main screen](https://i.imgur.com/1Pe3326.png)

This is a TI-84 Plus CE clone of the popular game Age of Empires 2, written in Assembly.

## Build
To build AoCE, be sure to download and install the [C toolchain](https://github.com/ce-programming/toolchain/releases/latest) and [MinGW](http://www.mingw.org/). After that, run `make gfx` from the command line to build the graphics, and then `make` to build AoCE.

### Troubleshooting
Here are some errors you might encounter during building, and respectively their solutions.
* *`make` is not recognized as an internal or external command, operable program or batch file* = install MinGW.
* *`fasmg` is not recognized as an internal or external command, operable program or batch file* = update/download the C toolchain.
* *`convpng` is not recognized as an internal or external command, operable program or batch file* = update/download the C toolchain.
* *`convhex` is not recognized as an internal or external command, operable program or batch file* = update/download the C toolchain.
* *Opened convpng.ini \ [error] unknown command #X (line Y)* = update the C toolchain. If that doesn't work, build the latest ConvPNG from [here](https://github.com/mateoconlechuga/convpng) and put it in the `gfx` folder.
* Anything else = redownload and rebuild this repo, or ask me on the EFnet IRC channel #aoce-dev (or #cemetech).

## Run
To run AoCE, copy `AOCE.8xp`, `AOCEAGE1.8xv`, `AOCEAGE2.8xv`, `AOCEAGE3.8xv`, `AOCEAGE4.8xv`, `AOCEGFX1.8xv`, `AOCEGFX2.8xv`, `AOCEUNI1.8xv` and `AOCEUNI2.8xv` to either CEmu or drag them into TI-Connect CE. In both cases, be sure to put them all in archive! The appvars are quite large, so they don't all fit in RAM. From the homescreen, run `Asm(prgmAOCE)` to run AoCE.

### Bugs
If you found a bug in the latest AoCE from the master branch, be sure to create an issue [here](https://github.com/PeterTillema/Age-Of-CEmpires-I/issues). Note that other branches might not be stable!

## To-Do-List
- [x] Homescreen
- [x] Generate map
- [x] Display tiles/resources
- [x] Display trees
- [x] Display buildings
- [ ] Display units
- [ ] Team (colors)
- [ ] Gameplay GUI (minimap etc.)
- [ ] Move units
- [ ] Create units
- [ ] Units actions (gathering resources, walking, building)
- [ ] Fighting
- [ ] AI
- [ ] Multiplayer?
