#!/bin/bash
ip="$(ifconfig | grep inet | grep -v inet6 | grep -v 127.0.0.1 | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | grep -v 255)"
ip="$ip:0.0"
echo $ip
if [ -z "$ip" ]; then
    echo "cannot find IP"
fi
if [ -n "$ip" ]; then
    docker create --rm --name=sublime -e DISPLAY=$ip pkos/sublimetext
fi