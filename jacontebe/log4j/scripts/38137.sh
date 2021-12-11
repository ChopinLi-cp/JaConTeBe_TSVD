#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

compile_dependencies=../lib/*:lib/log4j-1.2.13.jar
classes_to_compile=src/org/apache/log4j/Test38137.java
class_to_run=org.apache.log4j.Test38137

compile_and_run $*
