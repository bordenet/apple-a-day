#!/bin/bash

#==============================================================================
# bu.sh - "Brew Update" System Maintenance Script
#==============================================================================
# 
# Description: Comprehensive macOS development environment maintenance utility
# 
# This script automates routine maintenance tasks across multiple package managers
# and system components. Originally created as a shorthand for "brew update" but
# has evolved into a complete system maintenance solution for macOS development
# environments.
#
# Usage: ./bu.sh
#
# What it does:
#   - Updates and upgrades Homebrew packages and casks
#   - Performs system health checks via brew doctor
#   - Updates Atom packages (apm)
#   - Updates global npm packages and bower dependencies
#   - Updates Mac App Store applications via mas
#   - Resets and updates all GitHub repositories
#   - Updates Python pip packages (both pip and pip3)
#   - Installs macOS system software updates
#   - Performs cleanup operations
#
# Prerequisites:
#   - macOS operating system
#   - Homebrew installed (https://docs.brew.sh/Installation)
#   - Optional: mas, npm, pip, apm for respective package management
#   - Administrative privileges (script uses sudo)
#
# Features:
#   - Comprehensive package manager coverage
#   - Automatic cleanup and maintenance
#   - Repository synchronization
#   - System software updates
#   - Easy to type filename for quick execution
#
# Author: Matt Bordenet
# Created: 2017-01-23
# Modified: 2025-04-02
#
# Note: This script requires sudo privileges and will prompt for authentication.
#       Script is designed to be saved across multiple Macs for consistent
#       maintenance routines.
#
#==============================================================================

sudo ls
clear
brew update
brew upgrade
brew cleanup -s
brew upgrade --cask
brew untap homebrew/cask

brew doctor
brew missing
apm upgrade -c false

bower update
npm update -g --force
npm install -g npm --force

brew install mas
mas outdated
echo "install with: mas upgrade"
mas upgrade

pushd ~/GitHub > /dev/null
./reset_all_repos.sh -f
popd > /dev/null

sudo -H pip install --upgrade pip
sudo -H pip3 install --upgrade pip

#~/GitHub/fetch-github-projects.sh
sudo softwareupdate --all --install --force -R

# /bin/rm /Users/mattbordenet/Library/Mobile\ Documents/com\~apple\~CloudDocs/Backups/pass/*.plk
