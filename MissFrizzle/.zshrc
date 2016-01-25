# OPTIONS #

setopt autocd
setopt autopushd
setopt cdablevars
setopt globdots
setopt histignoredups
setopt histignorespace
setopt interactivecomments
setopt extended_glob
unsetopt CASE_GLOB
setopt completeinword

# PROMPTS #

source $HOME/open_source/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/open_source/zsh-git-prompt/zshrc.sh

PROMPT='
%F{green}%B$ %b%f'

RPROMPT='%(!|%F{magenta}|%F{cyan})%B%1~%b%f$(git_super_status)%(0?--%F{green}%B |%b%f %F{red}%B%?%b%f)'

# NAVIGATION #

alias l="ls -lahG"
alias tree="tree -l"
alias mkd="mkdir -pv"
alias cp="cp -rv"
alias ...="popd"
alias diff="colordiff"

function mkcd() {
    mkdir -pv $1
    pushd $1
}

# FILES #

alias e="emacs"
alias t="touch"
export EDITOR="/usr/bin/emacs"

function rd() {
    setopt rmstarsilent
    for i
    do rm -rfv $i
    done
    unsetopt rmstarsilent
}

# MISC #

alias ps-grep="ps aux | grep"
alias routes-grep="bundle exec rake routes | grep"
#alias ack="ack-grep -a"
alias path="echo $PATH | tr : '\n'"
#alias ts="date -r"
alias dot="dot -Tpng"
alias clean="rm -fv *~;rm -fv .*~;rm -fv '#'*;rm -fv '.#'*;rm -fv '.~'*'#'"
alias cleana="rm -fv **/*~;rm -fv **/.*~;rm -fv **/'#'*;rm -fv **/'.#'*;rm -fv **/'.~'*'#'"

# DEV #

alias ez="emacs ~/.zshrc"
alias z=". ~/.zshrc"
alias rand="ruby -e'p rand ARGV[0].to_i'"
alias svn="echo '... really..?' #"


# MISC #

alias free-cell="hcl -nu $HOME/open_source/FreeCell/game.hcl"

# SSH KEYS #

export BITBUCKET_SSH_PRIVATE_KEY=$HOME/.ssh/id_rsa
export HEROKU_SSH_PRIVATE_KEY=$HOME/.ssh/id_rsa


# PANORAMA HENCHMAN

export PANORAMA_TOP=$HOME/repos
source $PANORAMA_TOP/henchman/bin/shell_includes.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source /usr/local/opt/chruby/share/chruby/chruby.sh
