NET FILE 1>NUL 2>NUL 
if '%errorlevel%' == '0'  goto gotPrivileges 
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"  
ECHO UAC.ShellExecute "C:\SSD\Physiolibrary\Physiolibrary\Resources\Install\Dymola\uninstall.bat", "EVEL", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs" 
"%temp%\OEgetPrivileges.vbs" 
exit /B 
:gotPrivileges 
copy "C:\Program Files\Dymola 2019\insert\displayunit.mos" "C:\SSD\Physiolibrary\Physiolibrary\Resources\Install\Dymola\backup\displayunit.mos-uninstall_%date%_%time::=-%.bak" 
xcopy /Y "C:\SSD\Physiolibrary\Physiolibrary\Resources\Install\Dymola\backup\displayunit.mos-install_so 06. 10. 2018_19-15-12,46.bak" "C:\Program Files\Dymola 2019\insert\displayunit.mos" 
rmdir /S /Q "C:\Program Files\Dymola 2019\Modelica\Library\Physiolibrary" 
