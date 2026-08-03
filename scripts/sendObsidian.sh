#!/usr/bin/env bash
cd ~/gitprojects/Obsidian && \
git add . && \
git status && \
git commit -C HEAD && \
git push -u origin master
