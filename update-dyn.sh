#!/bin/sh
set -e

CURRENT_IP=$(curl -s http://checkip.dyndns.com 2>&1 | sed -r 's/.*\ ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+).*/\1/')

OLD_IP="none"
if [ -f /var/dyn/ip ]; then
  OLD_IP=$(cat /var/dyn/ip)
fi

if [ "$OLD_IP" != "$CURRENT_IP" ]; then
  echo "IP was ${OLD_IP} is now ${CURRENT_IP}"
  echo -n $CURRENT_IP > /var/dyn/ip
  curl -s "https://${DYN_USER}:${DYN_KEY}@members.dyndns.org/nic/update?hostname=${DYN_HOST}&myip=${CURRENT_IP}"
else
  echo "IP hasn't changed since last update"
fi
