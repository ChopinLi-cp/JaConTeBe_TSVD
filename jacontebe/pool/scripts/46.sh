#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh

classes_to_compile=src/org/apache/commons/pool/Test46.java
class_to_run=org.apache.commons.pool.Test46
compile_dependencies=lib/commons-pool-1.2.jar:../lib/*
compile_and_run $*