#!/bin/sh

case "${OSTYPE}" in
freebsd*|darwin*)
	brew install autojump
    ;;
linux*)
    cd ${HOME}/local/src/github.com && git clone https://github.com/joelthelion/autojump.git && cd autojump $$ ./install.py
    ;;
esac
