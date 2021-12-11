#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

classes_to_compile=src/Test162.java
class_to_run=Test162

compile_and_run $*
