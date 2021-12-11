@echo off
CALL %~dp0\prepare.bat %* 
SET compileDependencies=lib\commons-pool-1.4-SNAPSHOT.jar;..\lib\*
SET class2compile=src\Test120.java
SET class2run=Test120
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
pause