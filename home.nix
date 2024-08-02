{ pkgs, ... }:

{
  home.username = "mwyerman";
  home.homeDirectory = "/Users/mwyerman";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.gnumake
    pkgs.cmake
    pkgs.eza
    pkgs.fzf
    pkgs.ripgrep
    pkgs.wget
    pkgs.fd

    # dev
    pkgs.rustup
  ];

  imports = [ ./packages ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
