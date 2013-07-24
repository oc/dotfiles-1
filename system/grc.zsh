if $(grc &>/dev/null) && ! $(brew &>/dev/null); then
  source `brew --prefix`/etc/grc.bashrc
fi
