{pkgs, ... }: {
	imports = [
		./waybar/home.nix
		./wofi/home.nix
		./mako/home.nix
	];

	home.packages = with pkgs; [
		copyq
		wl-clipboard
		wlr-randr
	];
	
	programs.waybar.settings.main = {
		modules-left = ["sway/workspaces"];
		modules-center = ["sway/window"];
	};
}
