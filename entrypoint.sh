#!/bin/bash

if [ "x${NODE_UID}" != "x" ] && [ "x${NODE_GID}" != "x" ]; then
    uid=${NODE_UID}
    gid=${NODE_GID}
    usermod -u ${uid} armer 2> /dev/null && {
        groupmod -g ${gid} armer 2> /dev/null || usermod -a -G ${gid} armer
    }
else
    uid=$(id -u ${USER})
    gid=$(id -g ${USER})
fi

echo "Starting with UID : ${uid}, GID: ${gid}"

chown armer:armer -R /home/armer

exec /usr/sbin/gosu armer "$@"
