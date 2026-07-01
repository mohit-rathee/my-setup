GREEN="\e[32m"
RED="\e[31m"
BLUE="\e[34m"
YELLOW="\e[33m"
RESET="\e[0m"

tick() {
    printf "${GREEN}✔${RESET} %s\n" "$1"
}

cross() {
    printf "${RED}✘${RESET} %s\n" "$1"
}

header() {
    echo
    printf "${BLUE}==> %s${RESET}\n" "$1"
}

info() {
    printf "${YELLOW}•${RESET} %s\n" "$1"
}

success() {
    printf "\n${GREEN}Done:${RESET} %s\n" "$1"
}
