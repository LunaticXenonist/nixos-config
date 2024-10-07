{pkgs, ...}: {
  home.packages = [pkgs.mako];

  xdg.configFile."mako/config".text = ''
    layer=overlay
  '';
}


