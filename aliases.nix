{ config, pkgs, ... }:

{
  environment.shellAliases = {
    # Rebuild com flakes
    nrs   = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    nrb   = "sudo nixos-rebuild boot --flake /etc/nixos#nixos";
    nrt   = "sudo nixos-rebuild test --flake /etc/nixos#nixos";
    nrd   = "sudo nixos-rebuild dry-build --flake /etc/nixos#nixos";

    nfu   = "sudo nix flake update";
    nfuc  = "sudo nix flake update nixpkgs";

    nixcfg  = "sudo $EDITOR /etc/nixos/configuration.nix";
    nixflk  = "sudo $EDITOR /etc/nixos/flake.nix";
    cdnix   = "cd /etc/nixos";

    nclean  = "sudo nix-collect-garbage -d";
    nclean7 = "sudo nix-collect-garbage --delete-older-than 7d";
    ngens   = "nixos-rebuild list-generations";

    # Rollback
    nrollback = "sudo nixos-rebuild switch --rollback";

    upa = "update-all";
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "update-all" ''
      set -e
      echo "==> Updating flake inputs..."
      cd /etc/nixos
      sudo nix flake update

      echo "==> Rebuilding system..."
      sudo nixos-rebuild switch --flake /etc/nixos#nixos

      echo "==> Updating flatpaks..."
      flatpak update -y

      echo "==> Done!"
    '')
  ];
}
