local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg_bold[green]%}%~%{$reset_color%} %{$reset_color%}$(git_prompt_info)%{$reset_color%}%B$%b '

if which rbenv &> /dev/null; then
  PROMPT='%{$fg_bold[green]%}%~%{$reset_color%} %{$fg_bold[blue]%}($(rbenv version | sed -e "s/ (set.*$//"))%{$reset_color%} $(git_prompt_info)%{$reset_color%}%B$%b '
fi
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
