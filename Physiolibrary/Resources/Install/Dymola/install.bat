@echo off
cls


set CurrentDirectory=%cd%
echo %~dp0
cd %~dp0\..\..\..
set PHYSIOLIBRARYDIR=%cd%

if not exist "%PHYSIOLIBRARYDIR%\Resources\Install\Dymola" ( 
   echo "The Physiolibrary directory '%PHYSIOLIBRARYDIR%' is not valid!"
   exit /B
) 


FOR /f "delims=!" %%i IN ("%PHYSIOLIBRARYDIR%") DO (set PHYSIOLIBRARY=%%~nxi)


rem ****** Check administration privileges (for copying files into Dymola Program-Files directory)  *****

NET FILE 1>NUL 2>NUL
if '%errorlevel%' NEQ '0' ( goto getPrivileges )


rem ****** Find paths (find Dymola by windows file '.mo' association) *****

for /F delims^=^=^ tokens^=2 %%z in ('assoc .mo') DO set mofile=%%z
for /F delims^=^"^ tokens^=2 %%s in ('ftype %mofile%') DO set x=%%s
call set DYMOLADIR=%%x:\bin%x:*\bin=%=%%
set x=

if "%DYMOLADIR%"=="%DYMOLADIR:Dymola=%" ( set ISOK=N ) ELSE ( set ISOK=Y )
choice /C YN /M "Do you want to install Physiolibrary into dymola directory '%DYMOLADIR%'? " /T 10 /D %ISOK%
if errorlevel == 2 (
  set DYMOLADIR=
  set /P DYMOLADIR="Please write the Dymola directory:"
)
 
echo Selected Dymola directory is "%DYMOLADIR:"=%".
set DYMOLADIR=%DYMOLADIR:"=%


rem ****** Backup and generate "uninstall.bat" *****

if NOT EXIST "%PHYSIOLIBRARYDIR%\Resources\Install\Dymola\backup" mkdir "%PHYSIOLIBRARYDIR%\Resources\Install\Dymola\backup"
set DISPLAYUNIT_BACKUP_FILE=%PHYSIOLIBRARYDIR%\Resources\Install\Dymola\backup\displayunit.mos-install_%date%_%time::=-%.bak
copy "%DYMOLADIR%\insert\displayunit.mos" "%DISPLAYUNIT_BACKUP_FILE%"

set UNINST=%PHYSIOLIBRARYDIR%\Resources\Install\Dymola\uninstall.bat

echo NET FILE 1^>NUL 2^>NUL > "%UNINST%"
echo if '%%errorlevel%%' == '0'  goto gotPrivileges >> "%UNINST%"
echo ECHO Set UAC = CreateObject^^^("Shell.Application"^^^) ^> "%%temp%%\OEgetPrivileges.vbs"  >> "%UNINST%"
echo ECHO UAC.ShellExecute "%PHYSIOLIBRARYDIR%\Resources\Install\Dymola\uninstall.bat", "EVEL", "", "runas", 1 ^>^> "%%temp%%\OEgetPrivileges.vbs" >> "%UNINST%"
echo "%%temp%%\OEgetPrivileges.vbs" >> "%UNINST%"
echo exit /B >> "%UNINST%"
echo :gotPrivileges >> "%UNINST%"
echo copy "%DYMOLADIR%\insert\displayunit.mos" "%PHYSIOLIBRARYDIR%\Resources\Install\Dymola\backup\displayunit.mos-uninstall_%%date%%_%%time::=-%%.bak" >>  "%UNINST%"
echo xcopy /Y "%DISPLAYUNIT_BACKUP_FILE%" "%DYMOLADIR%\insert\displayunit.mos" >> "%UNINST%"
if "%PHYSIOLIBRARY%" NEQ "" echo rmdir /S /Q "%DYMOLADIR%\Modelica\Library\%PHYSIOLIBRARY%" >> "%UNINST%"


rem ****** Copy files into ProgramFiles\Dymola directory *****

if not exist "%DYMOLADIR%\Modelica\Library" ( 
   echo "The Dymola directory '%DYMOLADIR%' is not valid!"
   exit /B
) 

xcopy /Y "Resources\DisplayUnits\displayunit.mos" "%DYMOLADIR%\insert\"
mkdir "%DYMOLADIR%\Modelica\Library\%PHYSIOLIBRARY%"
xcopy /S /Y "%PHYSIOLIBRARYDIR%" "%DYMOLADIR%\Modelica\Library\%PHYSIOLIBRARY%"

cd "%CurrentDirectory%"
set CurrentDirectory=
exit /B


rem ****** Get administration privileges (ask user for pasword) *****
:getPrivileges

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "%PHYSIOLIBRARYDIR%\Resources\Install\Dymola\install.bat", "EVEL", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"

cd "%CurrentDirectory%"
set CurrentDirectory=
exit /B
