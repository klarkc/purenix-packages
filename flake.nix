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

  outputs = { self, nixpkgs, utils, package-set-repo, ... }@inputs:
    let
      __functor = _: { system }:
        import ./nix/purs-nix inputs nixpkgs.legacyPackages.${system};
    in
    { inherit __functor; } // utils.apply-systems
      {
        inherit inputs;
        # TODO remove systems limited by the test
        systems = [ "x86_64-linux" ];
      }
      ({ system, ... }@ctx:
        let
          generator = import ./nix/package-set/generate.nix
            package-set-repo
            inputs.official-package-set-repo
            ctx.pkgs;
        in
        {
          packages.package-set = generator;
        });
}
