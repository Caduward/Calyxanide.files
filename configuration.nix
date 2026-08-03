{ config, lib, pkgs, nixpkgs, pkgs-unstable, ... }:

{
  imports =
    [
	./hardware-configuration.nix
	./custom/nano.nix
	./custom/hardwareUSR.nix
    ];
#-----------------------------SYSTEMD-----------------------------
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
#--------------Nome do Sistema----------------------------------------
  networking.hostName = "terminus";
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
  services.displayManager.ly.enable = true;
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
#-----------------PACOTES DE SISTEMA------------------------------
   nixpkgs.config = {
	allowUnfreePredicate = (pkg: true);
	allowUnfree = true;
	allowUnfreeRedistributable = true;
};
   environment.systemPackages =
	(with pkgs; [
	wget
	git
	sway
	alacritty
	pavucontrol
	i3blocks
	]) ++
	(with pkgs-unstable; [
	intel-compute-runtime
	legcord
	openjdk21
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
	"rpgcopy" = "bash /etc/nixos/scripts/copyRPGSheet.sh";
	"swr" = "swaymsg reload";
	"obscopy" = "bash /etc/nixos/scripts/copyObsidianVault.sh";
	"obspull" = "source /etc/nixos/scripts/pullObsidianVault.sh";
	"obspush" = "source /etc/nixos/scripts/sendObsidian.sh";
	};
};
#--------------------FSTAB-FILESYSTEM---------------------
#
#                     
#------------CONNECTION----------------------
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 25565 ];
  networking.firewall.allowedUDPPorts = [ 25565 ];
#  networking.firewall.interfaces."ztdiytqva5".allowedTCPPorts = [ 25565 ];
#  networking.firewall.interfaces."ztdiytqva5".allowedUDPPorts = [ 25565 ];
#  networking.firewall.trustedInterfaces = [ "ztdiytqva5" ];
  services.logrotate.checkConfig = false;
  xdg.portal.wlr = {
	enable = true;	
};
  services.zerotierone = {
	enable = true;
#	port = 9993;
#	joinNetworks = [
#	"cf719fd540a7815d"
# ];
};
#---------------OUTROS----------------------------
  environment.sessionVariables = {
	WLR_DRM_NO_ATOMIC = 1;
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
  system.stateVersion = "26.05"; 
}
