#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*

echo "This bug affects Windows system only. There will be no deadlock on Linux system."
if [[ $MAJORVER -ne 7 || $MINORVER -lt 17 || $MINORVER -ge 40 ]] && [[ "${JAVAL}" = "" ]]; then
    report_warning jdk1.7.0_17 jdk1.7.0_40 8012019
else
    classes_to_compile=src/Test8012019.java
    class_to_run=Test8012019
    compile_and_run $param
fi
