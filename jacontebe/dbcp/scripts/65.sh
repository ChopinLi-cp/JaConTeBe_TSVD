#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh

classes_to_compile="src/Dbcp65.java src/org/apache/commons/dbcp/KeyGenerator.java"
class_to_run=Dbcp65

compile_and_run $*
