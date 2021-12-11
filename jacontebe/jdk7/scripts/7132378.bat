@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% NEQ 7 GOTO:C
IF %JminorV% GEQ 40 GOTO:C
GOTO:D
:C
IF NOT DEFINED JAVALOC (
       SET flag=1 
)
:D
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.7.0 JDK1.7.0_40 7132378
) ELSE (
   SET class2compile=src\asm\*.java
   SET class2run=asm.FutureTaskModifier
   echo phase 1: Instrument byte code.
   CALL %commonScriptPath%\jacontebe.bat compileAndRun

   echo phase 2: Start test:
   SET "options=-Xbootclasspath/p:classes"
   SET class2compile=src\Test7132378.java
   SET class2run=Test7132378
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)

pause