# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="sorin"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    fzf-zsh-plugin
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias gst="git status"
alias gc="git checkout "
alias gpull="git pull"
alias gpush="git push"
alias rserver="rails s "
alias rconsole="rails c "
alias rmigrate="rails db:migrate "
alias yd="yarn dev || yarn start "
alias yt="yarn test"
alias yb="yarn build"
alias ys="yarn start"
alias python="python3"
alias pip="pip3"
alias nv="nvim"
alias vi="nvim"
alias v="nvim"
alias ls="colorls"
alias tr2="tree -a -L 2"
alias cls="clear"
alias tm="tmux "
alias td="tmux detach "
alias ta="tmux attach -t "
alias tls="tmux ls"
alias l="ls -l"
alias la="ls -la"
alias py="python3 "
alias kssh="kitten ssh"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export DENO_INSTALL="/Users/sameer/.deno"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/sameer/softwares/flutter/bin:$PATH"
export PATH="/opt/homebrew/opt/mongodb-community@4.4/bin:$PATH"
export PATH="/Users/sameer/Applications/JetBrains Toolbox:$PATH"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/Users/sameer/.emacs.d/bin:$PATH"
export PATH="$(npm prefix -g)/bin:$PATH"
export PNPM_HOME="/Users/sameer/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/15/bin:$PATH"

eval "$(rbenv init - zsh)"
[ -f "/Users/sameer/.ghcup/env" ] && source "/Users/sameer/.ghcup/env" # ghcup-env

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(dirname $(gem which colorls))/tab_complete.sh

# Office work related configs.
if [ -f ~/.officerc.sh ]; then
    source ~/.officerc.sh
fi

prompt_context() {} # remove user and machine identifier
eval "$(zoxide init zsh)"

bindkey '^[^I' autosuggest-accept

PROMPT='%{$fg[cyan]%}%c$(git_prompt_info) %(!.%{$fg_bold[red]%}#.%{$fg_bold[red]%}❯%{$fg_bold[yellow]%}❯%{$fg_bold[green]%}❯)%{$reset_color%} '

source ~/.config/lf/scripts/lfcd.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
