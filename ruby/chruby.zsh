if ! $(brew &>/dev/null); then
  source `brew --prefix`/opt/chruby/share/chruby/chruby.sh
  source `brew --prefix`/opt/chruby/share/chruby/auto.sh
  chruby $(cat ~/.ruby-version)
fi
