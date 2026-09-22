#!/usr/bin/env bash

set -euo pipefail

good_commit="${1:?Usage: $0 <good-commit> <command>}"
command="${2:?Usage: $0 <good-commit> <command>}"

git_root="$(git rev-parse --show-toplevel)"

echo "Checking that HEAD is bad..."

if (cd "$git_root" && bash -c "$command"); then
  echo "HEAD is good. Nothing to bisect."
  exit 1
fi

echo "HEAD is bad. Starting bisect..."

git bisect start HEAD "$good_commit"

cleanup() {
  git bisect reset >/dev/null 2>&1 || true
}
trap cleanup EXIT

git bisect run bash -c "$command"

bad_commit="$(git rev-parse refs/bisect/bad)"

git bisect reset
trap - EXIT

short_bad="$(git rev-parse --short "$bad_commit")"

echo "First bad commit: $short_bad"
echo "Starting rebase and stopping there..."

GIT_SEQUENCE_EDITOR="sed -i 's/^pick $short_bad /edit $short_bad /'" \
  git rebase -i "${bad_commit}^"
