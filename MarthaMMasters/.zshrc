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

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/git-prompt/zshrc.sh

PROMPT="
%F{green}%B$ %b%f"

RPROMPT='%(!|%F{magenta}|%F{cyan})%B%1~%b%f$(git_super_status)%(0?--%F{red} %?!%f)'
#RPROMPT='%(!|%F{magenta}|%F{cyan})%B%1~%b%f%(0?--%F{green}%B |%b%f %F{red}%B%?%b%f)'

# NAVIGATION #

alias l="ls -lahgG --color"
alias tree="tree -l"
alias mkd="mkdir -pv"
alias cp="cp -rv"
alias ...="popd"

function mkcd() {
    mkdir -pv $1
    pushd $1
}

# FILES #

alias e="emacs -nw"
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

export LESSCHARSET="UTF-8"
#export LANG=en_US.UTF-8

alias ps-grep="ps aux | grep"
alias ack="ack-grep"
alias path="echo $PATH | tr : '\n'"
#alias ts="date -r"
alias dot="dot -Tpng"
alias clean="rm -fv *~;rm -fv .*~;rm -fv '#'*;rm -fv '.#'*;rm -fv '.~'*'#'"
alias cleana="rm -fv **/*~;rm -fv **/.*~;rm -fv **/'#'*;rm -fv **/'.#'*;rm -fv **/'.~'*'#'"

alias apti="sudo apt-get install"

# RAILS #

alias routes-grep="bundle exec rake routes | grep"

function gen-migration() {
    bundle exec rails g migration $* | ruby -e 'qq = STDIN.read; puts qq; exec "cat #{qq.strip.split(/\s+/).last}"'
}

# DEV #

alias g=git
alias ez="emacs -nw ~/.zshrc"
alias eg="emacs -nw ~/.gitconfig"
alias z=". ~/.zshrc"
alias rand="ruby -e'p rand ARGV[0].to_i'"
alias svn="echo '... really..?' #"

### Added by the Heroku Toolbelt                                                                                                                       
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


export PATH="$PATH:$HOME/bin"
