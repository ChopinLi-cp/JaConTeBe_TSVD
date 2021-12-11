@echo off
CALL %~dp0\prepare.bat %*
SET class2compile=src\org\apache\derby\impl\services\reflect\Derby764.java src\org\apache\derby\impl\services\locks\LockOperator.java
SET class2run=org.junit.runner.JUnitCore org.apache.derby.impl.services.reflect.Derby764
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

pause