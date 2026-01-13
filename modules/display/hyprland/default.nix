{pkgs,...}: {
	programs.hyprland.enable = true;
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
