@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% GTR 6 (
    IF NOT DEFINED JAVALOC (
        SET flag=1 
    )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.6.0 JDK1.7.0 6436220
) ELSE (
   SET class2compile=src/Test6436220.java
   SET class2run=Test6436220
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
pause