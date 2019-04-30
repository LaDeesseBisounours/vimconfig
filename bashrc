#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
setxkbmap -layout us -option caps:escape

evin()
{
  evince $1 &> /dev/null &
}




PROMPT_COMMAND=psf

psf()
{
	#if test "$(echo "$?")" == "0" ; then
		#PS1="\[\033[01;32m\]\w \[\033[01;34m\]$\[\033[00m\] "
	#else
		PS1="\[\033[01;32m\]\w \[\033[01;31m\]$?\[\033[01;34m\]$\[\033[00m\] "
	#fi
}
unset color_prompt force_color_prompt


alias netctl='sudo netctl'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias i3lock='i3lock -i ~/Downloads/6789350-fantastic-sleeping-cat-wallpaper.png'
alias gitl1='git log --oneline'
alias git1l='git log --oneline'
#alias evi='evin'
exec zsh

export QSYS_ROOTDIR="/home/chat/intelFPGA_lite/18.1/quartus/sopc_builder/bin"
