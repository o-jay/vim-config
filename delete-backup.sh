#!/bin/bash

# Simple shell script to remove the backup created by running copy-to-system.sh
# by Ollie Etherington

RCBACKUP=~/.vimrc-backup
DIRBACKUP=~/.vim-backup

read -p "Are you sure you want to remove the backup? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rm -rf $RCBACKUP $DIRBACKUP
	echo
	echo Removed backup
else
	echo
	echo Cancelled removing backup
fi
