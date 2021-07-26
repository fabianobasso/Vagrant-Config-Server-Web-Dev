#!/bin/bash - 
#===============================================================================
#
#          FILE: opensslConf.sh
# 
#         USAGE: ./opensslConf.sh 
# 
#   DESCRIPTION: configure a local self-signed certificate for https site
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 03/06/2021 19:37
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

sudo timedatectl set-timezone America/Sao_Paulo
IPHOST=`hostname -I`
sudo cp /vagrant/configServer/scripts/ssl/ssl-params.conf /etc/apache2/conf-available/
sudo a2enmod ssl
sudo a2enmod headers
sudo openssl req -x509 -nodes -days 5024 -newkey rsa:2048 -keyout /etc/ssl/private/apache.key -out /etc/ssl/certs/apache.crt -subj "/C=BR/ST=SP/L=CAMPINAS/O=DeveloperEnvirenment/OU=Developer Envirionment/CN=$IPHOST"
sudo cp /etc/ssl/certs/apache.crt /vagrant/configServer/scripts/ssl/cert/
sudo a2ensite site-ssl.conf
sudo a2enconf ssl-params
sudo systemctl reload apache2.service

