# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ben/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/ben/.fzf/bin"
fi

source <(fzf --zsh)
