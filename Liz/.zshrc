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

PROMPT="
%F{green}%B$ %b%f"

RPROMPT='%(!|%F{magenta}|%F{cyan})%B%1~%b%f$(git_super_status)%(0?--%F{green}%B |%b%f %F{red}%B%?%b%f)'

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
alias ack="ack-grep"
alias path="echo $PATH | tr : '\n'"
#alias ts="date -r"
alias dot="dot -Tpng"
alias clean="rm -fv *~;rm -fv .*~;rm -fv '#'*;rm -fv '.#'*;rm -fv '.~'*'#'"
alias cleana="rm -fv **/*~;rm -fv **/.*~;rm -fv **/'#'*;rm -fv **/'.#'*;rm -fv **/'.~'*'#'"

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

### Added by the Heroku Toolbelt                                                                                                                       
export PATH="/usr/local/heroku/bin:$PATH"

# PANORAMA TOOLS #
[[ -s $HOME/panorama_environment.sh ]] && source $HOME/panorama_environment.sh
. /etc/profile
export NEW_SURVEYS_BASE_URL="http://surveys.panlocal.me:3000"
export SURVEYS_API_TOKEN="surveys-api-secret-sshhhhh"

# for better_errors
export TRUSTED_IP="10.0.2.2"
export USE_PRY=true

# TMUX #

source ~/.bin/tmuxinator.zsh

if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
  tmuxinator start panorama
fi
