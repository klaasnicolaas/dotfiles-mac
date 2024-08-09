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
echo "** Installing Oh My Zsh & powerlevel10k and plugins"

# Copy the .zshrc file
ln -sf ~/dotfiles-mac/config/.zshrc ~/.zshrc

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh my ZSH - theme
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k --depth 1
ln -sf ~/dotfiles-mac/config/.p10k.zsh ~/.p10k.zsh

# Oh my ZSH - plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth 1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth 1

#----------------------------------------------------------------------------
# Pyenv (Python) & Uv (Python package manager)
#----------------------------------------------------------------------------
echo
echo "** Installing Pyenv & Uv"
brew install pyenv uv

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
