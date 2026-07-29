{ pkgs, lib, config, ...}: 
let
inherit (config.lib.formats.rasi) mkLiteral;
in {
programs.rofi = {
	enable = true;

  theme = {
	"*" = {
  background-color = mkLiteral "rgba(50, 41, 34, 0.70)";
  foreground-color = mkLiteral "#B7A287";
#  border-color = mkLiteral "#C9B595";
#  border = mkLiteral "1px solid";
#  border-radius = mkLiteral "2px";
  padding = mkLiteral "1px";
  width = 1024;
  text-color = mkLiteral "#D7C6B7";
    };
	"inputbar" = {
  children = map mkLiteral ["prompt" "entry"];
    };
	"textbox prompt colon" = {
  expand = false;
  str = ":";
#  text-color = mkLiteral "#D7C6B7";
    };
  "element selected" = {
  background-color = mkLiteral "#7B5042";
#  text-color = mkLiteral "#D7C6B7";
    }; 
   };
  };
#
}
