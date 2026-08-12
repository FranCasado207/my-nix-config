{ config, pkgs, ... }:

{
    #flatpak
    services.flatpak.enable = true;


    #gamemode
    programs.gamemode.enable = true;


    #Gaming
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
    };

    #NixPkgs
    environment.systemPackages = with pkgs; [
        #Launchers
        heroic
        lutris

        #proton stuff
        protonup-qt


        vesktop
        gparted

        #larp
        fastfetch

        #security
        bitwarden-desktop
    ];


}
