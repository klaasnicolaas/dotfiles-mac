#!/bin/bash

#----------------------------------------------------------------------------
# Homebrew
#----------------------------------------------------------------------------
echo
echo "** Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

#----------------------------------------------------------------------------
# GitHub CLI
#----------------------------------------------------------------------------
echo
echo "** Downloading GitHub CLI"
brew install gh

#----------------------------------------------------------------------------
# Oh My Zsh
#----------------------------------------------------------------------------
echo
echo "** Installing Oh My Zsh & Oh My Posh and plugins"

# Copy the .zshrc file
ln -sf ~/dotfiles-mac/config/.zshrc ~/.zshrc

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh My Posh - theme
brew install jandedobbeleer/oh-my-posh/oh-my-posh
ln -sf ~/dotfiles-mac/config/theme.omp.json ~/.config/theme.omp.json

# Oh my ZSH - plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth 1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth 1

#----------------------------------------------------------------------------
# nvm (nodejs) & Yarn
#----------------------------------------------------------------------------
echo
echo "** Installing nvm & Yarn"
brew install nvm yarn

#----------------------------------------------------------------------------
# Pyenv (Python), UV & Poetry (Python package managers)
#----------------------------------------------------------------------------
echo
echo "** Installing Pyenv & Uv"
brew install pyenv uv poetry

# Symlink UV and Poetry to /usr/local/bin to make it available system-wide
# To fix the error: Executable `uv` not found in pre-commit
sudo ln -s /opt/homebrew/bin/uv /usr/local/bin/uv
sudo ln -s /opt/homebrew/bin/poetry /usr/local/bin/poetry

#----------------------------------------------------------------------------
# Rbenv (Ruby) & Ruby-Build
#----------------------------------------------------------------------------
echo
echo "** Installing Rbenv & Ruby-Build"
brew install rbenv ruby-build

#----------------------------------------------------------------------------
# PHP & Composer
#----------------------------------------------------------------------------
echo
echo "** Installing PHP & Composer"
brew install php composer pkg-config imagemagick

pecl install imagick
export PATH=$PATH:~/.composer/vendor/bin
