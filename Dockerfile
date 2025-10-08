FROM ubuntu:latest

LABEL org.opencontainers.image.source="https://github.com/zzzshanghai/ubuntu"

ENV TZ=Asia/Shanghai \
    SSH_USER=test \
    SSH_PASSWORD=test

COPY entrypoint.sh /entrypoint.sh
COPY reboot.sh /usr/local/sbin/reboot
COPY supervisord.conf /home
COPY shadowsocks-rust/ssserver /usr/bin
COPY shadowsocks-rust/config.json /home
COPY hysteria/hysteria-linux-amd64-avx /usr/bin
COPY hysteria/config.yaml /home
COPY ttyd/ttyd.x86_64 /usr/bin

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install -y tzdata openssh-server sudo curl ca-certificates wget vim net-tools supervisor cron unzip iputils-ping telnet git iproute2 --no-install-recommends; \
    apt-get update; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    mkdir /var/run/sshd; \
    chmod +x /entrypoint.sh; \
    chmod +x /usr/local/sbin/reboot; \
    chmod +x /usr/bin/ssserver; \
    chmod +x /usr/bin/hysteria-linux-amd64-avx; \
    chmod +x /usr/bin/ttyd.x86_64; \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime; \
    echo $TZ > /etc/timezone;

EXPOSE 22
EXPOSE 7681
EXPOSE 8388
EXPOSE 10443

ENTRYPOINT ["/entrypoint.sh"]
#CMD ["/usr/sbin/sshd", "-D"]
