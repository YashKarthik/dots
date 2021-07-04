{ config, pkgs, lib, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "Yash";
  home.homeDirectory = "/Users/Yash";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  home.packages = [
	pkgs.zathura
	pkgs.cmatrix
	pkgs.girara
	pkgs.fish
	pkgs.gh
        pkgs.luajit
	pkgs.cmake
        pkgs.neovim-nightly
        pkgs.pinentry_mac
	pkgs.starship
	pkgs.tree
	pkgs.qutebrowser
	pkgs.dart
	pkgs.nodejs
	pkgs.onefetch
  ];


 nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

}
