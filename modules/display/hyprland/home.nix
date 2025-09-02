{pkgs, ... }: {
	imports = [ ./config/home.nix] ;
	wayland.windowManager.hyprland.enable = true;
}
