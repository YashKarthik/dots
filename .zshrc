# Path to your oh-my-zsh installation.
export YARN_IGNORE_NODE=1

# Profiling
# zmodload zsh/datetime
# setopt PROMPT_SUBST
# PS4='+$EPOCHREALTIME %N:%i> '

# logfile=$(mktemp zsh_profile.XXXXXXXX)
# echo "Logging to $logfile"
# exec 3>&2 2>$logfile
# 
# setopt XTRACE

# User configs
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias vim=nvim
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias cat='bat --theme=ansi --color=always'
alias python=python3

bindkey -v
bindkey -e
# yes i'm evil

eval "$(starship init zsh)"
export EDITOR=nvim

# Profiling stuff
# unsetopt XTRACE
# exec 2>&3 3>&-

# Volta (node version manager)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export STM32CubeMX_PATH=/Applications/STMicroelectronics/STM32CubeMX.app/Contents/Resources
export MACOSX_DEPLOYMENT_TARGET="12.6"
export VERILATOR_ROOT=/usr/local/share/verilator

# Created by `pipx` on 2024-06-20 17:55:11
export PATH="$PATH:/Users/Yash/.local/bin"
path+=('/Users/Yash/.apio/packages/tools-oss-cad-suite/bin/')

source <(fzf --zsh)

# FZF color config for Solarized Light
export FZF_DEFAULT_OPTS="
  --layout=reverse
  --color=bg+:#eee8d5,bg:#fdf6e3,spinner:#268bd2,hl:#268bd2
  --color=fg:#657b83,header:#b58900,info:#859900,pointer:#2aa198
  --color=marker:#d33682,fg+:#586e75,prompt:#cb4b16,hl+:#268bd2
"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

bindkey -r '^[c'  # Remove the default ALT-C binding
bindkey '^[d' fzf-cd-widget  # Bind ALT-D to the cd functionality
