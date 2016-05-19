#!/bin/bash

# Simple shell script to grab .vimrc and .vim from the system and update the
# repository

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
echo "Updating vim config from system..."

# Get rc if it exists
if [ -f $RC ];
then
	rm -rf $LOCALRC
	cp $RC $LOCALRC
	echo -e "${GREEN}Updated $LOCALRC from system file ${RC}${NC}"
else
	echo -e "${RED}${RC} not found - not updating local file ${LOCALRC}${NC}"
fi

# Get folder if it exists
if [ -d $DIR ];
then
	rm -rf $LOCALDIR
	cp -r $DIR $LOCALDIR
	echo -e "${GREEN}Updated ${LOCALDIR} from system dir ${DIR}${NC}"
else
	echo -e "${RED}${DIR} not found - not updating local dir ${LOCALDIR}${NC}"
fi
