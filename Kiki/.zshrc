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

source ~/.zsh/git-prompt/zshrc.sh

PROMPT='
%F{green}%B$ %b%f'

RPROMPT='$(git_super_status)%(!|%F{magenta}|%F{cyan})%B%1~%b%f %F{green}|%f %F{cyan}%B%* %w%b%f %(0?--%F{green}%B|%b%f %F{red}%B%?%b%f )%F{green}|%f %F{cyan}%B%m%b%f'

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
alias a="atom"

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

# GIT #

#source ~/git-completion.bash
alias glp="git log --pretty=format:\"%an <%ae>
  %ar
  %s
\""

# RAILS

alias routes-grep="bundle exec rake routes | grep"

function gen-migration() {
    bundle exec rails g migration $* | ruby -e 'qq = STDIN.read; puts qq; exec "cat #{qq.strip.split(/\s+/).last}"'
}

function single-test() {
    bin/rake test TEST=$1 --verbose
}

#export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

# SYNTAX HIGHLIGHTING #

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# BIN

PATH=$PATH:$HOME/bin # Add RVM to PATH for scripting

# JARVIS DEV

alias ems="ember serve --live-reload-port 49153"
alias emt="ember test --serve --filter"
alias noc="OVERCOMMIT_DISABLE=1"

eval "$(rbenv init -)"

function gr() {
    grip $1 & sleep 1 && open http://127.0.0.1:6419 && fg
}

# FUN

alias pray="coffee $HOME/Play/immortal.js.coffee"
alias flake="/Users/olleicua/.rvm/rubies/ruby-2.0.0-p643/bin/ruby $HOME/Play/flake/flake.rb"
alias measure-flakiness="/Users/olleicua/.rvm/rubies/ruby-2.0.0-p643/bin/ruby $HOME/Play/flake/measure_flakiness.rb"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
