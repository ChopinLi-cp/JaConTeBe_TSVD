#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*
if [[ $MAJORVER -gt 7 ]] && [[ "${JAVAL}" = "" ]] ;
then
    report_warning jdk1.6.0 jdk8 4243978
else
    classes_to_compile=src/Test4243978.java
    class_to_run=Test4243978
    compile_and_run $param
fi
