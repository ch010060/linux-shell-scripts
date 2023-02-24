#!/bin/bash

if [ "$#" -ne 2 ];then
    echo "Usage: convert_file_gb2big5_recursive.sh <Path> <Extension>"
    exit 1
fi

convert_gb2big5() {
    FILE="$1"
    for line in $(cat "$FILE" | grep -w 'genre\|tagline\|tag\|title_cn\|<plot>*')
    do
        #echo $line
        line_convert=`echo "$line" | iconv -c -f utf8 -t gb2312 | iconv -f gb2312 -t big5 | iconv -f big5 -t utf8 | sed "s@title_cn@title_tw@g"`
        #echo $line_convert
        sed -i "s@$line@$line_convert@g" "$FILE"
    done
}

MY_PATH="$1"
EXTENSION="$2"

IFS=$'\n'; set -f
FILES=$(find $MY_PATH -name "$EXTENSION")
FILES_COUNT=$(echo $FILES | sed 's@nfo @nfo\n@g' | wc -l)
COUNTER=1
for FILE in $FILES
do
    echo "Process($COUNTER/$FILES_COUNT): $FILE"
    convert_gb2big5 "$FILE"
    let COUNTER++
done
unset IFS; set +f
