FROM alpine:3.7

COPY tools /

#RUN apk --update add --no-cache \
#  curl=7.61.1-r2 \
#  wireguard \
#  supervisor \
#  openssh

RUN mkdir /var/run/sshd
RUN mkdir /log
RUN touch /log/supervisord.log

RUN echo "root:root" | chpasswd
#RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config

#COPY supervisord.conf /etc/supervisord.conf

EXPOSE 22

VOLUME ["/vpn", "/log"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

