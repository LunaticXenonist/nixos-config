{ config, pkgs, ...}:

{
  home.username = "cole";
  home.homeDirectory = "/home/cole";



  home.stateVersion = "24.05";



  programs.home-manager.enable = true;

}
