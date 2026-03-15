{pkgs, ...}: {
	imports = [
		./steam/home.nix
	];
	home.packages = [pkgs.rpcs3];
}
