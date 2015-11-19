#!/bin/bash

# optimize firefox sqlite databases

if [ "$(pgrep -c firefox)" = "0" ] ; then
	find ~/.mozilla -name \*.sqlite|while read -r i ; do
		echo "Optimizing \"$i\"..."
		sqlite3 "$i" vacuum
		sqlite3 "$i" reindex
	done
	echo "done"
else
	echo "Firefox is running..."
	exit 1
fi

