#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependenceis needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew); then
  echo "  x You should probably install Homebrew first:"
  echo "    http://brew.sh"
  exit
fi

# Install Homebrew packages
brew install grc coreutils

exit 0
