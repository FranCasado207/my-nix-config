{ config, pkgs, ... }:

{
    #flatpak
    services.flatpak.enable = true;

    #NixPkgs
    environment.systemPackages = with pkgs; [
        vesktop
        gparted

        #larp
        fastfetch

        #security
        bitwarden-desktop

        btop-cuda

        obsidian

        tree

        qbittorrent

        p7zip
        file

        libGL
        libglvnd
        localsend

        mpv

        #anime owo
        ani-cli
        (calibre.override {
            unrarSupport = true;
        })

        wget
        unzip

        ];

    #Localsend ports
    networking.firewall = {
        allowedTCPPorts = [ 53317 ];
        allowedUDPPorts = [ 53317 ];
    };

}
