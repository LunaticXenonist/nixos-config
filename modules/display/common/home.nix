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
		xrandr    # lets you set the primary monitor (and wlr-randr doesnt)
	];
}
