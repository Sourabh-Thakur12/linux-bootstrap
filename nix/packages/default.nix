{pkgs}:

 {
  workstation = (import ./hyprland.nix {inherit pkgs; }) ++ (import ./creative.nix {inherit pkgs; });
}