{pkgs, ...} : {

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = ["~/nixos-config/modules/display/hyprland/config/wallpapers/edda.jpg"];
      wallpaper = [", ~/nixos-config/modules/display/hyprland/config/wallpapers/edda.jpg"];
    };
  };

}
