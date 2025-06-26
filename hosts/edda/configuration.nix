{user, ...}: {
	imports = [
		./hardware-configuration.nix
	];

	hardware.brillo.enable = true;

}
