#!/bin/bash

# Simple shell script to copy the local vimrc and vim directory to the system
# by Ollie Etherington

# File names
LOCALRC=vimrc
LOCALDIR=vim
RC=~/.vimrc
DIR=~/.vim

# Colors
RED="\e[0;31m"
GREEN="\e[0;32m"
NC="\e[0m" # No Color

# Opening message
echo Copying Vim config to the system...

# If a config is already found on the system, prompt the user if they wish to
# save it as a backup
if [ -f $RC -o -d $DIR ]
then
	read -p "A Vim config was already found on the system - do you wish to save a backup? " -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo
		echo Saving a backup
		mv $RC $RC-backup
		mv $DIR $DIR-backup
	else
		echo
		echo Clobbering system config
		rm -rf $RC $DIR
	fi
fi

# Copy the local version to the system
cp $LOCALRC $RC
cp -r $LOCALDIR $DIR

# We're done
echo Copied local files to system
