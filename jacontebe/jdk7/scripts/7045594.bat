@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% NEQ 7 (
        IF NOT DEFINED JAVALOC (
            SET flag=1 
        )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.7.0 JDK1.8.0 7045594
) ELSE (
   SET class2compile=src\Test7045594.java src\RacingThreadsTest.java
   SET class2run=Test7045594
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
pause