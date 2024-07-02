#!/bin/bash
ssh -oKexAlgorithms=+diffie-hellman-group14-sha1 -oHostKeyAlgorithms=+ssh-dss -oCiphers=+aes256-ctr -l Administrator 10.42.1.3 "$@"
