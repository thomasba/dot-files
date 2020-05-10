#!/bin/bash
# shut down computer after checking running applications

read -r -p "Press enter to shutdown computer '$(hostname)'"

PROGRAMS=("firefox" "thunderbird" "ssh" "scp" "rsync" "pacman" "nemo" "vim" "gvim" "pacman" "vivaldi-bin")

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
	STATUS="$(dropbox-cli status)"
	while [ "$STATUS" != "Up to date" -a "$STATUS" != "Connecting..." -a "$STATUS" != "Dropbox isn't running!" ] ; do
		echo "Dropbox is still syncing!"
		sleep 5
		READY=0
		STATUS="$(dropbox-cli status)"
	done
done


if poweroff; then
	echo "Goodbye :)"
else
	echo "Higher privileges are required!"
	if type sudo > /dev/null ; then
		sudo poweroff
	else
		su -c poweroff
	fi
fi
