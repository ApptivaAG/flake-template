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
        devShells.default = pkgs.mkShell { buildInputs = [ nixfmt-rfc-style ]; };
      }

    )
    // {
      templates.default = {
        path = ./template;
        description = "Default Apptiva Nix Flake Template";
      };
    };
}
