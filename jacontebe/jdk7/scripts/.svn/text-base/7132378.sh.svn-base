#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*

if [[ $MAJORVER -ne 7 || $MINORVER -ge 40 ]] && [[ "${JAVAL}" = "" ]]; then
    report_warning jdk1.7.0 jdk1.7.0_40 7132378
else
    classes_to_compile=src/asm/*.java
    class_to_run=asm.FutureTaskModifier
    echo phase 1: Instrument byte code.
    compile_and_run

	echo phase 2: Start test:
    Opt='-Xbootclasspath/p:classes'
    classes_to_compile=src/Test7132378.java
    class_to_run=Test7132378
    compile_and_run $param
fi
