@echo off
set DYMOLADIR=%1
if "%DYMOLADIR%"=="" set DYMOLADIR=%programfiles(x86)%\Dymola 2014

echo Chosen Dymola directory is "%DYMOLADIR%".

if not exist "displayunit.mos.bak" copy "%DYMOLADIR%\insert\displayunit.mos" "displayunit.mos.bak"
xcopy displayunit.mos "%DYMOLADIR%\insert\"
