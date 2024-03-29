# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

#########################
# Environment Variables #
#########################

export TERM='st-256color'
export EDITOR='vim'
export VISUAL='vim'
export HISTCONTROL=ignoreboth

###########
# Aliases #
###########

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'

alias ..='cd ..'

alias grep='grep --color=auto'

# Dotfile git configuration management
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Bluetooth enable/disable
alias bton='sudo rfkill unblock bluetooth && sudo systemctl start bluetooth.service'
alias btoff='sudo systemctl stop bluetooth.service && sudo rfkill block bluetooth'

# yt-dlp
# Convert video to mp3
mp3 () {
    yt-dlp -x --audio-format mp3 -o "%(playlist_index|)s%(playlist_index& - |)s%(title)s.%(ext)s" "$1"
}

# Select format of video to download
yt () {
    yt-dlp -f - "$1"
}

# Download best video merged with best audio as mp4
mp4 () {
    yt-dlp -S ext:mp4 "$1"
}

# Download the best video merged with best audio no larger than 720p as mp4
720 () {
    yt-dlp -S "res:720,fps,ext:mp4" "$1"
}

# Download the best video merged with best audio no larger than 1080p as mp4
1080 () {
    yt-dlp -S "res:1080,fps,ext:mp4" "$1"
}

# Download best video merged with best audio as mkv
mkv () {
    yt-dlp --merge-output-format mkv "$1"
}
