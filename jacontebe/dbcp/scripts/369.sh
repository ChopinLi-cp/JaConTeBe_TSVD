#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh

classes_to_compile=src/org/apache/commons/dbcp/datasources/Dbcp369.java
class_to_run=org.apache.commons.dbcp.datasources.Dbcp369

compile_and_run $*
