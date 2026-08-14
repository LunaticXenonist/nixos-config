{pkgs, ...} : {
	home.packages = [pkgs.dotnet-sdk pkgs.icu];
}
