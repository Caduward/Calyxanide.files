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
	mako
	discord
	obsidian
	btop
	firefox
	fastfetch
	swaybg
	swayimg
	rofi
	grim
	wl-color-picker
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
       ];
#--------OFF--------
# 	nodejs
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
#----------OUTROS-------------
#  home.sessionVariables = {
#  };
}
