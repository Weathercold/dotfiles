#!/bin/bash

cd $(dirname "$BASH_SOURCE")
git pull
./dotdrop.sh update -f
git add .
git commit -m "Import $(( $(git log -10 --pretty=format:%B | grep -Pom1 'Import \K\d*') + 1 ))"
git push
