{
  description = "Hello world page served by Caddy";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    { self, nixpkgs }:
    {
      nixosModules.default = ./configuration.nix;

      nixosConfigurations.hello-world = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ self.nixosModules.default ];
      };
    };
}
