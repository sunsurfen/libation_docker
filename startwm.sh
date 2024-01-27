#!/bin/bash
/usr/bin/pulseaudio --start


# Need to have a UTF-8 friendly LANG set.

export LANG=en_US.UTF-8
export oa_external=false
export oa_packaging=docker

nohup libation >/dev/null 2>&1 &

# This blocks until user closes session
/usr/bin/startxfce4 > /dev/null 2>&1

