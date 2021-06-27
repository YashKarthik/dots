# Add fenv to path
set fish_function_path $fish_function_path ~/plugin-foreign-env/functions

# Source Nix setup script
fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fenv source /nix/var/nix/profiles/default/etc/profile.d/nix.sh

set -g -x PATH /usr/local/bin $PATH
fish_vi_key_bindings

alias neo=nvim
alias vim=nvim
alias python=~/anaconda3/bin/python
alias reddit=ttrv
alias qb=/Applications/Neo.app/Contents/MacOS/qutebrowser
alias dots='/usr/bin/git --git-dir=$HOME/dots/ --work-tree=$HOME'

function fetch 
	sh ~/Code/pfetch/pfetch
end

function fish_right_prompt
  #intentionally left blank
 end

set -gx GPG_TTY (tty)

set fish_greeting
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/Yash/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
