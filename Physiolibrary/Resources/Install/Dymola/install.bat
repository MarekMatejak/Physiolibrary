@echo off
cls

rem ****** Find paths *****

set CurrentDirectory=%cd%
echo %~dp0
cd %~dp0\..\..\..
set PHYSIOLIBRARYDIR=%cd%

FOR /f "delims=!" %%i IN ("%PHYSIOLIBRARYDIR%") DO (set PHYSIOLIBRARY=%%~nxi)
echo %PHYSIOLIBRARY%

for /F delims^=^=^ tokens^=2 %%z in ('assoc .mo') DO set mofile=%%z
for /F delims^=^"^ tokens^=2 %%s in ('ftype %mofile%') DO set x=%%s
call set DYMOLADIR=%%x:\bin%x:*\bin=%=%%
set x=

echo Selected Dymola directory is "%DYMOLADIR%".

if "%1" == "EVEL" goto gotPrivileges



rem ****** Backup and generate "uninstall.bat" *****

if NOT EXIST "%CurrentDirectory%\backup" mkdir "%CurrentDirectory%\backup"
set DISPLAYUNIT_BACKUP_FILE=%CurrentDirectory%\backup\displayunit.mos-install_%date%_%time::=-%.bak
copy "%DYMOLADIR%\insert\displayunit.mos" "%DISPLAYUNIT_BACKUP_FILE%"

set UNINST=%CurrentDirectory%\uninstall.bat

echo NET FILE 1^>NUL 2^>NUL > "%UNINST%"
echo if '%%errorlevel%%' == '0'  goto gotPrivileges >> "%UNINST%"
echo ECHO Set UAC = CreateObject^^^("Shell.Application"^^^) ^> "%%temp%%\OEgetPrivileges.vbs"  >> "%UNINST%"
echo ECHO UAC.ShellExecute "%PHYSIOLIBRARYDIR%\Resources\Install\Dymola\uninstall.bat", "EVEL", "", "runas", 1 ^>^> "%%temp%%\OEgetPrivileges.vbs" >> "%UNINST%"
echo "%%temp%%\OEgetPrivileges.vbs" >> "%UNINST%"
echo exit /B >> "%UNINST%"
echo :gotPrivileges >> "%UNINST%"
echo copy "%DYMOLADIR%\insert\displayunit.mos" "%CurrentDirectory%\backup\displayunit.mos-uninstall_%%date%%_%%time::=-%%.bak" >>  "%UNINST%"
echo xcopy /Y "%DISPLAYUNIT_BACKUP_FILE%" "%DYMOLADIR%\insert\displayunit.mos" >> "%UNINST%"
if "%PHYSIOLIBRARY%" NEQ "" echo rmdir /S /Q "%DYMOLADIR%\Modelica\Library\%PHYSIOLIBRARY%" >> "%UNINST%"



rem ****** Check administration privileges *****

NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )




rem ****** Get administration privileges *****
:getPrivileges

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "%PHYSIOLIBRARYDIR%\Resources\Install\Dymola\install.bat", "EVEL", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"

cd "%CurrentDirectory%"
set CurrentDirectory=
exit /B


rem ****** Copy files into ProgramFiles\Dymola directory *****
:gotPrivileges

xcopy /Y "Resources\DisplayUnits\displayunit.mos" "%DYMOLADIR%\insert\"
mkdir "%DYMOLADIR%\Modelica\Library\%PHYSIOLIBRARY%"
xcopy /S /Y "%PHYSIOLIBRARYDIR%" "%DYMOLADIR%\Modelica\Library\%PHYSIOLIBRARY%"

cd "%CurrentDirectory%"
set CurrentDirectory=

