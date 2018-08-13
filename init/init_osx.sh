#!/usr/bin/env bash
# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install Xcode command line tools
xcode-select --install

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"

# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'

# Change to the new shell, prompts for password
# chsh -s /usr/local/bin/bash

# Install zsh
brew install zsh zsh-completions

# Change to the new shell
chsh -s $(which zsh)
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Install `wget` with IRI support.
brew install wget --with-iri

# Install Python
brew install python
brew install python3

# Install more recent versions of some OS X tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/php71 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install thefuck
brew install ack
brew install dark-mode
brew install git
brew install git-lfs
brew install git-flow
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install pkg-config libffi
brew install tmux
brew install ngrep
brew install fzf
/usr/local/opt/fzf/install
brew tap homebrew/science
brew install r
brew install reattach-to-user-namespace
brew install brew-gem
brew gem install tmuxinator
brew install wrk
brew install neovim/neovim/neovim
brew install libevent

brew tap buo/cask-upgrade

# Install Cask
brew install caskroom/cask/brew-cask

# Misc casks
brew cask install --appdir="/Applications" adobe-reader
brew cask install --appdir="/Applications" diffmerge
brew cask install --appdir="/Applications" easyfind
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" filezilla
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" google-drive
brew cask install --appdir="/Applications" google-hangouts
brew cask install --appdir="/Applications" heroku-toolbelt
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="/Applications" jdownloader
brew cask install --appdir="/Applications" limechat
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null
brew cask install --appdir="/Applications" pgadmin4
brew cask install --appdir="/Applications" f-lux
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" sourcetree
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="~/Applications" transmit
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="~/Applications" vlc
brew cask install --appdir="~/Applications" the-unarchiver
brew cask install --appdir="~/Applications" db-browser-for-sqlite


# List of useful Quick Look plugins for developers
brew cask install --appdir="~/Applications" qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Glances an Eye on your system
pip install glances

# Install data stores
brew install mysql
brew install postgresql
brew install mongo

# Web Development
brew install node
npm install -g coffee-script
npm install -g grunt-cli
npm install -g jshint
npm install -g jscs
npm install -g eslint
npm install -g less
npm install -g nodemon
npm install -g bower
npm install -g mongodb
npm install -g mongoose
npm install -g js-beautify
npm install -g gulp-cli
sudo npm install -g cordova
npm install -g ios-deploy
npm install -g flow-bin
npm install -g underscore-cli
npm install -g aws-sam-local

# Sound
brew install sox
brew install vorbis-tools

# AWS
pip3 install awscli
pip3 install awsebcli

echo Install all AppStore Apps at first!
# no solution to automate AppStore installs
read -p "Press any key to continue... " -n1 -s
echo  '\n'
echo Install and Set San Francisco as System Font
ruby -e "$(curl -fsSL https://raw.github.com/wellsriley/YosemiteSanFranciscoFont/master/install)"
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew install wget
brew install gobrew
brew install ant
brew install ffmpeg
brew install eigen
brew install opencv

sudo npm install -g gitjk
sudo npm install -g cordova

# cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
