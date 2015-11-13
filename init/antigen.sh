#!/bin/sh

cd ${HOME}/local/src/github.com && mkdir -p zsh-users && cd zsh-users && git clone https://github.com/zsh-users/antigen.git && sudo make install
