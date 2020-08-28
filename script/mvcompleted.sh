#!/bin/sh
 
# $1 is gid.
# $2 is the number of files.
# $3 is the path of the first file.
 
DOWNLOAD=/home34/ch010060/downloads/aria # no trailing slash!
COMPLETE=/home34/ch010060/downloads/share # no trailing slash!
LOG=/home34/ch010060/downloads/log/aria/mvcompleted.log
SRC=$3
 
if [ "$2" == "0" ]; then
  echo `date` "INFO  no file to move for" "$1". >> "$LOG"
  exit 0
fi
 
while true; do
  DIR=`dirname "$SRC"`
  if [ "$DIR" == "$DOWNLOAD" ]; then
    echo `date` "INFO " "$3" moved as "$SRC". >> "$LOG"
    mv --backup=t "$SRC" "$COMPLETE" >> "$LOG" 2>&1
    exit $?
  elif [ "$DIR" == "/" -o "$DIR" == "." ]; then
    echo `date` ERROR "$3" not under "$DOWNLOAD". >> "$LOG"
    exit 1
  else
    SRC=$DIR
  fi
done
