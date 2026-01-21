{pkgs, host, ...} : {
  services.hyprpaper = {
    enable = true;
    settings = 
      let
        wallpaperPath = "~/nixos-config/modules/display/hyprland/config/wallpapers/${host}.jpg";
      in {
      preload = [wallpaperPath];
      wallpaper = {
        monitor = "";
        path = wallpaperPath;
        };
    };
  };
}
