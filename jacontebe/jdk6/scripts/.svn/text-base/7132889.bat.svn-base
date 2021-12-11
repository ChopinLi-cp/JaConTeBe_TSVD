@echo off
CALL %~dp0\prepare.bat  %*
SET RANGE=0
IF %JmajorV% EQU 7 (
    IF %JminorV% LSS 40 (
        SET RANGE=1
    )
)

IF %RANGE% EQU 0 (
    IF NOT %JmajorV% EQU 6 (
        IF NOT DEFINED JAVALOC (
            SET flag=1
        )
    )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.6.0 JDK1.7.0_40 7132889
) ELSE (
   SET class2compile=src/Test7132889.java
   SET class2run=Test7132889
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
pause