{pkgs, host, lib, ...}: {
  imports = [
    ./binds.nix
    ./exec-once.nix
    ./hyprpaper.nix
  ] ++ lib.optional (builtins.pathExists ./hosts/${host}.nix) ./hosts/${host}.nix;
	wayland.windowManager.hyprland.settings = {
		bindm = [
		"SUPER, mouse:272, movewindow"
		"SUPER, mouse:273, resizewindow"
		];
		windowrule = [
		"suppressevent maximize, class:.*"
		];
		decoration = {
			rounding = 10;
		};
		general = {
			gaps_in = 5;
			gaps_out = 10;
			border_size = 2;
			"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
			"col.inactive_border" = "rgba(595959aa)";
		};
	};
}
