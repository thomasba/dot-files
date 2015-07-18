#!/bin/bash

CARD=$(aplay -l|sed -n 's/^Karte \([0-9]\+\): .*G930.*$/\1/p')
CH="PCM"

if [ $# -eq 0 ] ; then
	echo "Usage: $0 ±<int>"
	echo "    ±<int>    change volume relative"
	echo "    <int>     set volume to <int>"
	exit 1
elif [[ $1 = +[0-9]* ]] || [[ $1 = -[0-9]* ]] ; then 
	volume="$1"
	#amixer -q -c 0 -- sset Master playback $(calc $(amixer sget Master | sed -rn 's/^.*Front Right: [^\[]*\[([0-9]+)%\].*$/\1/p')$volume)%
	amixer -c $CARD set $CH $(echo $1|sed -e 's/^\(.\)\(.*\)$/\2%\1/') > /dev/null
elif [[ $1 = [0-9]* ]] ; then
	volume=$1
	amixer -q -c $CARD -- sset $CH playback $volume%
else
	echo "Usage: $0 ±<int>"
	echo "    ±<int>    change volume relative"
	echo "    <int>     set volume to <int>"
	exit 1
fi

