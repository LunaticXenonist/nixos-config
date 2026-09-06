{pkgs, ... }: {
	imports = [ ./configlua/home.nix];
  home.packages = [pkgs.hyprshutdown];
	wayland.windowManager.hyprland.enable = true;
        xdg.userDirs.setSessionVariables = true;
}
