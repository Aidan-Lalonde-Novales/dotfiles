#!/bin/bash
#
# Shell Script for setting up a new Instance
#

# Upgrade Linux
sudo apt update && sudo apt -y dist-upgrade

# Configure Git
sudo apt install git
git config --global user.email "aidan.lalonde.novales@mths.ca"
git config --global user.name "Aidan-Lalonde-Novales"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global fetch.prune true

# Github & SSH
echo "Press Enter 3 times."
ssh-keygen -t ed25519 -C "aidan.lalonde.novales@mths.ca"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
echo "Copy the output from the most recent command and add it to github SSH key list. "
read any_key
echo "Type Yes."
echo "Press Enter."
read any_key
ssh -T git@github.com

# Install programs
sudo apt install tree

# NeoVim
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ..

# Install Typescript
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
command -v nvm
nvm install node --lst
nvm install-latest-npm

# Install Java
sudo apt install -y default-jdk

# Create File Structure
mkdir ~/ICS4U
mkdir ~/ICS4U/Unit1
mkdir ~/ICS4U/Unit2
mkdir ~/ICS4U/Unit3
mkdir ~/ICS4U/Assignments
cd ~

# Remove Dotfiles
sudo rm -R ~/dotfiles

# Install Github
sudo apt update
sudo apt install gh -y
gh auth login

# Ensure user is clean
echo Please take a shower immediately!
read any_key

# Restart Terminal
echo Done! Rebooting...
sudo reboot now
