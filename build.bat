@echo off
if not exist bin mkdir bin
cd gfx
if not exist bin mkdir bin && convpng
xcopy /s /y bin\*.8xv ..\bin
cd ..
spasm -E -T -L -I gfx\bin\ aoce.asm bin\AOCE.bin
convhex -x bin\AOCE.bin
del bin\AOCE.bin
del relocation_table?.asm
pause
exit