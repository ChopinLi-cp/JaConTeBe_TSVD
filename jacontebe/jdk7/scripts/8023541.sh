#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*

if [[ $MAJORVER -gt 8 ]] && [[ "${JAVAL}" = "" ]]; then
    report_warning jdk1.7.0 jdk9 8023541
else
    mkdir -p classes
    javac ../jacontebe/src/edu/illinois/jacontebe/globalevent/GlobalDriver.java -d classes
    classes_to_compile=src/asm/*.java
    class_to_run=asm.ActivationModifier
    echo phase 1: Instrument byte code.
    compile_and_run

    echo phase 2: Start test:
    Opt='-Xbootclasspath/p:classes -Djava.security.policy=security.policy'
    classes_to_compile="src/Test8023541.java src/testUtils/*.java"
    class_to_run=Test8023541
    compile_and_run $param
	
	rm -rf classes
fi