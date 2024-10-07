{pkgs, ...}: {
	imports = [
		./steam/default.nix
	];
	environment.systemPackages = [ pkgs.wine ];
}
