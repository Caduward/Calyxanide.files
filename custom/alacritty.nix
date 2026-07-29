{ pkgs, lib, ...}:
let
 
in {
  programs.alacritty = {
    enable = true;
    settings = {
	window.opacity = 0.94;
	window.padding = {x = 5;y = 5;};	
	font = {
	size = 10;
	normal = {
	family = "MartianMonoNerdFontMono";
	style = "Regular";
	   };
	};
	colors.primary = {
	background = "#170d08";
	};
	colors.normal = {
	black =   "#181715";
          red =     "#5A1E13";
          green =   "#FEB756";
          yellow =  "#BA7259";
          blue =    "#7d87ad";
          magenta = "#FE3E1D";
          cyan =    "#B9E3CF";
          white =   "#EBDED3";
	};
     };
  };
#
}

