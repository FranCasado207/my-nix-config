{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #to associate roms to steam
    steam-rom-manager

    pcsx2

    (retroarch.withCores (cores: with cores; [
      mgba
    ]))
  ];
}
