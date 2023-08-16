@echo off
cls

rem ****** Find paths *****

set CurrentDirectory=%cd%
set dp0=%~dp0
echo %dp0%
cd %dp0%\..\..\..\..\Chemical\Chemical
set CHEMICALDIR=%cd%
echo %CHEMICALDIR%
cd %dp0%\..\..\..
set PHYSIOLIBRARYDIR=%cd%
echo %PHYSIOLIBRARYDIR%

FOR /f "delims=!" %%i IN ("%PHYSIOLIBRARYDIR%") DO (set PHYSIOLIBRARY=%%~nxi)
echo %PHYSIOLIBRARY%
FOR /f "delims=!" %%i IN ("%CHEMICALDIR%") DO (set CHEMICAL=%%~nxi)
echo %CHEMICAL%


if "%1" == "EVEL" goto gotPrivileges




rem ****** Check administration privileges *****

NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )




rem ****** Get administration privileges *****
:getPrivileges

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "%PHYSIOLIBRARYDIR%\Resources\Install\SystemModeler\install.bat", "EVEL", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"

cd "%CurrentDirectory%"
set CurrentDirectory=
exit /B


rem ****** Copy files into ProgramFiles\SystemModeler directory *****
:gotPrivileges

ftype WSM 4.0 mo
if %ERRORLEVEL% GTR 1 ftype WSM 4.0 mo a
set /p SYSTEMMODELERDIR="Enter directory of ProgramFiles/Wolfram/SystemModeler: " %=%

echo Selected SystemModeler directory is "%SYSTEMMODELERDIR%".


mkdir "%SYSTEMMODELERDIR%\Libraries\%PHYSIOLIBRARY%"
xcopy /S /Y "%PHYSIOLIBRARYDIR%" "%SYSTEMMODELERDIR%\Libraries\%PHYSIOLIBRARY%"
mkdir "%SYSTEMMODELERDIR%\Libraries\%CHEMICAL%"
xcopy /S /Y "%CHEMICALDIR%" "%SYSTEMMODELERDIR%\Libraries\%CHEMICAL%"

cd "%CurrentDirectory%"
set CurrentDirectory=

