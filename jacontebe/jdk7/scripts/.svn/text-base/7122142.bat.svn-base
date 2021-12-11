@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% NEQ 7 (
        IF NOT DEFINED JAVALOC (
            SET flag=1 
        )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.7.0 JDK1.8.0 7122142
) ELSE (
   SET class2compile=src\Test7122142.java
   SET class2run=Test7122142
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)

pause