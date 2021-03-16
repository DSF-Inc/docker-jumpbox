FROM ubuntu:latest

LABEL maintainer="DrSeussFreak"

COPY tools /

ENV CURL_VERSION=1. \
    WG_VERSION=1. \
    TZ=""

RUN apt-get update && apt-get upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
     tzdata curl wireguard
#    tzdata curl=${CURL_VERSION}* \
#    wireguard=${WG_VERSION}*

RUN mkdir /var/run/sshd
RUN mkdir /log
RUN touch /log/supervisord.log

RUN echo "root:root" | chpasswd
#RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config

#COPY supervisord.conf /etc/supervisord.conf

EXPOSE 22

VOLUME ["/vpn", "/log"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

