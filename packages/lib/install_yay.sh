install_yay() {

    if command -v yay >/dev/null

    then
        tick "yay already installed"
        return
    fi

    header "Installing yay"

    cd ~

    git clone https://aur.archlinux.org/yay.git

    cd yay

    makepkg -si --noconfirm

    cd ~

    rm -rf ~/yay

    tick "yay installed"

}
