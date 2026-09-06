{pkgs, ... }: {
	imports = [ ./configlua/home.nix];
	wayland.windowManager.hyprland.enable = true;
        xdg.userDirs.setSessionVariables = true;
}
