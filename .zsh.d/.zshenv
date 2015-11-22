### vim:ft=zsh

#---------------------------------------
# Language Setting
#---------------------------------------
export LANG=ja_JP.UTF-8

### PATH
## default PATH
path=(
    # user setting
    ~/local/bin(N-/)

    # Linux
    {/usr/local,/usr,}{/sbin,/bin}(N-/)

    # optional
    /usr/local/go/bin(N-/)             # for go.
    /usr/local/opt/go/libexec/bin(N-/) # for brewed go.
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

## EDITOR setting
export EDITOR=vim
if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi
