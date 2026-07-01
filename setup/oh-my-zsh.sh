if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "==> Installing Oh My Zsh"

    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

mkdir -p "$ZSH_CUSTOM/plugins"
mkdir -p "$ZSH_CUSTOM/themes"

clone_plugin() {
    local name="$1"
    local repo="$2"

    if [[ -d "$ZSH_CUSTOM/plugins/$name" ]]; then
        echo "✓ $name already installed"
    else
        echo "==> Installing $name"
        git clone --depth=1 "$repo" "$ZSH_CUSTOM/plugins/$name"
    fi
}

clone_theme() {
    local name="$1"
    local repo="$2"

    if [[ -d "$ZSH_CUSTOM/themes/$name" ]]; then
        echo "✓ $name already installed"
    else
        echo "==> Installing $name"
        git clone --depth=1 "$repo" "$ZSH_CUSTOM/themes/$name"
    fi
}

clone_plugin \
    "zsh-autosuggestions" \
    "https://github.com/zsh-users/zsh-autosuggestions.git"

clone_plugin \
    "zsh-syntax-highlighting" \
    "https://github.com/zsh-users/zsh-syntax-highlighting.git"

clone_theme \
    "powerlevel10k" \
    "https://github.com/romkatv/powerlevel10k.git"
