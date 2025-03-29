#!/bin/bash

# 🎨 Colors
RED='\e[31m'    
GREEN='\e[32m'  
YELLOW='\e[33m' 
BLUE='\e[34m'   
CYAN='\e[36m'   
WHITE='\e[97m'  
MAGENTA='\e[35m'
RESET='\e[0m'   

# 🏆 Welcome function with ASCII text
welcome() {
    clear
    echo -e "${YELLOW}⚽🏀🏈🎾🏆🤾‍♂🏐🚴‍♂🏅⚾🎯🤽‍♂🥊⚽🏀🏈🎾🏆🤾‍♂🏐🚴‍♂🏅⚾🎯🤽‍♂🥊${RESET}"
    figlet -c -f slant "Welcome"
    figlet -c -f slant "to"
    figlet -c -f slant "SportsOS"
    echo -e "${YELLOW}⚽🏀🏈🎾🏆🤾‍♂🏐🚴‍♂🏅⚾🎯🤽‍♂🥊⚽🏀🏈🎾🏆🤾‍♂🏐🚴‍♂🏅⚾🎯🤽‍♂🥊${RESET}"
    echo -e "${CYAN}🎮 Welcome to SportsOS! 🏆${RESET}\n"
    echo -e "${GREEN}⚽ Available commands in SportsOS: ${RESET}"
    echo -e "${YELLOW}-----------------------------------------${RESET}"
    echo -e "${GREEN}📂 install <path>${RESET}      - Create a directory and file"
    echo -e "${RED}🗑  uninstall <path>${RESET}    - Remove a directory and file"
    echo -e "${BLUE}📅 date${RESET}                - Show the current date and time"
    echo -e "${CYAN}🎮 game${RESET}                - Open the game menu"
    echo -e "${WHITE}🎭 art${RESET}                 - Display an ASCII drawing of soccer/basketball"
    echo -e "${MAGENTA}🌐 help${RESET}               - Open the Bash manual in lynx"
    echo -e "${GREEN}💻 matrix${RESET}             - Activate the Matrix effect"
    echo -e "${RED}🚪 exit${RESET}               - Exit SportsOS"
    echo -e "${YELLOW}-----------------------------------------${RESET}"
}

art() {
    while true; do
        clear
        echo -e "${YELLOW}=============================${RESET}"
        echo -e "${CYAN}       🎭 ART MENU       ${RESET}"
        echo -e "${YELLOW}=============================${RESET}"
        echo -e "${GREEN}1) ⚽ Soccer${RESET}"
        echo -e "${GREEN}2) 🏀 Basketball${RESET}"
        echo -e "${GREEN}3) 🚴‍♂ Cycling${RESET}"
        echo -e "${GREEN}4) 🚪 Exit${RESET}"
        echo -e "${YELLOW}=============================${RESET}"
        read -p "Select a sport: " opcion

        case $opcion in
            1) echo -e "${CYAN}Displaying Soccer art...${RESET}"
               cat << "EOF"
                \O/   ⚽  ¡SIIIIUUUUUUU!  
                 |     
                / \    
               ( CR7 ) 
EOF
               ;;
            2) echo -e "${CYAN}Displaying Basketball art...${RESET}"
               cat << "EOF"
                  O
                 /|\
                 / \
                🏀 Basketball!
EOF
               ;;
            3) echo -e "${CYAN}Displaying Cycling art...${RESET}"
               cat << "EOF"
                🚴‍♂
                🚴‍♂💨
EOF
               ;;
            4) echo -e "${RED}Exiting the art menu...${RESET}"
               break
               ;;
            *) echo -e "${RED}❌ Invalid option, try again...${RESET}" ;;
        esac
        read -p "Press Enter to return to the menu..."
    done
    welcome
}

install() {
    if [ -z "$1" ]; then
        echo -e "${RED}❌ You must specify an app name or path. Usage: install <app_name>${RESET}"
        return
    fi
    local shell_dir="$(dirname "$(realpath "$0")")"
    local install_dir="$shell_dir/$1"
    if [ -e "$install_dir" ]; then
        echo -e "${RED}❌ The application '$1' is already installed in '$install_dir'.${RESET}"
        return
    fi
    echo -e "${CYAN}📂 Installing application '$1'...${RESET}"
    echo -e "${CYAN}📁 Creating directory: $install_dir${RESET}"
    mkdir -p "$install_dir"
    echo -e "${CYAN}📄 Creating files:${RESET}"
    echo -e "${CYAN}  - config.txt${RESET}"
    touch "$install_dir/config.txt"
    echo -e "${CYAN}  - readme.txt${RESET}"
    touch "$install_dir/readme.txt"
    echo -e "${CYAN}  - info.txt${RESET}"
    touch "$install_dir/info.txt"
    echo -e "Installation of the application $1" > "$install_dir/config.txt"
    echo -e "This is the README file for the application $1" > "$install_dir/readme.txt"
    echo -e "Additional information about $1" > "$install_dir/info.txt"
    echo -e "${GREEN}✅ The application '$1' has been successfully installed in '$install_dir'.${RESET}"
}

uninstall() {
    if [ -z "$1" ]; then
        echo -e "${RED}❌ You must specify a path. Usage: uninstall <path>${RESET}"
        return
    fi
    if [ ! -e "$1" ]; then
        echo -e "${RED}❌ The directory or file '$1' does not exist.${RESET}"
        return
    fi
    echo -e "${CYAN}🗑  Uninstalling application '$1'...${RESET}"
    echo -e "${CYAN}📁 Deleting directory: $1${RESET}"
    rm -rf "$1"
    echo -e "${GREEN}✅ The application '$1' and its contents have been successfully removed.${RESET}"
}

current_date() {
    echo -e "${BLUE}📅 Current date and time: $(date '+%Y-%m-%d %H:%M:%S')${RESET}"
}

game() {
    while true; do
        clear
        echo -e "${YELLOW}=============================${RESET}"
        echo -e "${CYAN}      🎮 GAME MENU      ${RESET}"
        echo -e "${YELLOW}=============================${RESET}"
        echo -e "${GREEN}1) 🏀 NSnake${RESET}"
        echo -e "${GREEN}2) 🚀 Tint${RESET}"
        echo -e "${GREEN}3) 👾 Pacman4console${RESET}"
        echo -e "${GREEN}4) 🚪 Exit${RESET}"
        echo -e "${YELLOW}=============================${RESET}"
        read -p "Select a game: " option

        case $option in
            1) if command -v nsnake &> /dev/null; then clear; nsnake
               else echo -e "${RED}❌ nsnake is not installed.${RESET}"
                    echo -e "${YELLOW}💡 You can install it with: sudo apt install nsnake${RESET}"
               fi ;;
            2) if command -v tint &> /dev/null; then clear; tint
               else echo -e "${RED}❌ Tint is not installed.${RESET}"
                    echo -e "${YELLOW}💡 You can install it with: sudo apt install tint${RESET}"
               fi ;;
            3) if command -v pacman4console &> /dev/null; then clear; pacman4console
               else echo -e "${RED}❌ Pacman4console is not installed.${RESET}"
                    echo -e "${YELLOW}💡 You can install it with: sudo apt install pacman4console${RESET}"
               fi ;;
            4) echo -e "${RED}Exiting the game menu...${RESET}"; break ;;
            *) echo -e "${RED}❌ Invalid option, please try again...${RESET}" ;;
        esac
        read -p "Press Enter to return to the menu..."
    done
    welcome
}

matrix() {
    echo -e "${RED}⚠ WARNING: SportsOS is about to be terminated!${RESET}"
    sleep 2
    echo -e "${YELLOW}💀 Initiating MATRIX process...${RESET}"
    sleep 2
    echo -e "${CYAN}🟢 The system is being overridden...${RESET}"
    sleep 3
    cmatrix -C green -u 15 
    kill -9 $$
}

help() {
    if command -v lynx &> /dev/null; then
        lynx "https://www.gnu.org/software/bash/manual/bash.html"
    else
        echo -e "${RED}❌ Lynx is not installed. Install it with 'sudo apt install lynx'.${RESET}"
    fi
}

if [ "$#" -gt 0 ]; then
    case "$1" in
        install) install "$2" ;;
        uninstall) uninstall "$2" ;;
        date) current_date ;;
        art) art ;;
        game) game ;;
        help) help ;;
        matrix) matrix ;;
        *) echo -e "${RED}❌ Invalid command. Run without arguments for interactive mode.${RESET}" ;;
    esac
    exit 0
fi

welcome
while true; do
    echo -ne "${CYAN}⚽ SportsOS-> ${RESET}"
    read -r -a args
    command="${args[0]}"
    arguments="${args[@]:1}"
    case $command in
        install) install "$arguments" ;;
        uninstall) uninstall "$arguments" ;;
        date) current_date ;;
        art) art ;;
        game) game ;;
        help) help ;;
        matrix) matrix ;;
        exit) echo -e "${RED}Exiting...${RESET}"; break ;;
        *) eval "$command $arguments" ;;
    esac
done
