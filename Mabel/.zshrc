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

#function battery_charge {
#    echo `battery` 2>/dev/null
#}

source ~/.zsh/git-prompt/zshrc.sh

#prompt_files() {
#	ruby ~/dev/zsh/files.rb
#}

# PROMPT='%F{magenta}╭╼╾╼━┓
# ╰%f%{$bg[black]%}%F{magenta}▏%F{green}%B%(!|#|$)%b%f%{$bg[black]%}%F{magenta}▕%f%{$reset_color%}%F{magenta}╼%f'

# RPROMPT='%F{magenta}╾%{$bg[black]%}▏%{$bg[black]%}$(git_super_status)%(!|%F{blue}|%F{cyan}) %B%1~ %b%F{magenta}%{$bg[black]%}│ %F{cyan}%B%T %b%(0?--%F{magenta}%{$bg[black]%}│ %F{red}%B%? %b)%F{magenta}%{$bg[black]%}│ $(prompt_files)%F{cyan}%B%m%b%F{magenta}%{$bg[black]%}▕%{$reset_color%}%F{magenta}╼%f'

PROMPT='
%F{green}%B$ %b%f'

RPROMPT='$(git_super_status)%(!|%F{magenta}|%F{cyan})%B%1~%b%f %F{green}|%f %F{cyan}%B%* %w%b%f %(0?--%F{green}%B|%b%f %F{red}%B%?%b%f )%F{green}|%f %F{cyan}%B%m%b%f'

# NAVIGATION #

alias s="cd ~/Dropbox/School"
alias p="cd ~/Play"
alias wo="cd ~/Work"
alias dow="cd ~/Downloads"
alias dev="cd ~/dev"
alias lib="cd ~/dev/lib"
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
    ls -lahOGF $* &&
    echo "\n"$(($(ls -la $* | wc -l) - 3)) items '('d:$(($(ls -laF $* | grep '\/$' | wc -l) - 2)) x:$(($(ls -laF $* | grep '\*$' | wc -l) * 1)) s:$(($(ls -laF $* | grep '@ ->' | wc -l) * 1))')';
}

function mkcd() {
    mkd $1;
    cd $1;
}

# FILES #

alias m="less"
alias edit="emacs"
alias e="emacs"
alias eb="edit -2"
alias t="touch"
alias sq="sqlite3"
alias py="pythonize"
alias o="open"
alias ql="qlmanage -p"
alias wl="web_look"
alias unpack-tar="tar xvf"
alias pack-tar="tar zcvf"

# SERVERS #

export EMP="olleicua@dev.empirican.com"
alias emp="ssh -A $EMP"
export DEV1="olleicua@dev1.ec2.greenriver.org"
alias dev1="ssh -A $DEV1"
alias dev1-tunnel="ssh -L 9523:localhost:9523 -Nf $DEV1"
alias dome="ssh sama@dome.local"
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
alias r4t="ssh -L 3000:localhost:3000 $RUBY4"

# APPLICATIONS #

alias psa="running_apps"
alias ps="ps -A"
alias q="sudo kill"
alias pref="open /Applications/System\ Preferences.app"
alias safari="launch_website -s"
alias chrome="launch_website -c"
alias ff3="launch_website -f3"
alias ff="launch_website -f"
alias ffdev="/Applications/Firefox.app/Contents/MacOS/firefox -profile ~/profiles/dev -no-remote &"
alias xkcd="launch_website xkcd"
alias skype="open /Applications/Skype.app"
alias earth="open /Applications/Google\ Earth.app"
alias psh="open /Volumes/Amy/Applications/Adobe Photoshop Elements 9/Adobe Photoshop Elements.app"
alias jtrh="open /Applications/DROD.app"
#alias drod="open /Applications/DROD-TCB.app"
alias steam="open /Applications/Steam.app"
alias aud="open -a /Applications/Audacity.app"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
alias wireshark="sudo /Applications/Wireshark.app/Contents/MacOS/Wireshark &"
alias sqp="open /Applications/Sequel\ Pro.app"
alias aqua="open /Applications/Aquamacs\ Emacs.app"

g() {
    shift
    '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' "https://www.google.com/search?q=$*"
}

# MISC #

function c() {
    cc $1.c -o $1 && ./$1
}

alias ericka="qlmanage -p ~/Pictures/Ericka.jpg"
alias nadya="gpg --armor --encrypt --sign --recipient nadyabedford@gmail.com"
alias aux="mkdir -pv /Volumes/Shared && sudo mount -t udf /dev/disk0s7 /Volumes/Shared"
alias of="file_count"
alias lsi="lsof -i"
alias path="echo $PATH | tr : '\n'"
alias als="add_alias"
alias mines="jython /Users/olleicua/dev/bin/mines"
alias ts="date -r"
alias todo="ls /Users/olleicua/todo"
alias bored="ls /Users/olleicua/bored"
alias beep="osascript -e 'beep 3'"
alias clisp="clisp -ansi -I -q -q"
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
alias hcl-dev="/Users/olleicua/Work/open_source/hcl/bin/hcl"
alias rspec="bundle exec rspec"
alias dj="python manage.py"
alias djadmin="django-admin"
alias ez="emacs /Users/olleicua/.zshrc"
alias z=". /Users/olleicua/.zshrc"
alias android="~/dev/android-sdk-macosx/tools/android &"
alias rand="ruby -e'p rand ARGV[0].to_i'"
alias svn="echo '... really..?' #"
alias solr-start="bundle exec rake sunspot:solr:start"
alias ps-grep="ps -A | grep"
alias routes-grep="bundle exec rake routes | grep"
#alias hcl="node $HOME/Dropbox/School/Plan/hcl/bin/hcl"

alias staging-deploy="heroku-deploy heroku-staging"
alias production-deploy="heroku-deploy heroku"

we() {
    which $1;
    eval "$@";
}

alias bv="pbcopy < $HOME/Dropbox/bida/volunteers"
alias okc="pbcopy < $HOME/Dropbox/okc_auto_qm"

# GIT #

#source ~/git-completion.bash
alias glp="git log --pretty=format:\"%an <%ae>
  %ar
  %s
\""

# RAILS

function gen-migration() {
    bundle exec rails g migration $* | ruby -e 'qq = STDIN.read; puts qq; exec "cat #{qq.strip.split(/\s+/).last}"'
}

function single-test() {
    bin/rake test TEST=$1 --verbose
}

#export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

# SYNTAX HIGHLIGHTING #

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# BIN

PATH=$PATH:$HOME/bin # Add RVM to PATH for scripting

# FUN

alias free-cell="node /Users/olleicua/Play/FreeCell/game.js"
alias pray="coffee $HOME/Play/immortal.js.coffee"
alias flake="/Users/olleicua/.rvm/rubies/ruby-2.0.0-p643/bin/ruby $HOME/Play/flake/flake.rb"
alias measure-flakiness="/Users/olleicua/.rvm/rubies/ruby-2.0.0-p643/bin/ruby $HOME/Play/flake/measure_flakiness.rb"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


