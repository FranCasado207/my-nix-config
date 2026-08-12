{ config, pkgs, ... }:
{
    #Git
    programs.git.enable = true;

    #Coding tools
    environment.systemPackages = with pkgs; [
        vscode
    ];

}
