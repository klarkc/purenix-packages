# this is basically purs-nix/purs-nix official generator
# but accepting arguments and adapted to purenix registry
package-set-repo: official-package-set-repo: pkgs:
let
  b = builtins;
  p = pkgs;
  l = p.lib;
  make-info-version = l.strings.removePrefix "v";
  official-packages = l.importJSON (official-package-set-repo + /packages.json);
  # FIXME we should not assume package-set-repo@0.0.1
  package-set = l.importJSON (package-set-repo + /package-sets/0.0.1.json);
  package-set-entries = l.mapAttrsToList (n: v: { inherit n v; }) package-set.packages;
  escape-reserved-word = ps-pkgs: str:
    let
      reserved-words = [ "assert" ];
    in
    if b.elem str reserved-words then
      if ps-pkgs then ''ps-pkgs."${str}"''
      else ''"${str}"''
    else
      str;
  package-set-str = b.foldl'
    (acc: { n, v }:
      let
        isOfficial = let is = b.isString v; in b.trace "${l.strings.optionalString is "Official "}${n}" is;
        package =
          if isOfficial
          then official-packages.${n}
          else (l.importJSON (repo + /${v.subdir}/purifix.json)).package;
        version =
          if isOfficial
          then v
          else make-info-version package.version;
        isRef = isOfficial && l.strings.versionAtLeast version "0.0.1";
        ref =
          if isRef
          then "refs/tags/v${version}"
          else v.ref;
        url =
          if isOfficial
          then official-packages.${n}.repo
          else "${v.git}?path=${v.subdir}";
        repo = b.fetchGit {
          inherit url;
          ${if isRef then "ref" else "rev"} = ref;
          ${if isRef then null else "allRefs"} = true;
        };
        assertVersion = assert (b.trace "${n} ${v} == ${version}?" v) == version; b.trace "true";
        cur = ''
          ${escape-reserved-word false n} =
            { src.git =
                { repo = "${url}";
                  rev = "${repo.rev}";
                };
              info =
                { ${if isRef then "version = \"${version}\";" else ""}
                  dependencies =
                    [ ${b.foldl'
                          (acc: d: acc + escape-reserved-word true d + " ")
                          ""
                          package.dependencies
                      }
                    ];
                };
            };
        '';
        evaluate = c:
          if isOfficial
          then assertVersion c
          else c;
      in
      acc + evaluate cur)
    ""
    package-set-entries;
in
p.writeText "" ''
  ps-pkgs:
    with ps-pkgs;
    { ${package-set-str} }
''

