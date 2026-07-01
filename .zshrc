# ---- PATHS ----
typeset -U path PATH   # remove duplicates automatically
path=(
  /opt/homebrew/bin
  /opt/homebrew/sbin
  $HOME/.config/yazi
  /Library/PostgreSQL/17/bin/
  /opt/homebrew/opt/openjdk/bin
  $path
  $(go env GOPATH)/bin
)
export PATH

# Enable completions
autoload -Uz compinit
compinit


# ---- FNM (Node version manager) ----
eval "$(fnm env --use-on-cd --shell zsh)"

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
  local ref
  ref=$(command git symbolic-ref --short HEAD 2>/dev/null) || return
  echo " %F{yellow}($ref)%f"
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
export FZF_DEFAULT_OPTS='
  --height 40%
  --layout=reverse
  --border
  --inline-info
  --cycle
'

# Alias expansion
source $HOME/.zsh-expand/zsh-expand.plugin.zsh

# ---- Syntax Highlighting (must be last) ----
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Aliases ----
alias bd='bun dev'
alias cls="clear"
alias duh='du -h -d 0 */ | sort -h'
alias gc='git branch | fzf --height=20% --reverse --info=inline | xargs git checkout'
alias gco='git checkout'
alias gpull="git pull"
alias gpush="git push"
alias gst="git status"
alias l="eza -l"
alias la="eza -la"
alias ll="eza -l"
alias lf="y"
alias ls="eza"
alias nv="nvim"
alias pb='pnpm build'
alias pd='pnpm dev'
alias pi='pnpm install'
alias pip="pip3"
alias python="python3"
alias tr2='tree -a -L 2'
alias vi="nvim"
alias vim="nvim"
alias yd='yarn dev'
alias ys='yarn start'
alias yt='yarn test'
alias zob='cd /Users/sameer/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/obsidian/'
# Project related aliases
source $HOME/.officerc
