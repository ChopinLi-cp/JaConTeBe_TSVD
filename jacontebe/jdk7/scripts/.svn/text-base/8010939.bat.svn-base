@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% NEQ 7 GOTO:C
IF %JminorV% LSS 13 GOTO:C
IF %JminorV% GEQ 25 GOTO:C
GOTO:D        
:C
IF NOT DEFINED JAVALOC (
       SET flag=1 
)
:D
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.7.0_13 JDK1.7.0_25 8010939
) ELSE (
   SET class2compile=src\Test8010939.java
   SET class2run=Test8010939
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)

pause