export EDITOR=vim
export PATH="$HOME/bin:$PATH"

HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

bindkey "^[." insert-last-word

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

alias ls='ls --color'
alias l='ls -l'
alias ll='ls -al'

alias docker-host='docker run --rm -it --privileged --pid=host ubuntu nsenter -t 1 -m -u -n -i sh'

export GPG_TTY=$(tty)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [ "$TERM" = "screen-256color" ] && [ -n "$TMUX" ]
then
	HISTFILE="$HOME/.tmux.$(tmux display-message -p '#{session_group}#{window_index}' 2>&1).zhistory"
fi
