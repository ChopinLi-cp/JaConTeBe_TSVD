@echo off
rem this bug has been fixed since jdk 1.6.0_02.
CALL %~dp0\prepare.bat %*
IF %JmajorV% GEQ 6 (
    IF %JminorV% GEQ 2 (
        IF NOT DEFINED JAVALOC (
            SET flag=1 
        )
    )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.6.0 JDK1.6.0_02 4742723
) ELSE (
   SET class2compile=src/Test4742723.java
   SET class2run=Test4742723
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
pause