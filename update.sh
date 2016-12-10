#!/bin/bash -eu

git fetch
git rebase origin master
git submodule update --init
