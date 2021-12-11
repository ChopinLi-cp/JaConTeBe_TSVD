#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*
#This bug affects since jdk1.6.0_10 and fixed since jdk7
if [[ $MAJORVER -eq 6 && $MINORVER -ge 10 ]] || [[ "${JAVAL}" != ""  ]];
then
    classes_to_compile=src/Test6977738.java
    class_to_run=Test6977738
    compile_and_run $param
else
    report_warning jdk1.6.0_10 jdk7 6977738
fi
