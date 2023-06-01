#!/usr/bin/env bash
# ############################################################################
# # PATH: bash_scripts/Bash_LocalRC  AUTHOR: Hoefkens.J@gmail.com
# # FILE: install.sh                                   0v7 - 2023.04.26
# ############################################################################
#
INSTALLDIR="/opt/local/config/rc/"
NAME="bash"
INSTALLPATH="$INSTALLDIR/$NAME"
mkdir -p $INSTALLPATH
cp -rvf "src/" "$INSTALLPATH"
cd $INSTALLPATH
ls
unset latest INSTALLDIR NAME INSTALLPATH 
