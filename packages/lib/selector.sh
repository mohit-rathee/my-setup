#!/usr/bin/env bash

declare -Ag SELECTED_GROUPS=()

select_optional_groups() {

    local optional_groups=()

    echo
    echo "========================================"
    echo " Optional Package Groups"
    echo "========================================"
    echo

    local i=1

    for group in "${PACKAGE_GROUPS[@]}"; do
        if [[ "${GROUP_TYPE[$group]}" == "optional" ]]; then
            optional_groups+=("$group")
            printf "%2d) %s\n" "$i" "$group"
            ((i++))
        fi
    done

    if ((${#optional_groups[@]} == 0)); then
        return
    fi

    echo
    read -rp "Select groups (e.g. 1 3 5-7, ENTER = none): " selection

    [[ -z "$selection" ]] && return

    parse_selection "$selection" optional_groups
}

parse_selection() {

    local input="$1"

    declare -n groups="$2"

    local token

    for token in $input; do

        if [[ "$token" =~ ^([0-9]+)-([0-9]+)$ ]]; then

            local start="${BASH_REMATCH[1]}"
            local end="${BASH_REMATCH[2]}"

            ((start > end)) && continue

            local i
            for ((i=start; i<=end; i++)); do
                [[ $i -le ${#groups[@]} ]] || continue
                SELECTED_GROUPS["${groups[i-1]}"]=1
            done

        elif [[ "$token" =~ ^[0-9]+$ ]]; then

            ((token >= 1 && token <= ${#groups[@]})) || continue

            SELECTED_GROUPS["${groups[token-1]}"]=1

        fi

    done
}
