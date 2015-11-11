#!/bin/sh

case "${OSTYPE}" in
freebsd*|darwin*)
	brew install peco
    ;;
linux*)
    echo "To install peco, goto https://github.com/peco/peco/releases";
    ;;
esac
