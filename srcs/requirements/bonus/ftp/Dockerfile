FROM debian:buster

RUN  apt-get update -y
RUN  apt-get install vsftpd openssl -y

COPY ./conf/launch.sh ./

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

CMD ["sh", "./launch.sh"]