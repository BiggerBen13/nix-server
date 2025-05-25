{lib, config, pkgs, ...}@inputs: {
    imports = [./seele-hardware-configuration.nix];

    networking.hostName = "seele";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
        vim
    ];
}
