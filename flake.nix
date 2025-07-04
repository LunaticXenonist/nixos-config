{
  description = "LunaticXenonist's Flake for NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

   nixos-hardware = {
	url = "github:NixOS/nixos-hardware";
   };
    home-manager = {
    	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
    	url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
	inputs.nixpkgs.follows = "nixpkgs";
    };
	

  };

  outputs = {...}@inputs: let 
   		lib = inputs.nixpkgs.lib;
		user = "cole";
		systems = ["x86_64-linux"];
		eachSystem = lib.genAttrs systems;
		sysPkgs = eachSystem (system: 
			import inputs.nixpkgs {
			system = "x86_64-linux";
			config.allowUnfree = true;
		});
  	in { 
		nixosConfigurations = import ./hosts/default.nix {
			inherit lib user inputs sysPkgs;
    		};
  	};
}
