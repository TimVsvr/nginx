#/bin/sh

/app/gh -L=ss+mws://$METHOD:$PASSWORD@localhost:3580 >/dev/null 2>&1 &
sed -i '#server_name#a     location /ws {\n        set $is_ws 0;\n        if ($http_upgrade = "websocket") {\n           set $is_ws 1;\n           proxy_pass http://127.0.0.1:3580;\n        }\n        proxy_http_version 1.1;\n        proxy_set_header Upgrade $http_upgrade;\n        proxy_set_header Connection "upgrade";\n        proxy_set_header        Host            $host;\n        proxy_set_header        X-Real-IP       $remote_addr;\n        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;\n        proxy_set_header        X-Forwarded-Proto $scheme;\n        if ($is_ws = 0) {\n           return 301 https://$host/;\n        }\n    }' /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'
