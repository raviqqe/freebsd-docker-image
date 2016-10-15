FROM auchida/freebsd
MAINTAINER Yota Toyama <raviqqe@gmail.com>

ENV ASSUME_ALWAYS_YES=yes
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN echo nameserver 8.8.8.8 > /etc/resolv.conf && \
    pkg update && \
    pkg install nginx ca_root_nss
