if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "==> Installing Oh My Zsh"

    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

clone_plugin() {
    local name="$1"
    local repo="$2"

    if [[ ! -d "$ZSH_CUSTOM/plugins/$name" ]]; then
        echo "==> Installing $name"
        git clone --depth=1 "$repo" "$ZSH_CUSTOM/plugins/$name"
    else
        echo "✓ $name already installed"
    fi
}

clone_plugin "zsh-autosuggestions" \
    "https://github.com/zsh-users/zsh-autosuggestions.git"

clone_plugin "zsh-syntax-highlighting" \
    "https://github.com/zsh-users/zsh-syntax-highlighting.git"
