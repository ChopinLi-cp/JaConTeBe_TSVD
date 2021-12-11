#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

classes_to_compile=src/Test149.java
class_to_run=Test149

compile_and_run $*