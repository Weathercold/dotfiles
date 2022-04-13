#!/bin/bash

cd $(dirname "$BASH_SOURCE")
git pull
./dotdrop.sh update -fp user
sudo ./dotdrop.sh update -fp system
git add .
git commit -m "Autoupdate $(( $(git log -10 --pretty=format:%B | grep -Pom1 'Autoupdate \K\d*') + 1 ))"
git push
