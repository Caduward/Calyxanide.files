{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs =(with pkgs; [
  geany.all
  gnumake
  gdb
  gcc
  valgrind
  cmake
]);
}
