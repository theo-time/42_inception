FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        vsftpd

COPY conf/vsftpd.conf /tmp/vsftpd.conf

COPY ./conf/launch.sh ./

# COPY ./conf/vsftpd.conf /etc/vsftpd.conf

CMD ["sh", "./launch.sh"]