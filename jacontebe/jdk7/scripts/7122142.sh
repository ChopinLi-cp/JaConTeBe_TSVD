#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*

if [[ $MAJORVER != 7 ]] && [[ "${JAVAL}" = "" ]]; then
    report_warning jdk1.7.0 jdk8 7122142
else
    classes_to_compile=src/Test7122142.java
    class_to_run=Test7122142
    compile_and_run $param
fi
