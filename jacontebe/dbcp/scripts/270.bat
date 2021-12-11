@echo off
CALL %~dp0\prepare.bat %*
SET class2compile=src\Dbcp270.java
SET class2run=Dbcp270
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

pause
