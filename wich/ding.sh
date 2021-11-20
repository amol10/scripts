#!/bin/bash

max_delay=$1
sound=$2
duration=$3

if [ $duration -ne -1 ]
then
    duration=$(bc <<< "$duration*60")
fi

echo

time_spent=0
while [ 1 ]
do
    delay=$(bc <<< "$RANDOM%$max_delay")
    time_spent=$(($time_spent + $delay))
    while [ $delay -gt 0 ]
    do
        delay=$(bc <<< $delay-1)
        sleep 1
        echo -e '\e[1A\e[K'$delay
    done
    mpg123 -q $sound
    if [ $time_spent -ge $duration ] && [ $duration -ne -1 ]
    then
        break
    fi
done