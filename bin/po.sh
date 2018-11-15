#!/bin/bash
# shut down computer after checking running applications

read -p "Press enter to shutdown computer '$(hostname)'"

PROGRAMS=("spotify" "firefox" "thunderbird" "ssh" "scp" "rsync" "pacman" "nemo" "vim" "gvim")

READY=0

while [ $READY -eq 0 ] ; do
	READY=1
	for PROGRAM in "${PROGRAMS[@]}"; do
		PID=$(pidof "$PROGRAM" 2> /dev/null)
		while [ -n "$PID" ]; do
			echo "$PROGRAM still running! (pid: $PID)"
			sleep 1
			PID=$(pidof "$PROGRAM" 2> /dev/null)
			READY=0
		done
	done
done

poweroff

if [ $? -ne 0 ] ; then
	echo "Higher privileges are required!"
	if type sudo > /dev/null ; then
		sudo poweroff
	else
		su -c poweroff
	fi
fi
