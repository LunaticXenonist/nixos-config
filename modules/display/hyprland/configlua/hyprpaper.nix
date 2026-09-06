{pkgs, host, ...} : {
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = 
      let
        wallpaperPath = "${./wallpapers/${host}.jpg}";
      in {
      preload = [wallpaperPath];
      wallpaper = {
        monitor = "";
        path = wallpaperPath;
        };
      splash = false;
      ipc = false;
    };
  };
}
