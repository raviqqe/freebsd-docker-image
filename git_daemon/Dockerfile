FROM auchida/freebsd
MAINTAINER Yota Toyama <raviqqe@gmail.com>

ENV ASSUME_ALWAYS_YES=yes

RUN echo nameserver 8.8.8.8 > /etc/resolv.conf && \
    pkg update && pkg install nginx git fcgiwrap

RUN sysrc nginx_enable=YES
RUN sysrc git_daemon_enable=YES

RUN sysrc fcgiwrap_enable=YES
RUN sysrc fcgiwrap_profiles=nginx
RUN sysrc fcgiwrap_nginx_socket=unix:/var/run/fcgiwrap/nginx.socket

COPY nginx.conf /usr/local/etc/nginx/nginx.conf
COPY /usr/local/etc/letsencrypt/live/raviqqe.com/fullchain.pem /usr/local/etc/letsencrypt/live/raviqqe.com/fullchain.pem
COPY /usr/local/etc/letsencrypt/live/raviqqe.com/privkey.pem /usr/local/etc/letsencrypt/live/raviqqe.com/privkey.pem

EXPOSE 80 443

CMD for s in git_daemon fcgiwrap nginx; do service $s start; done && \
    tail -f /dev/null
