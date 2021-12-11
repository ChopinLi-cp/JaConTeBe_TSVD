@echo off
CALL %~dp0\prepare.bat %*
SET compileDependencies=lib\commons-pool-1.2.jar;..\lib\*
SET class2compile=src\org\apache\commons\pool\Test46.java
SET class2run=org.apache.commons.pool.Test46
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

pause