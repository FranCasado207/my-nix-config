{ config, pkgs, inputs, ... }:
{
    #gamemode
    programs.gamemode.enable = true;


    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
    };

    environment.systemPackages = with pkgs; [
        #Launchers
        heroic
        lutris
        faugus-launcher

        #proton stuff
        protonup-qt
        steamtinkerlaunch

        #Celeste mod manager
        olympus

        #god mode
        openrct2

        inputs.dusklight.packages.${pkgs.system}.default
    ];



}
