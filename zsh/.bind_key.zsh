# ============================================================
#  ~/.bind_key.zsh — keybindings
#  Sourced from .zshrc after oh-my-zsh is loaded.
# ============================================================

# Use emacs-style base (works better with most terminals)
bindkey -e

# ── History search (history-substring-search plugin) ────────
# Up/Down arrow: search history by what you've typed so far
bindkey '^[[A' history-substring-search-up      # Up arrow
bindkey '^[[B' history-substring-search-down    # Down arrow
bindkey '^P'   history-substring-search-up      # Ctrl+P
bindkey '^N'   history-substring-search-down    # Ctrl+N

# ── Backward / forward search (classic) ─────────────────────
bindkey '^R' history-incremental-search-backward   # Ctrl+R  ← backward search
bindkey '^S' history-incremental-search-forward    # Ctrl+S  ← forward search
# Note: Ctrl+S may need `stty -ixon` if terminal flow control intercepts it:
stty -ixon 2>/dev/null || true

# ── Autosuggestions ─────────────────────────────────────────
bindkey '^[ '   autosuggest-accept         # Ctrl+Space — accept ghost suggestion
bindkey '^]'   autosuggest-accept          # Ctrl+] — alternate accept
bindkey '^[f'  autosuggest-accept          # Alt+F  — accept one word forward
bindkey '^E'   autosuggest-accept          # Ctrl+E — accept to end of line

# ── Word movement ────────────────────────────────────────────
bindkey '^[b'  backward-word              # Alt+B — move back one word
bindkey '^[f'  forward-word               # Alt+F — move forward one word
bindkey '^[[1;5D' backward-word           # Ctrl+Left
bindkey '^[[1;5C' forward-word            # Ctrl+Right

# ── Line editing ─────────────────────────────────────────────
bindkey '^A'   beginning-of-line          # Ctrl+A
bindkey '^E'   end-of-line                # Ctrl+E
bindkey '^K'   kill-line                  # Ctrl+K — delete to end
bindkey '^U'   backward-kill-line         # Ctrl+U — delete to start
bindkey '^W'   backward-kill-word         # Ctrl+W — delete previous word
bindkey '^[d'  kill-word                  # Alt+D  — delete next word
bindkey '^H'   backward-delete-char       # Ctrl+Backspace

# ── Misc ─────────────────────────────────────────────────────
bindkey '^L'   clear-screen               # Ctrl+L — clear (keep cmd line)
bindkey '^[i'   clear-screen              # Alt+L — clear (keep cmd line)
bindkey '^[.'  insert-last-word           # Alt+.  — insert last arg of prev cmd
bindkey '^[e'  expand-cmd-path            # Alt+E  — expand command path

# ── fzf integrations (set by fzf plugin, listed here for reference) ─
# Ctrl+T  — fuzzy file picker
# Ctrl+R  — fuzzy history search (overrides the plain Ctrl+R above when fzf is loaded)
# Alt+C   — fuzzy cd into subdirectory
