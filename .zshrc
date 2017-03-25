# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH=/home/neetordy/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
 ZSH_THEME="pure"
# "spaceship"
# "bullet-train"
#
#
# "powerlevel9k/powerlevel9k"
# "agnoster"
#
# Options Above


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
 plugins=(git autojump zsh-syntax-highlighting extract catimg encode64 zsh-autosuggestions zsh-completions zsh-256color)

 autoload -U compinit && compinit

 source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export PATH="$HOME/.rbenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias pc="proxychains4"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias pip="sudo -H pip2"
alias pip2="sudo -H pip2"
alias pip3="sudo -H pip3"


# User eval configuration
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"




# User source configuration
source ~/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/tmuxinator-0.9.0/completion/tmuxinator.zsh

# Anitbody config
# source <(antibody init)


#tmux auto-start and configuration
tmux_init()  
{  
    session=Miku
    tmux new-session -d -s $session -n home
    tmux send-keys -t $session:1 'cd ~' C-m
    tmux new-window -t $session:2 -n edit vi
    tmux new-window -t $session:3 -n zsh
    tmux new-window -t $session:4 -n SSH 
    tmux send-keys -t $sesstio:4 'ssh root@' C-e C-m 

    tmux split-window -t $session:3 -h
    tmux select-window -t $session:1
    tmux -2 attach-session -d

#    tmux new-session -s "kumu" -d -n "local"    # 开启一个会话  
#    tmux new-window -n "other"          # 开启一个窗口  
#    tmux split-window -h                # 开启一个竖屏  
#    tmux split-window -v "top"          # 开启一个横屏,并执行top命令  
#    tmux -2 attach-session -d           # tmux -2强制启用256color，连接已开启的tmux  
}


# 判断是否已有开启的tmux会话，没有则开启  
# if which tmux 2>&1 >/dev/null; then  
# test -z "$TMUX" && (tmux attach || tmux_init)  
# fi 


#开启256色
#if [ "$TERM" = "linux" ]; then
#    alias fbterm='LANG=zh_CN.UTF-8 fbterm'
#    export TERM=fbterm
#    fbterm -- tmux
#else
#    export TERM='screen-256color'
    # forbid touchpad when I'm typing
#    if [ "none`pgrep syndaemon`" = "none" ]; then
#        syndaemon -i 1 -K -d
#    fi
#fi
#xrdb命令使xterm的配置生效
#alias xterm='xrdb ~/.Xdefaults && xterm -e tmux
