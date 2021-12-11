@echo off
CALL %~dp0\prepare.bat %* 
SET compileDependencies=lib\lucene-core-2.4.0.jar;lib\junit3.jar;..\lib\*
SET class2compile=src\org\apache\lucene\Test1544.java src\org\apache\lucene\util\LuceneTestCase240.java src\org\apache\lucene\util\_TestUtil293.java
SET class2run=junit.textui.TestRunner org.apache.lucene.Test1544
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

rd /q/s TestDoug2-cold
rd /q/s TestDoug2-hot
pause

