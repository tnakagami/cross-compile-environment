#!/bin/bash

if [ "${MAP_NODE_UID}" != "no" ]; then
    if [ ! -d "${MAP_NODE_UID}" ]; then
        MAP_NODE_UID=${PWD}
    fi

    uid=$(stat -c '%u' "${MAP_NODE_UID}")
    gid=$(stat -c '%g' "${MAP_NODE_UID}")

    echo "armer ---> UID = ${uid} / GID = ${gid}"

    export USER=armer

    usermod -u ${uid} armer 2> /dev/null && {
        groupmod -g ${gid} armer 2> /dev/null || usermod -a -G ${gid} armer
    }
else
    uid=$(id -u ${USER})
    gid=$(id -g ${USER})
fi

echo "Starting with UID : ${uid}, GID: ${gid}"

exec /usr/sbin/gosu armer "$@"
