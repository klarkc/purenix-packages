{
  description = "PureNix package sets powered by purs-nix";

  inputs =
    {
      utils.url = "github:ursi/flake-utils";
      purs-nix.url = "github:purs-nix/purs-nix";
      ps-tools.follows = "purs-nix/ps-tools";
      purenix.url = "github:purenix-org/purenix";
      nixpkgs.follows = "purs-nix/nixpkgs";
      package-set-repo.url = "github:purenix-org/purenix-package-sets";
    };

  outputs = { self, nixpkgs, utils, ... }@inputs:
    let
      b = builtins;
      psr-packages = system: pkgs: pkgs.lib.attrsets.filterAttrs
        (name: b.hasAttr "package")
        inputs.package-set-repo.packages.${system};
      # pursnix overlay
      overlay = system: self: super:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          inherit (pkgs) lib;
          make-info = name: p:
            p // {
              purs-nix-info = {
                inherit name;
                dependencies = b.attrValues (
                  lib.mapAttrs make-info p.dependencies
                );
              };
            };
        in
        lib.mapAttrs make-info (psr-packages system pkgs);
      __functor = _: { system }: overlay system;
    in
    { inherit __functor; } // utils.apply-systems
      {
        inherit inputs;
        # TODO remove systems limited by purs-nix
        systems = [ "x86_64-linux" ];
      }
      ({ system, pkgs, purenix, ps-tools, ... }@ctx:
        let
          # TODO use version from package-set-repo
          version = "18.0.0";
          output =
            let
              purs-nix = inputs.purs-nix
                {
                  inherit system;
                  overlays = [
                    (overlay system)
                  ];
                };
              ps = purs-nix.purs
                {
                  purescript = pkgs.writeShellApplication {
                    name = "purs";
                    runtimeInputs = with pkgs; [
                      ised
                      rsync
                      # TODO we should use purescript from the package-set
                      ps-tools.purescript-0_15_4
                    ];
                    text = ''
                      string="$4"
                      result=$(echo "$string" | sed 's/\/\*\*\/\*\.purs//')
                      output="$result/output"
                      if [ -d "$output" ]; then
                        echo "already build, syncing output"
                        rsync -rauL "$output" .
                        chmod -R u+w ./output
                      else
                        echo "not built, proceeding"
                        purs "$@"
                      fi
                    '';
                  };
                  srcs = [ ];
                  dependencies = pkgs.lib.attrsets.attrVals
                    (b.attrNames (psr-packages system pkgs))
                    purs-nix.ps-pkgs;
                };
            in
            ps.output { };
        in
        {
          checks = {
            inherit output;
          };
        }
      );
}
