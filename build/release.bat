@ECHO OFF

FOR /F %%I IN ('DIR ..\bin\* /B /O:G-N') DO SET VERSION=%%I & goto :done
:done



rem trim whitespace
setlocal EnableDelayedExpansion
set "word=%VERSION: =" & (if "!word!" neq "" set "CLEANED=!CLEANED! !word!") & set "word=%" & set "CLEANED=!CLEANED:~1!"

set VERSION=%CLEANED%

SET LOCATION=..\bin\%VERSION%

ECHO Building v%VERSION% from %LOCATION%

copy /Y ../license %LOCATION%
copy /Y ../readme.md %LOCATION%

SET ARCHIVENAME="sheret-v%VERSION%.zip"

powershell Compress-Archive %LOCATION% %ARCHIVENAME%

ECHO Done. Built %ARCHIVENAME%