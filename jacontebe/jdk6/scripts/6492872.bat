@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% GEQ 6 (
    IF %JminorV% GEQ 2 (
        IF NOT DEFINED JAVALOC (
            SET flag=1 
        )
    )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.6.0 JDK1.7.0 6492872
) ELSE (
   SET class2compile=src/Test6492872.java
   SET class2run=Test6492872
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
pause