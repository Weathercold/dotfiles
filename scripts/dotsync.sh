#!/usr/bin/env bash

cd $(dirname $(dirname $(readlink -f "$0")))
./dotdrop.sh update -bfp user
./dotdrop.sh update -bfp system
./dotdrop.sh update -bfp catppuccin
git add .
git commit -m "Autoupdate $(( $(git log -10 --pretty=format:%B | grep -Pom1 'Autoupdate \K\d*') + 1 ))"
git pull
git push