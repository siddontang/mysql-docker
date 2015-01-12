FROM ubuntu:14.04
MAINTAINER siddontang@gmail.com

# Use Chinese sources.list to speed up if you are in China
COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y mysql-server-5.6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/mysql

COPY my.cnf /etc/mysql/my.cnf
COPY my-default.cnf /usr/share/mysql/my-default.cnf

COPY start.sh /start.sh
RUN chmod +x /start.sh

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ["/start.sh"]
