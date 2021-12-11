#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*

if [[ $MAJORVER != 7 ]] && [[ "${JAVAL}" = "" ]]; then
    report_warning jdk1.7.0 jdk8 7045594
else
    classes_to_compile="src/Test7045594.java src/RacingThreadsTest.java"
    class_to_run=Test7045594
    compile_and_run $param
fi
