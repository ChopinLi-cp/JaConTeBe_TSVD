@echo off
CALL %~dp0\prepare.bat %*
SET compileDependencies=lib\log4j-1.2.13.jar;..\lib\*
SET class2compile=src\org\apache\log4j\Test38137.java
SET class2run=org.apache.log4j.Test38137
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

pause