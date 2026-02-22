if [[ ":$FPATH:" != *":/Users/sameer/.zsh/completions:"* ]]; then export FPATH="/Users/sameer/.zsh/completions:$FPATH"; fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="sorin"

zstyle ':omz:update' mode auto

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    git
    zsh-autosuggestions
    fzf-zsh-plugin
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

alias gst="git status"
alias gc="fzf-git-checkout"
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
alias ls="eza"
alias tr2="tree -a -L 2"
alias cls="clear"
alias tm="tmux "
alias td="tmux detach "
alias ta="tmux attach -t "
alias tls="tmux ls"
alias l="ls -l"
alias la="ls -la"
alias lf="yazi"
alias lfcd="y"
alias py="python3 "
alias nm="nodemon "

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export ERL_AFLAGS="-kernel shell_history enabled"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/sameer/softwares/flutter/bin:$PATH"
export PATH="/opt/homebrew/opt/mongodb-community@4.4/bin:$PATH"
export PATH="/Users/sameer/Applications/JetBrains Toolbox:$PATH"
export PATH="$(npm prefix -g)/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/15/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"

export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_AVD_HOME=~/.android/avd
export PATH="$HOME/.pub-cache/bin:$PATH"
export PATH="/Users/sameer/.cargo/bin:$PATH"

eval "$(rbenv init - zsh)"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Office work related configs.
if [ -f ~/.officerc.sh ]; then
    source ~/.officerc.sh
fi

prompt_context() {} # remove user and machine identifier
eval "$(zoxide init zsh)"

bindkey '^[^I' autosuggest-accept

PROMPT='%{$fg[cyan]%}%c$(git_prompt_info) %(!.%{$fg_bold[red]%}#.%{$fg_bold[red]%}❯%{$fg_bold[yellow]%}❯%{$fg_bold[green]%}❯)%{$reset_color%} '

source ~/.config/yazi/y.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ZSH_DISABLE_COMPFIX=true

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

. "$HOME/.local/bin/env"
