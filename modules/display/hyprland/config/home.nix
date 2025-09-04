{pkgs, host, lib, ...}: {
  imports = [
    ./binds.nix
    ./exec-once.nix
    ./hyprpaper.nix
  ];
	wayland.windowManager.hyprland.settings =
    let
      monitors = {
        summum = ["DP-2, 2560x1440@164.55400, 0x0, 1"];
        edda = ["eDP-1, 2880x1920@120.00000, 0x0, 2"];
      };
    in {
		  monitor = monitors.${host};

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
