{ config, pkgs, lib, ...}:

{
	home.username = "cadu";
	home.homeDirectory = "/home/cadu";
	home.stateVersion = "25.11";
	programs.bash = {
		enable = true;
};
  programs.git = {
	enable = true;
	settings.user.name = "Calyxanide";
	settings.user.email = "cadu3195@gmail.com";
};
   home.packages = with pkgs;[
	imagej
	libreoffice
	findutils
	file
	discord
	obsidian
	btop
	firefox
	fastfetch
	swaybg
	swayimg
	rofi
	grim
	bella
	steam
	gamemode
	thunar
	thunar-volman
	thunar-archive-plugin
	thunar-media-tags-plugin
	tumbler
	alsa-lib
	alsa-utils
	protonplus
	vkbasalt
	parted
	krita
	prismlauncher
	unrar
	unzip
	zip
	busybox
	zerotierone
	notepad-next
	gimp
	p7zip
	image-roll
	vlc
	jetbrains.webstorm
	eclipses.eclipse-cpp
	nodejs
       ];
#-----------------------CONFIGURACOES------------------
  imports = [
	./custom/sway.nix
	./custom/alacritty.nix
	./custom/mangohud.nix
	./custom/rofi-theme.nix
   ];
	gtk = {
	enable = true;
	gtk3 = {
	theme.package = "${pkgs.gruvterial-theme}";
	theme.name = "gruvterial";
	iconTheme.package = "${pkgs.adwaita-icon-theme}";
	iconTheme.name = "adwaita";
  };
};
  programs.btop.enable = true;
  programs.btop.settings = lib.mkForce {
	theme_background = false;
	color_theme = "gruvbox_dark";
	true_color = false;
  };
  services.mako = {
    enable = true;
      settings = {
	actions = true;
	anchor = "top-right";
	background-color = "#000000";
	border-color = "#FFFFFF";
	border-radius = 1;
	default-timeout = 5;
	font = "monospace 10";
	height = 100;
	width = 300;
	ignore-timeout = false;
	icons = true;
	layer = "top";
	margin = 5;
	markup = true; 
  };
};
  programs.micro = {
    enable = true;
#    settings = {
	
#    };
  };
#----------OUTROS-------------
#  home.sessionVariables = {
#  };
}
