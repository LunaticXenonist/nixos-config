{pkgs, ...}: {
	xdg.mimeApps.defaultApplications."x-scheme-handler/ror2mm" = ["r2modman.desktop"];
  	home.packages = [pkgs.r2modman];
}
