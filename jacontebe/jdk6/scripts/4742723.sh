#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*
#This bug has been fixed since jdk 1.6.0_02. So system's jdk version is checked here, if it is JDK6 and below 1.6.0_02, run the test directly, other wise inform user to specify the required jdk location.
if [[ $MAJORVER -ne 6 || $MINORVER -ge 02 ]] && [[ "${JAVAL}" = "" ]];
then
    report_warning jdk1.6.0 jdk1.6.0_02 4742723
else
    classes_to_compile=src/Test4742723.java
    class_to_run=Test4742723
    compile_and_run $param
fi
