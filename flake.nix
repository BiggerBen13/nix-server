{
    description = "The nix-flake for my hetzner server";

    inputs = {
        nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.05";

        disko = {
            url = "github:nix-community/disko";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, ... }: let 
            args = inputs // {inherit (inputs.nixpkgs) lib;};
        in{

        # Utilized by `nix flake check`

        # # Default overlay, for use in dependent flakes
        # overlay = final: prev: { };
        #
        # # # Same idea as overlay but a list or attrset of them.
        # overlays = { exampleOverlay = self.overlay; };

        inherit args;

        nixosConfigurations = import ./hosts args;
    };
}
