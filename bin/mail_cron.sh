#!/bin/sh
PID=$(pgrep offlineimap)
#FPID=$(pgrep imapfilter)
WPID=$(pgrep wvdial)

if [ -n "$PID" ] ; then
	echo "It’s up :-P"
	exit 1
fi

# UMTS Syncing once…
if [ -n "$WPID" ] ; then
	echo Syncing once!
	offlineimap -o -u Noninteractive.Quiet &>/dev/null &
	exit 0
fi

#imapfilter &> /dev/null
offlineimap -u Noninteractive.Quiet &>/dev/null &

