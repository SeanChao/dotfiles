if [[ -r ~/.local.zshrc ]]; then
  source ~/.local.zshrc
fi

# Environment Variable
export HTTP_PROXY_PORT=1080
export SOCKS_PROXY_PORT=1080
export ZSH=$HOME/.oh-my-zsh

# alias
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls --color=tty'
alias lsa='ls -lah'
alias md='mkdir -p'
alias py=python3
alias ww='cd ~/cstar'
alias winip='cat /etc/resolv.conf'

# bindkey
bindkey "^[^[[C" forward-word

# PATH
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.nvm/versions/node/*/bin"
export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/sdk/go1.15/bin"
export PATH="$PATH:$HOME/go/bin"
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# TMUX
export EDITOR='vim'

# WSL2
if [[ $IS_WSL == "true" ]]; then
  if [ -z $WSL_ADDR ]; then
    WSL_ADDR=$(cat /etc/resolv.conf | grep nameserver | cut -d ' ' -f 2)
  fi
  export winip=$WSL_ADDR
  export http_proxy=http://${winip}:${HTTP_PROXY_PORT}
  export https_proxy=http://${winip}:${HTTP_PROXY_PORT}
  export NO_PROXY="localhost,127.0.0.1"
  export DISPLAY=${winip}:0.0
  export c=/mnt/c
  export star=/mnt/c/star
  export dl="/mnt/c/Users/Sean/Downloads"
  export docker_proxy="--env HTTP_PROXY=\"${http_proxy}\" --env HTTPS_PROXY=\"${https_proxy}\""
  # git proxy in WSL2
  git config --global http.proxy http://$winip:${HTTP_PROXY_PORT}
  git config --global https.proxy http://$winip:${HTTP_PROXY_PORT}
  git config --global ssh.proxy http://$winip:${HTTP_PROXY_PORT}
  # remove npm in windows installation
  PATH=$(echo "$PATH" | sed -e 's/\/mnt\/c\/Program Files\/nodejs://')
  PATH=$(echo "$PATH" | sed -e 's/\/mnt\/c\/Users\/jburkholder\/AppData\/Roaming\/npm://')
  PATH=$(echo "$PATH" | sed -e 's/\/mnt\/c\/Program Files (x86)\/Yarn\/bin://')

  alias show=explorer.exe
  alias www='cd /mnt/c/star'
fi

# zsh
# eval `dircolors ~/Git/dircolors-solarized/dircolors.256dark`
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="ys"
sec=$(date +"%S")
flag=$(($sec % 10))
if [[ $flag -eq 0 ]]; then
  ZSH_THEME="random"
else
  ZSH_THEME="chaos"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "macovsky" "maran" "ys" "kardan" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins+=(
  docker
  docker-compose
  git
  tmux
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_UNICODE=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# NVM
export NVM_DIR="$HOME/.nvm"

# nvm() {
#   echo "Lazy loading nvm..."
#   # Remove nvm function
#   unfunction "$0"
#   # Load nvm
#   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
#   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
#   # Call nvm
#   $0 "$@"
# }
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
command -v rbenv && export PATH="$(rbenv which ruby):$PATH"
