# Path to your oh-my-zsh installation.
export ZSH=/home/z/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
plugins=(git)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval $(thefuck --alias)

alias poule="git pull; npm install"
alias top="/usr/bin/htop"
alias tkt="cd ~/tarkett && docker-compose up -d"
alias tktt="cd ~/tarkett && docker-compose up -d && find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} cp develop \; -exec git -C {} co - \; && docker exec -it tarkett_account_1 bin/console doc:schema:up --force && docker exec -it tarkett_basket_1 bin/console doc:schema:up --force"
alias pstorm="~/Téléchargements/PhpStorm-162.2380.11/bin/phpstorm.sh"
alias sourceme="source ~/.zshrc"
alias pycharm="/opt/pycharm-community-2017.1.4/bin/pycharm.sh"
alias expo="~/bin/xde-2.19.2-x86_64.AppImage"

awsset() {
export AWS_DEFAULT_PROFILE=$1
export AWS_PROFILE=$1
export AWS_DEFAULT_REGION=eu-west-1
export AWS_REGION=eu-west-1
}

get_params_file() {
    awsset parameters-$1
    aws s3 cp s3://tarkett-parameters-$1/$2/parameters.yml $3
}

set_params_file() {
    awsset parameters-$1
    aws s3 cp $3 s3://tarkett-parameters-$1/$2/parameters.yml
}

edit_params_file() {
    get_params_file $1 $2 /tmp/$1.$2.yml
    vim /tmp/$1.$2.yml
    read "update?Update params file (y/n)?"
    if [[ "$update" =~ ^[Yy]$ ]]
    then
        set_params_file $1 $2 /tmp/$1.$2.yml
	echo "file updated"
    else
        echo "file not updated"
    fi
}


# added by travis gem
[ -f /home/louis/.travis/travis.sh ] && source /home/louis/.travis/travis.sh

export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
