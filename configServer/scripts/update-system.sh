#!/bin/bash - 
#===============================================================================
#
#          FILE: updateSystem.sh
# 
#         USAGE: ./updateSystem.sh 
# 
#   DESCRIPTION: updating the system
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Fabiano Basso (fabiano.basso.dev@gmail.com),
#  ORGANIZATION: 
#       CREATED: 03/06/2021 19:19
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

sudo apt-get update
sudo apt-get upgrade -y
