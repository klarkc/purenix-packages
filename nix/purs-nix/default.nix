# this is a purs-nix overlay (not nixpkgs overlay)
inputs: pkgs:
let
  b = builtins;
  p = pkgs;
  l = p.lib;
  package-set = import ./package-set.nix;
in
package-set 
