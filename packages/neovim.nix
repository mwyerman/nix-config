{ pkgs, config, ... }:
{

  home.packages = [
    # lua runtime
    pkgs.luarocks
    pkgs.lua5_1

    # lua lsp
    pkgs.luajitPackages.lua-lsp
    pkgs.stylua

    # nix lsp
    pkgs.nixd
    pkgs.nixfmt-rfc-style

    # c lsp
    pkgs.clang-tools

    # python lsp
    pkgs.pyright
    pkgs.black
    pkgs.isort

    # rust lsp # these should be handled by rustup
    # pkgs.rust-analyzer
    # pkgs.rustfmt

    # misc markup lsp
    pkgs.vscode-langservers-extracted
    pkgs.yaml-language-server

    pkgs.nodePackages.prettier

  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.file = {
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/dotfiles/nvim";
    };
  };
}
