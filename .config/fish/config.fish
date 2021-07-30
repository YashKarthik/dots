# Add fenv to path
set fish_function_path $fish_function_path ~/plugin-foreign-env/functions

# Source Nix setup script
fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fenv source /nix/var/nix/profiles/default/etc/profile.d/nix.sh

fish_vi_key_bindings

alias neo=nvim
alias vim=nvim
alias python=~/anaconda3/bin/python
alias reddit=ttrv
alias dots='/usr/bin/git --git-dir=$HOME/dots/ --work-tree=$HOME'
alias dartls='/nix/store/kxdgginvmx43cdm3s423wayk0bppyv0v-dart-2.13.1/bin/snapshots/analysis_server.dart.snapshot --lsp'
alias zathura=~/Code/zath.py

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
#
# Solarized Light & Magenta highlight
set -g man_blink -o red
set -g man_bold -o magenta
set -g man_standout -b white 586e75
set -g man_underline -u 586e75

