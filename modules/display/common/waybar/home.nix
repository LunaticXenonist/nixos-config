{...}: {
	programs.waybar = {
		enable = true;
		settings.main = {
			layer = "top";
			position = "top";
			height = 30;

			modules-right = [ "pulseaudio" "cpu" "memory" "clock" "tray"];

			modules-left = ["sway/workspaces" "hyprland/workspaces"];
			modules-center = ["sway/window" "hyprland/window"];

			clock = {
				tooltip-format = "<big>{:%Y %B} </big>\n<tt><small>{calendar}</small></tt>";
				format = "{:%I %M %p}";
				format-alt = "{:%b %d (%a)}";
			};

			tray = {
				spacing = 10;
			};
		};
		#style = ./style.css
	};
}
