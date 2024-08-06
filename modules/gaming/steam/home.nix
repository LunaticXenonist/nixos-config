{pkgs, ...}: {
	home.packages = with pkgs; [
		gamescope
		protonup-ng
		protonup-qt
		protontricks
	];
}
