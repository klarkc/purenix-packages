# this is basically purs-nix/purs-nix official generator
# but accepting arguments and adapted to purenix registry
inputs: registry-version: pkgs:
let
  inherit (inputs) package-set-repo;
  b = builtins;
  p = pkgs;
  l = p.lib;
  u = (import ../utils.nix) inputs p;
  make-info-version = l.strings.removePrefix "v";
  package-set = (u.get-package-set {
    package-set-config.registry = registry-version;
    # TODO add extra-packages
    extra-packages = { };
  }).packages;
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
    (acc: { n, v }@pkg:
      let
        inherit (v) ref version dependencies;
        inherit (v.location) githubOwner githubRepo;
        # FIXME we should not assume github
        url = "https://github.com/${githubOwner}/${githubRepo}";
        repo = b.fetchGit {
          inherit url;
          ref = "refs/tags/${ref}";
        };
        cur = b.trace "building ${n}@${ref}" ''
          ${escape-reserved-word false n} = 
            { src.git =
                { repo = "${url}";
                  rev = "${repo.rev}";
                };

              info =
                { version = "${version}";
                  dependencies =
                    [ ${b.foldl'
                          (acc: d: acc + escape-reserved-word true d + " ")
                          ""
                          dependencies
                      }
                    ];
                };
            };
        '';
      in
      b.trace pkg.v.dependencies (acc + cur))
    ""
    #(l.mapAttrsToList u.n-v { inherit (package-set) yoga-json; });
    (l.mapAttrsToList u.n-v package-set);
  src = p.writeText "src" ''
    ps-pkgs:
      with ps-pkgs;
      { ${package-set-str} }
  '';
in
p.runCommand "src-parsed"
{
  buildInputs = [ p.nixfmt ];
} ''nixfmt < ${src} > $out''
