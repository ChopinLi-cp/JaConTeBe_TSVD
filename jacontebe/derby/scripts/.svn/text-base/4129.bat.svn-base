@echo off
CALL %~dp0\prepare.bat %*
SET class2compile=src\Derby4129.java
SET class2run=Derby4129
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

rd /s /q  DB
del derby.log
pause