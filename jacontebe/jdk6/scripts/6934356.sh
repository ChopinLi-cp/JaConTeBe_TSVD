#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*
#This bug affects since JDK 1.4.2 and fixed since JDK 1.7.0.
if [[ $MAJORVER -gt 6 ]] && [[ "${JAVAL}" = "" ]]; then 
    report_warning jdk1.4.2 jdk1.7.0 6934356
else
    classes_to_compile=src/Test6934356.java
    class_to_run=Test6934356
    compile_and_run $param
fi
