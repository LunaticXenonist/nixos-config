{ user, config, ...}:

{
  nix = {
  # Apparently user-level gc is required, seperate from system level
  	gc = {
		automatic = true;
		frequency = "weekly";
		options = "--delete-older-than-7d";
	};
  };

  home = {
  	username = "${user}";
  	homeDirectory = "/home/${user}";
	
	sessionPath = ["${config.home.homeDirectory}/.local/bin"];

  	stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

}
