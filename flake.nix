{
  description = "PureNix package sets powered by purs-nix";

  inputs =
    {
      utils.url = "github:ursi/flake-utils";
      purs-nix.url = "github:purs-nix/purs-nix";
      nixpkgs.follows = "purs-nix/nixpkgs";
      package-set-repo.url = "github:purenix-org/purenix-package-sets";
    };

  outputs = { self, nixpkgs, utils, package-set-repo, ... }@inputs:
    utils.apply-systems
      {
        inherit inputs;
        # TODO remove systems limited by the test
        systems = [ "x86_64-linux" ];
      }
      ({ system, ... }@ctx: { });
}
