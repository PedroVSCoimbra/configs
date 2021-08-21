# Exports €
export LANG=C
export LC_ALL=en_US.UTF-8
export EDITOR='nvim'
export TERMINAL='st'
export BROWSER='brave'
export VIFM='/etc/vifm'
export XDG_CONFIG_HOME='/home/pedro/.config/'
export XDG_DATA_HOME='/home/pedro/.local/share/'
export XDG_CACHE_HOME='/home/pedro/.cache'
export WINEPREFIX=""$XDG_DATA_HOME"/wineprefixes/default"
export CARGO_HOME='"$XDG_DATA_HOME"/cargoa'
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export SU2_RUN="$HOME/cfd/su2/bin"
export SU2_HOME="$HOME/cfd/su2"
export SU2_MPI_COMMAND="mpirun -np %i %s"
# export SU2_MPI_COMMAND="mpirun --use-hwthread-cpus -np %i %s"
export IMAGES=/home/pedro/dados/faculdade/imagens/
export QT_QPA_PLATFORMTHEME=qt5ct
export _JAVA_AWT_WM_NONREPARENTING=1
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export GRIPHOME="$XDG_CONFIG_HOME/grip"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android/
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android
export SCIHOME="$XDG_CONFIG_HOME"/scilab
export SU2_RUN=/bin
export GTK_IM_MODULE=fcitx 
export XMODIFIERS=@im=fcitx 
export QT_IM_MODULE=fcitx 
export XIM_PROGRAM=/usr/bin/fcitx 
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
# Home Cleaing €
export HISTFILE=""$XDG_DATA_HOME"/bash/history"
export GNUPGHOME=""$XDG_DATA_HOME"/gnupg"
export LESSKEY=""$XDG_CONFIG_HOME"/less/lesskey"
export LESSHISTFILE=""$XDG_CACHE_HOME"/less/history"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android/
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYTHONPATH=$SU2_RUN:$PYTHONPATH
# Wget €
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
alias wget="wget --hsts-file="$XDG_CACHE_HOME"/wget-hsts"
# ¥
# Xinitrc €
# export XINITRC=""$XDG_CONFIG_HOME"/X11/xinitrc"
# export XSERVERRC=""$XDG_CONFIG_HOME"/X11/xserverrc"
# alias startx="startx /home/pedro/.config/X11/xinitrc /home/pedro/.config/X11/xserverrc vt1"
alias vxi="nvim /home/pedro/.config/X11/xinitrc"
# ¥
# ¥ ¥

# dtrx stuff €
export GOPATH=""$XDG_DATA_HOME"/go"
export PATH=$PATH:$GOPATH/bin
# export PATH="${PATH}:${HOME}/.local/scripts:$GOPATH/bin:${HOME}/.config/gem/ruby/2.7.0/bin:${HOME}/.local/bin:/opt/visit/bin"
# ¥

# Octave €
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"
# ¥

# Man page colorful €
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal
# ¥

# PATH
export PATH=$PATH:$SU2_RUN
export PATH=$PATH:/home/pedro/.local/scripts/statusbar/
export PATH=$PATH:/home/pedro/.local/scripts
export PATH=$PATH:/home/pedro/.local/scripts/bar-functions
export PATH=$PATH:/home/pedro/.local/scripts/statusbar
export PATH=$PATH:/home/pedro/faculdade/02_ic/02_numerical/aulas/rodrigo_moura/02_aula/243_Transonic_Euler/su2-6.2.0/bin
export PATH=$PATH:/home/pedro/dados/cfd/su2/pointwise
export PATH=$PATH:/home/pedro/dados/crypto/teamredminer
export PATH=$PATH:/home/pedro/.local/bin
