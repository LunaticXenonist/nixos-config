{...}: {
	programs.waybar = {
		enable = true;
    systemd.enable = true;
		settings.main = {
			layer = "top";
			position = "top";
			height = 30;

			modules-right = [ "pulseaudio" "custom/player-volume" "battery" "cpu" "memory" "clock" "tray"];

			modules-left = ["sway/workspaces" "hyprland/workspaces"];
			modules-center = ["sway/window" "hyprland/window"];

			clock = {
				tooltip-format = "<big>{:%Y %B} </big>\n<tt><small>{calendar}</small></tt>";
				format = "{:%I %M %p}";
				format-alt = "{:%b %d (%a)}";
			};
			"custom/player-volume" = {
				format = " 🎵 {text} ";
    				exec = "playerctl volume | awk '{print int($1 * 1000)}'";
    				interval = "once";
				signal = 5;
    				on-scroll-up = "playerctl volume 0.01+";
    				on-scroll-down = "playerctl volume 0.01-";
    				on-click = "playerctl play-pause";
    				tooltip = false;	
			};

			tray = {
				spacing = 10;
			};
		};
		#style = ./style.css
	};
}
