{ config, pkgs, ... }:

{
    #enable docker
    virtualisation.docker.enable = true;

    #add my user to group
    users.extraGroups.docker.members = [ "francisco" ];
    virtualisation.docker.storageDriver = "btrfs";

    #nvidia gpu
    hardware.nvidia-container-toolkit.enable = true;
    virtualisation.docker.daemon.settings.features.cdi = true;

    environment.systemPackages = with pkgs; [
        ducker
    ];
}
