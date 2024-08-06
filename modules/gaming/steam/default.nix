{pkgs, ... }: {
	programs.steam = {
		enable = true;
		extest.enable = true;

		dedicatedServer.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;
		remotePlay.openFirewall = true;
		

		package = pkgs.steam.override {
			extraPkgs = pkgs: 
				with pkgs; [
					libgdiplus
					keyutils
					libkrb5
					libpng
					libpulseaudio
					libvorbis
					stdenv.cc.cc.lib
					xorg.libXcursor
					xorg.libXi
					xorg.libXinerama
					xorg.libXScrnSaver

					source-sans
					source-serif
					source-han-sans
					source-han-serif
				];
			extraLibraries = pkgs:
				with pkgs; [
					gperftools
				];
		};
	};
}
