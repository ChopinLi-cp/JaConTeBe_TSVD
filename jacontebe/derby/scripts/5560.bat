@echo off
CALL %~dp0\prepare.bat %*
SET class2compile=src\Derby5560.java src\org\apache\derby\client\ConnectionSetter.java
SET class2run=Derby5560
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

pause