{pkgs, ...}: {
	imports = [
		./steam/home.nix
	];
	home.packages = [
		pkgs.deadlock-mod-manager
		];
}
