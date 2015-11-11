### vim:ft=zsh fenc=utf-8

#---------------------------------------
# Language Setting
#---------------------------------------
export LANG=ja_JP.UTF-8

### PATH
## default PATH
path=(
	# user setting
	~/local/bin(N-/)
    # Solaris
    /opt/{csw,sfw}/bin(N-/)
    # Linux
    {/usr/local,/usr,}{/sbin,/bin}(N-/)
)

typeset -gxU path
## manpath
manpath=(
	# user setting
    ~/dotfiles/man(N-/)
    # Solaris
    /opt/{csw,sfw}/share/man(N-/)
    # Linux
    {/usr,/usr/local}/share/man(N-/)
)
typeset -gxU manpathA

### EDITOR setting
export EDITOR=vim
if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi

