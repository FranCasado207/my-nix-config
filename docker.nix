{ config, pkgs, ... }:

{
    #enable docker
    virtualisation.docker.enable = true;

    #add my user to group
    users.extraGroups.docker.members = [ "francisco" ];
    virtualisation.docker.storageDriver = "btrfs";

    networking.firewall.allowedTCPPorts = [
      8096 # Jellyfin
      25600 # Komga
    ];

    networking.firewall.allowedUDPPorts = [
      7359 # Jellyfin autodiscovery
    ];

    networking.firewall.trustedInterfaces = [ "docker0" ];
    #nvidia gpu
    hardware.nvidia-container-toolkit.enable = true;
    virtualisation.docker.daemon.settings.features.cdi = true;

    environment.systemPackages = with pkgs; [
        ducker
    ];
}
