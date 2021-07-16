# Powershell 6 or above support utf8NoBOM encoding
foreach ($file in get-ChildItem -Recurse *.cue) {
    Echo $file.fullname
    Get-Content $file | Set-Content -Encoding utf8NoBOM "$file.new"
    Move-Item -Force "$file.new" "$file"
 }
