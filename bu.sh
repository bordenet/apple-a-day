#!/bin/bash

#
# I save this across my Macs as "bu.sh" bc it's easy to type. This script originated as a shorthand for "brew update"
# Stuff folks other than me are likely to use is now commented out
# Pre-requisite: install brew: https://docs.brew.sh/Installation
#
brew update
brew upgrade
brew cleanup -s
brew upgrade --cask

brew doctor
brew missing

# apm upgrade -c false

# bower update
# npm update -g --force
# npm install -g npm --force

# mas outdated
# echo "install with: mas upgrade"
# mas upgrade

# sudo -H pip install --upgrade pip
# sudo -H pip3 install --upgrade pip

# /Users/matt/GitHub/fetch-github-projects.sh

sudo softwareupdate --all --install --force -R
