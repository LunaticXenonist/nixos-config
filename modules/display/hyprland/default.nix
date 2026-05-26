{pkgs,...}: {
	environment.systemPackages = [pkgs.playerctl];
	programs.hyprland.enable = true;
	services.playerctld.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -r --time --cmd start-hyprland";
        user = "greeter";
        };
    };
  }; 
}
