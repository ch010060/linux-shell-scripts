#!/bin/bash

if [ "$#" -ne 3 ];then
	echo "Usage: rsync_copy_with_filter.sh <Source> <Destination> <Extension>"
	exit 1
fi

SRC="$1"
DST="$2"
EXTENSION="$3"
rsync -zarv --prune-empty-dirs --include "*/" --include=$EXTENSION --exclude="*" $SRC $DST
