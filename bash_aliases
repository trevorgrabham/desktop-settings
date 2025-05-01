# neovim aliases
alias nvi="nvim" 
alias snvi="sudo -E HOME=$HOME nvim"

# super user aliases
alias xable="sudo chmod +x"
alias smv="sudo mv"

# common task aliases
alias ebrc="nvim ~/.bashrc"
alias sbrc="source ~/.bashrc"
alias ealias="nvim ~/.bash_aliases"

alias usertimers="systemctl --user list-timers"
alias userservicelogs="journalctl --user -u"
alias userrestartsysd="systemctl --user daemon-reexec && systemctl --user daemon-reload"
alias userenablesysd="systemctl --user enable --now"

alias shist="history_search"

alias sapti="apt_install_and_log"
