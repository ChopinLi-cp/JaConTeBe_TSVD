#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh

classes_to_compile=src/Dbcp270.java
class_to_run=Dbcp270

compile_and_run $*
