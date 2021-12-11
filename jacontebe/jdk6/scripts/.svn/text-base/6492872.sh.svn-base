#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*

if [[ $MAJORVER -ne 6 || $MINORVER -ge 02 ]] && [[ "${JAVAL}" = "" ]];
then
    report_warning jdk1.6.0 jdk1.6.0_02 6492872
else
    classes_to_compile=src/Test6492872.java
    class_to_run=Test6492872
    compile_and_run $param
fi

