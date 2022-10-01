#/bin/sh

/app/gh -L=ss+mws://$METHOD:$PASSWORD@:$PORT >/dev/null 2>&1 &
nginx -g daemon off
