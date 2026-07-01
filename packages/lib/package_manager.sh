install_packages() {

    local manager="$1"
    local cmd=()

    if [[ "$manager" == "yay" ]]; then
        cmd=(yay)
    else
        cmd=(sudo pacman)
    fi

    header "Installing Packages via ${manager^}"

    local group
    local arr

    for group in "${PACKAGE_GROUPS[@]}"; do

        [[ "${GROUP_MANAGER[$group]}" != "$manager" ]] && continue

        if [[ "${GROUP_TYPE[$group]}" == "optional" &&
              ! -v "SELECTED_GROUPS[$group]" ]]; then
            continue
        fi

        info "$group"

        arr="PKG_${group// /_}"
        declare -n packages="$arr"

        if "${cmd[@]}" -S --needed --noconfirm --overwrite '*'  "${packages[@]}"; then
            tick "$group"
        else
            cross "$group"
            return 1
        fi

        echo
    done
}
