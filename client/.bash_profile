#!/bin/bash
clear

figlet "$(hostname)" | lolcat -f

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

export XDG_CONFIG_HOME="$HOME"/.config
. "$HOME/.cargo/env"
