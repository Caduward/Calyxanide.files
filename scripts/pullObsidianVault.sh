#!/usr/bin/env bash
echo "###PUXANDO VAULT###"
cd ~/gitprojects/Obsidian/ && \
git fetch origin master && \
git status && \
git pull origin master && \
cp -a ~/gitprojects/Obsidian/* ~/Docs/Obsidian && \
echo "###VAULT ATUALIZADA###"
