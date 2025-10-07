#!/usr/bin/env sh

useradd -m -s /bin/bash $SSH_USER
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd
usermod -aG sudo $SSH_USER
echo "$SSH_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/init-users
echo 'PermitRootLogin no' > /etc/ssh/sshd_config.d/my_sshd.conf
wget -P /home/zhihao https://raw.githubusercontent.com/zzzshanghai/ubuntu/refs/heads/main/config.json
ssserver -c /home/zhihao/config.json

exec "$@"
