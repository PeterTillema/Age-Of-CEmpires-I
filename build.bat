@echo off
setlocal EnableDelayedExpansion
if not exist bin mkdir bin
del relocation_table?.asm
cd gfx
if not exist bin mkdir bin && convpng
spasm -E -L -I bin\ appvar1.asm ..\bin\AOCEGFX1.8xv
spasm -E -L -I bin\ appvar2.asm ..\bin\AOCEGFX2.8xv
for /L %%a in (1,1,4) do spasm -E -L -I bin\ a%%a.asm ..\bin\AGE%%a.bin
cd ..\bin
call :editFile AOCEGFX1.lab
call :editFile AOCEGFX2.lab
call :editFile AGE1.lab
call :editFile AGE2.lab
call :editFile AGE3.lab
call :editFile AGE4.lab
for /L %%a in (1,1,4) do call :editFile AGE%%a.lab
cd ..
spasm -E -T -L aoce.asm bin\AOCE.bin
convhex -x bin\AOCE.bin
for /L %%a in (1,1,4) do convhex -m 80000 -c bin\AGE%%a.bin
del bin\AGE?.lab
del bin\AOCEGFX?.lab
del bin\AOCE.bin
del bin\AGE?.bin
pause
exit

:editFile
set filename=%1%
if exist temp.txt del temp.txt
for /f "delims=," %%a in (%filename%) do (
    set string=%%a
    set substring1=!string:~0,1!
    set substring2=!string:~1,1!
    if !substring1! NEQ _ set string=""
    if !substring2!==_ set string=""
    if !string! NEQ "" echo !string! >> temp.txt
)
del %filename%
ren temp.txt %filename%
exit /b