{pkgs, ...}: {
	imports = [
		./mako/home.nix
		./waybar/home.nix
		./wofi/home.nix
	];

	home.packages = with pkgs; [
		copyq
		wl-clipboard
		wlr-randr
	];
}
