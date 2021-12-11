#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh
check_java_version $*
if [[ $MAJORVER -ge 6 && $MINORVER -ge 10 ]] && [[ "${JAVAL}" = "" ]];
then
    report_warning jdk1.6.0 jdk1.6.0_10 6648001
else
    classes_to_compile=src/Test6648001.java
    class_to_run=Test6648001
    Opt="-ea:sun.net.www.protocol.http.AuthenticationInfo -Dhttp.auth.serializeRequests=true"
    compile_and_run $param
fi
