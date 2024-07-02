#!/bin/bash
firewall-cmd --add-port=34003/tcp
mitmdump --set tls_version_server_min=TLS1_1 --set tls_version_server_max=TLS1_1 --set ciphers_server=AES128-SHA --ssl-insecure -p 34003 --mode reverse:https://10.42.1.3:443/ &
