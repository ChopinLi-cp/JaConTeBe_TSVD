@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% GTR 6 (
   IF NOT DEFINED JAVALOC ( 
       SET flag=1 
   ) 
)
IF %flag% EQU 1 (
    CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.6.0 JDK1.7.0 4292
) ELSE (
    SET class2compile=src\org\codehaus\groovy\ast\Groovy4292.java
    SET class2run=org.codehaus.groovy.ast.Groovy4292
    CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
pause