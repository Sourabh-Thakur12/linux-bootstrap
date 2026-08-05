{
  description = "Sourabh's Linux Bootstrap";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
  url = "github:hyprwm/Hyprland";
  inputs.nixpkgs.follows = "nixpkgs";
};
  };

  outputs = { self, nixpkgs, zen-browser, hyprland, ... } @ inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      allPackages = import ./packages/default.nix {
        inherit pkgs;
        externalPkgs = {
          zenBrowser = zen-browser.packages.${system}.default;
          hyprland = hyprland.packages.${system}.default;
        };
      };
      
    in {
      packages.${system}.default = pkgs.buildEnv{
        name = "sourabh-env";
        paths = allPackages;
      };
      

      devShells.${system}.default = pkgs.mkShell {
        packages = allPackages;
      };
    };
}
