cd %~dp0\..
SET commonScriptPath=..\scripts
CALL %commonScriptPath%\jacontebe.bat checkVersion
CALL %commonScriptPath%\jacontebe.bat parseParam %*
SET flag=0
GOTO:EOF