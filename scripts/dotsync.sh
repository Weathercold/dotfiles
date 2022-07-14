#!/usr/bin/env bash

cd $(dirname $(readlink -f "$0"))
./dotdrop.sh update -fp user
./dotdrop.sh update -bfp system
./dotdrop.sh update -bfp catppuccin

cd $(dirname $(pwd))
git add .
git commit -m "Autoupdate $(( $(git log -10 --pretty=format:%B | grep -Pom1 'Autoupdate \K\d*') + 1 ))"
git pull
git push