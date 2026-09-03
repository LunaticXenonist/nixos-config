{pkgs, host, lib, ...}: {
  imports = [
    ./binds.nix
    ./hyprpaper.nix
    ./exec-once.nix
  ] ++ lib.optional (builtins.pathExists ./hosts/${host}.nix) ./hosts/${host}.nix;
  xdg.configFile."hyprland" = {
    source = "./config";
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
    };
    in {
      "
      local commands = {
        brillo = ${commands.brillo},
        mako = ${commands.mako},
        hyprshot = ${commands.hyprshot},
        kitty = ${commands.kitty},
        player = ${commands.player},
        wireplumber = ${commands.wireplumber},
        wofi = ${commands.wofi}
      }
      return commands
      ""
    };
  };
}
