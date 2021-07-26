#!/bin/bash - 
#===============================================================================
#
#          FILE: apache.sh
# 
#         USAGE: ./apache.sh 
# 
#   DESCRIPTION: install apache web server on linux and set some configuration 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: to configure your project you can edit the files:
#			site.conf
#			site-ssl.conf
#
#
#        AUTHOR: Fabiano Basso (fabiano.basso.dev@gmail.com),  
#  ORGANIZATION: 
#       CREATED: 03/06/2021 19:28
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# install apache
sudo apt-get install apache2 -y
source /home/vagrant/.bashrc

# enable modolo rewrite for friendly url in php
sudo a2enmod rewrite

# enable mpm_prefork if it is not already active
mpm=`apache2ctl -M|grep -i mpm`

if [ "$mpm" != "mpm_prefork module (shared)" ]
then
	sudo a2dismod mpm_event
	sudo a2enmod mpm_prefork
	sudo systemctl restart apache2.service
fi

sudo cat > /etc/apache2/mods-available/mpm_prefork.conf <<EOF
<IfModule mpm_prefork_module>
          StartServers            20
          MinSpareServers         20
          MaxSpareServers         30
          MaxRequestWorkers       20
          MaxConnectionsPerChild  500
</IfModule>
EOF

sudo systemctl restart apache2.service

sudo cp /vagrant/configServer/scripts/apache/apache2.conf /etc/apache2/
sudo cp /vagrant/configServer/scripts/apache/site.conf /etc/apache2/sites-available/
sudo cp /vagrant/configServer/scripts/apache/site-ssl.conf /etc/apache2/sites-available/
sudo a2dissite 000-default.conf
sudo a2dissite default-ssl.conf
sudo a2ensite site.conf
sudo a2ensite site-ssl.conf
sudo systemctl reload apache2.service

