#!/bin/bash

add-apt-repository ppa:neovim-ppa/unstable
apt-get update

apt-get install python-dev python-pip python3-dev python3-pip xsel neovim

pip2 install neovim
pip3 install neovim

update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
update-alternatives --config vi
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
update-alternatives --config vim
update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
update-alternatives --config editor

if [ ! -d "~/.config/nvim" ]; then
	./copy-to-system.sh
fi
