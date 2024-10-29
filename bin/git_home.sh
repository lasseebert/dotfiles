#! /bin/bash

set -e

git_main_branch () {
    git branch | cut -c 3- | grep -E '^master$|^main$'
}

git checkout $(git_main_branch)
git pull
git remote prune origin
git branch -vv \
  | grep ': gone]' \
  | grep -v "\*" \
  | awk '{ print $1; }' \
  | xargs -r git branch -d
