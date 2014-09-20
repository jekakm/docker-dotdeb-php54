FROM debian:wheezy
MAINTAINER Evgeniy Gurinovich "jeka@geek.km.ua"
RUN apt-get update && apt-get install -y wget curl ca-certificates
RUN echo "deb http://packages.dotdeb.org wheezy all\ndeb-src http://packages.dotdeb.org wheezy all" > /etc/apt/sources.list.d/dotdeb.list
RUN wget http://www.dotdeb.org/dotdeb.gpg -O /tmp/dotdeb.gpg && apt-key add /tmp/dotdeb.gpg
RUN apt-get update && apt-get install -y php5-cli php5-fpm php5-gd php5-curl php5-intl php5-mysql php5-sqlite php5-xmlrpc php5-xsl php5-apc php5-imagick nginx-extras 
ADD configs/fpm.conf /etc/php5/fpm/pool.d/www.conf
ADD configs/php_fpm.ini /etc/php5/fpm/php.ini
ADD configs/php_cli.ini /etc/php5/cli/php.ini
ADD configs/nginx-conf /etc/nginx/sites-enabled/default
ADD configs/run.sh /usr/local/bin/run.sh
RUN chmod a+x /usr/local/bin/run.sh
CMD /usr/local/bin/run.sh
