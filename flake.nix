{
  description = "PureNix package sets powered by purs-nix";

  inputs =
    {
      utils.url = "github:ursi/flake-utils";
      purs-nix.url = "github:purs-nix/purs-nix";
      purenix.url = "github:purenix-org/purenix";
      nixpkgs.follows = "purs-nix/nixpkgs";
      package-set-repo.url = "github:purenix-org/purenix-package-sets";
      # FIXME use official-package-set from package-set-repo
      official-package-set-repo.url = "github:purescript/package-sets";
      official-package-set-repo.flake = false;
    };

  outputs = { self, nixpkgs, utils, ... }@inputs:
    let
      b = builtins;
      __functor = _: { system }:
        import ./nix/purs-nix inputs nixpkgs.legacyPackages.${system};
    in
    { inherit __functor; } // utils.apply-systems
      {
        inherit inputs;
        # TODO remove systems limited by purs-nix
        systems = [ "x86_64-linux" ];
      }
      ({ system, pkgs, purenix, ... }@ctx:
        let
          u = (import ./nix/utils.nix) pkgs;
          generator = import ./nix/package-set/generate.nix
            inputs.package-set-repo
            inputs.official-package-set-repo
            pkgs;
        in
        {
          packages = {
            inherit generator;
          };

          checks.output =
            let
              package-set = import self.packages.${system}.generator;
              purs-nix = inputs.purs-nix
                {
                  inherit system;
                  defaults.compile.codegen = "corefn";
                  overlays = [
                    (self: package-set)
                  ];
                };
              ps = purs-nix.purs
                {
                  srcs = [ ];
                  dependencies = u.package-set-pkgs
                    inputs.package-set-repo
                    purs-nix.ps-pkgs;
                };
              prefix = "output";
            in
            pkgs.stdenv.mkDerivation
              {
                inherit prefix;
                name = prefix;
                src = ps.output { };
                nativeBuildInputs = with pkgs; [ purenix ];
                dontInstall = true;
                postBuild = ''
                  mkdir -p $out
                  cp -L -r $src $out/${prefix}
                  chmod -R u+w $out/${prefix}
                  cd $out
                  purenix
                '';
              };
        }
      );
}
