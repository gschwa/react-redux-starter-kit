#!/usr/bin/env bash

#validate nginx config before we start
nginx -V
#start nginx config
nginx
#tail logs
tail -f /var/log/nginx/access.log -f /var/log/nginx/error.log
