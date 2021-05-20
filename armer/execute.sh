#!/bin/bash

if [ "x$1" != "x" ]; then
    qemu-arm -L /usr/local/arm-linux $1
fi
