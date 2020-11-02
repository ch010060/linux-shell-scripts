#!/bin/bash

### Fixed "%urlFilename%" to "%works_date_fmt{%Y-%m-%d}% %title%" for PixivUtil2
### https://github.com/Nandaka/PixivUtil2

filetype="*.jpg *.jpeg *.png *.gif *.pdf *.mp4"

# Replace space with underscore in all filenames
find -name "* *" -type f | rename 's/ /_/g'

for filename in $(ls ${filetype});
do (
    # if filename contain more than three underlines
    rmString=$(echo "${filename}" | cut -d '_' -f 3 -s)
    lastModifiedTime=$(date -r "${filename}" +"%Y-%m-%d")
    if [ -z "${rmString}" ]; then
        newFilename=${lastModifiedTime}" _"${filename}
        mv "${filename}" "${newFilename}"
    else
        rmString=${rmString}"_-_"
        newFilename=${lastModifiedTime}" "$(echo "${filename}" | sed s/${rmString}//g)
        mv "${filename}" "${newFilename}"
    fi
)
done