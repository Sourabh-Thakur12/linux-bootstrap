{pkgs, externalPkgs}:

let
  creative = import ./creative.nix {inherit pkgs; };
  customize = import ./customize.nix {inherit pkgs; };
  cli = import ./cli.nix {inherit pkgs; };
  external = import ./external.nix { inherit externalPkgs; };
  development = import ./development.nix {inherit pkgs;};
  software = import ./software.nix { inherit pkgs; };
in

creative ++ customize ++ cli ++ external ++ development ++ software
