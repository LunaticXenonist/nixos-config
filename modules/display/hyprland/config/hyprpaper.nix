{pkgs, host, ...} : {

  services.hyprpaper = {
    enable = true;
    settings = 
      let 
        wallpaperPath = builtins.toPath ./wallpapers/${host}.jpg;
      in
    {
      ipc = "on";
      splash = false;
      preload = [wallpaperPath];
      wallpaper = [", ${wallpaperPath}"];
    };
  };

}
