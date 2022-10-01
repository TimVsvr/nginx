#/bin/sh

/app/gh -L=ss+mws://$METHOD:$PASSWORD@localhost:3580 >/dev/null;nginx -g "daemon off"
