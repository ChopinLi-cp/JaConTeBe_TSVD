#!/bin/bash 
source $(cd `dirname $0`; pwd)/jacontebe.sh

compile_dependencies=../lib/*:lib/lucene-core-2.9.3.jar:lib/junit3.jar
classes_to_compile="src/org/apache/lucene/util/LuceneTestCase293.java src/org/apache/lucene/util/_TestUtil293.java src/org/apache/lucene/store/*.java src/org/apache/lucene/util/English.java src/org/apache/lucene/index/Test2783.java"
class_to_run="junit.textui.TestRunner org.apache.lucene.index.Test2783"

compile_and_run $*