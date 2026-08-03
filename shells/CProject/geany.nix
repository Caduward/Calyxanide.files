{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs =(with pkgs; [
  geany.all
  gnumake
  gdb
  gcc
  valgrind
  cmake
  foot
]);
#shellHook = ''
#  export GTK_THEME="Gruvbox-Dark"
#'';
}
