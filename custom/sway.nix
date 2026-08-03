{							
  pkgs,
  lib,
  ...
}: let
  mod = "Super";
  mod2 = "Alt";
  mod3 = "Ctrl";
  term = "alacritty";
  run = "rofi -show run";
  drun = "rofi -show drun";
  foto = "grim -t png -l 1 -c";
  suspend = "systemctl suspend";
  brightp = "exec brightnessctl set 5%+";
  brightm =  "exec brightnessctl set 5%-";
	wllp = "~/wllp/dks12.png";
in {
  wayland.windowManager.sway = {
	enable = true;
};
  wayland.windowManager.sway.package = "${pkgs.swayfx}";
  wayland.windowManager.sway.config = {
	startup = [
	{ command = "${pkgs.swaybg}/bin/swaybg -i ${wllp}"; }	
];
	modes = {
	  resize = {
	    "a" = "resize shrink width 30 px";
	    "s" = "resize grow height 30 px";
	    "w" = "resize shrink height 30 px";
	    "d" = "resize grow width 30 px";
	    "Escape" = "mode default";
	    "Return" = "mode default";
  };
};
  floating.criteria = [
    {title = "Renomear";}
    {app_id = "org.pulseaudio.pavucontrol";}
    {app_id = "com.github.weclaw1.ImageRoll";}
    {app_id = "net.davidotek.pupgui2";}
    {app_id = "swayimg";}
    {title = "Confirmar substituição de arquivos";}
    {title = "Andamento da operação de arquivo";}
    {title = "Lista de amigos";}
    {title = "Steam — Configurações";}
    {title = "Servidores";}
    {title = "Adicionar um jogo não Steam";}
    {title = "PagSeguro";}
#    {title = "";}
];
  colors = {
    focused = {
      background = "#FEBC61";
      border = "#FEBC61";
      childBorder = "#FEBC61";
      indicator = "#D0C6B8";
      text = "#1D1512";
  };
  unfocused = {
      border = "#916353";
      background = "#916353";
      childBorder = "#916353";
      indicator = "#D0C6B8";
      text = "#1D1512";
  };
  focusedInactive = {
      border = "#FE3C1C";
      background = "#FE3C1C";
      childBorder = "#9B6C5C";
      indicator = "#D0C6B8";
      text = "#1D1512";
  };
};
	modifier = mod;
	gaps.smartGaps = false;
	gaps.inner = 10;
	gaps.outer = 2;
  focus.followMouse = false;
  fonts = {
	style = "Bold";
	names = ["iMWritingMonoNerdFontPropo"];
#	size = 1.0;
};
#----------ATALHOS------------------
	up = "w";
	down = "s";
	right = "d";
	left = "a";	
		keybindings = lib.mkForce {
		"${mod}+t" = " exec ${term}";
		"${mod}+f" = "fullscreen toggle";
		"${mod}+x" = "kill";
		"${mod}+r" = "exec ${drun}";
		"${mod}+${mod2}+w" = "exec ${run}";
	"${mod}+1" = "workspace 1";
	"${mod}+2" = "workspace 2";
	"${mod}+3" = "workspace 3";
	"${mod}+4" = "workspace 4";
	"${mod}+5" = "workspace 5";
	"${mod}+6" = "workspace 6";
	"${mod}+7" = "workspace 7";
	"${mod}+8" = "workspace 8";
	"${mod}+9" = "workspace 9";
	"${mod}+${mod2}+1" = "move container to workspace 1";
	"${mod}+${mod2}+2" = "move container to workspace 2";
	"${mod}+${mod2}+3" = "move container to workspace 3";
	"${mod}+${mod2}+4" = "move container to workspace 4";
	"${mod}+${mod2}+5" = "move container to workspace 5";
	"${mod}+${mod2}+6" = "move container to workspace 6";
	"${mod}+${mod2}+7" = "move container to workspace 7";
	"${mod}+${mod2}+8" = "move container to workspace 8";
	"${mod}+${mod2}+9" = "move container to workspace 9";
		"${mod}+space" = "floating toggle";
		"${mod}+${mod2}+g" = "split h";
		"${mod}+${mod2}+v" = "split v";
		"${mod}+${mod2}+r" = "mode resize";
	"${mod}+w" = "focus up";
	"${mod}+s" = "focus down";
	"${mod}+d" = "focus right";
	"${mod}+a" = "focus left";
	"${mod3}+${mod}+w" = "move up";
	"${mod3}+${mod}+d" = "move right";
	"${mod3}+${mod}+a" = "move left";
	"${mod3}+${mod}+s" = "move down";
		"Print" = "exec ${foto}";
	"Shift+F9" = "exec ${suspend}";
	"Shift+F6" = "exec ${brightp}";
	"Shift+F5" = "exec ${brightm}";
};
#------------TECLADO---------------
  input = {
  "*" = { 
  xkb_layout = "br";
  xkb_variant = "abnt2";
  repeat_delay = "220";
  accel_profile = "flat";
  pointer_accel = "0.5";
	};
  };
};
#------------MONITOR---------------
  wayland.windowManager.sway.extraConfig = ''
  default_border pixel none
  output * max_render_time 1
'';
#-----------------OUTROS-------------------
  wayland.windowManager.sway.checkConfig = false;
  imports = [
	./i3status.nix
  ];
#
}

