#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*

if [[ $MAJORVER -gt 6 ]] && [[ "${JAVAL}" = "" ]] ; then
    report_warning jdk1.6.0 jdk7 6436220
else
    classes_to_compile=src/Test6436220.java
    class_to_run=Test6436220
    compile_and_run $param
fi
