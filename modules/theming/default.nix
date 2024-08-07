{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    # Useful default font packages.
    # > https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/fonts/packages.nix#L33
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      (nerdfonts.override {fonts = ["JetBrainsMono"];}) # Only JetBrains
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["Noto Sans"];
        sansSerif = ["Noto Sans"];
        monospace = ["JetBrainsMono Nerd Font"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}


