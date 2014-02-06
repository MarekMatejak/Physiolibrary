@echo off

for /F delims^=^"^ tokens^=2 %%s in ('ftype mofile') DO set x=%%s
call set DEFAULT_DYMOLADIR=%%x:\bin%x:*\bin=%=%%
set x= 

set DYMOLADIR=%1

if "%1"=="" set DYMOLADIR=%DEFAULT_DYMOLADIR%

echo Chosen Dymola directory is "%DYMOLADIR%".

copy "%DYMOLADIR%\insert\displayunit.mos" "displayunit.mos-install_%date%_%time::=-%.bak"
if not exist "displayunit.mos.bak" copy "%DYMOLADIR%\insert\displayunit.mos" "displayunit.mos.bak"
xcopy displayunit.mos "%DYMOLADIR%\insert\"


echo copy "%DYMOLADIR%\insert\displayunit.mos" "displayunit.mos-uninstall_%%date%%_%%time::=-%%.bak" > uninstallDisplayUnits.bat
echo xcopy "displayunit.mos.bak" "%DYMOLADIR%\insert\displayunit.mos" >> uninstallDisplayUnits.bat
echo del "displayunit.mos.bak" >> uninstallDisplayUnits.bat

