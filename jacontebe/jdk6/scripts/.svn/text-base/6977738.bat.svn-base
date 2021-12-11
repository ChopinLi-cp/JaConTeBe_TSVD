@echo off
rem this bug affects jdk 1.6.0_10.
rem this bug has been fixed since jdk 1.7.0.
CALL %~dp0\prepare.bat %*
SET RANGE=0
IF %JmajorV% EQU 6 (
    IF %JminorV% GEQ 10 (
        SET RANGE=1
    )
)

IF %RANGE% EQU 0 (
    IF NOT DEFINED JAVALOC (
        SET flag=1 
    )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.6.0_10 JDK1.7.0 6977738
) ELSE (
   SET class2compile=src/Test6977738.java
   SET class2run=Test6977738
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
pause