# ============================================================
#  .zshrc — crafted config
#  Framework : Oh My Zsh
#  Theme     : Powerlevel10k
# ============================================================

# ── Path ────────────────────────────────────────────────────
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

# ── Oh My Zsh ───────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"

# ── Theme ───────────────────────────────────────────────────
# Powerlevel10k — run `p10k configure` after first launch
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load p10k instant prompt (keep near top, before any output)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ── OMZ settings ────────────────────────────────────────────
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"   # uncomment for huge repos
HIST_STAMPS="dd.mm.yyyy"

# Auto-update every 14 days, no prompt
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

# ── Plugins ─────────────────────────────────────────────────
plugins=(
  git                        # git aliases + prompt info
  zsh-autosuggestions        # ghost-text suggestions
  zsh-syntax-highlighting    # live syntax colours
  fzf                        # fuzzy finder keybindings
  history-substring-search   # Up/Down searches through history
  colored-man-pages          # colour in man pages
  dirhistory                 # Alt+Left/Right navigate dir history
  z                          # jump to frecent dirs
)

source $ZSH/oh-my-zsh.sh

# ── Powerlevel10k config file ────────────────────────────────
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ── Keybindings ─────────────────────────────────────────────
source "$HOME/.bind_key.zsh"

# ── Environment ─────────────────────────────────────────────
export EDITOR='nvim'
export VISUAL='nvim'
# export LANG=en_US.UTF-8

# ── Pyenv ───────────────────────────────────────────────────
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ── Android SDK ─────────────────────────────────────────────
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/emulator"

# ── Docker ──────────────────────────────────────────────────
export DOCKER_BUILDKIT=1

# ── NVM ─────────────────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ]             && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ]    && source "$NVM_DIR/bash_completion"

# ── Spicetify ───────────────────────────────────────────────
export PATH="$PATH:$HOME/.spicetify"

# ── History ─────────────────────────────────────────────────
HISTSIZE=50000
SAVEHIST=50000
HISTFILE="$HOME/.zsh_history"

setopt HIST_IGNORE_DUPS        # don't store duplicate adjacent entries
setopt HIST_IGNORE_ALL_DUPS    # remove older duplicate entries
setopt HIST_FIND_NO_DUPS       # no dupes in search
setopt HIST_REDUCE_BLANKS      # strip extra blanks
setopt HIST_VERIFY             # show expanded history before running
setopt SHARE_HISTORY           # share history across all sessions instantly
setopt INC_APPEND_HISTORY      # write to history immediately, not on exit

# ── Directory behaviour ─────────────────────────────────────
setopt AUTO_CD                 # type a dir name to cd into it
setopt AUTO_PUSHD              # cd pushes onto dir stack automatically
setopt PUSHD_IGNORE_DUPS       # no duplicate entries in dir stack
setopt PUSHD_SILENT            # don't print dir stack after pushd/popd

# ── Completion ──────────────────────────────────────────────
setopt CORRECT                 # spelling correction for commands
setopt CORRECT_ALL             # spelling correction for arguments
autoload -Uz compinit && compinit

# Coloured completions (files, dirs, sockets, pipes, etc.)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}No matches for: %d%f'

# ── ls colours ──────────────────────────────────────────────
# Uses GNU dircolors; covers files, dirs, links, sockets, pipes, executables…
if command -v dircolors &>/dev/null; then
  eval "$(dircolors -b)"
fi
alias ls='ls --color=auto --group-directories-first'

# ── Autosuggestion style ─────────────────────────────────────
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#666666'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# ── fzf ─────────────────────────────────────────────────────
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --info=inline"
# Use fd if available (respects .gitignore, faster)
if command -v fd &>/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -s "^[f" "tmux-sessionizer\n"

# ── Linux console only ───────────────────────────────────────
if [[ $TERM == 'linux' ]]; then
  setfont ter-v32b.psf.gz 2>/dev/null || true
  echo "WELCOME"
fi

# ── Aliases — Navigation ─────────────────────────────────────
alias ll='ls -lhF --color=auto --group-directories-first'
alias la='ls -lAhF --color=auto --group-directories-first'
alias l='ls -CF --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'               # go back to previous dir

# ── Aliases — Git ───────────────────────────────────────────
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbd='git branch -d'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gds='git diff --staged'
alias gst='git stash'
alias gstp='git stash pop'

# ── Aliases — Neovim ────────────────────────────────────────
alias nv='nvim'
alias nivm='nvim'          # kept from old config (typo muscle memory)

# ── Aliases — Tmux ──────────────────────────────────────────
alias tl='tmux ls'
alias ta='tmux a'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'

# ── Aliases — Network ───────────────────────────────────────
alias my_wifi='nmcli d wifi connect AirFiber'
alias home_wifi='nmcli d wifi connect AirFiber'
alias disconnect='nmcli d disconnect wlp2s0b1'

# ── Aliases — Bluetooth ─────────────────────────────────────
alias connect_bluetooth='bluetoothctl connect 74:D7:13:ED:10:00'
alias disconnect_bluetooth='bluetoothctl disconnect 74:D7:13:ED:10:00'

# ── Aliases — Misc ──────────────────────────────────────────
alias st='startx'
alias edit_history='nvim ~/.zsh_history'
alias zshrc='nvim ~/.zshrc'
alias reload='source ~/.zshrc'

# ── Powerlevel10k right-side command timer ───────────────────
# P10k shows command execution time on the right by default.
# Tune the threshold (seconds) below which time is hidden:
# In ~/.p10k.zsh find: typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD
# and set it to e.g. 2 (only show if cmd took > 2 s).
# Run `p10k configure` to set this interactively.
