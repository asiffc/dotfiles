      #::::::::  :::::::::      :::     ::::    :::  ::::::::  :::::::::: 
    #:+:    :+: :+:    :+:   :+: :+:   :+:+:   :+: :+:    :+: :+:         
   #+:+    +:+ +:+    +:+  +:+   +:+  :+:+:+  +:+ +:+        +:+          
  #+#+    +:+ +#++:++#:  +#++:++#++: +#+ +:+ +#+ :#:        +#++:++#      
 #+#+    +#+ +#+    +#+ +#+     +#+ +#+  +#+#+# +#+   +#+# +#+            
#+#    #+# #+#    #+# #+#     #+# #+#   #+#+# #+#    #+# #+#             
########  ###    ### ###     ### ###    ####  ########  ##########       
#-----------------------------------------------------------------------------------------------------

HISTSIZE= HISTFILESIZE= # infinite history.

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

[[ "$(whoami)" = "root" ]] && return

# system maintainence
alias sdn="sduo shutdown now"
alias rb="sudo reboot"
#alias ebrc='edit ~/.bashrc'

# misc alaises
alias e="$EDITOR"
alias p="sudo pacman"
alias SS="sudo systemctl"
alias sv="sudo vim"
alias ka="killall"
alias g="git"
alias h='history'

# adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

# Extract
extract () {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.lzma)      unlzma $1      ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x -ad $1 ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.xz)        unxz $1        ;;
          *.exe)       cabextract $1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
 fi
}

# android
export ANDROID_HOME=/Users/$USER/android-sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
#------------------------------------------------------------

#neofetch
pfetch
