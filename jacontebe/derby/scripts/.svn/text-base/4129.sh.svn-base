#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

classes_to_compile=src/Derby4129.java
class_to_run=Derby4129

compile_and_run $*

#delete generated files
rm -rf DB
rm derby.log