#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

classes_to_compile=src/groovy/servlet/Groovy6456.java
class_to_run=groovy.servlet.Groovy6456

compile_and_run $*