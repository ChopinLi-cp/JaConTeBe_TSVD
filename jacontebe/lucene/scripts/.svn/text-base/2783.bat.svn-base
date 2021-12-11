@echo off
CALL %~dp0\prepare.bat %*
SET compileDependencies=lib\lucene-core-2.9.3.jar;lib\junit3.jar;..\lib\*
SET class2compile=src\org\apache\lucene\util\LuceneTestCase293.java src\org\apache\lucene\util\_TestUtil293.java src\org\apache\lucene\store\*.java src\org\apache\lucene\util\English.java src\org\apache\lucene\index\Test2783.java
SET class2run=junit.textui.TestRunner org.apache.lucene.index.Test2783
CALL %commonScriptPath%\jacontebe.bat compileAndRun %Param%

pause