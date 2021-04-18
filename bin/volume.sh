#!/bin/bash

CARDS="$(pactl list sinks short|cut -f2)"
if [ "$(pactl list sinks short|grep RUNNING$|wc -l)" -ne 0 ] ; then
	CARDS="$(pactl list sinks short|grep RUNNING$|cut -f2)"
fi

if [ $# -eq 0 ] ; then
	echo "Usage: $0 ±<int>"
	echo "    ±<int>    change volume relative"
	echo "    <int>     set volume to <int>"
	exit 1
elif [[ $1 = "toggle-mute" ]] ; then
	pactl list sinks short | cut -f2 | while read l; do
		pactl set-sink-mute "$l" toggle
	done
elif [[ $1 = [+-][0-9]* ]] || [[ $1 = [0-9]* ]] ; then 
	for l in $CARDS; do
		pactl set-sink-volume "$l" $1%
	done
	#pkill -RTMIN+1 i3blocks||true
else
	echo "Usage: $0 ±<int>"
	echo "    ±<int>    change volume relative"
	echo "    <int>     set volume to <int>"
	exit 1
fi

