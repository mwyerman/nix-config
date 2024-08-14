{ pkgs, ... }:

{
  home.username = "mwyerman";
  # home.homeDirectory = "/Users/mwyerman";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/mwyerman" else "/home/mwyerman";

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
    pkgs.nodePackages.nodejs
    pkgs.nodePackages.pnpm
    pkgs.nodePackages.typescript-language-server
    pkgs.clang
    pkgs.automake
    pkgs.autoconf
    pkgs.libtool

    # compilers/interpreters
    pkgs.python3
    pkgs.python3Packages.virtualenv
    pkgs.cpputest
  ];

  imports = [ ./packages ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
