@echo off
CALL %~dp0\prepare.bat %*
SET compileDependencies=lib\log4j-1.2.15.jar;..\lib\*
SET class2compile=src\Test44032.java
SET class2run=Test44032
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

pause