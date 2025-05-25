{lib, config, pkgs, ...}@inputs: {
    imports = [./seele-hardware-configuration.nix];

    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

    networking.hostName = "seele";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
        vim
    ];

    boot.loader.grub = {
        # no need to set devices, disko will add all devices that have a EF02 partition to the list already
        # devices = [ ];
        efiSupport = true;
        efiInstallAsRemovable = true;
    };

    system.stateVersion = "25.05";
} 
