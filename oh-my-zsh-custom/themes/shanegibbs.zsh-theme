local ret_status="%(?:%{$fg_bold[green]%}§ :%{$fg_bold[red]%}⨯ %s)"
PROMPT='
%{$fg_bold[green]%}%n@%M%{$reset_color%} %{$fg_bold[blue]%}%~ $(git_prompt_info)
${ret_status}%{$fg_bold[blue]%}%{$fg_bold[blue]%}%{$reset_color%}'
# »
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
