{lib, ...}@inputs: {
    seele = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
            ../system/disk-configuration.nix
            ../system/sshd.nix
            inputs.disko.nixModules.disko
            ../host-configurations/seele.nix
        ];
    };
}
