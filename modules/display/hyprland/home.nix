{pkgs, ... }: {
	imports = [ ./config/default.nix] ;
	wayland.windowManager.hyprland.enable = true;
}
