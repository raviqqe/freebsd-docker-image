FROM auchida/freebsd
MAINTAINER Yota Toyama <raviqqe@gmail.com>

ENV ASSUME_ALWAYS_YES=yes
ENV nsd_dir=/usr/local/etc/nsd

RUN echo nameserver 8.8.8.8 > /etc/resolv.conf && pkg update && pkg install nsd
RUN sysrc nsd_enable=YES
RUN nsd-control-setup

ADD nsd.conf $nsd_dir/nsd.conf
ADD raviqqe.com.zone $nsd_dir/raviqqe.com.zone

CMD service nsd start && tail -f /dev/null
