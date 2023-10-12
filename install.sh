#!/usr/bin/env bash
# ############################################################################
# # PATH: bash_scripts/bash_LocalRC        AUTHOR: Hoefkens.J@gmail.com
# # FILE: install.sh                                   0v7 - 2023.04.26
# ############################################################################
#
PROJECT="bash_LocalRC"
INSTALLDIR="/opt/local/config/rc/bash"
mkdir -p $INSTALLDIR
cp -v "$PWD/src/bash_LocalRC/"* $INSTALLDIR
sudo touch "/etc/bash/bashrc.d/localRC"
sudo chmod 777 "/etc/bash/bashrc.d/localRC"
echo "sourcepath  $INSTALLDIR" >> "/etc/bash/bashrc.d/localRC"
source "/etc/bash/bashrc.d/localRC"
