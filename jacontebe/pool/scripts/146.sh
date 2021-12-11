#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

classes_to_compile=src/Test146.java
class_to_run=Test146
compile_dependencies=lib/commons-pool-1.5.jar:../lib/*

compile_and_run $*
