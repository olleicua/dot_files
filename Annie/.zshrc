# OPTIONS #

setopt autocd
setopt autopushd
setopt cdablevars
setopt globdots
setopt histignoredups
setopt histignorespace
setopt interactivecomments
setopt extended_glob
unsetopt case_glob
setopt null_glob
setopt completeinword

#bindkey "^?" backward-delete-char
#bindkey "^[[3~" delete-char

# PROMPT #

autoload -U promptinit
promptinit

#function battery_charge {
#    echo `battery` 2>/dev/null
#}

source ~/.zsh/git-prompt/zshrc.sh

prompt_files() {
    ruby ~/.zsh/files.rb
}

prompt_battery() {
    ruby ~/.zsh/battery.rb
}

autoload -U colors && colors

PROMPT='%F{blue}┍┅
┕╸%f%{$bg[black]%}%F{blue}▏%F{green}%B%(!|#|$)%b%f%{$bg[black]%}%F{blue}▕%f%{$reset_color%}%F{blue}╺%f '

RPROMPT='%F{blue}╸%{$bg[black]%}▏%{$bg[black]%}$(git_super_status)%(!|%F{magenta}|%F{cyan}) %B%1~ %b%F{blue}%{$bg[black]%}│ %F{cyan}%B%T %b%(0?--%F{blue}%{$bg[black]%}│ %F{red}%B%? %b)%F{blue}%{$bg[black]%}│$(prompt_files)$(prompt_battery)%F{cyan}%B%m%b%F{blue}%{$bg[black]%}▕%{$reset_color%}%F{blue}╺┅%f'

# NAVIGATION #

alias s="cd ~/Dropbox/School"
alias p="cd ~/Play"
alias wo="cd ~/Work"
alias dow="cd ~/Downloads"
alias l="ls -lah --color"
alias tree="tree -l"
alias mkd="mkdir -pv"
alias mv="mv -v"
alias cp="cp -rv"
alias ...="popd"
alias diff="colordiff"

# FILES #

alias m="less"
alias e="emacs"
alias t="touch"
alias unpack-tar="tar xvf"
alias pack-tar="tar zcvf"

# SERVERS #

export JACK="olleicua@Jack.local"
alias jack="ssh -Y $JACK"
alias sam="ssh olleicua@samauciello.com"
export CS="sam@cs.marlboro.edu"
alias cs="ssh -Y $CS"
alias nfs="nfs_ssh"
alias mtemp="ssh sam@sam.marlboro.edu"
alias bb="ssh sam@cs2.marlboro.edu"
alias pride="ssh sam@pride.marlboro.edu"
alias zaphod="ssh sam@10.1.4.16"
export CSM="sam@csmarlboro.org"
alias csm="ssh $CSM"
export LIN="olleicua@li289-200.members.linode.com"
alias lin="ssh $LIN"
export SCI="sam@sci.marlboro.edu"
alias sci="ssh $SCI"
export RUBY4="sauciello@ruby4.ec2.greenriver.org"
alias r4="ssh $RUBY4"
export RUBY3="ubuntu@ruby3.ec2.greenriver.org"
alias r3="ssh $RUBY3"
alias r4t="ssh -L 3000:localhost:3000 $RUBY4"
export PHP1="ubuntu@php1.ec2.greenriver.org"
alias php1="ssh $PHP1"
export PHP2="olleicua@php2.greenriver.org"
alias php2="ssh $PHP2"
export PTN_PROD="ec2-user@goputney.com"
alias ptn_prod="ssh $PTN_PROD"
export BIDA="root@162.243.12.162"
alias bida="ssh $BIDA"

# APPLICATIONS #

function music() {
    mplayer $HOME/Music/**/*"$*"*/**/* -shuffle
}

function song() {
    mplayer $HOME/Music/**/*"$*"* -shuffle
}

function sing() {
    if [[ -z $1 ]]; then
        mplayer $HOME/Music/**/* -shuffle
    else
        mplayer $HOME/Music/**/*"$*"*/**/* $HOME/Music/**/*"$*"* -shuffle
    fi
}

function loop() {
    mplayer $HOME/Music/**/*"$*"*/**/* $HOME/Music/**/*"$*"* -loop 0
}

function songs() {
    for file in $HOME/Music/**/*"$*"*/**/* $HOME/Music/**/*"$*"*
    do
        if [[ -f $file ]]; then
            echo $file
        fi
    done
}

function sing-l() {
    ls $HOME/Music/**/*"$*"*/**/* $HOME/Music/**/*"$*"*
}

alias mp="mplayer"
alias apti="sudo apt-get install"
alias psa="running_apps"
alias ps="ps -A"
alias q="sudo kill"
alias pref="open /Applications/System\ Preferences.app"
alias cr='google-chrome'

alias mount-aux="sudo mount /dev/sdb1 /media/aux_drive"

# MISC #

alias server="python -m SimpleHTTPServer"
alias mbta="(cd /home/olleicua/Work/open_source/mbta_app && python -m SimpleHTTPServer)"
export EDITOR="/usr/bin/emacs"

alias ci="DEFAULT_WIDTH=115 DEFAULT_RATIO=2.5 /home/olleicua/.rvm/rubies/ruby-2.0.0-p481/bin/ruby /home/olleicua/Play/cli_image/display.rb"
alias caca="CACA_GEOMETRY=235x64 mplayer -vo caca"
alias mute="v 0"
alias solr-start="bundle exec rake sunspot:solr:start"
alias ps-grep="ps aux | grep"
alias routes-grep="bundle exec rake routes | grep"
alias rake="TERM=xterm-256color rake"

function test-file() {
    time TERM=xterm-256color rake TEST=$1
}

alias ack="ack-grep"
alias of="file_count"
alias lsi="lsof -i"
alias path="echo $PATH | tr : '\n'"
alias ts="date -r"
alias clisp="clisp -ansi -I -q -q"
alias dot="dot -Tpng"
alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"
alias clean="rm -fv *~;rm -fv .*~;rm -fv '#'*;rm -fv '.#'*;rm -fv '.~'*'#'"
alias cleana="rm -fv **/*~;rm -fv **/.*~;rm -fv **/'#'*;rm -fv **/'.#'*;rm -fv **/'.~'*'#'"

# Screen layouts

alias vs="~/.screenlayout/work-2-monitors.sh"
alias home="~/.screenlayout/home-2-monitors.sh"
alias lap="~/.screenlayout/laptop.sh"

function rd() {
    setopt rmstarsilent
    for i
    do rm -rfv $i
    done
    unsetopt rmstarsilent
}

function run() {
    for x in $2
    do echo $x
        $1 $x
    done
}

function d() {
    "$@" &>/dev/null &!
}

# DEV #

alias howdoi="howdoi -c"

alias hcl-dev="~/Dropbox/School/Plan/hcl/bin/hcl"
alias rspec="bundle exec rspec"
alias dj="python manage.py"
alias djadmin="django-admin"
alias ez="emacs ~/.zshrc"
alias z=". ~/.zshrc"
alias rand="ruby -e'p rand ARGV[0].to_i'"
alias svn="echo '... really..?' #"
#alias hcl="node $HOME/Dropbox/School/Plan/hcl/bin/hcl"

# GIT #

#source ~/git-completion.bash
alias glp="git log --pretty=format:\"%an <%ae>
  %ar
  %s
\""

# SYNTAX HIGHLIGHTING #

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# RVM

alias rakedb='rake db:migrate; rake db:migrate:redo; rake db:test:prepare'

# HASKELL

PATH=$HOME/.cabal/bin:$PATH

# FUN

alias free-cell="node ~/Play/FreeCell/game.js"

# GTK
PATH=$PATH:$HOME/.local/bin

alias b='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

. /etc/zsh_command_not_found
source ~/.fzf.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
