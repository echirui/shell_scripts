#!/bin/bash
# usage: ping_until_down.sh $target $timeout

declare -r MAX=${2:-300}
declare -i counter=$MAX+1
declare -r PING="ping -c 1 -i 1 -W 1"
declare -r TARGET=${1:-localhost}

while [[ ! $((--counter)) -eq 0 ]]
do
    ${PING} ${TARGET} || break
    sleep 1
done >& /dev/null

if [[ $counter -eq 0 ]] || [[ $counter -eq ${MAX} ]]
then
    exit 8
else
    exit 0
fi
