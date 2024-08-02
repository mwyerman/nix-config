{
  description = "Home Manager Config";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
    lib = nixpkgs.lib;
      # TODO make this cross platform
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations = {
        mwyerman = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  modules = [
	    ./home.nix
	  ];
	};
      };
    };
}
