# Add fenv to path
set fish_function_path $fish_function_path ~/plugin-foreign-env/functions

# Source Nix setup script
fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fenv source /nix/var/nix/profiles/default/etc/profile.d/nix.sh

# vim & emacs bindings
function fish_hybrid_key_bindings --description \
"Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings

alias dots='/usr/bin/git --git-dir=$HOME/dots/ --work-tree=$HOME'
alias dartls='/nix/store/kxdgginvmx43cdm3s423wayk0bppyv0v-dart-2.13.1/bin/snapshots/analysis_server.dart.snapshot --lsp'
alias doom=~/.emacs.d/bin/doom
alias cat=bat

source "~/.nvm/nvm.sh"

function fish_right_prompt
  #intentionally left blank
 end

set -gx GPG_TTY (tty)

set fish_greeting
starship init fish | source

set -g man_blink -o red
set -g man_bold -o magenta
set -g man_standout -b white 586e75
set -g man_underline -u 586e75

fish_add_path /usr/local/opt/icu4c/bin
fish_add_path /usr/local/opt/icu4c/sbin
fish_add_path /usr/local/sbin
fish_add_path /usr/local/bin/emacs

pyenv init - | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
