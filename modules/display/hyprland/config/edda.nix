{pkgs, host, lib, ...}: {
	wayland.windowManager.hyprland.settings = {
		bind = [
    ", XF86MonBrightnessDown, exec, brillo -U 5"
    ", XF86MonBrightnessUp, exec, brillo -A 5"
		]; 

	};
}
