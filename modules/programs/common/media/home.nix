{pkgs, ...}: {
  home.packages = with pkgs; [
    mpv
    qbittorrent
  ];
}
