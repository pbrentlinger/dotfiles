#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Add ~/.local/bin to PATH if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add to path if ruby exists
if [ -d "$HOME/.local/share/gem/ruby/3.3.0/bin" ] ; then
    PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
fi

alias dotfiles='/usr/bin/git --git-dir=/home/patrick/.dotfiles/ --work-tree=/home/patrick'
eval "$(zoxide init bash)"
. "$HOME/.cargo/env"
