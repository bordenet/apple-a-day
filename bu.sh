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

brew doctor
brew missing

# Update Atom packages if apm is available
if command -v apm &> /dev/null; then
  apm upgrade -c false
else
  echo "apm not found, skipping Atom package updates"
fi

# Update bower and npm if available
if command -v bower &> /dev/null; then
  bower update
else
  echo "bower not found, skipping bower updates"
fi

if command -v npm &> /dev/null; then
  npm update -g --force
  npm install -g npm --force
else
  echo "npm not found, skipping npm updates"
fi

# Install mas if not already installed, then update Mac App Store apps
if ! command -v mas &> /dev/null; then
  brew install mas
fi
mas outdated
echo "install with: mas upgrade"
mas upgrade

# Update GitHub repositories using local script
if [ -x "./reset_all_repos.sh" ]; then
  ./reset_all_repos.sh -f ~/GitHub
else
  echo "reset_all_repos.sh not found or not executable, skipping repository resets"
fi

# Update pip packages if pip is available
if command -v pip &> /dev/null; then
  sudo -H pip install --upgrade pip
else
  echo "pip not found, skipping pip updates"
fi

if command -v pip3 &> /dev/null; then
  sudo -H pip3 install --upgrade pip
else
  echo "pip3 not found, skipping pip3 updates"
fi

# Optionally run fetch-github-projects.sh
# ./fetch-github-projects.sh

sudo softwareupdate --all --install --force -R
