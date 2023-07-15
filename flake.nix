{
  description = "PureNix package sets powered by purs-nix";

  inputs =
    {
      utils.url = "github:ursi/flake-utils";
      purs-nix.url = "github:purs-nix/purs-nix";
      purenix.url = "github:purenix-org/purenix";
      nixpkgs.follows = "purs-nix/nixpkgs";
      package-set-repo.url = "github:purenix-org/purenix-package-sets";
      # TODO use registry from package-set-repo
      official-registry.url = "github:purescript/registry";
      official-registry.flake = false;
      # TODO use registry-index from package-set-repo
      official-registry-index.url = "github:purescript/registry-index";
      official-registry-index.flake = false;
      # We use some purifix tools to parse purescript manifest files
      purifix.url = "github:purifix/purifix";
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
            inputs
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
                  dependencies =
                    (import ./nix/dependencies.nix) purs-nix.ps-pkgs;
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
