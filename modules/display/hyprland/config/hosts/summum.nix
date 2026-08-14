{...}: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
    	"DP-2, 2560x1440@164.55400, 0x0, 1"
	"HDMI-A-1, 1920x1080@143.98, 2560x360, 1"
	# "HDMI-A-1, preferred, auto, 1"
	];

    workspace = [
    	"1, monitor:DP-1"
	"2, monitor:DP-1"
	"3, monitor:HDMI-A-1"
	"4, monitor:HDMI-A-1"
	];
  };
}
