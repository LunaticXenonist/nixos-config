{pkgs, host, lib, ...}: 
  let
    getExe = lib.getExe;
    getExe' = lib.getExe';
    commands = with pkgs; {
      brillo = getExe pkgs.brillo;
      mako = getExe' pkgs.mako "makoctl";
      hyprshot = getExe pkgs.hyprshot;
      kitty = getExe pkgs.kitty;
      player = getExe' pkgs.playerctl "playerctl";
      wireplumber = getExe' pkgs.wireplumber "wpctl";
    };
  in {
    wayland.windowManager.hyprland.settings = {
      bind = [
      # wofi
        ["SUPER + r" "hl.dsp.exec_cmd(wofi --show=run)"]
      # terminal
		    "SUPER + q, hl.dsp.exec_cmd(${commands.kitty})"
      # murder machine
		    "SUPER, c, hl.dsp.window.close(activewindow)"
      #exit 
		    "SUPER + m, hl.dsp.exit()"
      # screen management
		    "SUPER + f, hl.dsp.window.fullscreen(fullscreen, toggle, true, activewindow)"
      # Workspace movement
		    "SUPER + 1, hl.dsp.focus(1)"
		    "SUPER + 2, hl.dsp.focus(2)"
		    "SUPER + 3, hl.dsp.focus(3)"
		    "SUPER + 4, hl.dsp.focus(4)"
		    "SUPER + 5, hl.dsp.focus(5)"
		    "SUPER + 6, hl.dsp.focus(6)"
		    "SUPER + 7, hl.dsp.focus(7)"
		    "SUPER + 8, hl.dsp.focus(8)"
		    "SUPER + 9, hl.dsp.focus(9)"
		    "SUPER + 0, hl.dsp.focus(10)"
      # workspace application movement
		    "SUPER + SHIFT + 1, movetoworkspace, 1"
		    "SUPER + SHIFT + 2, movetoworkspace, 2"
		    "SUPER + SHIFT + 3, movetoworkspace, 3"
		    "SUPER + SHIFT + 4, movetoworkspace, 4"
		    "SUPER + SHIFT + 5, movetoworkspace, 5"
		    "SUPER + SHIFT + 6, movetoworkspace, 6"
		    "SUPER + SHIFT + 7, movetoworkspace, 7"
		    "SUPER + SHIFT + 8, movetoworkspace, 8"
		    "SUPER + SHIFT + 9, movetoworkspace, 9"
		    "SUPER + SHIFT + 0, movetoworkspace, 10"
		    "SUPER, mouse_down, workspace, e+1"
		    "SUPER, mouse_up, workspace, e-1"
      # mako dismiss notifications
		    "ALT, space, exec, ${commands.mako} dismiss -a"
      # take screenshots
        "SHIFT, PRINT, exec, ${commands.hyprshot} -m window -m active --clipboard-only"
        ", PRINT, exec, ${commands.hyprshot} -m window -m active -o ~/Pictures/Screenshots"
        "SUPER SHIFT, PRINT, exec, ${commands.hyprshot} -m output --clipboard-only" 
        "SUPER , PRINT, exec, ${commands.hyprshot} -m output -o ~/Pictures/Screenshots"
        "ALT SHIFT, PRINT, exec, ${commands.hyprshot} -m region --clipboard-only"
        "ALT, PRINT, exec, ${commands.hyprshot} -m region -o ~/Pictures/Screenshots"

      # brightness 
        ", XF86MonBrightnessUp, exec, ${commands.brillo} -A 5 -u 10000" 
        ", XF86MonBrightnessDown, exec, ${commands.brillo} -U 5 -u 10000"

      # media
 	", XF86AudioPlay, exec, ${commands.player} play-pause"
 	", XF86AudioNext, exec, ${commands.player} next"
 	", XF86AudioPrev, exec, ${commands.player} previous"
 	", XF86AudioMute, exec, ${commands.player} volume 0"
 	", XF86AudioRaiseVolume, exec, ${commands.player} volume 0.01+"
 	", XF86AudioLowerVolume, exec, ${commands.player} volume 0.01-"
      ];
    };
  }
