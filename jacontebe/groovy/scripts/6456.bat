@echo off
CALL %~dp0\prepare.bat %*
SET class2compile=src\groovy\servlet\Groovy6456.java
SET class2run=groovy.servlet.Groovy6456
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

pause