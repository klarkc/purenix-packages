# this is basically purs-nix/purs-nix official generator
# but accepting arguments and adapted to purenix registry
package-set-repo: official-package-set-repo: pkgs:
let
  b = builtins;
  p = pkgs;
  l = p.lib;
  u = (import ../utils.nix) p;
  make-info-version = l.strings.removePrefix "v";
  official-packages = l.importJSON (official-package-set-repo + /packages.json);
  # FIXME we should not assume package-set-repo@0.0.1
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
        optOff = l.strings.optionalString isOfficial;
        optUnoff = l.strings.optionalString (! isOfficial);
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
          else v.git;
        repo = b.fetchGit {
          inherit url;
          ${if isRef then "ref" else "rev"} = ref;
          ${if isRef then null else "allRefs"} = true;
        };
        assertVersion = assert (b.trace "${n} ${v} == ${version}?" v) == version; b.trace "true";
        cur = ''
          ${escape-reserved-word false n} =
            { 
              ${optOff "src.git.repo = \"${url}\";"}
              ${optOff "src.git.rev = \"${repo.rev}\";"}
              ${optUnoff "src.path = fetchGitSubdir"}
                ${optUnoff "{ url = \"${url}\"; rev = \"${repo.rev}\"; allRefs = true; }"}
                ${optUnoff "\"${v.subdir}\";"}
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
    (u.package-set-entries package-set-repo);
in
p.writeText "" ''
  ps-pkgs:
    let
      fetchGitSubdir = opts: dir: (builtins.fetchGit opts) + "/" + dir;
    in
    with ps-pkgs;
    { ${package-set-str} }
''


