#!/bin/bash -e

EXECUTABLE="$0"
COMMAND="$1"
ARGS="$@"

function usage() {
    echo "Run a command in this folder by executing one of the numbered scripts followed by a valid commaind (init, plan, apply, or destroy)"
    echo "For example: ./00_main plan"
}

function extract_module() {
    export MODULE=$(echo "$EXECUTABLE" | sed s/'[0-9]*_'//)
    if [ "$MODULE" == "" ]; then
        echo "Error: Unable to determine module."
        usage
        exit 1
    fi
}

function pushm() {
    pushd "../$MODULE/"
}

function main() {
    extract_module
    pushm
    terraform $ARGS
    popd
}

main
