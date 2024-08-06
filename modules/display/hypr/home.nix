{pkgs, ... }: {
	imports = [
		./waybar/home.nix
		./wofi/home.nix
		./hyprland/config.nix
	];

	home.packages = with pkgs; [
		copyq
		wl-clipboard
		wlr-randr
	];
	
	programs.waybar.settings.main = {
		modules-left = ["hyprland/workspaces"];
		modules-center = ["hyprland/window"];
	};
}
