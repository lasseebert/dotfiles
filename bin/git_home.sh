#! /bin/bash

set -e

git checkout main
git pull
git remote prune origin
git branch -vv \
  | grep ': gone]' \
  | grep -v "\*" \
  | awk '{ print $1; }' \
  | xargs -r git branch -d
