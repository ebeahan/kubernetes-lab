#!/bin/bash -e

NAME="$1"

if [ "$NAME" == "" ]; then
    echo "You must specify a module name as the first argument."
    exit 1
fi

if [ -e "$NAME" ]; then
    echo "You cannot run this script on an existing module."
    exit 1
fi

if [ $(echo "$NAME" | grep '[/. *?$]' | wc -l) -gt 0 ]; then
    echo "Are you trying to delete /dev/null? Do not specify slashes, periods, spaces, dollar signs, or bash wild cards in your folder name!"
    exit 1
fi

function copy_defaults() {
    pushd "$NAME"
    cp ../main/backend.tf "$NAME"
    sed -i s/'main'/"$NAME"/ "$NAME/backend.tf"
    ln -s ../common/providers.tf .
    ln -s ../common/main.tf .
    popd
}

function setup_init() {
    pushd setup_init
    ln -s manage.sh 99_"$NAME"
    popd
}

function main() {
    mkdir "$NAME"
    copy_defaults
    setup_init
}

main
