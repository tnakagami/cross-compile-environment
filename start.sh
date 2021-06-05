#!/bin/bash

trap_TERM() {
    now=$(date "+%Y/%m/%d-%H:%M:%S")
    echo "[${now}]" SIGTERM ACCEPTED

    for filename in .bash_history .viminfo .profile .bash_logout; do
        rm -f /home/armer/${filename}
    done
    exit 0
}

trap 'trap_TERM' TERM

while :
do
    sleep 1
done
