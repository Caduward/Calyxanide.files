#!/usr/bin/env bash
sudo nmcli c show --active | \
cut -d " " -f 1-2 | \
head -n 2 | \
tail -n 1 > /etc/nixos/info/wifi.txt && \
echo " " && echo "## WIFI ATUALIZADO ##"
