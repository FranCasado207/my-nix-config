{
  description = "Yakureito's Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # ou nixos-24.11, etc
    nixvim.url = "github:nix-community/nixvim";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    dusklight.url = "github:TwilitRealm/dusklight";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
