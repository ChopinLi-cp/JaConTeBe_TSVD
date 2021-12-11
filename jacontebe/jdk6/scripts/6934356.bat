echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% GTR 6 (
    IF NOT DEFINED JAVALOC (
        SET flag=1 
    )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.4.2 JDK1.7.0 6934356
) ELSE (
   SET class2compile=src/Test6934356.java
   SET class2run=Test6934356
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
pause