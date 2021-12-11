#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

compile_dependencies=../lib/*:lib/lucene-core-2.4.0.jar:lib/junit3.jar
classes_to_compile="src/org/apache/lucene/Test1544.java  src/org/apache/lucene/util/LuceneTestCase240.java src/org/apache/lucene/util/_TestUtil293.java"
class_to_run="junit.textui.TestRunner org.apache.lucene.Test1544"

compile_and_run $*

#delete temp files if there is any.
rm -rf TestDoug2-*
