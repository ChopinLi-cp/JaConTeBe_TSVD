#!/bin/bash
source $(cd `dirname $0`; pwd)/jacontebe.sh
if [[ -z ${jpf_root} ]]; 
then
	echo "The environment variable "jpf_root", which means the path to your jpf-core project, is not set. Please set it to your jpf-core folder.";
	exit 1;
fi
if [[ $# -eq 0 ]]; 
then
	echo "Usage: $0 testname.jpf";
	exit 1;
fi
echo "================Run test without JPF================"
./scripts/$1.sh
echo "================Run test with JPF==================="
${jpf_root}/bin/jpf ./scripts/jpf/$1.jpf