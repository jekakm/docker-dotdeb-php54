#!/bin/bash

nginx -c /etc/nginx/nginx.conf
php5-fpm -c /etc/php5/fpm/pool.d/www.conf -FR
