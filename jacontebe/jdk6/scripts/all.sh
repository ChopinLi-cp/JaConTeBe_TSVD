#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh

for file in scripts/[^a,j]*.sh
do
    echo "========================="
    echo "Starting "${file}
    ${file}
    echo "========================="
done
