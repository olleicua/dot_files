# OPTIONS #

setopt autocd
setopt autopushd
setopt cdablevars
setopt globdots
setopt histignoredups
setopt histignorespace
setopt interactivecomments
setopt extended_glob
setopt rmstarsilent
unsetopt case_glob
setopt null_glob

#bindkey "^?" backward-delete-char
#bindkey "^[[3~" delete-char

# PROMPT #

autoload -U promptinit
promptinit

source ~/.zsh/zsh-git-prompt/zshrc.sh

PROMPT='
%(!|%F{magenta}|%F{cyan})%B%~%b%f %F{green}|%f $(git_super_status) %F{green}|%f %F{cyan}%B%* %w%b%f %(0?--%F{green}%B|%b%f %F{red}%B%?%b%f )%F{green}|%f %F{cyan}%B%m%b%f
%F{green}%B$ %b%f'

RPROMPT=''
#RPROMPT='%(!|%F{magenta}|%F{cyan})%B%~%b%f %F{green}|%f $(git_super_status) %F{green}|%f %F{cyan}%B%* %w%b%f %(0?--%F{green}%B|%b%f %F{red}%B%?%b%f )%F{green}|%f %F{cyan}%B%m%b%f'

# NAVIGATION #

#alias l="ls -lahOGF"
alias la="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias tree="tree -l"
alias mkd="mkdir -pv"
alias ...="popd"
alias cp="cp -rv"
alias mv="mv -v"
alias dir="open ./"
alias kl="clear;ls -lahG"

function ls-grep-count() {
    ls -laF
}

function l() {
    ls -lahOGFo $* &&
    echo "\n"$(($(ls -la $* | wc -l) - 3)) items '('d:$(($(ls -laF $* | grep '\/$' | wc -l) - 2)) x:$(($(ls -laF $* | grep '\*$' | wc -l) * 1)) s:$(($(ls -laF $* | grep '@ ->' | wc -l) * 1))')';
}

function mkcd() {
    mkd $1;
    cd $1;
}

# FILES #

alias t="touch"
alias o="open"
alias ql="qlmanage -p"
alias wl="web_look"
alias unpack-tar="tar xvf"
alias pack-tar="tar zcvf"

# APPLICATIONS #

alias ps="ps -A"
alias g=git
alias e="emacs -nw"

# MISC #

function c() {
    cc $1.c -o $1 && ./$1
}

alias rmdow="rm -rfv $HOME/Downloads/*"

alias path="echo $PATH | tr : '\n'"
alias ts="date -r"
alias beep="osascript -e 'beep 3'"
alias dot="dot -Tpng"
alias serve="sudo python -m SimpleHTTPServer 80"
#alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"
alias clean="rm -fv *~;rm -fv .*~;rm -fv '#'*;rm -fv '.#'*;rm -fv '.~'*'#'"
alias cleana="rm -fv **/*~;rm -fv **/.*~;rm -fv **/'#'*;rm -fv **/'.#'*;rm -fv **/'.~'*'#'"
alias empty-trash="setopt rmstarsilent;rm -rfv ~/.Trash/*;unsetopt rmstarsilent"

function cl() {
    pushd $1; cleana; popd
}

function rd() {
    setopt rmstarsilent
    for i
    do rm -rfv $i
    done
    unsetopt rmstarsilent
}

# MUSIC #

alias wmbr="mpv http://wmbr.org:8000/hi"
alias pynk="mpv $HOME/Music/Dirty\ Computer\ Explicit/07*"

MUSIC=$HOME/Music/shared

function music() {
    mplayer $MUSIC/**/*"$*"*/**/* -shuffle
}

function song() {
    mplayer $MUSIC/**/*"$*"* -shuffle
}

function sing() {
    if [[ -z $1 ]]; then
        mplayer $MUSIC/**/* -shuffle
    else
        mplayer $MUSIC/**/*"$*"*/**/* $MUSIC/**/*"$*"* -shuffle
    fi
}

function loop() {
    mplayer $MUSIC/**/*"$*"*/**/* $MUSIC/**/*"$*"* -loop 0
}

function songs() {
    for file in $MUSIC/**/*"$*"*/**/* $MUSIC/**/*"$*"*
    do
        if [[ -f $file ]]; then
            echo $file
        fi
    done
}

function sing-l() {
    ls $MUSIC/**/*"$*"*/**/* $MUSIC/**/*"$*"*
}

alias mp=mpv

# DEV #

alias df="df -h"
alias rspec="bundle exec rspec"
alias guard="GUARD_ONLY_RSPEC=1 doppler run bundle exec guard"
alias dj="python manage.py"
alias djadmin="django-admin"
alias ez="emacs -nw $HOME/.zshrc"
alias az="atom $HOME/.zshrc"
alias z=". $HOME/.zshrc"
alias android="~/dev/android-sdk-macosx/tools/android &"
alias rand="ruby -e'p rand ARGV[0].to_i'"
alias svn="echo '... really..?' #"
alias ps-grep="ps -A | grep"
#alias hcl="node $HOME/Dropbox/School/Plan/hcl/bin/hcl"

alias pick-reviewer="ruby -e'p %i[g dave weldys traci seth christian annabel hanna].sample'"

we() {
    which $1;
    eval "$@";
}

# RAILS

alias routes-grep="bundle exec rake routes | grep"

function gen-migration() {
    dopr generate migration $* | ruby -e 'qq = STDIN.read; puts qq; exec "cat #{qq.strip.split(/\s+/).last}"'
}

function single-test() {
    bin/rake test TEST=$1 --verbose
}

#export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

# SYNTAX HIGHLIGHTING #

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# BIN

PATH=/usr/local/git/bin:/opt/homebrew/opt:/opt/homebrew/bin:$PATH:~/.gem/ruby/2.6.0/bin:/Users/sam/.gem/ruby/2.5.0/bin:/Users/sam/.gem/ruby/2.7.0/bin:$HOME/bin

# ROSETTA

alias rbrew='/usr/local/bin/brew'
alias aaz='arch -arm64 zsh'

# FUN

alias pray="coffee $HOME/Play/immortal.js.coffee"
#alias flake="/Users/olleicua/.rvm/rubies/ruby-2.0.0-p643/bin/ruby $HOME/Play/flake/flake.rb"
#alias measure-flakiness="/Users/olleicua/.rvm/rubies/ruby-2.0.0-p643/bin/ruby $HOME/Play/flake/measure_flakiness.rb"

# NODE / RVM things..

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#npm config delete prefix
#npm config delete prefix

# GIT #

alias check-for-emacs-artifacts="git diff --no-commit-id --name-only --staged | grep '[*#]' | ruby -e 'ARGF.read.strip.size>0 && raise(\"emacs artifacts staged\")'"

#source ~/.zsh/git-flow-completion.zsh

# TMUX #

# alias side="tmux split-window -h -l 50"
# alias hud="tmux split-window -v -l 30"

export PATH="$HOME/.yarn/bin:$PATH"


# RBENV

# eval "$(/opt/homebrew/bin/brew shellenv)"
# eval "$(rbenv init -)"

# run servers
alias startpg="brew services start postgresql"
#alias uapi="pushd ~/user-api && bin/rails s --port=3002"
alias capi="pushd ~/charity-api  && doppler run -- heroku local -f Procfile.dev"
alias caping="pushd ~/charity-api  && doppler run -c dev_ngrok -- heroku local -f Procfile.dev"

alias dop="doppler run -- "
alias dopr="dop bundle exec rails "

alias dopng="doppler run -c dev_ngrok -- "
alias doprng="dopng bundle exec rails "

alias ng="ngrok http --hostname=gl.ngrok.io secure.localhost:3001"

alias yicf="yarn install --check-files"

export EDITOR='emacs -nw'

# RSPEC

export RUBYOPT='-W0'
alias rs="NO_PRECOMPILE_BEFORE_SYSTEM_SPEC=true dop bundle exec rspec"
alias rsfl="NO_PRECOMPILE_BEFORE_SYSTEM_SPEC=true dop bundle exec rspec --tag flaky"
alias rsff="NO_PRECOMPILE_BEFORE_SYSTEM_SPEC=true dop bundle exec rspec --fail-fast"
alias crs="dop bundle exec rspec"
alias crsfl="dop bundle exec rspec --tag flaky"
alias crsff="dop bundle exec rspec --fail-fast"

# HEROKU

alias staging="heroku run -a charity-api-staging"
alias stagingc="staging rails c"
alias prod="heroku run -a charity-api"
alias prodc="prod rails c"
alias sandbox="heroku run -a charity-api-sandbox"
alias sandboxc="sandbox rails c"
export PATH="$HOME/.rbenv/bin:$PATH"

# GL BIN

alias lt="./bin/lint"
alias lb="./bin/lint --branch"

# eval "$(rbenv init - zsh)"

###-begin-envkey-completions-###
#
# yargs command completion script
#
# Installation: usr/local/bin/envkey completion >> ~/.zshrc
#    or usr/local/bin/envkey completion >> ~/.zsh_profile on OSX.
#
_envkey_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" usr/local/bin/envkey --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
#compdef _envkey_yargs_completions envkey
###-end-envkey-completions-###


export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include"

# RESET CAMERA
alias reset-camera="sudo killall VDCAssistant"

# RBENV
eval "$(rbenv init - zsh)"
