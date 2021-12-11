#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

compile_dependencies=lib/*:../lib/*:class
classes_to_compile="src/org/apache/derby/impl/services/reflect/Derby764.java src/org/apache/derby/impl/services/locks/LockOperator.java"
class_to_run="org.junit.runner.JUnitCore  org.apache.derby.impl.services.reflect.Derby764"

compile_and_run $*
