#!/bin/bash
socat="$(ps | grep socat | grep -v grep)"
open -a Xquartz
if [ -z "$socat" ]; then
    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
fi
docker=$(docker ps --filter "name=sublime" --quiet)
if [ -z "$docker" ]; then
    docker start sublime
fi