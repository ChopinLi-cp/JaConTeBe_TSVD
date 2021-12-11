@echo off
CALL %~dp0\prepare.bat %*
SET compileDependencies=lib\log4j-1.2.13.jar;..\lib\*

SET class2compile=src\com\main\*.java src\com\a\*.java src\com\b\*.java src\com\c\*.java src\com\d\*.java
copy /Y src\log4j.properties  %~dp0\..\bin
SET class2run=com.main.Test41214
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
pause