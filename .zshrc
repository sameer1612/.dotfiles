# ---- PATHS ----
typeset -U path PATH   # remove duplicates automatically
path=(
  /opt/homebrew/bin
  /opt/homebrew/sbin
  $HOME/.cargo/bin
  $HOME/.pub-cache/bin
  $HOME/softwares/flutter/bin
  /opt/homebrew/opt/mysql@8.4/bin
  /opt/homebrew/opt/mongodb-community@4.4/bin
  /Applications/Postgres.app/Contents/Versions/15/bin
  ~/.config/yazi
  $path
)
export PATH

# Enable completion
autoload -Uz compinit
compinit -C -d "$HOME/.cache/zsh/.zcompdump"

# ---- NVM (lazy loaded) ----
export NVM_DIR="$HOME/.nvm"
load_nvm() {
  unset -f node npm npx nvm
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"
}
node() { load_nvm; node "$@"; }
npm()  { load_nvm; npm "$@"; }
npx()  { load_nvm; npx "$@"; }
nvm()  { load_nvm; nvm "$@"; }

# ---- rbenv ----
export RBENV_ROOT="$HOME/.rbenv"
if command -v rbenv >/dev/null; then
  eval "$(rbenv init - zsh)"
fi


# Useful options
setopt autocd
setopt correct
setopt interactivecomments
setopt PROMPT_SUBST

# Colors
autoload -Uz colors
colors

# Editor
export EDITOR=nvim
export VISUAL=nvim

# Git branch in prompt (fast, no oh-my-zsh)
git_branch() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  echo " %F{yellow}($branch)%f"
}
PROMPT='%F{cyan}%~%f$(git_branch) '

# ---- History ----
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory        # don’t overwrite
setopt sharehistory         # share across terminals
setopt hist_ignore_dups     # no consecutive duplicates
setopt hist_ignore_all_dups # remove older duplicates
setopt hist_reduce_blanks   # trim extra spaces
setopt hist_verify          # show command before executing from history
setopt inc_append_history   # write immediately

# ---- zoxide (smart cd) ----
eval "$(zoxide init zsh)"

# ---- Autosuggestions ----
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---- yazi file manager ----
if [ -f "$HOME/.dotfiles/.config/yazi/y.sh" ]; then
  source "$HOME/.dotfiles/.config/yazi/y.sh"
fi

# ---- fzf ----
if [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi
if [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi
export FZF_DEFAULT_OPTS='
  --height 40%
  --layout=reverse
  --border
  --inline-info
  --cycle
'

# ---- Syntax Highlighting (must be last) ----
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Aliases ----
alias bd='bun dev || bun start'
alias cls="clear"
alias dc='docker compose'
alias duh='du -h -d 0 */ | sort -h'
alias gc='git branch | fzf --height=20% --reverse --info=inline | xargs git checkout'
alias gco='git checkout'
alias gpull="git pull"
alias gpush="git push"
alias gst="git status"
alias ishell='pipenv run python3 qcsystem/manage.py shell -i ipython'
alias l="eza -l"
alias la="eza -la"
alias lf="y"
alias ls="eza"
alias nv="nvim"
alias pb='pnpm build'
alias pd='pnpm dev'
alias pi='pnpm install'
alias pip="pip3"
alias py="python3"
alias python="python3"
alias rconsole='rails c'
alias rserver='rails s'
alias run='cd ~/codes/tl/aicrete/qualitycontrol && pipenv run python3 qcsystem/manage.py runserver'
alias ssh-prod='aic ssh-ecs -e prod -a prod -s web'
alias ssh-qa2='aic ssh-ecs -e staging -a qa2 -s web'
alias ssh-qa='aic ssh-ecs -e staging -a qa -s web'
alias tr2='tree -a -L 2'
alias ur='uv run'
alias vi="nvim"
alias yb='yarn build'
alias yd='yarn dev || yarn start'
alias ys='yarn start'
alias yt='yarn test'
alias ytdl='yt-dlp -f bestaudio --no-playlist --extract-audio --audio-format mp3 -o "~/Downloads/ytdlc/%(title)s.%(ext)s"'

. "$HOME/.local/bin/env"
