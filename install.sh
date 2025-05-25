git clone https://github.com/BiggerBen13/nix-server.git nixos
cd nixos
sudo nix run github:nix-community/disko/latest#disko-install --extra-experimental-features "flakes nix-command" -- --flake .#seele --extra-files . /etc/nixos --disk nixos /dev/sda
