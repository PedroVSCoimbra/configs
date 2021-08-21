# Lines configured by zsh-newuser-install
HISTFILE=~/.local/share/zhistfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep

typeset -U PATH

autoload -Uz compinit edit-command-line
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zle -N edit-command-line

bindkey -v
bindkey '\C-o' accept-line-and-down-history
bindkey '^D' delete-char-or-list
source /home/pedro/.config/zsh/aliases
source /home/pedro/.config/zsh/exports.zsh
source /home/pedro/.config/zsh/prompt.zsh
source /home/pedro/.config/zsh/vi-mode.zsh

# Screen recording €
rec () {
  if [ $# -eq 3 ]; then
    ffmpeg -f x11grab -s $1x$3 -i :0.0 $3.mp4
  elif [ $# -eq 1 ]; then
    ffmpeg -f x11grab -s 1280x1080 -i :0.0 $1.mp4
  else
    ffmpeg -f x11grab -s 2560x1080 -i :0.0 out.mp4
  fi
}

# Auto login €
 if [[ "$(tty)" = "/dev/tty1" ]]; then
   startx /home/pedro/.config/X11/xinitrc /home/pedro/.config/X11/xserverrc vt1
 elif [[ "$(tty)" = "/dev/tty2" ]]; then
   startx /home/pedro/.config/X11/xinitrc2 /home/pedro/.config/X11/xserverrc vt1
 elif [[ "$(tty)" = "/dev/tty3" ]]; then
   startx /home/pedro/.config/X11/xinitrc3 /home/pedro/.config/X11/xserverrc vt1
 fi
# ¥
[[ -f ~/.config/X11/xresources ]] && xrdb -merge -I$HOME ~/.config/X11/xresources
