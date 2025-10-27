# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, host, ... }:

{

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # kernel
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  networking = {
  	hostName = host;
  	#wireless.enable = true;  # Enables wireless support via wpa_supplicant.
	networkmanager.enable = true;
  networkmanager.plugins = [pkgs.networkmanager-openconnect];  
  };

  programs.dconf.enable = true;

  # Package Manager configuration
  nix = {
  	settings = {
  		auto-optimise-store = true;
		experimental-features = [ "nix-command" "flakes"];
		substituters = [ "https://hyprland.cachix.org"];
		trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
	};
	gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than-7d";
	};
  };


  # Set your time zone.
  time.timeZone = "America/New_York";
  
  # turn on bluetooth
  hardware.bluetooth.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cole = {
    isNormalUser = true;
    description = "Cole Gibbs";
    extraGroups = [ "networkmanager" "wheel" "input" "video" ];
    packages = with pkgs; [
	vesktop
	nautilus
	];
  };

  environment = {
  	systemPackages = with pkgs; [
		neovim
     		git
     		wget
     		curl
		killall
		gparted
  	];
	variables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
	};
	sessionVariables = {
		XDG_CURRENT_DESKTOP = "Hyprland";
		XDG_SESSION_TYPE = "wayland";
		XDG_SESSUIB_DESKOP = "Hyprland";
	};
  };


  services.flatpak.enable = true;
  services.udisks2.enable = true;


  # Switch pro controller kernel module
   boot.kernelModules = ["hid-nintendo"];

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
  	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	jack.enable = true;
  };


  # Desktop Portals
  xdg.portal = {
  	enable = true;
	extraPortals = with pkgs; [xdg-desktop-portal-gtk];
	config.common.default = "gtk";
  };



  services.dbus = {
  	implementation = "broker";
	packages = with pkgs; [gcr];
  };

  # Polkit
  security.polkit.enable = true;
  systemd =  {
  	user.services.polkit-gnome-authentication-agent-1 = {
		description = "polkit-gnome-authentication-agent-1";
		wants = ["graphical-session.target"];
		wantedBy = ["graphical-session.target"];
		after = ["graphical-session.target"];
		serviceConfig = {
			Type = "simple";
			ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
			Restart = "on-failure";
			RestartSec = 1;
			TimeoutStopSec = 10;
		};
	};
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
