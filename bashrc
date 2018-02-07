
[[ $- != *i* ]] && return

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"
set nocompatible

export EDITOR=vim

alias ls='ls --color=auto'
alias lsa='ls -a'
alias lsl='ls -la'
 #output1="\[\033[38;5;40m\]\W\\$\[$(tput sgr0)\]"
 #output2="\[\033[38;5;160m\]\W\\$\[$(tput sgr0)\]"


evin()
{
  evince "$1" 2> /dev/null &
}
mvcd()
{
  mv "$1" "$2"
  cd "$2"
}
cpcd()
{
  cp "$1" "$2"
  cd "$2"
}
mkdircd()
{
  mkdir "$1"
  cd "$1"
}
newgit()
{
  echo "* mehio_m" > AUTHORS
  echo "auto-generated README" > README
  touch TODO
  mkdir tests
  cp ~/afs/.confs/testsuit.sh tests/testsuit.sh
  cp ~/afs/.confs/Makefile Makefile
  echo '*.swp' > .gitignore
  echo '*.o' > .gitignore
  mkdir src
}
mktouch()
{
	mkdir -v "$1"
	touch "$1/$1.c"
	ls "$1"
}
mktouchh()
{
	mkdir -v "$1"
	touch "$1/$1.c"
	touch "$1/$1.h"
	ls "$1"
}

comp()
{
	touch "Makefile"
  echo "CC = gcc" > Makefile
	echo "CFLAGS = -Wall -Werror -Wextra -std=c99 -g" >> Makefile
	echo "SRC = $1 $2.c\n" >> Makefile
	echo "BIN = execut"  >> Makefile
	echo "\$(BIN) : \$(SRC)"  >> Makefile
}

#test()
#{
# mkdir "$1"
#	touch "$1/main.c"
#	echo "include <stdio.h>" >> "$1/main.c"
#echo "include <stdlib.h>\n\nint main(void)\n{\n"
#return 0;\n}" >> "$1/main.c"
#

PROMPT_COMMAND=psf
psf()
{
	if test "$(echo "$?")" == "0" ; then
    PS1="\[\033[38;5;40m\]\W\\$ \[$(tput sgr0)\]"
  else
    PS1="\[\033[38;5;160m\]\W\\$ \[$(tput sgr0)\]"
  fi
}

export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

alias mesyeux='redshift -o -r  &> /dev/null &'
alias i3lock='i3lock -i ~/afs/lockscreen/keep-calm-and-sleep.png'
alias gcc='gcc -Wextra -Wall -Werror -std=c99 -pedantic'
alias gccg='gcc -g'
alias modx='chmod a+x'
alias evince='evin'
