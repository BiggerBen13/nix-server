{pkgs, lib, ...}@inputs : 
let 
    modpack = pkgs.fetchPackwizModpack {
        url = "https://raw.githubusercontent.com/TheStaticVoid/StaTech-Industry/d0fc315c67f3eba1f720676b977e5d1bca9f00f0/pack.toml";
        packHash = "sha256-d0fc315c67f3eba1f720676b977e5d1bca9f00f0";
    };
in
{
    services.minecraft-servers = {
        enable = true;
        eula = true;
        symlinks = {
            "mods" = "${modpack}/mods";
            "kubejs" = "${modpack}/kubejs";
            "config" = "${modpack}/config";
            "defaultconfigs" = "${modpack}/defaultconfigs";
        };
    };
}
