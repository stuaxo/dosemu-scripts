#!/bin/bash

VERSION=`dosemu --version 2>&1 | head -1`

function main() {
    DIR="config/$VERSION"
    echo "config: $DIR"
    rm -fr $DIR
    mkdir -p $DIR
    echo "copying ~/.dosemu to $DIR"
    # Follow symlinks as after uninstall some dirs may not be available
    cp -RL ~/.dosemu/* $DIR
}

main
