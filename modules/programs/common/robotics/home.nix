{pkgs, ...} : {
	home.packages = [pkgs.gcc-arm-embedded pkgs.pipx pkgs.gnumake];
}
