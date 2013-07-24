# Uses git's autocompletion for inner commands. Assumes an install of git's bash
# `git-completion` script ad $completion below (this is where Homebrew tosses
# it, at least).
completion='$(git --prefix)/share/zsh/site-functions/_git'

if test -f $completion; then
  source $completion
fi
