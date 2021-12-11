@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% NEQ 7 GOTO:C
IF %JminorV% LSS 17 GOTO:C
IF %JminorV% GEQ 40 GOTO:C
GOTO:D        
:C
IF NOT DEFINED JAVALOC (
       SET flag=1 
)
:D
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.7.0_17 JDK1.7.0_40 8012019
) ELSE (
   SET class2compile=src\Test8012019.java
   SET class2run=Test8012019
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)

pause