#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Turn off analytics
brew analytics off

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
echo 'Be sure to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.'
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
echo 'Add `$(brew --prefix findutils)/libexec/gnubin` to `$PATH` if you would prefer these be the defaults.'
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
echo 'Be sure to add `$(brew --prefix gnu-sed)/libexec/gnubin` to `$PATH`.'
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
echo 'If you would like to map vi so it opens the brew-installed vim: ln -s /usr/local/bin/vim /usr/local/bin/vi'
brew install grep
brew install openssh
brew install screen
brew install gmp

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
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
#brew install zopfli

#Docker
brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" virtualbox

# Development tool casks
brew cask install --appdir="/Applications" sublime-text

# Misc casks
brew cask install --appdir="/Applications" google-chrome
#brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" skype
#brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" evernote
#brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" keepassxc
brew cask install --appdir="/Applications" postman
brew cask install --appdir="/Applications" zoomus
#brew cask install --appdir="/Applications" duet
brew cask install --appdir="/Applications" adobe-acrobat-reader
#brew cask install --appdir="/Applications" viber

brew install tmux

brew install node
brew install yarn

brew install maven
brew install midnight-commander

brew insatll httpd

