#!/bin/sh
sslocal -c /opt/conf/ssr.json --log-file /opt/logs/ssl.log -d start --pid-file /opt/run/ssr.pid
sleep 10000d
