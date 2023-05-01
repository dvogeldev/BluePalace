{
  description = "Home Manager Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {

    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations = {
      "david" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

	modules = [
	  ./home.nix
	  ./aliases.nix
	  ./programs.nix
	  ./shell.nix
	];
      };
    };
  };
}
