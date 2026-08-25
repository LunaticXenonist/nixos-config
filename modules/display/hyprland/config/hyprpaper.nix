{pkgs, host, ...} : {
  services.hyprpaper = {
    enable = true;
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
      ipc = true;
    };
  };
}
