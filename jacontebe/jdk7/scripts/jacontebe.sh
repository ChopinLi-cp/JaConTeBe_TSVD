cd $(cd `dirname $0`/..; pwd)

function compile_and_run_0()
{
    mkdir -p bin
    if [ -z ${compile_dependencies} ]; then
        compile_dependencies=lib/*:../lib/*
    fi
    ${JAVAL}javac -cp ${compile_dependencies} ${classes_to_compile} -d bin
    if [ -z ${runtime_dependencies} ]; then
        runtime_dependencies=${compile_dependencies}:bin
    fi
    ${JAVAL}java ${Opt} -cp ${runtime_dependencies} ${class_to_run} $*
}

function compile_and_run()
{
    mkdir -p bin
    if [ -z ${compile_dependencies} ]; then
        compile_dependencies=lib/*:../lib/*
    fi
    ${JAVAL}javac -cp ${compile_dependencies} ${classes_to_compile} -d bin
    if [ -z ${runtime_dependencies} ]; then
        runtime_dependencies=${compile_dependencies}:bin
    fi
    ${JAVAL}java ${Opt} -javaagent:${HOME}/.m2/repository/asm-simple-project/agent/0.1-SNAPSHOT/agent-0.1-SNAPSHOT.jar -cp ${runtime_dependencies} ${class_to_run} $*
}

function check_java_version()
{
    JAVA_VERSION=`java -version 2>&1 | awk 'NR==1{ gsub(/"/,""); print $3 }'`
    MAJORVER=`java -version 2>&1 | grep "java version" | awk '{print $3}' | tr -d \" | awk '{split($0, array, ".")} END{print array[2]}'`
    MINORVER=`java -version 2>&1 | grep "java version" | awk '{print $3}' | tr -d \" | awk '{split($0, array, "_")} END{print array[2]}'`

    parse_parameter $*
}

#$1 starting broken JDK version
#$2 fixed JDK version
#$3 description file name
function report_warning()
{
    echo This bug existed from version $1, and fixed at $2, but your current Java version is $JAVA_VERSION.
    echo If you have a proper JDK installed, please rerun this script with the --javaloc option as per description/$3.html.
}

function parse_parameter()
{
    i=1
    while [ $i -le $# ]
    do
        eval O=\${$i}
        if [ "${O}" = "--javaloc" ];
        then
           i=`expr $i + 1`
           eval JAVAL=\${$i}
        else
            param="${param} $OPT"
        fi
        i=`expr $i + 1`
    done
}
