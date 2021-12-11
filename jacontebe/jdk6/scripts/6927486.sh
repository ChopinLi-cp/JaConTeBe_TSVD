#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*

if [[ $MAJORVER -gt 6 ]] && [[ "${JAVAL}" = "" ]]; then
    report_warning jdk1.6.0 jdk1.7.0 6927486
else
    classes_to_compile=src/Test6927486.java
    class_to_run=Test6927486
    compile_and_run $param
fi

rm file1
rm file2
