@echo on

for /F delims^=^"^ tokens^=2 %%s in ('ftype mofile') DO set x=%%s
set suffix=%x:*bin=%
call set DEFAULT_DYMOLADIR=%%x:bin%suffix%=%%
set suffix=
set x= 

set DYMOLADIR=%1

if "%1"=="" set DYMOLADIR=%DEFAULT_DYMOLADIR%

echo Chosen Dymola directory is "%DYMOLADIR%".

if not exist "displayunit.mos.bak" copy "%DYMOLADIR%\insert\displayunit.mos" "displayunit.mos.bak"
xcopy displayunit.mos "%DYMOLADIR%\insert\"
