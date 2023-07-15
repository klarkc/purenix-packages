inputs: pkgs:
let
  inherit (inputs) purifix official-registry official-registry-index;
  p = pkgs;
  b = builtins;
  l = p.lib;
in
rec {
  n-v = n: v: { inherit n v; };
  package-set = package-set-repo: version: l.importJSON
    (package-set-repo + /package-sets/${version}.json);
  package-set-entries =
    let
      # FIXME we should not assume package-set-repo@0.0.1
      version = "0.0.1";
    in
    package-set-repo: l.mapAttrsToList
      n-v
      (package-set package-set-repo version).packages;
  package-set-pkgs = package-set-repo: ps-pkgs: excluding:
    let
      # FIXME we should not assume package-set-repo@0.0.1
      version = "0.0.1";
      s1 = (package-set package-set-repo version).packages;
      s2 = ps-pkgs;
      s3 = b.intersectAttrs s1 s2;
      l1 = b.filter
        ({ n, ... }: !(b.elem (b.trace n n) excluding))
        (l.mapAttrsToList n-v s3);
    in
    b.map ({ v, ... }: v) l1;
  purescript-registry = official-registry;
  purescript-registry-index = official-registry-index;
  fromYAML = p.callPackage (purifix + ./nix/build-support/purifix/from-yaml.nix) { };
  get-package-set = p.callPackage (purifix + /nix/build-support/purifix/get-package-set.nix) {
    inherit fromYAML purescript-registry purescript-registry-index;
  };
}
