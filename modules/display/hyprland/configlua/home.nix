{pkgs, host, lib, ...}: {
  imports = [ ./hyprpaper.nix ];
  wayland.windowManager.hyprland.configType = "lua";
  xdg.configFile."hyprland" = {
    source = ./config;
    target = "hypr";
    recursive = true;
  };
  xdg.configFile."hyprland/store.lua" = {
    target = "hypr/store.lua";
    text = 
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
        wofi = getExe pkgs.wofi;
    };
    in 
      ''
      local store = {
        brillo = "${commands.brillo}",
        mako = "${commands.mako}",
        hyprshot = "${commands.hyprshot}",
        kitty = "${commands.kitty}",
        player = "${commands.player}",
        wireplumber = "${commands.wireplumber}",
        wofi = "${commands.wofi}",
        host = "${host}"
      }
      return store
      '';
  };
}
