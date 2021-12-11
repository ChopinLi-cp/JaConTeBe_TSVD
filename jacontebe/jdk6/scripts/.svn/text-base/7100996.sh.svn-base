#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*

if [[ $MAJORVER -gt 7 ]] && [[ "${JAVAL}" = "" ]]; then
    report_warning jdk1.6.0 jdk1.8.0 7100996
else
    classes_to_compile=src/Test7100996.java
    class_to_run=Test7100996
    compile_and_run $param
fi
