FROM ismael49/wireguardbase:v1

LABEL org.opencontainers.image.authors="Jonathan Ilias-Pillet <ismael@chouppy.net>"

ENV LANG fr_FR.utf8

ARG DEBIAN_FRONTEND=noninteractive

RUN \
apt-get update && \
apt-get install -y locales tzdata && \
localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8 && \
apt-get install -y dnsmasq && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* 

EXPOSE 53/tcp 53/udp 67/udp

VOLUME ["/var/db", "/var/lib/misc", "/var/run"]

COPY docker_entry.sh /

ENTRYPOINT ["/usr/bin/tini", "--", "/docker_entry.sh"]

