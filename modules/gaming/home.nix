{pkgs, ...}: {
	imports = [
		./steam/home.nix
	];
	home.packages = [
		pkgs.rpcs3
		pkgs.deadlock-mod-manager
		];
}
