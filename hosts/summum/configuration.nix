{user, ...}: {
	imports = [
		./hardware-configuration.nix
	];

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};


	systemd.tmpfiles.rules = ["d /home/cole/hdd 755 ${user} users"];

	

	fileSystems."/home/cole/hdd" = {
		device = "/dev/disk/by-uuid/910737de-240f-4d98-8931-a292a4e70f78";
		fsType = "ext4";
		};
}
