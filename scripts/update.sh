#!/bin/bash
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

function zshup(){
  #update zsh plugins
  printf "${BLUE}Updating Zsh Plugins${NC}\n"
  (cd $HOME/.zsh;
  curl -JLO https://github.com/ohmyzsh/ohmyzsh/raw/master/plugins/git/git.plugin.zsh;
  curl -JLO https://github.com/ohmyzsh/ohmyzsh/raw/master/plugins/sudo/sudo.plugin.zsh;
  git submodule update --init --recursive --remote --merge)
}

function kittyup(){
  printf "${BLUE}Updating kitty theme${NC}\n"
  (cd $HOME/.config/kitty;
  curl -JLO https://raw.githubusercontent.com/catppuccin/kitty/main/catppuccin.conf;
  sed -i'' -e '/macos_titlebar_color/d' catppuccin.conf)
  #sed -i '/macos_titlebar_color/d' catppuccin.conf)
}

function rofiup(){
  #update rofi theme/config
  printf "${BLUE}Updating Rofi theme/config${NC}\n"
  (cd $HOME/.config/rofi; 
  curl -JLO https://raw.githubusercontent.com/catppuccin/rofi/main/.config/rofi/config.rasi;
  curl -JLO https://raw.githubusercontent.com/catppuccin/rofi/main/.local/share/rofi/themes/catppuccin.rasi
  sed -i '/font: \"/c\    font: \"Liga SFMono Nerd Font 9\";' config.rasi)
}
function discordup(){
  #update betterdiscord theme
  printf "${BLUE}Updating BetterDiscord theme${NC}\n"
  (cd $HOME/.config/BetterDiscord/themes;
  curl -JLO https://raw.githubusercontent.com/catppuccin/discord/main/Catppuccin.theme.css)
}
function theosup(){
  #update theos
  printf "${BLUE}Updating Theos${NC}\n"
  $THEOS/bin/update-theos
}
function evillineup(){
  #update evil_lualine
  printf "${BLUE}Updating evil_lualine${NC}\n"
  (cd $HOME/.config/nvim/lua; 
  curl -JLO https://raw.githubusercontent.com/nvim-lualine/lualine.nvim/master/examples/evil_lualine.lua;
  patch evil_lualine.lua < evil.diff)
}
function paruup(){
  #update system
  printf "${BLUE}Updating System${NC}\n"
  paru
}
function brewup(){
  #update system
  printf "${BLUE}Updating System${NC}\n"
  (brew upgrade;brew update;brew upgrade --cask)
}

#check if arguments are provided
if [ $# -ne 0 ]
then
  echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
  #check internet access
  if [ $? -eq 0 ]; then
    #create valid function list
      for valid in $(compgen -A function);do
        validarr+=(${valid})
      done
      for arg in "$@"
      do
        #call function if found
        func="${arg}up"
        if [[ " ${validarr[*]} " =~ " ${func} " ]]; then
          ${func}
        else
          printf "${RED}Update function not found${NC}\n"
        fi
      done
  else
      printf "${RED}Unable to update, Internet Unaccessible${NC}\n"
  fi
else
  printf "${RED}No arguments supplied${NC}\n"
fi
