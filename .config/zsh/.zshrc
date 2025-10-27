# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH

### ZINIT INSTALL AND SOURCE ###
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Enable colors and change prompt:
# autoload -U colors && colors	# Load colors

# Luke Smith PS1
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode

zinit ice depth=1; zinit light romkatv/powerlevel10k
#     ice = add          light vs load; light is lighter (duh) and load
#     			 gives more diagnostics


# History
HISTSIZE=100000
if [[ ! -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh" ]]; then
	mkdir "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/"
fi


HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt inc_append_history
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

setopt autocd		# Automatically cd into typed directory.


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# bind ctrl-f to accept suggestion
bindkey '^f' autosuggest-accept

# emac specific search
# bindkey '^p' history-searh-backward
# bindkey '^n' history-searh-forward
# vi mode fuck you
# bindkey -v

source $XDG_CONFIG_HOME/zsh/aliasrc

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
