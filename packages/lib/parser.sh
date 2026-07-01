#!/usr/bin/env bash

# Ordered list of groups
declare -ag PACKAGE_GROUPS=()

# Metadata
declare -Ag GROUP_MANAGER=()
declare -Ag GROUP_TYPE=()

parse_packages() {
    local file="$1"

    local current_group=""

    while IFS= read -r line || [[ -n "$line" ]]; do
        # Trim whitespace
        line="${line#"${line%%[![:space:]]*}"}"
        line="${line%"${line##*[![:space:]]}"}"

        # Ignore empty lines and comments
        [[ -z "$line" || "$line" == \#* ]] && continue

        case "$line" in
            "[group]")
                current_group=""
                ;;

            name=*)
                current_group="${line#name=}"
                PACKAGE_GROUPS+=("$current_group")

                # Create an array named:
                # PKG_Core_Networking
                local arr="PKG_${current_group// /_}"
                declare -g -a "$arr=()"
                ;;

            manager=*)
                GROUP_MANAGER["$current_group"]="${line#manager=}"
                ;;

            type=*)
                GROUP_TYPE["$current_group"]="${line#type=}"
                ;;

            *)
                local arr="PKG_${current_group// /_}"
                declare -n packages="$arr"
                packages+=("$line")
                ;;
        esac
    done < "$file"
}
#!/usr/bin/env bash

# Ordered list of groups
declare -ag PACKAGE_GROUPS=()

# Metadata
declare -Ag GROUP_MANAGER=()
declare -Ag GROUP_TYPE=()

parse_packages() {
    local file="$1"

    local current_group=""

    while IFS= read -r line || [[ -n "$line" ]]; do
        # Trim whitespace
        line="${line#"${line%%[![:space:]]*}"}"
        line="${line%"${line##*[![:space:]]}"}"

        # Ignore empty lines and comments
        [[ -z "$line" || "$line" == \#* ]] && continue

        case "$line" in
            "[group]")
                current_group=""
                ;;

            name=*)
                current_group="${line#name=}"
                PACKAGE_GROUPS+=("$current_group")

                # Create an array named:
                # PKG_Core_Networking
                local arr="PKG_${current_group// /_}"
                declare -g -a "$arr=()"
                ;;

            manager=*)
                GROUP_MANAGER["$current_group"]="${line#manager=}"
                ;;

            type=*)
                GROUP_TYPE["$current_group"]="${line#type=}"
                ;;

            *)
                local arr="PKG_${current_group// /_}"
                declare -n packages="$arr"
                packages+=("$line")
                ;;
        esac
    done < "$file"
}
