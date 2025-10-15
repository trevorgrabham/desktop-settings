# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes go if it exists
if [ -d "/usr/local/go" ] ; then
    PATH="/usr/local/go/bin:$PATH"
fi
# also add my local go binaries (where go downloads bin files to)
if [ -d "$HOME/go/bin" ];then
    PATH="$HOME/go/bin:$PATH"
fi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# cleanup $PATH 
PATH=$(printf "%s" "$PATH" | awk -v RS=: '!seen[$0]++' | paste -sd:)

# set default editors
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim
