#!/usr/bin/env bash
cd ~/gitprojects/nixoFiles && \
git add . && \
git status && \
git commit -C HEAD && \
git push -u origin calyx
