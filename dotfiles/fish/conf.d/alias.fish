# fish shell aliases

# if eza is installed, use it
if type -q eza
    alias ls='eza --group-directories-first -lh'
    alias ll='eza --group-directories-first -lh'
    alias la='eza --group-directories-first -lah'
    alias l='eza -ah'
else
    alias ls='ls -lh'
    alias ll='ls -lh'
    alias la='ls -lah'
    alias l='ls -ah'
end

alias mkdir='mkdir -pv'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cp='cp -i'
alias mv='mv -i'

alias df='df -h'
alias du='du -h'

alias untar='tar -xvf'
alias extract='tar -xvf'
