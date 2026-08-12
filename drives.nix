{ config, pkgs, ... }:

{

    # Storage
    fileSystems."/mnt/SSD" = {
        device = "/dev/disk/by-uuid/cd7eeb84-2687-47e3-863b-c3682cceeed3";
        fsType = "btrfs";
    };

    fileSystems."/mnt/HDD" = {
        device = "/dev/disk/by-uuid/576e0c5c-5134-4a1b-a94a-cd1c0e29c6d5";
        fsType = "btrfs";
    };
}
