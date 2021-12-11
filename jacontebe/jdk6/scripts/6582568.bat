@echo off
CALL %~dp0\prepare.bat %*
SET class2compile=src/Test6582568.java
SET class2run=Test6582568
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
pause