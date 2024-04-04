{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system: with import nixpkgs { inherit system; }; {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            nixfmt-rfc-style
            nodejs_20
            # add more packages here
          ];
        };
      }
    );
}
