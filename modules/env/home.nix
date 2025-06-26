{
  config, 
  lib,
  host,
  pkgs,
  ...
}: {
	xdg = {
		enable = true;
		userDirs = {
			enable = true;
			createDirectories = true;
			};
		};
	}
	
