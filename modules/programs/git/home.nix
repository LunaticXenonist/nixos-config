{config, ...}: {
	programs.git = {
		enable = true;
		diff-so-fancy.enable = true;
		lfs.enable = true;
		extraConfig = {
			user = {
				name = "Cole Gibbs";
				email = "colemgibbs@gmail.com";
				signingkey = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
				};
			color.ui = true;
			commit = {
				gpgsign = true;
				verbose = true;
			};
			gpg = {
				format = "ssh";
			};
			init = {
				defaultBranch = "main";
			};
			submodule = {
				recurse = true;
			};
		};
	};
}
