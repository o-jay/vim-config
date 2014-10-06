#!/bin/bash

# Simple shell script to reinstate the system backup created by running
# copy-to-system.sh by Ollie Etherington

RCBACKUP=~/.vimrc-backup
DIRBACKUP=~/.vim-backup
RC=~/.vimrc
DIR=~/.vim

read -p "Are you sure you want to reinstate the backup? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo

	rm -rf $RC $DIR

	if [ -f $RCBACKUP ]
	then
		mv $RCBACKUP $RC
		echo Reinstated $RC
	else
		echo $RCBACKUP not found
	fi

	if [ -d $DIRBACKUP ]
	then
		mv $DIRBACKUP $DIR
		echo Reinstated $DIR
	else
		echo $DIRBACKUP not found
	fi
else
	echo
	echo Cancelled reinstating backup
fi
