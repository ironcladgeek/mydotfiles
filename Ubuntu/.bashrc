# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    #PS1='--> '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    #PS1='--> '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

function nodeschool() {
	echo "command			lesson decription"
	echo "==========================================================================================="
	echo "javascripting		Learn the basics of JavaScript."
	echo "learnyounode		Learn the basics of node: asynchronous i/o, http."
	echo "git-it			Learn Git and GitHub basics."
	echo "how-to-npm		Learn how to use and create npm modules."
	echo "count-to-6		Learn how to use some features from ES6, the next version of JavaScript."
	echo "lololodash		Learn Lo-Dash (fork of underscore) to handle your arrays and objects simple!"
	echo "learn-generators	An Intro to JavaScript ES6 Generators."
	echo "esnext-generation	Intro to ES6 Iterators, their use, and how they relate to Generators."
	echo "test-anything		Learn to test your code"
	echo "tower-of-babel		Show you through a series of exercises that introduce you to ES6 features."
	echo "expressworks		Learn the basics of the Express.js framework."
	echo "makemehapi		Learn all about hapi through a series of challenges."
	echo "kick-off-koa		Getting started with Koa, the next generation web framework for Node.js."
	echo "learnyoumongo		Getting started with MongoDB and Node.js"
	echo "learn-sass		Learn the basics of SASS"
	echo "learnyoubash		Learn you how to use the terminal and write your first Bash script."
	echo "js-best-practices	Learn the best practices of writing clean JavaScript code."
	echo "functional-javascript	Learn fundamental functional programming features of JavaScript in vanilla ES5."
	echo "scope-chains-closures	Learn the details of Scope, Scope Chains, Closures, and Garbage Collection."
	echo "how-to-markdown		Learn how to start using Markdown."
	echo "promise-it-wont-hurt	Learn to use promises in JavaScript to handle async operations."
	echo "stream-adventure	Learn to compose streaming interfaces with .pipe()."
	echo "learnyoureact		Let's learn React.js and server side rendering!"
    echo "thinking-in-react	Learn React's philosophy by building a UI from scratch."
}

function gcm() {
		git commit -m $1
}

# Showing git branch in terminal prompt
function git_branch() {
		git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(git_branch)\$ "
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

alias antifilter="sudo openconnect s1c.fadns.biz"
alias antifilter2="sudo openconnect s2c.fadns.biz"
alias lara_new_5.3="composer create-project --prefer-dist laravel/laravel blog '5.3.*'"
alias lara_new_5.2="composer create-project --prefer-dist laravel/laravel blog '5.2.*'"
alias vm="ssh vagrant@127.0.0.1 -p 2222"
alias he="gedit ~/.homestead/Homestead.yaml &"
alias g="git"
alias gst="git status"
alias gpom="git push -u origin master"
alias gba="git branch -a"
alias gla="git log --oneline --decorate --all --graph"
alias cls="clear"
