#!/usr/bin/env bash
/usr/local/bin/start_wireguard.sh
exec /usr/sbin/dnsmasq -d --log-facility=- --log-debug
