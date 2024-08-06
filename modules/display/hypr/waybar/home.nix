{...}: {
	programs.waybar = {
		enable = true;
		settings.main = {
			layer = "top";
			position = "top";
			height = 30;

			modules-right = [ "pulseaudio" "cpu" "memory" "clock" "tray"];

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
