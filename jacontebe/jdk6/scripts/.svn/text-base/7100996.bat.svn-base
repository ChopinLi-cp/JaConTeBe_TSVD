@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% GEQ 8 (
    IF NOT DEFINED JAVALOC (
        SET flag=1 
    )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.6.0 JDK1.8.0 7100996
) ELSE (
   SET class2compile=src/Test7100996.java
   SET class2run=Test7100996
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
pause