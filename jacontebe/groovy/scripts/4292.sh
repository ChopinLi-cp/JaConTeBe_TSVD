#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh
classes_to_compile=src/org/codehaus/groovy/ast/*.java
class_to_run=org.codehaus.groovy.ast.Groovy4292

compile_and_run $*
