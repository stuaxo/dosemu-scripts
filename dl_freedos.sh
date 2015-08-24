DOSEMU_FREEDOS=dosemu-freedos-1.0
DOSEMU_FREEDOS_TGZ="${DOSEMU_FREEDOS}.bin.tgz"

function dl_dosemu_freedos() {
    if [ ! -e "$DOSEMU_FREEDOS_TGZ" ]; then
        curl -L  http://downloads.sourceforge.net/project/dosemu/dosemu-freedos/1.0/dosemu-freedos-1.0-bin.tgz > "${DOSEMU_FREEDOS_TGZ}"
    else
        echo "$DOSEMU_FREEDOS already downloaded"
    fi
}

function extract_freedos() {
    rm -rf "${DOSEMU_FREEDOS}"
    mkdir -p "${DOSEMU_FREEDOS}"
    echo extract "${DOSEMU_FREEDOS_TGZ}" to "${DOSEMU_FREEDOS}"
    tar -zxf "${DOSEMU_FREEDOS_TGZ}" -C "${DOSEMU_FREEDOS}"
}

dl_dosemu_freedos
extract_freedos
