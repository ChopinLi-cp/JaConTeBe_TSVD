#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh
#This bug is not fixed, so no need to check java version.

classes_to_compile="src/Test6588239.java"
class_to_run=Test6588239
compile_and_run $*
