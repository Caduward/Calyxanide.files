{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs =(with pkgs; [
  geany
  gnumake
  gdb
  gcc
  valgrind
  cmake
]);
}
