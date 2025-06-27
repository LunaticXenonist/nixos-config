{pkgs, host, lib, ... }: {
	imports = [
    ./config/common.nix 
    lib.mkIf (host == "edda") ./config/edda.nix
    ];
	wayland.windowManager.hyprland.enable = true;
}
