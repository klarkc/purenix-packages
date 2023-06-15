pkgs:
let
  b = builtins;
  l = pkgs.lib;
in
rec {
  # FIXME we should not assume package-set-repo@0.0.1
  package-set = package-set-repo: l.importJSON
    (package-set-repo + /package-sets/0.0.1.json);
  package-set-entries = package-set-repo: l.mapAttrsToList
    (n: v: { inherit n v; })
    (package-set package-set-repo).packages;
  package-set-pkgs = package-set-repo: ps-pkgs:
    let
      s1 = (package-set package-set-repo).packages;
      s2 = ps-pkgs;
      s3 = b.intersectAttrs s1 s2;
    in
    b.attrValues s3;
}
