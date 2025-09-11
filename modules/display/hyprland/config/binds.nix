{pkgs, host, lib, ...}: 
  let
    getExe = lib.getExe;
    getExe' = lib.getExe';
    commands = with pkgs; {
      brillo = getExe pkgs.brillo;
      mako = getExe' pkgs.mako "makoctl";
      hyprshot = getExe pkgs.hyprshot;
      kitty = getExe pkgs.kitty;
    };
  in {
    wayland.windowManager.hyprland.settings = {
      bind = [
      # wofi
        "SUPER, r, exec, wofi --show=run"
      # terminal
		    "SUPER, q, exec, ${commands.kitty}"
      # murder machine
		    "SUPER, c, killactive"
      #exit 
		    "SUPER, m, exit"
      # screen management
		    "SUPER, f, fullscreen"
      # Workspace movement
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
      # workspace application movement
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
      # mako dismiss notifications
		    "ALT, space, exec, ${commands.mako} dismiss -a"
      # take screenshots
        "SUPER SHIFT ALT, p, exec, ${commands.hyprshot} -m window -m active --clipboard-only"
        "SUPER SHIFT, p, exec, ${commands.hyprshot} -m window -m active -o ~/Pictures/Screenshots"
      # brightness 
        ", XF86MonBrightnessUp, exec, ${commands.brillo} -A 5 -u 10000" 
        ", XF86MonBrightnessDown, exec, ${commands.brillo} -U 5 -u 10000"
      ];
    };
  }
