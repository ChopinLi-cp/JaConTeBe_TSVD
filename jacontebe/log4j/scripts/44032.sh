#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

compile_dependencies=../lib/*:lib/log4j-1.2.15.jar
classes_to_compile=src/Test44032.java
class_to_run=Test44032

compile_and_run $*
