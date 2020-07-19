#!/bin/sh
set -e

CURRENT_IP=$(curl -s http://checkip.dyndns.com 2>&1 | sed -r 's/.*\ ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*/\1/')

curl -s "https://${DYN_USER}:${DYN_KEY}@members.dyndns.org/nic/update?hostname=${DYN_HOST}&myip=${CURRENT_IP}"
