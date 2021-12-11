@echo off
rem this bug has been fixed since jdk 1.8.
CALL %~dp0\prepare.bat %*
IF %JmajorV% GTR 8 (
   IF NOT DEFINED JAVALOC ( 
       SET flag=1 
   ) 
)
IF %flag% EQU 1 (
    CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.6.0 JDK1.8.0 4243978
) ELSE (
    SET class2compile=src/Test4243978.java
    SET class2run=Test4243978
    CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
pause
