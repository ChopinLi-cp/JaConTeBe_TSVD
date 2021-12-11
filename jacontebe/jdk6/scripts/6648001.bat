@echo off
CALL %~dp0\prepare.bat %*
IF %JmajorV% GEQ 6 (
    IF %JminorV% GEQ 10 (
        IF NOT DEFINED JAVALOC (
            SET flag=1 
        )
    )
)
IF %flag% EQU 1 (
   CALL %commonScriptPath%\jacontebe.bat reportwarning JDK1.6.0 JDK1.6.0_10 6648001
) ELSE (
   SET class2compile=src\Test6648001.java
   SET class2run=Test6648001
   SET options=-ea:sun.net.www.protocol.http.AuthenticationInfo -Dhttp.auth.serializeRequests=true
   CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%
)
pause