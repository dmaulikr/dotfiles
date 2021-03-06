#!/usr/bin/env bash

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BRORANGE='\033[0;33m' # brown/orange
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LGRAY='\033[0;37m' # light gray

DGRAY='\033[1;30m' # dark gray
LRED='\033[1;31m' # light red
LGREEN='\033[1;32m' # light green
YELLOW='\033[1;33m'
LBLUE='\033[1;34m' # light blue
LPURPLE='\033[1;35m' # light purple
LCYAN='\033[1;36m' # light cyan
WHITE='\033[1;37m'

NC='\033[0m' # No Color

echo "${CYAN}
 ******** **      **   ******
/**///// /**     /**  **////**
/**      /**     /** **    //
/******* //**    ** /**
/**////   //**  **  /**
/**        //****   //**    **
/**         //**     //******
//           //       //////
${LGREEN}
+-+-+-+-+-+-+-+-+
|D|o|t|f|i|l|e|s|
+-+-+-+-+-+-+-+-+
${WHITE}
https://github.com/fvcproductions/dotfiles.git
${NC}
"

# downloading Apple Dev Tools
echo "${LGREEN}To run this, you must download & install the latest Xcode and Command Line Tools${NC}"
echo "    > https://developer.apple.com/xcode/"
echo "    > https://developer.apple.com/downloads/"

xcode-select --install

# function to check if a package exists
check () { type -t "${@}" > /dev/null 2>&1; }

# function to install Homebrew Formulas
install_formula () {
  DOTFILE="$HOME/Dropbox/github/dotfiles"

  echo ""
  echo "${LGREEN}Installing Homebrew Packages...${NC}"

  echo ""
  echo "  ➜ git"
  brew install git

  echo ""
  echo "  ➜ mongodb"
  brew install mongo
  mkdir $HOME/.mongodb-data

  echo ""
  echo "  ➜ nginx"
  brew install nginx

  echo ""
  echo "  ➜ node"
  brew install node

  echo ""
  echo "  ➜ openssl"
  brew install openssl

  echo ""
  echo "  ➜ python"
  brew install python

  echo ""
  echo "  ➜ zsh"
  brew install zsh

  echo ""
  echo "  ➜ youtube-dl"
  brew install youtube-dl

  echo ""
  echo "  ➜ libav"
  brew install libav

  echo ""
  echo "  ➜ duti"
  brew install duti

  # cleanup
  echo ""
  echo "${LGREEN}Cleaning up Homebrew installation...${NC}"
  brew cleanup

  yes | cp -rf $DOTFILE/bin/shell/.bashrc $HOME/.bashrc
  yes | cp -rf $DOTFILE/bin/shell/.bash_alias $HOME/.bash_alias
  yes | cp -rf $DOTFILE/bin/shell/.bash_profile $HOME/.bash_profile

  echo "${LGREEN}Installing Caskroom, Caskroom versions, Caskroom Fonts and Brew Services${NC}"
  brew install caskroom/cask/brew-cask
  brew tap homebrew/services
  brew tap caskroom/versions
  brew tap caskroom/fonts

  # Make /Applications the default location of installed Homebrew casks
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"

}

# install Hushlogin
echo ""
echo "${LGREEN}Installing hushlogin...${NC}"
echo "Disabling the system copyright notice, the date and time of the last login."
echo "More info at @mathiasbynens/dotfiles http://goo.gl/wZBM80."
echo ""
yes | cp -rf "$DOTFILE/.hushlogin" $HOME/.hushlogin
touch .hushlogin

# install Homebrew
echo ""
echo "${LGREEN}Checking if Homebrew is installed...${NC}"

if check brew; then
  echo ""
  echo "${YELLOW}Awesome! Homebrew is installed! Now updating...${NC}"
  echo ""
  brew upgrade
  brew update --all
fi

if ! check brew; then
  echo "${LGREEN}Downloading and install homebrew${NC}"
  echo ""
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # run Brew doctor before anything else
  brew doctor
fi

# install Homebrew Formulas
while true; do
  read -p "${LGREEN}Would you like to install Homebrew formulas? [y/n]${NC}" answer
  echo ""
  case $answer in
    [y/Y]* ) install_formula; break;;
    [n/N]* ) break;;
    * ) echo "${RED}Please answer Y or N.${NC}";;
  esac
done

# restart terminal to apply changes
echo ""
echo "${LGREEN}Bootstrapping complete!"
echo "Quitting terminal now...${NC}"
killall Terminal