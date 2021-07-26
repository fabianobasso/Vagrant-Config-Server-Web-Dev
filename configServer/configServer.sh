#!/bin/bash - 
#===============================================================================
#
#          FILE: InstallServerLAMP.sh
# 
#         USAGE: ./InstallServerLAMP.sh 
# 
#   DESCRIPTION: Configurar um servidor LAMP (Linux: Ubunto 20.04, Apache, MariaDB, PHP 8)
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Fabiano Basso (fabiano.basso.dev@gmail.com), 
#  ORGANIZATION: 
#       CREATED: 28/05/2021 21:40
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

SLEEPTIME=10
echo "<< Atualizando Sistema >>"
sleep $SLEEPTIME
source /vagrant/configServer/scripts/update-system.sh

echo "<< Instalando e Configurando Apache >>"
sleep $SLEEPTIME
source /vagrant/configServer/scripts/install-apache2.sh

echo "<< Configurar Certificado SSL >>"
sleep $SLEEPTIME
source /vagrant/configServer/scripts/config-openSSL.sh

echo "<< Instalando PHP 8 >>"
sleep $SLEEPTIME
source /vagrant/configServer/scripts/install-php-8.sh

