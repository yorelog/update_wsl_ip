#!/bin/bash

# get current wsl eth0 ip with `ip addr`
# format it as something like "172.0.0.1 wsl" so it's convinent to compare with hosts
NOW_IP=$(ip addr |grep eth0|grep -oEe "inet [0-9.]+"|sed -r "s/inet ([0-9.]+)/\1 wsl/g")
#echo $NOW_IP

# check if there is a host binding configure for wsl,
# or modified if configured
ACTIVE_IP=$(grep wsl /mnt/host/c/Windows/System32/drivers/etc/hosts)

#echo $ACTIVE_IP


if [ "$NOW_IP" = "$ACTIVE_IP" ]; then
  echo "$NOW_IP has CORRECT configured"
  exit 0
fi

if [ "$ACTIVE_IP" = "" ]; then
  echo "now CONFIGURE $NOW_IP"
  echo $NOW_IP >>  /mnt/host/c/Windows/System32/drivers/etc/hosts
else
  echo "now UPDATE $NOW_IP"
  sed -r "s/[0-9.]+ wsl/$NOW_IP/g" /mnt/host/c/Windows/System32/drivers/etc/hosts > /mnt/host/c/Windows/System32/drivers/etc/hosts
fi
