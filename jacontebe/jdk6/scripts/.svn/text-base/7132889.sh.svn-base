#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*

#This bug affects from JDK 1.6.0 to JDK 1.7.0_40.
if [[ $MAJORVER != 6 ]] && [[ "${JAVAL}" = "" ]]; then 
    if [[ $MAJORVER -eq 7 ]] && [[ $MINORVER -ge 40 ]] || [[ $MAJORVER -ne 7 ]];
    then
        report_warning jdk1.6.0 jdk1.7.0_40 7132889
    fi
else
    classes_to_compile=src/Test7132889.java
    class_to_run=Test7132889
    compile_and_run $param
fi
