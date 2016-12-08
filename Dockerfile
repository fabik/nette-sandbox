FROM ubuntu:16.10
MAINTAINER jansfabik@gmail.com

ENV DEBIAN_FRONTEND noninteractive

# upgrade the system
RUN apt-get update
#RUN apt-get upgrade -y

# base tools
RUN apt-get install mc curl vim wget htop openssh-client git -y

# mysql
RUN apt-get install mysql-client mysql-server -y

# php
RUN apt-get install php7.0 php7.0-curl php7.0-gd php7.0-mysql php7.0-xdebug -y

# apache
RUN apt-get install apache2 libapache2-mod-php7.0
RUN a2enmod rewrite

# composer
RUN cd && curl -sS https://getcomposer.org/installer | php && ln -s /root/composer.phar /usr/local/bin/composer

# setup vhost
RUN mkdir -p /data

COPY .docker/sandbox.conf /etc/apache2/sites-available/sandbox.conf

RUN a2dissite 000-default.conf && \
  a2ensite sandbox.conf

# setup mysql user
RUN service mysql start && \
  mysql -u root -e "FLUSH PRIVILEGES; SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');"
