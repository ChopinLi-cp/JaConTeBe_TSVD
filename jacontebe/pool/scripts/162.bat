@echo off
CALL %~dp0\prepare.bat %* 
SET compileDependencies=lib\commons-pool-1.5.jar;..\lib\*
SET class2compile=src\Test162.java
SET class2run=Test162
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
pause