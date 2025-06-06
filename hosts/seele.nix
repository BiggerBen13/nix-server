{lib, ...}@inputs: 
    lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
            inputs.disko.nixosModules.disko
            inputs.nix-minecraft.nixosModules.minecraft-servers
        ] ++ [
            ../system/disk-configuration.nix
            ../system/sshd.nix
            ../host-configurations/seele.nix
            ../system/minecraft-server.nix
            ../system/xonotic-server.nix
        ];
}
