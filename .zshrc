export ZSH="$HOME/.oh-my-zsh"

# mira, fino, af-magic
# ZSH_THEME="fino"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git 
  command-not-found
  zsh-autosuggestions
  web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;6D" backward-word
bindkey "^[[1;6C" forward-word

export FONT="DroidSansM Nerd Font"
export GTK_THEME=Adwaita:dark
export EDITOR=nvim
export CONFDIR="~/source/setup/.dotfiles"
export PATH=$PATH:~/.cargo/bin/

alias vim="$EDITOR"
alias vi="$EDITOR"

alias cls='clear'
alias la='ls -la'
alias sudoe='sudo -E -s'
alias cd="z"

alias clip='xclip -se c'
alias paste='xclip -se c -o'

alias hy="Hyprland"
alias edc="$EDITOR $CONFDIR"
alias vh="$EDITOR ."
alias sff="proxychains firefox > /dev/null 2>&1 &"

alias copy="xclip -selection clipboard"
alias paste="xclip -selection clipboard -o"

function zle-line-init {
   marking=0
}
zle -N zle-line-init

function select-char-right {
   if (( $marking != 1 )) 
   then
       marking=1
       zle set-mark-command
   fi
   zle .forward-char
}
zle -N select-char-right

function select-char-left {
   if (( $marking != 1 )) 
   then
       marking=1
       zle set-mark-command
   fi
   zle .backward-char
}
zle -N select-char-left

function forward-char {
   if (( $marking == 1 ))
   then
       marking=0
       NUMERIC=-1 zle set-mark-command
   fi
   zle .forward-char
}
zle -N forward-char

function backward-char {
   if (( $marking == 1 ))
   then
       marking=0
       NUMERIC=-1 zle set-mark-command
   fi
   zle .backward-char
}
zle -N backward-char

function delete-char {
   if (( $marking == 1 ))
   then
       zle kill-region
       marking=0
   else
       zle .delete-char
   fi
}
zle -N delete-char

function select-word-right {
  if (( $marking != 1 )) 
  then
      marking=1
      zle set-mark-command
  fi
  zle .forward-word
}
zle -N select-word-right

function select-word-left {
  if (( $marking != 1 )) 
  then
      marking=1
      zle set-mark-command
  fi
  zle .backward-word
}
zle -N select-word-left

bindkey '^[[1;2D' select-char-left  # assuming xterm
bindkey '^[[1;2C' select-char-right # assuming xterm

bindkey '^[[1;4D' select-word-left  # assuming xterm
bindkey '^[[1;4C' select-word-right # assuming xterm

# autocomplete
autoload -U compinit && compinit

# history setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# autocompletion using arrow keys
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

neofetch 

# bun completions
[ -s "/home/nex/.bun/_bun" ] && source "/home/nex/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/nex/source/repos/JS/smmo-gt/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/nex/source/repos/JS/smmo-gt/node_modules/tabtab/.completions/electron-forge.zsh