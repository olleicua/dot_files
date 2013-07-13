# OPTIONS #

setopt autocd
setopt cdablevars
setopt globdots
setopt histignoredups
setopt histignorespace
setopt interactivecomments
setopt extended_glob


bindkey "^?" backward-delete-char
bindkey "^[[3~" delete-char

# PROMPT #

autoload -U promptinit
promptinit

function battery_charge {
    echo `battery` 2>/dev/null
}

source ~/.zsh/git-prompt/zshrc.sh

prompt_files() {
	ruby ~/dev/zsh/files.rb
}

PROMPT='
%F{green}%B$ %b%f'

RPROMPT='$(git_super_status)%(!|%F{magenta}|%F{cyan})%B%1~%b%f %F{green}|%f %F{cyan}%B%* %w%b%f %(0?--%F{green}%B|%b%f %F{red}%B%?%b%f )%F{green}|%f $(prompt_files)%F{cyan}%B%m%b%f'

# NAVIGATION #

alias s="cd ~/Dropbox/School"
alias p="cd ~/Play"
alias wo="cd ~/Work"
alias dow="cd ~/Downloads"
alias dev="cd ~/dev"
alias app="cd /Applications"
alias lib="cd ~/dev/lib"
alias l="ls -lahG"
alias la="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias tree="tree -l"
alias mkd="mkdir -pv"
alias cp="cp -rv"
alias dir="open ./"
alias kl="clear;ls -lahG"

# FILES #

alias m="less"
alias e="edit"
alias eb="edit -2"
alias t="touch"
alias sq="sqlite3"
alias py="pythonize"
alias o="open"
alias ql="qlmanage -p"
alias wl="web_look"
alias c="echo -n \"\" >"
alias unpack-tar="tar xvf"
alias pack-tar="tar zcvf"

# SERVERS #

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
alias g="launch_website g"
alias gi="launch_website gi"
alias gv="launch_website gv"
alias gm="open -a /Applications/Firefox.app http://gmail.com/"
alias ftp="open /Applications/Transmit.app"
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

# ITUNES #

alias v="set_volume"
alias it="open /Applications/iTunes.app"
alias linalg="open ~/Desktop/School/Math/book.pdf"
alias itn="itunes_next"
alias itb="itunes_previous"
alias itp="itunes_pause"
alias itl="itunes_play"
alias iti="itunes_info"

# MISC #

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
alias clean="rm -fv *~;rm -fv .*~;rm -fv '#'*;rm -fv '.#'*"
alias cleana="rm -fv **/*~;rm -fv **/.*~;rm -fv **/'#'*;rm -fv **/'.#'*"
alias empty-trash="setopt rmstarsilent;rm -rfv ~/.Trash/*;unsetopt rmstarsilent"

function rd() {
	setopt rmstarsilent
	for i
	do rm -rfv $i
	done
	unsetopt rmstarsilent
}

# DEV #

alias hcl-dev="/Users/olleicua/School/Plan/hcl/bin/hcl"
alias rspec="bundle exec rspec"
alias dj="python manage.py"
alias djadmin="django-admin"
alias ez="edit /Users/olleicua/.zshrc"
alias z=". /Users/olleicua/.zshrc"
alias android="~/dev/android-sdk-macosx/tools/android &"
alias rand="ruby -e'p rand ARGV[0]'"
alias svn="echo '... really..?' #"
#alias hcl="node $HOME/Dropbox/School/Plan/hcl/bin/hcl"

# GIT #

#source ~/git-completion.bash
alias glp="git log --pretty=format:\"%an <%ae>
  %ar
  %s
\""

# RAILS

export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

# SYNTAX HIGHLIGHTING #

source ~/dev/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# RVM

[[ -s "~/.rvm/scripts/rvm" ]] && . "~/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


# FUN

alias free-cell="node /Users/olleicua/Play/solitare/game.js"