# sudo pacman -S fish fisher
# fisher install pure-fish/pure

# set -g pure_color_primary green

alias edit-cfg="vim ~/.config/fish/config.fish"
alias load-cfg="source ~/.config/fish/config.fish"
alias vim="vim -p"
alias vi="vim -p"
alias thisbranch="git branch --show-current"
alias remake="make clean && make"
alias modified="git status|grep modified|sed 's/\(\s*modified:\s*\)\(.*\)/\2/'"
