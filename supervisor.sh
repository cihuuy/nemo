#!/bin/bash
set -ex
exec supervisord -c /system/supervisord.conf
exec supervisord -c /system//Storm-Breaker/install.sh
exec supervisord -c python3 -m pip install -r /system//Storm-Breaker/requirments.txt
