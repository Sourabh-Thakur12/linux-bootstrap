{pkgs, externalPkgs}:

#  {
#   workstation = (import ./hyprland.nix {inherit pkgs; }) ++ (import ./creative.nix {inherit pkgs; });
# }
let
  creative = import ./creative.nix {inherit pkgs; };
  customize = import ./customize.nix {inherit pkgs; };
  cli = import ./cli.nix {inherit pkgs; };
  external = import ./external.nix { inherit externalPkgs; };
in

creative ++ customize ++ cli ++ external