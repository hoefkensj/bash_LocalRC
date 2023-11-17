#!/usr/bin/env bash
# ############################################################################
# # PATH: bash_scripts/bash_LocalRC        AUTHOR: Hoefkens.J@gmail.com
# # FILE: install.sh                                   0v7 - 2023.04.26
# ############################################################################
#
PROJECT="bash_LocalRC"
INSTALLDIR="/opt/local/config/rc/bash"
mkdir -p $INSTALLDIR
cp -v "$PWD/src/"* $INSTALLDIR
sudo touch "/etc/bash/bashrc.d/localRC"
sudo chmod 777 "/etc/bash/bashrc.d/localRC"
if [[ $( type -t sourcepath ) != "function" ]] ; then
	match=$(cat  "/etc/bash/bashrc.d/localRC"| rg   "sourcepath  $INSTALLDIR" )
	[[ -z "$match" ]] && echo "sourcepath  $INSTALLDIR" >> "/etc/bash/bashrc.d/localRC"
fi
source "/etc/bash/bashrc.d/localRC"
