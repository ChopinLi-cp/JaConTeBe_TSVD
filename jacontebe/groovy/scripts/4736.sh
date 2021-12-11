#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

classes_to_compile=src/Groovy4736.java
class_to_run=Groovy4736

compile_and_run $*