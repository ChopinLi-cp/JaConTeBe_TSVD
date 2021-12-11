@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% GTR 8 (
        IF NOT DEFINED JAVALOC (
            SET flag=1 
        )
)

IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.7.0 JDK1.8.0 8023541
)

rem compile the modified Activation class first, which is going to be used to replace the original one from rt.jar.
mkdir classes
javac ..\jacontebe\src\edu\illinois\jacontebe\globalevent\GlobalDriver.java -d  classes

rem instrument codes
echo phase 1: Instrument byte code.
SET class2compile=src\asm\*.java
SET class2run=asm.ActivationModifier
CALL %commonScriptPath%\jacontebe.bat compileAndRun

echo phase 2: Start test:
SET options=-Xbootclasspath/p:classes -Djava.security.policy=security.policy
SET class2compile=src\Test8023541.java src\testUtils\*.java
SET class2run=Test8023541
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

rem delete generated instrumented class files.
rmdir classes\edu /s /q
rmdir classes\sun /s /q
pause