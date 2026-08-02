{
  description = "Sourabh's Linux Bootstrap";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      packages.${system} =
        import ./packages/default.nix {
          inherit pkgs;
        };

      devShells.${system}.default = pkgs.mkShell {
        packages = [ ];
      };
    };
}