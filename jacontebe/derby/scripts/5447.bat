@echo off
CALL %~dp0\prepare.bat %*
SET class2compile=src\org\apache\derby\impl\store\raw\data\Derby5447.java
SET class2run=org.apache.derby.impl.store.raw.data.Derby5447
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

pause