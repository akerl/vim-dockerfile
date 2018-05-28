#!/usr/bin/env bash

set -euo pipefail

REPO_URL=https://github.com/moby/moby
REPO_DIR=tmp_repo
PLUGIN_PATH=contrib/syntax/vim

if [ -e "$REPO_DIR" ] ; then
    (cd "$REPO_DIR" && git pull origin master)
else
    git clone "$REPO_URL" "$REPO_DIR"
fi
cp -R "$REPO_DIR/$PLUGIN_PATH"/* ./
git --git-dir="$REPO_DIR/.git" log -n1 --format="%h" -- contrib/syntax/vim | head -c7 > .commit
