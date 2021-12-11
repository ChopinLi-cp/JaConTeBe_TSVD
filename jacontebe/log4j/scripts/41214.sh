#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

compile_dependencies=../lib/*:lib/log4j-1.2.13.jar
classes_to_compile="src/com/main/*.java src/com/a/*.java src/com/b/*.java src/com/c/*.java src/com/d/*.java"
class_to_run=com.main.Test41214

compile_and_run $*
