#!/bin/bash

# Replace space with underscore in all filenames
find -name "* *" -type f | rename 's/ /_/g'

# List files
for filename in $(find . -maxdepth 1 -type f);
do (
    # Get video height
    echo ${filename}
    quality=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of default=nw=1:nk=1 $filename)
    if [ ! -d "${quality}" ]; then
        mkdir "${quality}"
    fi
    mv "${filename}" "${quality}"
)
done