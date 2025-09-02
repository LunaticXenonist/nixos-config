{
	lib, 
	inputs, 
	user, 
	sysPkgs,
	...
}: let 
	findModules = suffix: modules: 
		builtins.filter builtins.pathExists (
			builtins.map (path: path + suffix) modules);
	findHomeModules = findModules "/home.nix";
	findSysModules = findModules "/default.nix";

	mkHM = host: modules: {
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.extraSpecialArgs = {
			inherit user inputs host; };
		home-manager.users.${user} = {
			imports = findHomeModules modules
			++ lib.optional (builtins.pathExists ./${host}/home.nix) ./${host}/home.nix;
		};
	};

	mkHost = {
		host, 
		system, 
		modules ? [],
	}:
		lib.nixosSystem {
			pkgs = sysPkgs.${system};
			specialArgs = {
				inherit user inputs host;
			};
			modules = 
				findSysModules modules 
				++ [
					./configuration.nix
					./${host}/configuration.nix
					(mkHM host modules)
				];
		};

	moduleSets = {
		common = {
			modules = [
			../modules/gaming
			../modules/env
			../modules/home-manager
			../modules/display
			../modules/theming
			../modules/programs/common
			];
		};
    edda = {
      modules = [
        ../modules/laptop/framework/13/ai300
        ../modules/laptop/common
        ../modules/programs/edda
        ];
    };
	};
  in {
	summum = mkHost {
		host = "summum";
		system = "x86_64-linux";
		modules = moduleSets.common.modules;
	};
	edda = mkHost {
		host = "edda";
		system = "x86_64-linux";
		modules = moduleSets.common.modules ++ moduleSets.edda.modules;
	};
}
