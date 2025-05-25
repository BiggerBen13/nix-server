{nixpkgs, pkgs, lib, ...}@inputs :
let
statech = pkgs.fetchzip {
        url = "https://mediafiles.forgecdn.net/files/6112/165/StaTech%201.1.15%20Server%20Pack.zip";
        hash = "sha256-SiSoxqXPXxoO5X3U6nLPECkUEEUAm/z6dpkVaDUK9Dg=";
        stripRoot = false;
};
in
{
        nixpkgs.config.allowUnfree = true;

        services.minecraft-servers = {
                enable = true;
                eula = true;
                servers.statech-industries = {
                        enable = true;
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
        };
}
