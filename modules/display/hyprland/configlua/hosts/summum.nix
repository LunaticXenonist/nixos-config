{...}: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
    	"DP-2, 2560x1440@164.55400, 0x0, 1"
	"DP-1, 1920x1080@143.98, 2560x360, 1"
	"HDMI-A-1, preferred, auto, 1"
	];

    workspace = [
    	"1, monitor:DP-2"
	"2, monitor:DP-2"
	"3, monitor:DP-1"
	"4, monitor:DP-1"
	];
  };
}
