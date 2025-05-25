{pkgs, lib, ...}@inputs : 
let 
    statech = pkgs.fetchPackwizModpack {
        url = "https://raw.githubusercontent.com/TheStaticVoid/StaTech-Industry/d0fc315c67f3eba1f720676b977e5d1bca9f00f0/pack.toml";
        packHash = "sha256-d0fc315c67f3eba1f720676b977e5d1bca9f00f0";
    };
in
{
    services.minecraft-servers.servers.statech = {
        enable = true;
        eula = true;
        package = pkgs.fabricServers.fabric-1_19_2-0_16_10;
        files = {
            "mods" = "${statech}/mods";
            "kubejs" = "${statech}/kubejs";
            "config" = "${statech}/config";
            "defaultconfigs" = "${statech}/defaultconfigs";
        };
    };
}
