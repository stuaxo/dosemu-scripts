#!/bin/bash

# pass in the version tag to install

function verify_params() {
    # sanity check params
    if [ -z "$1" ]; then
       echo "Pass in dosemu version"
        ./get-versions.sh
        exit 1
    fi

    VERSION_TAG=$1

    if [ ! -d src/${VERSION_TAG} ]; then
        echo "No version ${VERSION_TAG}"
        ./get-versions.sh
        exit 2
    fi
}

function _info() {
    echo "INFO  dir: `basename $PWD`"
    echo "INFO  getversion: `./getversion`"
    echo .
}

function _clean() {
    echo "RUN  make realclean"
    make realclean
}

function _configure() {
    if [ -e ./autogen.sh ]; then
        echo "RUN  autogen.sh"
        ./autogen.sh
    else
        echo "INFO  no autogen.sh"
    fi

    if [ -e ./autogen.sh ]; then
        echo "RUN  ./default-config"
        ./default-config
    else
        echo "INFO  no  ./default-config"
        echo "RUN  ./configure"
        ./configure
    fi
}

function _make() {
    make
}

function _install() {
    _info
    _clean
    _configure
    _make
    cp ../../dosemu-freedos-1.0.bin.tgz dosemu-freedos-bin.tgz
    sudo make install
}

function main() {
    verify_params $*
    pushd src/${VERSION_TAG} > /dev/null
    _install
    popd > /dev/null
}

main $*
