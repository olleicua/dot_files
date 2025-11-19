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

#source $HOME/open_source/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source $HOME/.zsh/zsh-git-prompt/zshrc.sh

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

PROMPT="
%F{green}%B$ %b%f"

RPROMPT='%(!|%F{magenta}|%F{cyan})%B%~%b%f$vcs_info_msg_0_%(0?--%F{green}%B |%b%f %F{red}%B%?%b%f)'

# NAVIGATION #

alias l="ls -lah --color"
alias tree="tree -l"
alias mkd="mkdir -pv"
alias cp="cp -rv"
alias ...="popd"

function mkcd() {
    mkdir -pv $1
    pushd $1
}

# APT #

alias sai="sudo apt install"

# FILES #

alias e="emacs"
alias ke="pkill emacs"
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
alias ack="ack-grep"
alias path="echo $PATH | tr : '\n'"
#alias ts="date -r"
alias dot="dot -Tpng"
alias clean="rm -fv *~;rm -fv .*~;rm -fv '#'*;rm -fv '.#'*;rm -fv '.~'*'#'"
alias cleana="rm -fv **/*~;rm -fv **/.*~;rm -fv **/'#'*;rm -fv **/'.#'*;rm -fv **/'.~'*'#'"
alias df="df -h"
alias vpn="mozillavpn"

# DIVINATION #

function sample() {
  ruby -e"p %i[$*].sample"
}
alias tdr="$HOME/tarot/bin/single_draw"
alias tsp="$HOME/tarot/bin/spread"

# RAILS #

alias routes-grep="bundle exec rake routes | grep"

function gen-migration() {
    bundle exec rails g migration $* | ruby -e 'qq = STDIN.read; puts qq; exec "cat #{qq.strip.split(/\s+/).last}"'
}

# DEV #

alias g=git
alias ez="emacs ~/.zshrc"
alias z=". ~/.zshrc"
alias rand="ruby -e'p rand ARGV[0].to_i'"
alias svn="echo '... really..?' #"
alias serve="python3 -m http.server"

# TMUX #

#source ~/.bin/tmuxinator.zsh

#if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
#  tmuxinator start panorama
#fi

