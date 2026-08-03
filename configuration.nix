{ config, lib, pkgs, nixpkgs, pkgs-unstable, ... }:
let
showSwap = pkgs.writeShellScript "showSwap" ''
export PATH="${pkgs.busybox}/bin:${pkgs.procps}/bin:"
free -h | grep Swap: | tr -s " " | cut -d " " -f 3 | tee /etc/nixos/info/swap.txt
'';
in {
  imports =
    [
	./hardware-configuration.nix
	./custom/nano.nix
	./custom/hardwareUSR.nix
    ];
#--------------------Systemd--------------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
#--------------Nome do Sistema----------------------------------------
  networking.hostName = "calyxanide";
  networking.networkmanager.enable = true;
 #------------------IDIOMA--------------------------
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     useXkbConfig = true;
};
#-------------------INTERFACE----------------------------
  services.xserver = {
	enable = true;
	autoRepeatDelay = 200;
	autoRepeatInterval = 35;
	xkb.layout = "br";
	xkb.variant = "abnt2";
   };
  programs.sway = {
	enable = true;
};
xdg.portal = {
	wlr.enable = true;
	enable = true;
};	
#------------SERVICES--------------------------
  services.locate.enable = true;
  services.displayManager.ly.enable = true;
  services.lact.enable = true;
  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/1 * * * * root ${showSwap}"
  ];
};
#--------------------AUDIO----------------------------
   services.pipewire = {
      audio.enable = true;
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
      extraConfig.pipewire = {
	"default-clock-rate" = {
	  "context.properties" = {
	    "default.clock.rate" = 192000;
	    "default.clock.quantum" = 256;
	    "default.clock.min-quantum" = 256;
	    "default.clock.allowed-rates" = [ 44100 48000 88200 96000 192000 ];
	  };
        };
      };
   };
#--------------------USUARIOS----------------------------------
   users.users.cadu = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "cadu" ];
#-----------------PACOTES DE SISTEMA------------------------------
   nixpkgs.config = {
	allowUnfreePredicate = (pkg: true);
	allowUnfree = true;
	allowUnfreeRedistributable = true;
};
   environment.systemPackages =
	(with pkgs; [
	vagrant
	wget
	git
	swayfx
	alacritty
	pavucontrol
	bc
	ntfs3g
	lm_sensors
	lact
	vpl-gpu-rt
	glmark2
	]) ++
	(with pkgs-unstable; [
	wireplumber
	pipewire
	tmux
	mesa
	libva
	intel-media-driver
	mangohud
	intel-gpu-tools
	intel-compute-runtime
	gamescope
	legcord
	openjdk21
	openjdk8
	easyeffects
	]);
  fonts = {
  enableDefaultPackages = true;
  packages = with pkgs; [
	nerd-fonts.sauce-code-pro
	nerd-fonts.martian-mono
	nerd-fonts.lilex
	pango
];
  fontconfig = {
    defaultFonts = {
	serif = ["nerd-fonts-lilex"];
	sansSerif = ["nerd-fonts-lilex"];
	monospace = ["MartianMonoNerdFontMono"];
    };
  };
};		
  programs.bash = {
	enable = true;
	shellAliases = {
	"att" = "sudo nixos-rebuild switch";
	"lixo" = "sudo nix-collect-garbage -d";
	"grep" = ''grep --color="always"'';
	"nx" = ''cd /etc/nixos/ && ls'';
	"cfg" = ''cd ~/.config/ && ls'';
	"sgt" = ''swaymsg -t get_tree'';
	"fonts" = "fc-list";
	"steam" = ''gamescope --expose-wayland --adaptive-sync -w 1920 -h 1080 -r 75 -b -- steam'';
	"reboot" = "sudo systemctl reboot";
	"nxup" = "sudo nix flake update";
	"nixofcopy" = "bash /etc/nixos/scripts/copyNixoFiles.sh";
	"nixofpush" = "source /etc/nixos/scripts/sendNixoFiles.sh";
	"sshon" = "source /etc/nixos/scripts/activateSshAgent.sh";
	"rpgcopy" = "source /etc/nixos/scripts/copyRPGSheet.sh";
	"swr" = "swaymsg reload";
	"obscopy" = "bash /etc/nixos/scripts/copyObsidianVault.sh";
	"obspull" = "source /etc/nixos/scripts/pullObsidianVault.sh";
	"obspush" = "source /etc/nixos/scripts/sendObsidian.sh";
	};
};
#--------------------FSTAB-FILESYSTEM---------------------
   fileSystems."/boot" = {
	device = "/dev/disk/by-label/refind";
	fsType = "vfat";
	options = [
	"users"
	"nofail"
	"defaults"
   ];
};
   fileSystems."/mnt/nvme" = {
	device = "/dev/disk/by-label/NVLINUX";
	fsType = "ext4";
	options = [
	"nofail"
  ];
};
   fileSystems."~/VMs/VM1" = {
	device = "/dev/disk/by-label/VM1";
	fsType = "ext4";
	options = [
	"nofail"
	"users"
	"rw"
	"exec"
  ];
};                                                                                  
#------------CONNECTION----------------------
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 25565 ];
  networking.firewall.allowedUDPPorts = [ 25565 ];
  networking.firewall.interfaces."ztdiytqva5".allowedTCPPorts = [ 25565 ];
  networking.firewall.interfaces."ztdiytqva5".allowedUDPPorts = [ 25565 ];
  networking.firewall.trustedInterfaces = [ "ztdiytqva5" ];
  services.logrotate.checkConfig = false;
  services.zerotierone = {
	enable = true;
	port = 9993;
	joinNetworks = [
	"cf719fd540a7815d"
 ];
};
#---------------OUTROS----------------------------
  environment.sessionVariables = {
	LIBVA_DRIVER_NAME = "iHD";
	WLR_DRM_NO_ATOMIC = 1;
	WLR_NO_HARDWARE_CURSORS = 1;
	WLR_RENDERER = "vulkan";
	WLR_SCENE_DISABLE_DIRECT_SCANOUT = 1;
	WLR_DRM_NO_DIRECT_SCANOUT=1;
};
#-----------------------VERSAO--------------------------
  nix.settings = {
  experimental-features = [ "nix-command" "flakes" ];
  keep-outputs = true;
  keep-derivations = true;
  max-jobs = "auto";
  cores = 0;
};
  security.allowSimultaneousMultithreading = lib.mkForce true;
  system.stateVersion = "25.11"; 
}
