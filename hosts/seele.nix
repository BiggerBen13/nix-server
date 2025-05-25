{lib, ...}@inputs: 
    lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
            ../system/disk-configuration.nix
            ../system/sshd.nix
            inputs.disko.nixosModules.disko
            ../host-configurations/seele.nix
        ];
}
