#!/bin/bash - 
#===============================================================================
#
#          FILE: php-8.sh
# 
#         USAGE: ./php-8.sh 
# 
#   DESCRIPTION: install and configure php 8-0
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: Modules install:
#			mysql 
#			cli
#			common
#			imap
#			ldap
#			xml
#			fpm
#			curl
#			mbstring
#			zip 
#			gd
#			sqlite3
#        AUTHOR: Fabiano Basso (fabiano.basso.dev@gmail.com), 
#  ORGANIZATION: 
#       CREATED: 03/06/2021 19:46
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php8.0 libapache2-mod-php8.0 -y
sudo apt-get install php8.0-{mysql,cli,common,imap,ldap,xml,fpm,curl,mbstring,zip,gd,sqlite3} -y
sudo cp /vagrant/configServer/scripts/php/php.ini /etc/php/8.0/
sudo systemctl reload apache2.service
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
sudo mv composer.phar /usr/local/bin/composer
php -r "unlink('composer-setup.php');"



