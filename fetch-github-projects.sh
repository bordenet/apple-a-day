#!/bin/bash

#==============================================================================
# fetch-github-projects.sh
#==============================================================================
# 
# Description: Automated Git repository updater for GitHub projects
# 
# This script iterates through all Git repositories in the ~/GitHub directory
# and performs a git pull operation on each repository to keep local copies
# synchronized with their remote counterparts.
#
# Usage: ./fetch-github-projects.sh
#
# Prerequisites:
#   - Git installed and configured
#   - Valid Git repositories in ~/GitHub directory
#   - Proper authentication for private repositories
#
# Author: Matt Bordenet
# Created: 2023-10-01
# Modified: 2023-10-01
#
# Notes:
#   - Script changes directory context using pushd/popd for clean navigation
#   - Commented git maintenance start command available for optional use
#   - Current working directory is preserved after execution
#
#==============================================================================

pushd ~/GitHub
for filename in /Users/matt/GitHub/*/; do
  pushd $filename
  echo $(pwd)
#  git maintenance start
  git pull
  popd
done
popd

