#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh
#This bug is not fixed, so no need to check java version.

classes_to_compile=src/Test6582568.java
class_to_run=Test6582568
compile_and_run $*
