@echo off
rem this bug has been fixed since jdk 1.7.
CALL %~dp0\prepare.bat %*
IF %JmajorV% GTR 6 (
    IF NOT DEFINED JAVALOC (
        SET flag=1 
    )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.6.0 JDK1.7.0 4779253
) ELSE (
   ECHO Phase 1: instrument Logger.class
   SET class2compile=src/asm/*.java
   SET class2run=asm.LoggerModifier
   CALL %commonScriptPath%\jacontebe.bat compileAndRun
   ECHO Phase 2: run the test
   SET class2compile=src/Test4779253.java
   SET class2run=Test4779253
   SET options=-Xbootclasspath/p:classes
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
rmdir classes\java /s /q
pause