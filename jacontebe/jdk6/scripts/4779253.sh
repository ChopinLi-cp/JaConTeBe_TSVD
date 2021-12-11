#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*
#This bug has been fixed since jdk 1.7.0. So system's jdk version is checked here, if it is below JDK 1.7.0, run the test directly, other wise inform user to specify the required jdk location.
if [[ $MAJORVER -gt 6 ]] && [[ "${JAVAL}" = "" ]];
then
    report_warning jdk1.6.0 jdk1.7.0 4779253
else
    classes_to_compile=src/asm/*.java
    class_to_run=asm.LoggerModifier
	echo Phase 1: instrument Logger.class
    compile_and_run
    
    echo Phase 2: run test
    Opt="-Xbootclasspath/p:classes"
    classes_to_compile=src/Test4779253.java
    class_to_run=Test4779253
    compile_and_run $param
fi
