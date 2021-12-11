SET function=%1
SHIFT
:L
IF NOT "%1" == "" (
    SET p=%p% %1
    SHIFT
    GOTO L
)
CALL :%function% %p%
IF DEFINED %p% SET %p%=""
GOTO:EOF

:reportWarning
echo This bug affects since %1, and is fixed since %2, and your current Java version is %jversion%.
echo If you have a proper JDK installed, please rerun this script with the --javaloc option. Please refer to description/%3.html for details.
GOTO:EOF

:parseParam
:Loop
IF "%1"=="" GOTO Continue
IF "%1" == "--javaloc" (
    SET JAVALOC=%2
    SHIFT
) ELSE (
    SET Param=%Param% %1
)   
SHIFT
GOTO Loop
:Continue
GOTO:EOF

:compileAndRun
IF not exist bin ( 
    mkdir bin
)
if not defined compileDependencies (
    set compileDependencies=lib/*;../lib/*
)
if not defined runtimeDependencies (
    set runtimeDependencies=%compileDependencies%;bin
)
%JAVALOC%javac -cp %compileDependencies% %class2compile% -d bin
%JAVALOC%java %options% -cp %runtimeDependencies% %class2run% %1
GOTO :EOF

:checkVersion
for /f tokens^=2-5^ delims^=.-_^" %%j in ('java -fullversion 2^>^&1') do (
    set JmajorV=%%k
    set JminorV=%%m
    set jversion=%%j.%%k.%%l_%%m
)

rem when "java -fullversion" returns something like 1.6.0_b52
rem JminorV is b52. In this case, we set JminorV to 0.
IF "%JminorV:~0,1%" == "b" (
    SET JminorV=0
)
GOTO:EOF