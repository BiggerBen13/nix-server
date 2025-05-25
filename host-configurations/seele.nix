{lib, config, pkgs, ...}@inputs: {
    networking.hostName = "seele";
    environment.systemPackages = with pkgs; [
        vim
    ];

}
