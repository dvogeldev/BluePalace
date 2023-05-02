{
  description = "Home Manager Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }: {

    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    #defaultPackage = stylix.packages.x86_64-linux.stylix-nix;

    homeConfigurations = {
      "david" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
	      extraSpecialArgs = { inherit nix-colors; };

	      modules = [
	        ./home.nix
	        ./aliases.nix
	        ./programs.nix
	        ./shell.nix
	        stylix.homeManagerModules.stylix
	      ];
      };
    };
  };
}
