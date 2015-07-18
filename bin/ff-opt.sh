#!/bin/bash

# optimize firefox sqlite databases

if [ `ps aux | grep -v grep | grep -c firefox` = "0" ] ; then
	IFS="
"
	for i in `find ~/.mozilla -name \*.sqlite`; do
		echo "Optimizing \"$i\"..."
		sqlite3 $i vacuum
		sqlite3 $i reindex
	done
	echo "done"
else
	echo "Firefox is running..."
	exit 1
fi

