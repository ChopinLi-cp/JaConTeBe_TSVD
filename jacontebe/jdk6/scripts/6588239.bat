@echo off
CALL %~dp0\prepare.bat %*
SET class2compile=src\Test6588239.java
SET class2run=Test6588239

CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
pause