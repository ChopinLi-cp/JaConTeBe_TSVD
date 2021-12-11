#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*

if [[ $MAJORVER -ne 7 || $MINORVER -lt 13 || $MINORVER -ge 25 ]] && [[ "${JAVAL}" = "" ]]; then
    report_warning jdk1.7.0_13 jdk1.7.0_25 8010939
else
    classes_to_compile=src/Test8010939.java
    class_to_run=Test8010939
    compile_and_run $param
fi

