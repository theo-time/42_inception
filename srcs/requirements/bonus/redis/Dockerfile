FROM debian:buster

RUN  apt-get update -y
RUN  apt-get install redis-server -y

RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf
RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
RUN sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]