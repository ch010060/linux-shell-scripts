#!/bin/sh

OIFS="$IFS"
IFS=$'\n'
FILE_EXT="cue"
for file in $(find . -type f -name "*.${FILE_EXT}")
do
     charset=$(uchardet "${file}")
     if [ "${charset}" != 'UTF-8' ]
     then
        iconv -f ${charset} -t utf-8 "$file" >"$file.new" &&
        mv -f "$file.new" "$file"
     fi
done
IFS="$OIFS"