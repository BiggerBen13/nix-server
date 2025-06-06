{nixpkgs, pkgs, lib, ...}@inputs :
let
statech = pkgs.fetchzip {
        url = "https://mediafiles.forgecdn.net/files/6112/165/StaTech%201.1.15%20Server%20Pack.zip";
        hash = "sha256-SiSoxqXPXxoO5X3U6nLPECkUEEUAm/z6dpkVaDUK9Dg=";
        stripRoot = false;
};
adrena = pkgs.fetchPackwizModpack {
        url = "https://raw.githack.com/intergrav/Adrenaline/main/versions/fabric/1.21.1/pack.toml";
        packHash = "sha256-wL/2wo0C/rZnT+H/mBYEUUzip9Z5squkeMsK8pWrscM=";
};
in
{
        nixpkgs.config.allowUnfree = true;

        environment.systemPackages = with pkgs; [
            mcrcon
        ];

        services.minecraft-servers = {
                enable = true;
                eula = true;
                user = "minecraft";
                servers.statech-industries = {
                        enable = false;
                        openFirewall = true;
                        package = pkgs.fabricServers.fabric-1_19_2;
                        symlinks = {
                                "mods" = "${statech}/mods";
                        };
                        files = {
                                "kubejs" = "${statech}/kubejs";
                                "config" = "${statech}/config";
                                "defaultconfigs" = "${statech}/defaultconfigs";
                        };
                        serverProperties = {
                                server-port = 25565;
                                motd = "StaTech Industries :3";
                        };
                };
                servers.vanilla = {
                        enable = true;
                        openFirewall = true;
                        package = pkgs.fabricServers.fabric-1_21_1;
                        symlinks = {
                            "mods" = "${adrena}/mods";
                        };
                        files = {
                                "config" = "${statech}/config";
                        };
                        serverProperties = {
                                server-port = 25565;
                                motd = "Bens Minecraft Server";
                                correct-player-movement = false;
                                difficulty = "hard";
                                "rcon.port" = 27777;
                                "rcon.password" = "meow";
                                enable-rcon = true;
                                enable-status = false;
                        };
                };
        };
}
