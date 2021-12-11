@echo off
CALL %~dp0\prepare.bat %*
SET compileDependencies=lib\log4j-1.2.14.jar;..\lib\*
SET class2compile=src\org\apache\log4j\Test50463.java
SET class2run=org.apache.log4j.Test50463
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
pause