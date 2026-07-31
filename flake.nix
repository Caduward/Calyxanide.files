{
 description = "GITHUB + UNSTABLE"; 
    inputs = {
	nixpkgs.url = "nixpkgs/nixos-26.05";
	nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
	home-manager = {
	  url = "github:nix-community/home-manager/release-26.05";
	  inputs.nixpkgs.follows = "nixpkgs";
    };
};
    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... } @ inputs:
let
system = "x86_64-linux";
pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

in
{
	nixosConfigurations.terminus = nixpkgs.lib.nixosSystem
  {
	inherit system;
	    modules = [
		./configuration.nix
		{nixpkgs.config = {allowUnfree = true;};}
		home-manager.nixosModules.home-manager {
		    home-manager = {
			useGlobalPkgs = true;
			useUserPackages = true;
			users.cadu = import ./home.nix;
			backupFileExtension = "backup";
	             		    }; 
  }
		
		       ];
	specialArgs = {
	  inherit pkgs-unstable;
	};
      };
    };
#
}
