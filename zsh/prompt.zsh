autoload colors && colors

if (( $+commands[git] )); then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$($git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]; then
    echo ""
  else
    if [[ "$st" =~ ^nothing ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info() {
  ref=$($git symbolic-ref HEAD 2>/dev/null) || return
  echo "${ref#refs/heads/}"
}

unpushed() {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push() {
  if [[ "$(unpushed)" == "" ]]; then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

rb_prompt() {
  if (( $+functions[chruby] )); then
    version=$(chruby | grep -e "^ \*" | cut -d" " -f3- 2>/dev/null)
    if [[ "$version" == "" ]] then version="-" fi

    echo "%{$fg_bold[yellow]%}$version%{$reset_color%}"
  else
    echo ""
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

export PROMPT=$'\n$(rb_prompt) in $(directory_name) $(git_dirty)$(need_push)\n› '

precmd() {
  title "zsh" "%m" "%55<...<%~"
}
