{...}: {
	wayland.windowManager.sway = {
		enable = true;
		config = rec {
		modifier = "Mod4";
		# Use kitty as default terminal
		terminal = "kitty"; 
    	};
  };
}
