@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% GTR 6 (
    IF NOT DEFINED JAVALOC (
        SET flag=1 
    )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.6.0 JDK1.7.0 6927486
) ELSE (
   SET class2compile=src/Test6927486.java
   SET class2run=Test6927486
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
del file1
del file2
pause