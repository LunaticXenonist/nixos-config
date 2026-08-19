{pkgs, ... }: {
	imports = [ ./config/home.nix] ;
	wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.configType = "hyprlang";
        xdg.userDirs.setSessionVariables = true;
}
