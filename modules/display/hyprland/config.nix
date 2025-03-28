{pkgs, ...}: {
	wayland.windowManager.hyprland.settings = {
		exec-once = "waybar && mako";
		monitor = [ "DP-2, 2560x1440@164.55400, 0x0, 1"];
		bind = [
		"SUPER, r, exec, wofi --show=run"
		"SUPER, q, exec, kitty"
		"SUPER, c, killactive"
		"SUPER, m, exit"
		"SUPER, f, fullscreen"
		"SUPER, 1, workspace, 1"
		"SUPER, 2, workspace, 2"
		"SUPER, 3, workspace, 3"
		"SUPER, 4, workspace, 4"
		"SUPER, 5, workspace, 5"
		"SUPER, 6, workspace, 6"
		"SUPER, 7, workspace, 7"
		"SUPER, 8, workspace, 8"
		"SUPER, 9, workspace, 9"
		"SUPER, 0, workspace, 10"
		"SUPER SHIFT, 1, movetoworkspace, 1"
		"SUPER SHIFT, 2, movetoworkspace, 2"
		"SUPER SHIFT, 3, movetoworkspace, 3"
		"SUPER SHIFT, 4, movetoworkspace, 4"
		"SUPER SHIFT, 5, movetoworkspace, 5"
		"SUPER SHIFT, 6, movetoworkspace, 6"
		"SUPER SHIFT, 7, movetoworkspace, 7"
		"SUPER SHIFT, 8, movetoworkspace, 8"
		"SUPER SHIFT, 9, movetoworkspace, 9"
		"SUPER SHIFT, 0, movetoworkspace, 10"
		"SUPER, mouse_down, workspace, e+1"
		"SUPER, mouse_up, workspace, e-1"
		];
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
			gaps_out = 20;
			border_size = 2;
			"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
			"col.inactive_border" = "rgba(595959aa)";
		};
	};
}
