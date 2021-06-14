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

#source ~/.zsh/git-prompt/zshrc.sh

PROMPT='
%F{green}%B$ %b%f'

RPROMPT='%1~|%*|%w|ezri'

# NAVIGATION #

#alias l="ls -lahOGF"
alias l="ls -la"
alias tree="tree -l"
alias mkd="mkdir -pv"
alias ...="popd"
alias cp="cp -rv"
alias mv="mv -v"
alias dir="open ./"

function ls-grep-count() {
    ls -laF
}

function mkcd() {
    mkd $1;
    cd $1;
}

# FILES #

alias t="touch"
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

alias path="echo $PATH | tr : '\n'"
alias ts="date -r"
alias dot="dot -Tpng"
alias serve="sudo python -m SimpleHTTPServer 80"
alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"
alias clean="rm -fv *~;rm -fv .*~;rm -fv '#'*;rm -fv '.#'*;rm -fv '.~'*'#'"
alias cleana="rm -fv **/*~;rm -fv **/.*~;rm -fv **/'#'*;rm -fv **/'.#'*;rm -fv **/'.~'*'#'"
alias empty-trash="setopt rmstarsilent;rm -rfv ~/.Trash/*;unsetopt rmstarsilent"

function rd() {
    setopt rmstarsilent
    for i
    do rm -rfv $i
    done
    unsetopt rmstarsilent
}

# MUSIC #

alias wmbr="mplayer http://wmbr.org:8000/hi"
alias pynk="mplayer $HOME/Music/Dirty\ Computer\ Explicit/07*"

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

alias mp=mplayer

# DEV #

alias df="df -h"
alias rspec="bundle exec rspec"
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

we() {
    which $1;
    eval "$@";
}

# RAILS

alias routes-grep="bundle exec rake routes | grep"

function gen-migration() {
    bundle exec rails g migration $* | ruby -e 'qq = STDIN.read; puts qq; exec "cat #{qq.strip.split(/\s+/).last}"'
}

function single-test() {
    bin/rake test TEST=$1 --verbose
}

#export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

# BIN

PATH=$PATH:$HOME/bin # Add RVM to PATH for scripting

# FUN

alias pray="coffee $HOME/Play/immortal.js.coffee"9
alias flake="/Users/olleicua/.rvm/rubies/ruby-2.0.0-p643/bin/ruby $HOME/Play/flake/flake.rb"
alias measure-flakiness="/Users/olleicua/.rvm/rubies/ruby-2.0.0-p643/bin/ruby $HOME/Play/flake/measure_flakiness.rb"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#npm config delete prefix
#npm config delete prefix

# TMUX #

alias side="tmux split-window -h -l 50"
alias hud="tmux split-window -v -l 30"

export PATH="$HOME/.yarn/bin:$PATH"
