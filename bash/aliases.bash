# vim: ft=sh

# ls aliases
alias sl='ls'
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -a'
alias lal='ls -la'

alias gti='git'

# enable color support of ls and redefine aliases if able
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls -F --color=auto'
    # alias ll='ls -lh'
    # alias la='ls -A'
    # alias lal='ls -lhA'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias c=clear
alias ud='cd ~/.dotfiles && git pull'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

function findport() {
    lsof -n -i4TCP:"$1" | grep LISTEN
}

function killport() {
    kill -9 $(findport "$1" | tr -s ' ' | cut -d' ' -f2)
}

# macos quicklook from the terminal
alias ql="qlmanage -p ${@} > /dev/null 2> /dev/null"

function unescapewhitespace() {
	gsed 's|\\n|\
|g' | gsed 's|\\t|\t|g'
}

function returnwith() {
    return $1
}

function splitlines() {
    if [ -z "$1" ]
    then
        echo "usage: splitlines [delimiter]"
        return 1
    fi

    # https://stackoverflow.com/a/918931
    while IFS="$1" read -ra LINES; do
        for i in "${LINES[@]}"; do
            echo $i
        done
    done
}

alias pbpastehtml="osascript -e 'the clipboard as «class HTML»' | perl -ne 'print chr foreach unpack(\"C*\",pack(\"H*\",substr(\$_,11,-3)))'"
