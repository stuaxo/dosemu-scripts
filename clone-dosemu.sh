#!/bin/bash

# clones dosemu2 into src/dosemu2 and copies the tagged versions to src/dosemu2-version
# also downloads freedos binary if needed

VERSION_TAGS="dosemu-1.5.0 dosemu2-2.0pre1 dosemu2-2.0pre2 dosemu2-2.0pre3"

function grab_versions {
    # original version - will be untouched
    if [ ! -d dosemu2 ]; then
        git clone https://github.com/stsp/dosemu2.git
    fi
    pushd dosemu2
        git pull
    popd

    for versiontag in ${VERSION_TAGS}
    do
        echo "$versiontag"
        rm -fR $versiontag
        cp -Rp dosemu2 $versiontag
        pushd $versiontag
            git checkout $versiontag
        popd
    done
}

function main() {
    ./dl_freedos.sh
    mkdir -p src
    pushd src
    grab_versions
    popd
}

main
