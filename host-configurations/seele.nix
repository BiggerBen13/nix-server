{lib, config, pkgs, ...}@inputs: {

    networking.hostName = "seele";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
        vim
    ];
}
