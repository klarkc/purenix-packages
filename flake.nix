{
  description = "PureNix package sets powered by purs-nix";

  inputs =
    {
      utils.url = "github:ursi/flake-utils";
      purs-nix.url = "github:purs-nix/purs-nix";
      nixpkgs.follows = "purs-nix/nixpkgs";
      package-set-repo.url = "github:purenix-org/purenix-package-sets";
      # FIXME use official-package-set from package-set-repo
      official-package-set-repo.url = "github:purescript/package-sets";
      official-package-set-repo.flake = false;
    };

  outputs = { self, nixpkgs, utils, ... }@inputs:
    let
      __functor = _: { system }:
        import ./nix/purs-nix inputs nixpkgs.legacyPackages.${system};
    in
    { inherit __functor; } // utils.apply-systems
      {
        inherit inputs;
        # TODO remove systems limited by purs-nix
        systems = [ "x86_64-linux" ];
      }
      ({ system, pkgs, ... }@ctx:
        let
          generator = import ./nix/package-set/generate.nix
            inputs.package-set-repo
            inputs.official-package-set-repo
            pkgs;
        in
        {
          packages = {
            inherit generator;
          };

          checks =
            let
              package-set = import self.packages.${system}.generator;
              ps = inputs.purs-nix { inherit system; };
            in
            ps.build-set package-set;
        });
}
