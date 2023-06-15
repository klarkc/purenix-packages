pkgs:
let
  b = builtins;
  l = pkgs.lib;
in
rec {
  n-v = n: v: { inherit n v; };
  # FIXME we should not assume package-set-repo@0.0.1
  package-set = package-set-repo: l.importJSON
    (package-set-repo + /package-sets/0.0.1.json);
  package-set-entries = package-set-repo: l.mapAttrsToList
    n-v
    (package-set package-set-repo).packages;
  package-set-pkgs = package-set-repo: ps-pkgs: excluding:
    let
      s1 = (package-set package-set-repo).packages;
      s2 = ps-pkgs;
      s3 = b.intersectAttrs s1 s2;
      l1 = b.filter
        ({ n, ... }: !(b.elem (b.trace n n) excluding))
        (l.mapAttrsToList n-v s3);
    in
    b.map ({ v, ... }: v) l1;
}
