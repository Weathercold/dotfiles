#!/bin/bash

BASEDIR=$(dirname "$BASH_SOURCE") $BASEDIR/dotdrop update -f
git add .
git commit -m "Import $(( $(git log -1 --pretty=format:%B | grep -oP '\d*') + 1 ))"
git push
