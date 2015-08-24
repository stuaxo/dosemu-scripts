#!/bin/bash

# output version for all dosemus in 'src' dir
#
# calls getversion in each directory

function main() {
    DIR=src
    echo "dosemu versions in directory $DIR:"
    for d in $DIR/dosemu*/ ; do
        pushd $d > /dev/null
        if [ -f getversion ]; then
            VERSION=$(./getversion)
        else
            VERSION="No getversion"
        fi
        echo "`basename $d`: $VERSION"
        popd > /dev/null
    done
}

main
