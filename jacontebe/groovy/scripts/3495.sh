#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

classes_to_compile=src/Groovy3495.java
class_to_run=Groovy3495

compile_and_run $*