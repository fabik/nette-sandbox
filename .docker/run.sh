#!/bin/bash

docker run -i -t --rm -v "$PWD:/data" -w /data \
  -p 3000:80 \
  nette/sandbox:latest \
  sh -c 'service mysql start;\
    mysqladmin -u root -proot create test;\
    service apache2 start;\
    cd /data && composer install;\
    bash'
