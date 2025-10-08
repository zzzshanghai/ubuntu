#!/usr/bin/env sh

#useradd -m -s /bin/bash $SSH_USER
#echo "$SSH_USER:$SSH_PASSWORD" | chpasswd
#usermod -aG sudo $SSH_USER
#echo "$SSH_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/init-users
#echo 'PermitRootLogin no' > /etc/ssh/sshd_config.d/my_sshd.conf
#hysteria-linux-amd64-avx server -c /home/config.yaml
#ssserver -c /home/config.json
ttyd -p 8080 bash

exec "$@"
